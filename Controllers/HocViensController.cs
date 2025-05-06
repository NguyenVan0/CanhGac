//using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CanhGac.Models;
using PagedList.Core;
using System;
using CanhGac.ModelViews;

namespace CanhGac.Controllers
{
    public class HocViensController : Controller
    {
        private readonly CanhGacContext _context;

        public HocViensController(CanhGacContext context)
        {
            _context = context;
        }

        // GET: HocViens
        public async Task<IActionResult> Index()
        {
            var canhGacContext = _context.HocViens.Include(h => h.MaCapBacNavigation).Include(h => h.MaChucVuNavigation).Include(h => h.MaDaiDoiNavigation);
            return View(await canhGacContext.ToListAsync());
        }

        public IActionResult HocVienTheoDaiDoi(int? page, string? MaHV = "", string? TenHV = "", string? ChucVu = "", string? CapBac = "", int? solangac = null, string? Gioitinh = "", bool? gac = null, string? madaidoi = "")
        {
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 10;
            IQueryable<HocVien> query = _context.HocViens.AsNoTracking()
                .Include(h => h.MaCapBacNavigation)
                .Include(h => h.MaChucVuNavigation)
                .Include(h => h.MaDaiDoiNavigation);

            if (!string.IsNullOrEmpty(madaidoi))
            {
                query = query.Where(x => x.MaDaiDoi == madaidoi);
            }
            if (!string.IsNullOrEmpty(MaHV))
            {
                query = query.Where(x => x.MaHocVien.Contains(MaHV));
            }
            if (!string.IsNullOrEmpty(TenHV))
            {
                query = query.Where(x => x.TenHocVien.Contains(TenHV));
            }
            if (!string.IsNullOrEmpty(ChucVu))
            {
                query = query.Where(x => x.MaChucVuNavigation.TenChucVu.Contains(ChucVu));
            }
            if (!string.IsNullOrEmpty(CapBac))
            {
                query = query.Where(x => x.MaCapBac == CapBac);
            }
            if (!string.IsNullOrEmpty(Gioitinh))
            {
                query = query.Where(x => x.GioiTinh.Contains(Gioitinh));
            }
            if (solangac != null)
            {
                query = query.Where(x => x.SoLanGac == solangac);
            }
            // Remove this condition to show all students regardless of Gac status
            // if ((bool)gac)
            // {
            //     query = query.Where(x => x.Gac == gac);
            // }

            // Only apply the Gac filter if it's explicitly provided
            if (gac != null)
            {
                query = query.Where(x => x.Gac == gac);
            }

            var lsProducts = query.OrderByDescending(x => x.MaHocVien).ToList();
            PagedList<HocVien> models = new PagedList<HocVien>(lsProducts.AsQueryable(), pageNumber, pageSize);
            ViewBag.CurrentMaDaiDoi = madaidoi;
            ViewBag.CurrentPage = pageNumber;
            ViewBag.CurrentMaHV = MaHV;
            ViewBag.CurrentTenHV = TenHV;
            ViewBag.CurrentCapbac = CapBac;
            ViewBag.CurrentChucVu = ChucVu;
            ViewBag.CurrentGac = gac;
            ViewBag.CurrentSoLanGac = solangac;
            ViewBag.CurrentGioiTinh = Gioitinh;
            ViewData["GioiTinh"] = new SelectList(_context.HocViens, "GioiTinh", "GioiTinh", Gioitinh);
            ViewData["CapBac"] = new SelectList(_context.CapBacs, "MaCapBac", "TenCapBac", CapBac);
            ViewData["DonVi"] = new SelectList(_context.DonVis, "MaDonVi", "TenDonVi", madaidoi);
            return View(models);
        }

