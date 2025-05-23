﻿using System;
using System.Collections.Generic;

namespace CanhGac.Models;

public partial class ThongTinGac
{
    public DateTime Ngay { get; set; }

    public string? Hoi { get; set; }

    public string? Dap { get; set; }

    public string? MaDonVi { get; set; }

    public virtual ICollection<KiemTraGac> KiemTraGacs { get; set; } = new List<KiemTraGac>();

    public virtual DonVi? MaDonViNavigation { get; set; }

    public virtual ICollection<Pcgac> Pcgacs { get; set; } = new List<Pcgac>();
}
