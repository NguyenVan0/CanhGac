using System;
using System.Collections.Generic;

namespace CanhGac.Models;

public partial class NhatKyTruyCap
{
    public int Id { get; set; }

    public int? AccountId { get; set; }

    public string? Action { get; set; }

    public string? TableAffected { get; set; }

    public DateTime? TimeStamp { get; set; }

    public string? Ipaddress { get; set; }

    public virtual Account? Account { get; set; }
}
