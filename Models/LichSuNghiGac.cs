using System;
using System.Collections.Generic;

namespace CanhGac.Models;

public partial class LichSuNghiGac
{
    public string MaNghiGac { get; set; } = null!;

    public string? MaHocVien { get; set; }

    public DateTime? NgayBatDau { get; set; }

    public DateTime? NgayKetThuc { get; set; }

    public int? SlgacBatDau { get; set; }

    public int? SlgacKetThuc { get; set; }

    public string? LyDo { get; set; }

    public string? NguoiCapNhat { get; set; }

    public virtual HocVien? MaHocVienNavigation { get; set; }
}
