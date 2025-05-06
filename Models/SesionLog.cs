using System;
using System.Collections.Generic;

namespace CanhGac.Models;

public partial class SesionLog
{
    public string SessionId { get; set; } = null!;

    public int? AccountId { get; set; }

    public DateTime? LoginTime { get; set; }

    public DateTime? LogoutTime { get; set; }

    public string? Ipaddress { get; set; }

    public virtual Account? Account { get; set; }
}
