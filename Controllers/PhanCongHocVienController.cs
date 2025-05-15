using CanhGac.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MyPhamCheilinus.Controllers;
using MyPhamCheilinus.Infrastructure;
using MyPhamCheilinus.ModelViews;
using System;
using Microsoft.AspNetCore.Authorization;


namespace MyPhamCheilinus.Controllers
{
    public class PhanCongHocVienController : Controller
    {

        CanhGacContext db = new CanhGacContext();

        private readonly ILogger<PhanCongHocVienController> _logger;
        public PhanCongHocVienController(ILogger<PhanCongHocVienController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index(DateTime ngay, int? page, string? TenHV = "", string? NhiemVu = "", string? VongGac = "")
        {
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 10;


            var queryResult = (from pcg in db.Pcgacs
                               join hv in db.HocViens on pcg.MaHocVien equals hv.MaHocVien
                               join nv in db.NhiemVus on pcg.MaNhiemVu equals nv.MaNhiemVu
                               join cg in db.CaGacs on pcg.MaCaGac equals cg.MaCaGac
                               join vg in db.VongGacs on nv.MaVongGac equals vg.MaVongGac
                               where pcg.Ngay.Date == ngay.Date
                                     && (string.IsNullOrEmpty(TenHV) || hv.TenHocVien.Contains(TenHV))
                                     && (string.IsNullOrEmpty(NhiemVu) || nv.TenNhiemVu.Contains(NhiemVu))
                                     && (string.IsNullOrEmpty(VongGac) || vg.TenVongGac.Contains(VongGac))
                               orderby cg.MaCaGac
                               select new PCGacViewModel
                               {
                                   MaHocVien = hv.MaHocVien,
                                   TenHocVien = hv.TenHocVien,
                                   GioiTinh = hv.GioiTinh,
                                   TenNhiemVu = nv.TenNhiemVu,
                                   TenVongGac = vg.TenVongGac,
                                   Ngay = ngay,
                                   TuGio = TimeSpan.Parse(cg.TuGio.ToString()),
                                   DenGio = TimeSpan.Parse(cg.DenGio.ToString()),
                               }).ToList();



            if (queryResult.Count == 0)
            {
                var noDataViewModel = new PCGacViewModel
                {
                    Ngay = ngay
                };
                queryResult.Add(noDataViewModel);
            }

            return View(queryResult);

        }
        public IActionResult Filtter(DateTime ngay, int? page, string? TenHV = "", string? NhiemVu = "", string? VongGac = "")
        {
            var url = "/PhanCongHocVien/Index?";
            if (ngay != null)
            {
                url += $"ngay={ngay.ToString("yyyy-MM-dd")}&";
            }

            if (!string.IsNullOrEmpty(NhiemVu))
            {
                url += $"NhiemVu={NhiemVu}&";
            }

            if (!string.IsNullOrEmpty(TenHV))
            {
                url += $"TenHV={TenHV}&";
            }

            if (VongGac != null)
            {
                url += $"VongGac={VongGac}&";
            }

            // Loại bỏ dấu '&' cuối cùng nếu có
            if (url.EndsWith("&"))
            {
                url = url.Substring(0, url.Length - 1);
            }

            return Json(new { status = "success", redirectUrl = url });
        }


        [HttpPost]
        [Authorize(Roles = "Đại đội")]
        public IActionResult PhanCong(DateTime ngay)
        {
            try
            {
                var tenDonViNguoiDung = User.Identity.Name;

                // Tìm tên đơn vị tương ứng với ngày được chọn
                var tenDonViTuNgay = db.ThongTinGacs
                    .Where(t => t.Ngay.Date == ngay.Date)
                    .Select(t => t.MaDonViNavigation.TenDonVi)
                    .FirstOrDefault();

                // So sánh tên đơn vị của người dùng với đơn vị phân công
                if (tenDonViNguoiDung != tenDonViTuNgay)
                {
                    return Forbid(); // Trả về 403 nếu không trùng đơn vị
                }

                var ngayParameter = new SqlParameter("@Ngay", ngay);
                db.Database.ExecuteSqlRaw("EXEC PhanCongGac @Ngay", ngayParameter);

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal Server Error");
            }
        }



        [HttpPost]
        [Authorize(Roles = "Đại đội")]
        public IActionResult ThayTheHocVien(string maHocVienCu, DateTime ngay)
        {
            try
            {
                // Gọi proc ThayTheHocVien
                db.Database.ExecuteSqlRaw("EXEC ThayTheHocVien @MaHocVienCu, @Ngay",
                    new SqlParameter("@MaHocVienCu", maHocVienCu),
                    new SqlParameter("@Ngay", ngay));

                // Load lại trang, có thể chuyển hướng hoặc render lại view tùy thuộc vào yêu cầu của bạn
                return RedirectToAction("Index"); // Chuyển hướng đến action Index
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal Server Error"); // Trả về lỗi nếu xảy ra exception
            }
        }
        [HttpGet]

        [HttpGet]
        public IActionResult GetHocVienChuaCoLich(DateTime ngay, string maHocVienCu)
        {
            // B1: Lấy đơn vị tương ứng với ngày
            var maDonVi = db.ThongTinGacs
                .Where(t => t.Ngay == ngay)
                .Select(t => t.MaDonVi)
                .FirstOrDefault();

            if (string.IsNullOrEmpty(maDonVi))
                return BadRequest("Không tìm thấy thông tin gác cho ngày này.");

            // B2: Truy xuất MaCaGac của học viên cũ tại ngày đó
            var maCaGac = db.Pcgacs
                .Where(pc => pc.Ngay == ngay && pc.MaHocVien == maHocVienCu)
                .Select(pc => pc.MaCaGac)
                .FirstOrDefault();

            if (maCaGac == 0)
                return BadRequest("Không tìm thấy mã ca gác của học viên này.");

            // B3: Suy ra giới tính cần chọn
            var gioiTinhCanChon = (maCaGac == 1 || maCaGac == 2) ? "Nữ" : "Nam";

            // B4: Lọc ra học viên phù hợp (cùng đơn vị, chưa được phân công, đúng giới tính, không phải học viên cũ)
            var hocViens = db.HocViens
                .Where(hv => hv.MaDaiDoi == maDonVi
                             && hv.GioiTinh == gioiTinhCanChon
                             && hv.MaHocVien != maHocVienCu
                             && !db.Pcgacs.Any(pc => pc.Ngay == ngay && pc.MaHocVien == hv.MaHocVien))
                .Select(hv => new
                {
                    hv.MaHocVien,
                    hv.TenHocVien
                })
                .ToList();

            return Json(hocViens);
        }

        [HttpPost]
        public IActionResult ThayTheThuCong(string maHocVienCu, string maHocVienMoi, DateTime ngay)
        {
            try
            {
                // Tìm dòng cần xoá
                var phanCongCu = db.Pcgacs
                    .FirstOrDefault(pc => pc.MaHocVien == maHocVienCu && pc.Ngay.Date == ngay.Date);

                if (phanCongCu == null)
                {
                    return BadRequest("Không tìm thấy phân công để thay thế.");
                }

                // Kiểm tra học viên mới đã có lịch chưa
                bool daPhanCong = db.Pcgacs
                    .Any(pc => pc.MaHocVien == maHocVienMoi && pc.Ngay.Date == ngay.Date);

                if (daPhanCong)
                {
                    return BadRequest("Học viên mới đã được phân công trong ngày này.");
                }

                // Lưu các thông tin cũ để dùng lại
                var maNhiemVu = phanCongCu.MaNhiemVu;
                var maCaGac = phanCongCu.MaCaGac;

                // Xoá bản ghi cũ
                db.Pcgacs.Remove(phanCongCu);
                db.SaveChanges();

                // Thêm bản ghi mới
                var phanCongMoi = new Pcgac
                {
                    Ngay = ngay,
                    MaHocVien = maHocVienMoi,
                    MaNhiemVu = maNhiemVu,
                    MaCaGac = maCaGac
                };

                db.Pcgacs.Add(phanCongMoi);
                db.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Lỗi hệ thống: {ex.Message}");
            }
        }


        //// GET: PhanCongHocVien
        //public ActionResult Index()
        //{
        //    return View();
        //}

        //// GET: PhanCongHocVien/Details/5
        //public ActionResult Details(int id)
        //{
        //    return View();
        //}

        //// GET: PhanCongHocVien/Create
        //public ActionResult Create()
        //{
        //    return View();
        //}

        //// POST: PhanCongHocVien/Create
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create(IFormCollection collection)
        //{
        //    try
        //    {
        //        return RedirectToAction(nameof(Index));
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}

        //// GET: PhanCongHocVien/Edit/5
        //public ActionResult Edit(int id)
        //{
        //    return View();
        //}

        //// POST: PhanCongHocVien/Edit/5
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit(int id, IFormCollection collection)
        //{
        //    try
        //    {
        //        return RedirectToAction(nameof(Index));
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}

        //// GET: PhanCongHocVien/Delete/5
        //public ActionResult Delete(int id)
        //{
        //    return View();
        //}

        //// POST: PhanCongHocVien/Delete/5
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Delete(int id, IFormCollection collection)
        //{
        //    try
        //    {
        //        return RedirectToAction(nameof(Index));
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
    }
}