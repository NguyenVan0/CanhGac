using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using CanhGac.Models;

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
    }
}
