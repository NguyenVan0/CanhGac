using System;
using System.Collections.Generic;

namespace CanhGac.Models;

public partial class KiemTraGac
{
    public int MaSqkt { get; set; }

    public DateTime Ngay { get; set; }

    public TimeSpan? Gio { get; set; }

    public string? TrangThai { get; set; }

    public int? NhiemVuHocVien { get; set; }

    public int? MaViPham { get; set; }

    public virtual SyQuanKiemTra MaSqktNavigation { get; set; } = null!;

    public virtual ViPham? MaViPhamNavigation { get; set; }

    public virtual ThongTinGac NgayNavigation { get; set; } = null!;

    public virtual NhiemVu? NhiemVuHocVienNavigation { get; set; }
}
