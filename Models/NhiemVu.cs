﻿using System;
using System.Collections.Generic;

namespace CanhGac.Models;

public partial class NhiemVu
{
    public int MaNhiemVu { get; set; }

    public string? TenNhiemVu { get; set; }

    public int? MaVongGac { get; set; }

    public virtual ICollection<KiemTraGac> KiemTraGacs { get; set; } = new List<KiemTraGac>();

    public virtual VongGac? MaVongGacNavigation { get; set; }

    public virtual ICollection<Pcgac> Pcgacs { get; set; } = new List<Pcgac>();
}
