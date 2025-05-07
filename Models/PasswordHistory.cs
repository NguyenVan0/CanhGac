using System;
using System.Collections.Generic;

namespace CanhGac.Models;

public partial class PasswordHistory
{
    public int Id { get; set; }

    public int? AccountId { get; set; }

    public string? PasswordHash { get; set; }

    public DateTime? ChangeDate { get; set; }

    public virtual Account? Account { get; set; }
}
