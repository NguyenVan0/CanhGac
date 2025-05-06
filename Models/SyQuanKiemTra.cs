using System;
using System.Collections.Generic;

namespace CanhGac.Models;

public partial class SyQuanKiemTra
{
    public int MaSqkt { get; set; }

    public string? NghiepVu { get; set; }

    public virtual ICollection<KiemTraGac> KiemTraGacs { get; set; } = new List<KiemTraGac>();
}
