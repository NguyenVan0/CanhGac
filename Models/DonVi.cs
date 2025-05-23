﻿using System;
using System.Collections.Generic;

namespace CanhGac.Models;

public partial class DonVi
{
    public string MaDonVi { get; set; } = null!;

    public string TenDonVi { get; set; } = null!;

    public int? QuanSo { get; set; }

    public string? MauSac { get; set; }

    public bool? Gac { get; set; }

    public virtual ICollection<HocVien> HocViens { get; set; } = new List<HocVien>();

    public virtual ICollection<ThongTinGac> ThongTinGacs { get; set; } = new List<ThongTinGac>();
}
