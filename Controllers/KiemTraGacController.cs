using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using CanhGac.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using CanhGac.ModelViews;

namespace CanhGac.Controllers
{
    public class KiemTraGacController : Controller
    {
        private readonly CanhGacContext _context;

        public KiemTraGacController(CanhGacContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            // Lấy toàn bộ danh sách vi phạm từ bảng ViPhams
            var ViPhamList = await _context.ViPhams.ToListAsync();
            return View(ViPhamList);
        }
        public async Task<IActionResult> Details(int id)
        {
            if (id == null || _context.ViPhams == null)
            {
                return NotFound();
            }

            var ViPham = await _context.ViPhams
                .FirstOrDefaultAsync(m => m.MaViPham == id);
            if (ViPham == null)
            {
                return NotFound();
            }

            return View(ViPham);
        }

        // GET: ViPhams/Create
        public IActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaViPham,TenViPham")] ViPham ViPham)
        {
            if (ModelState.IsValid)
            {
                _context.Add(ViPham);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(ViPham);
        }


        // GET: ViPhams/Edit/5
        public async Task<IActionResult> Edit(int id)
        {
            if (id == null || _context.ViPhams == null)
            {
                return NotFound();
            }

            var ViPham = await _context.ViPhams.FindAsync(id);
            if (ViPham == null)
            {
                return NotFound();
            }
            return View(ViPham);
        }

        // POST: ViPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MaViPham,TenViPham")] ViPham ViPham)
        {
            if (id != ViPham.MaViPham)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(ViPham);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ViPhamExists(ViPham.MaViPham))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(ViPham);
        }

        // POST: ViPhams/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var ViPham = await _context.ViPhams.FindAsync(id);
            if (ViPham != null)
            {
                _context.ViPhams.Remove(ViPham);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        private bool ViPhamExists(int id)
        {
            return (_context.ViPhams?.Any(e => e.MaViPham == id)).GetValueOrDefault();
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        ///
        public async Task<IActionResult> LSGac()
        {
            var list = await (from kt in _context.KiemTraGacs
                              join nv in _context.NhiemVus on kt.NhiemVuHocVien equals nv.MaNhiemVu
                              join sq in _context.SyQuanKiemTras on kt.MaSqkt equals sq.MaSqkt
                              join vp in _context.ViPhams on kt.MaViPham equals vp.MaViPham into vpGroup
                              from vp in vpGroup.DefaultIfEmpty()
                              join ttg in _context.ThongTinGacs on kt.Ngay equals ttg.Ngay
                              select new KiemTraGacViewModel
                              {
                                  MaSQKT = kt.MaSqkt,
                                  MaKTG = kt.MaKTG,
                                  Ngay = kt.Ngay,
                                  CaGac = kt.CaGac.HasValue ? kt.CaGac.Value.ToString(@"hh\:mm") : "Không rõ",
                                  TrangThai = kt.TrangThai,
                                  TenNhiemVu = nv.TenNhiemVu,
                                  NghiepVu = sq.NghiepVu,
                                  TenViPham = vp != null ? vp.TenViPham : "Không vi phạm",
                                  MaDonVi = ttg.MaDonVi
                              }).ToListAsync();

            return View(list);
        }
        // GET: KiemTraGac/Create
        public IActionResult CreateLSGac()
        {
            ViewBag.NhiemVuList = new SelectList(_context.NhiemVus.ToList(), "MaNhiemVu", "TenNhiemVu");
            ViewBag.ViPhamList = new SelectList(_context.ViPhams.ToList(), "MaViPham", "TenViPham");
            ViewBag.CaGacList = new SelectList(_context.CaGacs.ToList(), "MaCaGac", "TuGio");

            var list = _context.SyQuanKiemTras
     .Select(sq => new { sq.MaSqkt, sq.NghiepVu })
     .ToList();

            ViewBag.SQKTList = new SelectList(list, "MaSqkt", "NghiepVu");
            return View();
        }

        // POST: KiemTraGac/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateLSGac([Bind("MaSqkt,Ngay,CaGac,TrangThai,NhiemVuHocVien,MaViPham")] KiemTraGac kiemTraGac)
        {
            Console.WriteLine($"MaSqkt nhận được: {kiemTraGac.MaSqkt}"); // 👈 kiểm tra

            _context.Add(kiemTraGac);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(LSGac));
        }
        public async Task<IActionResult> DetailLSGac(int id)
        {
            var kiemTraGac = await _context.KiemTraGacs
         .Include(k => k.MaSqktNavigation)
         .Include(k => k.NhiemVuHocVienNavigation)
         .Include(k => k.MaViPhamNavigation)
         .FirstOrDefaultAsync(m => m.MaKTG == id);

            if (kiemTraGac == null)
            {
                return NotFound();
            }

            return View(kiemTraGac);
        }
        // GET: KiemTraGacs/Edit/5
        public async Task<IActionResult> EditLSGac(int id)
        {
            if (_context.KiemTraGacs == null)
            {
                return NotFound();
            }

            var kiemTraGac = await _context.KiemTraGacs
                .Include(k => k.MaSqktNavigation)
                .Include(k => k.MaViPhamNavigation)
                .Include(k => k.NhiemVuHocVienNavigation)
                .FirstOrDefaultAsync(k => k.MaKTG == id);

            if (kiemTraGac == null)
            {
                return NotFound();
            }

            ViewBag.NhiemVuList = new SelectList(_context.NhiemVus.ToList(), "MaNhiemVu", "TenNhiemVu");
            ViewBag.ViPhamList = new SelectList(_context.ViPhams.ToList(), "MaViPham", "TenViPham");
            ViewBag.SQKTList = new SelectList(_context.SyQuanKiemTras.ToList(), "MaSqkt", "NghiepVu");

            return View(kiemTraGac);
        }

        // POST: KiemTraGacs/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditLSGac(int id, [Bind("MaKTG,MaSqkt,Ngay,CaGac,TrangThai,NhiemVuHocVien,MaViPham")] KiemTraGac kiemTraGac)
        {
            if (id != kiemTraGac.MaKTG)
            {
                return NotFound();
            }

                try
                {
                    _context.Update(kiemTraGac);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!KiemTraGacExists(kiemTraGac.MaKTG))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(LSGac));
          
        }

        private bool KiemTraGacExists(int id)
        {
            return _context.KiemTraGacs.Any(e => e.MaKTG == id);
        }

        // POST: ViPhams/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteLSGac(int MaKTG)
        {
            var KiemTraGac = await _context.KiemTraGacs.FindAsync(MaKTG);
            if (KiemTraGac != null)
            {
                _context.KiemTraGacs.Remove(KiemTraGac);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(LSGac));
        }

        private bool LSGacExists(int MaKTG)
        {
            return (_context.KiemTraGacs?.Any(e => e.MaKTG == MaKTG)).GetValueOrDefault();
        }
    }
}