        public IActionResult Filtter(string? CapBac, string? TenHV, string? Gioitinh, string? madaidoi, string? MaHV, string? gacStatus)
        {
            var url = "/HocViens/HocVienTheoDaiDoi?";

            if (!string.IsNullOrEmpty(madaidoi))
            {
                url += $"madaidoi={madaidoi}&";
            }

            if (!string.IsNullOrEmpty(MaHV))
            {
                url += $"MaHV={MaHV}&";
            }

            if (!string.IsNullOrEmpty(CapBac))
            {
                url += $"CapBac={CapBac}&";
            }

            if (!string.IsNullOrEmpty(TenHV))
            {
                url += $"TenHV={TenHV}&";
            }

            if (!string.IsNullOrEmpty(Gioitinh))
            {
                url += $"Gioitinh={Gioitinh}&";
            }

            // Xử lý trạng thái gác
            if (!string.IsNullOrEmpty(gacStatus))
            {
                if (gacStatus == "1")
                {
                    url += "gac=true&";
                }
                else if (gacStatus == "0")
                {
                    url += "gac=false&";
                }
            }

            // Loại bỏ dấu '&' cuối cùng
            if (url.EndsWith("&"))
            {
                url = url.Substring(0, url.Length - 1);
            }

            return Json(new { status = "success", redirectUrl = url });
        }



        // GET: HocViens/Details/5
        public async Task<IActionResult> Details(string id, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi, bool? gac = null)
        {
            if (id == null || _context.HocViens == null)
            {
                return NotFound();
            }
            var hocVien = await _context.HocViens
                .Include(h => h.MaCapBacNavigation)
                .Include(h => h.MaChucVuNavigation)
                .Include(h => h.MaDaiDoiNavigation)
                .FirstOrDefaultAsync(m => m.MaHocVien == id);
            if (hocVien == null)
            {
                return NotFound();
            }
            ViewBag.CurrentMaDaiDoi = madaidoi;
            ViewBag.CurrentPage = page;
            ViewBag.CurrentMaHV = MaHV;
            ViewBag.CurrentTenHV = TenHV;
            ViewBag.CurrentCapbac = CapBac;
            ViewBag.CurrentGioiTinh = Gioitinh;
            ViewBag.CurrentGac = gac;
            return View(hocVien);
        }
        // GET: HocViens/Create
        public IActionResult Create(int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi)
        {
            ViewData["MaCapBac"] = new SelectList(_context.CapBacs, "MaCapBac", "TenCapBac");
            ViewData["MaChucVu"] = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu");
            ViewData["MaDaiDoi"] = new SelectList(_context.DonVis, "MaDonVi", "TenDonVi");
            ViewBag.CurrentMaDaiDoi = madaidoi;
            ViewBag.CurrentPage = page;
            ViewBag.CurrentMaHV = MaHV;
            ViewBag.CurrentTenHV = TenHV;
            ViewBag.CurrentCapbac = CapBac;
            ViewBag.CurrentGioiTinh = Gioitinh;
            return View();
        }

        // POST: HocViens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(int? page, [Bind("MaHocVien,TenHocVien,NgaySinh,MaDaiDoi,GioiTinh,Gac,SoLanGac,MaCapBac,MaChucVu")] HocVien hocVien)
        {
            if (ModelState.IsValid)
            {
                _context.Add(hocVien);
                await _context.SaveChangesAsync();
                return RedirectToAction("HocVienTheoDaiDoi", new { page = page });
            }
            ViewData["CapBac"] = new SelectList(_context.CapBacs, "MaCapBac", "TenCapBac", hocVien.MaCapBac);
            ViewData["ChucVu"] = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", hocVien.MaChucVu);
            ViewData["MaDaiDoi"] = new SelectList(_context.DonVis, "MaDonVi", "MaDonVi", hocVien.MaDaiDoi);

            return View(hocVien);
        }

        // GET: HocViens/Edit/5
        public async Task<IActionResult> Edit(string id, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi)
        {
            if (id == null || _context.HocViens == null)
            {
                return NotFound();
            }

            var hocVien = await _context.HocViens.FindAsync(id);
            if (hocVien == null)
            {
                return NotFound();
            }
            ViewData["CapBac"] = new SelectList(_context.CapBacs, "MaCapBac", "TenCapBac", hocVien.MaCapBac);
            ViewData["ChucVu"] = new SelectList(_context.ChucVus, "MaChucVu", "TenChucVu", hocVien.MaChucVu);
            ViewData["MaDaiDoi"] = new SelectList(_context.DonVis, "MaDonVi", "MaDonVi", hocVien.MaDaiDoi);
            ViewBag.CurrentMaDaiDoi = madaidoi;
            ViewBag.CurrentPage = page;
            ViewBag.CurrentMaHV = MaHV;
            ViewBag.CurrentTenHV = TenHV;
            ViewBag.CurrentCapbac = CapBac;
  
            ViewBag.CurrentGioiTinh = Gioitinh;
            return View(hocVien);
        }

