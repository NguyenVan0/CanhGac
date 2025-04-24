using System;
using System.Collections.Generic;

namespace CanhGac.Models;

public partial class ViPham
{
    public int MaViPham { get; set; }

    public string? TenViPham { get; set; }

    public virtual ICollection<KiemTraGac> KiemTraGacs { get; set; } = new List<KiemTraGac>();
}
