using System.ComponentModel.DataAnnotations;

namespace CanhGac.ModelViews
{
    public class TamNghiGacViewModel
    {
        public string MaHocVien { get; set; }
        public string TenHocVien { get; set; }
        public string MaDonVi { get; set; }
        public string TenDonVi { get; set; }
        public string GioiTinh { get; set; }
        public int? SoLanGac { get; set; }

        [Required(ErrorMessage = "Ngày bắt đầu nghỉ là bắt buộc")]
        [DataType(DataType.Date)]
        [Display(Name = "Ngày bắt đầu nghỉ")]
        public DateTime NgayBatDau { get; set; }

        [Required(ErrorMessage = "Lý do nghỉ là bắt buộc")]
        [Display(Name = "Lý do nghỉ")]
        public string LyDo { get; set; }
    }

    
}