        // POST: HocViens/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi, [Bind("MaHocVien,TenHocVien,NgaySinh,MaDaiDoi,GioiTinh,Gac,SoLanGac,MaCapBac,MaChucVu")] HocVien hocVien)
        {
            if (id != hocVien.MaHocVien)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(hocVien);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HocVienExists(hocVien.MaHocVien))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("HocVienTheoDaiDoi", new { page = page, MaHV = MaHV, TenHV = TenHV, Gioitinh = Gioitinh, CapBac = CapBac, madaidoi = madaidoi });
            }
            ViewData["MaCapBac"] = new SelectList(_context.CapBacs, "MaCapBac", "MaCapBac", hocVien.MaCapBac);
            ViewData["MaChucVu"] = new SelectList(_context.ChucVus, "MaChucVu", "MaChucVu", hocVien.MaChucVu);
            ViewData["MaDaiDoi"] = new SelectList(_context.DonVis, "MaDonVi", "MaDonVi", hocVien.MaDaiDoi);
   
            return View(hocVien);
        }

        // GET: HocViens/Delete/5
        public async Task<IActionResult> Delete(string id, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi)
        {
            if (id == null || _context.HocViens == null)
            {
                return NotFound();
            }

            var hocVien = await _context.HocViens
                .Include(h => h.MaCapBacNavigation)
                .Include(h => h.MaChucVuNavigation)
                .Include(h => h.MaDaiDoiNavigation)
                .FirstOrDefaultAsync(m => m.MaHocVien == id);
            if (hocVien == null)
            {
                return NotFound();
            }
            ViewBag.CurrentMaDaiDoi = madaidoi;
            ViewBag.CurrentPage = page;
            ViewBag.CurrentMaHV = MaHV;
            ViewBag.CurrentTenHV = TenHV;
            ViewBag.CurrentCapbac = CapBac;
            ViewBag.CurrentGioiTinh = Gioitinh;
            return View(hocVien);
        }

        // POST: HocViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi)
        {
            if (_context.HocViens == null)
            {
                return Problem("Entity set 'CanhGacContext.HocViens'  is null.");
            }
            var hocVien = await _context.HocViens.FindAsync(id);
            if (hocVien != null)
            {
                _context.HocViens.Remove(hocVien);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction("HocVienTheoDaiDoi", new { page = page, MaHV = MaHV, TenHV = TenHV, Gioitinh = Gioitinh, CapBac = CapBac, madaidoi = madaidoi });
        }

        private bool HocVienExists(string id)
        {
          return (_context.HocViens?.Any(e => e.MaHocVien == id)).GetValueOrDefault();
        }





        /////-----------------------------------CÀI ĐẶT NGHỈ GÁC -----------------------------------------------////
        ///
        // GET: HocViens/TamNghiGac/5
        public async Task<IActionResult> TamNghiGac(string id, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi)
        {
            if (string.IsNullOrEmpty(id))
            {
                return NotFound();
            }

            var hocVien = await _context.HocViens
                .Include(h => h.MaDaiDoiNavigation)
                .FirstOrDefaultAsync(m => m.MaHocVien == id);

            if (hocVien == null)
            {
                return NotFound();
            }

            // Kiểm tra xem học viên có đang gác không
            if (hocVien.Gac != true)
            {
                TempData["ErrorMessage"] = "Học viên này hiện không trong trạng thái gác!";
                return RedirectToAction("HocVienTheoDaiDoi", new { page = page, MaHV = MaHV, TenHV = TenHV, Gioitinh = Gioitinh, CapBac = CapBac, madaidoi = madaidoi });
            }

            ViewBag.CurrentMaDaiDoi = madaidoi;
            ViewBag.CurrentPage = page;
            ViewBag.CurrentMaHV = MaHV;
            ViewBag.CurrentTenHV = TenHV;
            ViewBag.CurrentCapbac = CapBac;
            ViewBag.CurrentGioiTinh = Gioitinh;

            var model = new TamNghiGacViewModel
            {
                MaHocVien = hocVien.MaHocVien,
                TenHocVien = hocVien.TenHocVien,
                MaDonVi = hocVien.MaDaiDoi,
                TenDonVi = hocVien.MaDaiDoiNavigation?.TenDonVi,
                GioiTinh = hocVien.GioiTinh,
                SoLanGac = hocVien.SoLanGac,
                NgayBatDau = DateTime.Now
            };

            return View(model);
        }

        // POST: HocViens/TamNghiGac/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> TamNghiGac(TamNghiGacViewModel model, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi)
        {
            if (ModelState.IsValid)
            {
                using (var transaction = _context.Database.BeginTransaction())
                {
                    try
                    {
                        // Cập nhật trạng thái Gac = 0 cho học viên
                        var hocVien = await _context.HocViens.FindAsync(model.MaHocVien);
                        if (hocVien == null)
                        {
                            return NotFound();
                        }

                        // Lưu số lần gác hiện tạilichSuNghiGac.SlgacBatDau
                        var soLanGacHienTai = hocVien.SoLanGac;

                        // Cập nhật trạng thái gác
                        hocVien.Gac = false;
                        hocVien.LastModified = DateTime.Now;
                        _context.Update(hocVien);
                        await _context.SaveChangesAsync();

                        // Tạo bản ghi lịch sử nghỉ gác
                        var lichSuNghiGac = new LichSuNghiGac
                        {
                            MaHocVien = model.MaHocVien,
                            NgayBatDau = model.NgayBatDau,
                            NgayKetThuc = null,
                            SlgacBatDau = soLanGacHienTai ?? 0,
                            SlgacKetThuc = null,
                            LyDo = model.LyDo,
                            NguoiCapNhat = User.Identity?.Name ?? "admin" // Hoặc lấy từ hệ thống xác thực
                        };

                        _context.LichSuNghiGacs.Add(lichSuNghiGac);
                        await _context.SaveChangesAsync();

                        transaction.Commit();

                        TempData["SuccessMessage"] = "Đã cho học viên tạm nghỉ gác thành công!";
                        return RedirectToAction("HocVienTheoDaiDoi", new { page = page, MaHV = MaHV, TenHV = TenHV, Gioitinh = Gioitinh, CapBac = CapBac, madaidoi = madaidoi });
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        ModelState.AddModelError("", "Lỗi khi lưu dữ liệu: " + ex.Message);
                    }
                }
            }

            ViewBag.CurrentMaDaiDoi = madaidoi;
            ViewBag.CurrentPage = page;
            ViewBag.CurrentMaHV = MaHV;
            ViewBag.CurrentTenHV = TenHV;
            ViewBag.CurrentCapbac = CapBac;
            ViewBag.CurrentGioiTinh = Gioitinh;

            return View(model);
        }

        // GET: HocViens/KichHoatGac/5
        public async Task<IActionResult> KichHoatGac(string id, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi)
        {
            if (string.IsNullOrEmpty(id))
            {
                return NotFound();
            }

            var hocVien = await _context.HocViens
                .Include(h => h.MaDaiDoiNavigation)
                .FirstOrDefaultAsync(m => m.MaHocVien == id);

            if (hocVien == null)
            {
                return NotFound();
            }

            // Kiểm tra xem học viên có đang trong trạng thái nghỉ gác không
            if (hocVien.Gac == true)
            {
                TempData["ErrorMessage"] = "Học viên này hiện đã trong trạng thái gác!";
                return RedirectToAction("HocVienTheoDaiDoi", new { page = page, MaHV = MaHV, TenHV = TenHV, Gioitinh = Gioitinh, CapBac = CapBac, madaidoi = madaidoi });
            }

            // Tìm bản ghi lịch sử nghỉ gác đang mở
            var lichSuNghiGac = await _context.LichSuNghiGacs
                .Where(ls => ls.MaHocVien == id && ls.NgayKetThuc == null)
                .OrderByDescending(ls => ls.NgayBatDau)
                .FirstOrDefaultAsync();

            if (lichSuNghiGac == null)
            {
                // Có thể tạo bản ghi mới nếu cần
                TempData["WarningMessage"] = "Không tìm thấy bản ghi nghỉ gác cho học viên này. Sẽ tạo bản ghi mới.";
            }

            ViewBag.CurrentMaDaiDoi = madaidoi;
            ViewBag.CurrentPage = page;
            ViewBag.CurrentMaHV = MaHV;
            ViewBag.CurrentTenHV = TenHV;
            ViewBag.CurrentCapbac = CapBac;
            ViewBag.CurrentGioiTinh = Gioitinh;

            var model = new KichHoatGacViewModel
            {
                MaHocVien = hocVien.MaHocVien,
                TenHocVien = hocVien.TenHocVien,
                NgayBatDau = lichSuNghiGac?.NgayBatDau ?? DateTime.Now.AddDays(-30),
                SoLanGacBatDau = lichSuNghiGac?.SlgacBatDau ?? 0
            };

            return View(model);
        }

        // POST: HocViens/KichHoatGac/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> KichHoatGac(KichHoatGacViewModel model, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    // Lấy thông tin về đơn vị và giới tính của học viên
                    var hocVien = await _context.HocViens.FindAsync(model.MaHocVien);
                    if (hocVien == null)
                    {
                        return NotFound();
                    }

                    string maDonVi = hocVien.MaDaiDoi;
                    string gioiTinh = hocVien.GioiTinh;

                    // Tìm số lần gác thấp nhất trong cùng đơn vị và giới tính
                    var soLanGacMoi = await _context.HocViens
                        .Where(h => h.MaDaiDoi == maDonVi && h.GioiTinh == gioiTinh && h.Gac == true)
                        .MinAsync(h => (int?)h.SoLanGac) ?? 0;

                    using (var transaction = _context.Database.BeginTransaction())
                    {
                        try
                        {
                            // Cập nhật trạng thái gác và số lần gác của học viên
                            hocVien.Gac = true;
                            hocVien.SoLanGac = soLanGacMoi;
                            hocVien.LastModified = DateTime.Now;
                            _context.Update(hocVien);
                            await _context.SaveChangesAsync();

                            // Cập nhật bảng lịch sử nghỉ gác
                            var lichSuNghiGac = await _context.LichSuNghiGacs
                                .Where(ls => ls.MaHocVien == model.MaHocVien && ls.NgayKetThuc == null)
                                .OrderByDescending(ls => ls.NgayBatDau)
                                .FirstOrDefaultAsync();

                            if (lichSuNghiGac != null)
                            {
                                lichSuNghiGac.NgayKetThuc = DateTime.Now;
                                lichSuNghiGac.SlgacKetThuc = soLanGacMoi;
                                lichSuNghiGac.NguoiCapNhat = User.Identity?.Name ?? "admin";
                                _context.Update(lichSuNghiGac);
                                await _context.SaveChangesAsync();
                            }
                            else
                            {
                                // Tạo bản ghi mới nếu không tìm thấy
                                var newLichSu = new LichSuNghiGac
                                {
                                    MaHocVien = model.MaHocVien,
                                    NgayBatDau = model.NgayBatDau,
                                    NgayKetThuc = DateTime.Now,
                                    SlgacBatDau = model.SoLanGacBatDau,
                                    SlgacKetThuc = soLanGacMoi,
                                    LyDo = "Kích hoạt lại tự động",
                                    NguoiCapNhat = User.Identity?.Name ?? "admin"
                                };

                                _context.Add(newLichSu);
                                await _context.SaveChangesAsync();
                            }

                            transaction.Commit();

                            TempData["SuccessMessage"] = "Đã kích hoạt lại gác cho học viên thành công!";
                            return RedirectToAction("HocVienTheoDaiDoi", new { page = page, MaHV = MaHV, TenHV = TenHV, Gioitinh = Gioitinh, CapBac = CapBac, madaidoi = madaidoi });
                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            ModelState.AddModelError("", "Lỗi khi lưu dữ liệu: " + ex.Message);
                        }
                    }
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Lỗi khi kích hoạt lại: " + ex.Message);
                }
            }

            ViewBag.CurrentMaDaiDoi = madaidoi;
            ViewBag.CurrentPage = page;
            ViewBag.CurrentMaHV = MaHV;
            ViewBag.CurrentTenHV = TenHV;
            ViewBag.CurrentCapbac = CapBac;
            ViewBag.CurrentGioiTinh = Gioitinh;

            return View(model);
        }


        // POST: HocViens/TamNghiGacAjax
        [HttpPost]
        public async Task<IActionResult> TamNghiGacAjax(string MaHocVien, DateTime NgayBatDau, string LyDo, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi)
        {
            try
            {
                // Cập nhật trạng thái Gac = 0 cho học viên
                var hocVien = await _context.HocViens.FindAsync(MaHocVien);
                if (hocVien == null)
                {
                    return Json(new { success = false, message = "Không tìm thấy học viên" });
                }

                // Lưu số lần gác hiện tại
                var soLanGacHienTai = hocVien.SoLanGac;

                using (var transaction = _context.Database.BeginTransaction())
                {
                    try
                    {
                        // Cập nhật trạng thái gác
                        hocVien.Gac = false;
                        hocVien.LastModified = DateTime.Now;
                        _context.Update(hocVien);
                        await _context.SaveChangesAsync();

                        // Tạo bản ghi lịch sử nghỉ gác
                        var lichSuNghiGac = new LichSuNghiGac
                        {
                            MaNghiGac = Guid.NewGuid().ToString(),
                            MaHocVien = MaHocVien,
                            NgayBatDau = NgayBatDau,
                            NgayKetThuc = null,
                            SlgacBatDau = soLanGacHienTai ?? 0,
                            SlgacKetThuc = null,
                            LyDo = LyDo,
                            NguoiCapNhat = User.Identity?.Name ?? "admin"
                        };

                        _context.LichSuNghiGacs.Add(lichSuNghiGac);
                        await _context.SaveChangesAsync();

                        transaction.Commit();

                        return Json(new { success = true });
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        return Json(new { success = false, message = ex.Message });
                    }
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }

        // POST: HocViens/KichHoatGacAjax
        [HttpPost]
        public async Task<IActionResult> KichHoatGacAjax(string MaHocVien, int? page, string? MaHV, string? TenHV, string? CapBac, string? Gioitinh, string? madaidoi)
        {
            try
            {
                // Lấy thông tin về đơn vị và giới tính của học viên
                var hocVien = await _context.HocViens.FindAsync(MaHocVien);
                if (hocVien == null)
                {
                    return Json(new { success = false, message = "Không tìm thấy học viên" });
                }

                string maDonVi = hocVien.MaDaiDoi;
                string gioiTinh = hocVien.GioiTinh;

                // Tìm số lần gác thấp nhất trong cùng đơn vị và giới tính
                var soLanGacMoi = await _context.HocViens
                    .Where(h => h.MaDaiDoi == maDonVi && h.GioiTinh == gioiTinh && h.Gac == true)
                    .MinAsync(h => (int?)h.SoLanGac) ?? 0;

                using (var transaction = _context.Database.BeginTransaction())
                {
                    try
                    {
                        // Cập nhật trạng thái gác và số lần gác của học viên
                        hocVien.Gac = true;
                        hocVien.SoLanGac = soLanGacMoi;
                        hocVien.LastModified = DateTime.Now;
                        _context.Update(hocVien);
                        await _context.SaveChangesAsync();

                        // Cập nhật bảng lịch sử nghỉ gác
                        var lichSuNghiGac = await _context.LichSuNghiGacs
                            .Where(ls => ls.MaHocVien == MaHocVien && ls.NgayKetThuc == null)
                            .OrderByDescending(ls => ls.NgayBatDau)
                            .FirstOrDefaultAsync();

                        if (lichSuNghiGac != null)
                        {
                            lichSuNghiGac.NgayKetThuc = DateTime.Now;
                            lichSuNghiGac.SlgacKetThuc = soLanGacMoi;
                            lichSuNghiGac.NguoiCapNhat = User.Identity?.Name ?? "admin";
                            _context.Update(lichSuNghiGac);
                            await _context.SaveChangesAsync();
                        }
                        else
                        {
                            // Tạo bản ghi mới nếu không tìm thấy
                            var newLichSu = new LichSuNghiGac
                            {
                                MaNghiGac = Guid.NewGuid().ToString(),
                                MaHocVien = MaHocVien,
                                NgayBatDau = DateTime.Now.AddDays(-30),
                                NgayKetThuc = DateTime.Now,
                                SlgacBatDau = hocVien.SoLanGac ?? 0,
                                SlgacKetThuc = soLanGacMoi,
                                LyDo = "Kích hoạt lại tự động",
                                NguoiCapNhat = User.Identity?.Name ?? "admin"
                            };

                            _context.Add(newLichSu);
                            await _context.SaveChangesAsync();
                        }

                        transaction.Commit();

                        return Json(new { success = true });
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        return Json(new { success = false, message = ex.Message });
                    }
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }
    }

}
