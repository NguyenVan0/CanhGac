using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace CanhGac.Models;

public partial class CanhGacContext : DbContext
{
    public CanhGacContext()
    {
    }

    public CanhGacContext(DbContextOptions<CanhGacContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Account> Accounts { get; set; }

    public virtual DbSet<CaGac> CaGacs { get; set; }

    public virtual DbSet<CapBac> CapBacs { get; set; }

    public virtual DbSet<ChucVu> ChucVus { get; set; }
    public virtual DbSet<ViPham> ViPhams { get; set; }
    public virtual DbSet<DonVi> DonVis { get; set; }

    public virtual DbSet<HocVien> HocViens { get; set; }

    public virtual DbSet<KiemTraGac> KiemTraGacs { get; set; }

    public virtual DbSet<LichSuNghiGac> LichSuNghiGacs { get; set; }

    public virtual DbSet<NhatKyTruyCap> NhatKyTruyCaps { get; set; }

    public virtual DbSet<NhiemVu> NhiemVus { get; set; }

    public virtual DbSet<PasswordHistory> PasswordHistories { get; set; }

    public virtual DbSet<Pcgac> Pcgacs { get; set; }
    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<SesionLog> SesionLogs { get; set; }

    public virtual DbSet<SyQuanKiemTra> SyQuanKiemTras { get; set; }

    public virtual DbSet<ThongTinGac> ThongTinGacs { get; set; }


    public virtual DbSet<VongGac> VongGacs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
   => optionsBuilder.UseSqlServer("Data Source=ADMIN-PC\\SQLEXPRESS;Initial Catalog=Canh_gac;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Account>(entity =>
        {
            entity.ToTable("Account");

            entity.Property(e => e.AccountId).HasColumnName("AccountID");
            entity.Property(e => e.CreateDate).HasColumnType("date");
            entity.Property(e => e.LastLogin).HasColumnType("date");
            entity.Property(e => e.Pasword).HasMaxLength(50);
            entity.Property(e => e.Phone)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.Salt)
                .HasMaxLength(6)
                .IsFixedLength();
            entity.Property(e => e.TenDonVi).HasMaxLength(50);
            entity.Property(e => e.UserName).HasMaxLength(50);

            entity.HasOne(d => d.Role).WithMany(p => p.Accounts)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK_Account_Roles");
        });

        modelBuilder.Entity<CaGac>(entity =>
        {
            entity.HasKey(e => e.MaCaGac);

            entity.ToTable("CaGac");

            entity.Property(e => e.MaCaGac).ValueGeneratedNever();
        });

        modelBuilder.Entity<CapBac>(entity =>
        {
            entity.HasKey(e => e.MaCapBac).HasName("PK__CapBac__21908825D2DFFC70");

            entity.ToTable("CapBac");

            entity.Property(e => e.MaCapBac)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.TenCapBac).HasMaxLength(50);
        });

        modelBuilder.Entity<ChucVu>(entity =>
        {
            entity.HasKey(e => e.MaChucVu).HasName("PK__ChucVu__D4639533164955E6");

            entity.ToTable("ChucVu");

            entity.Property(e => e.MaChucVu)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.TenChucVu).HasMaxLength(50);
        });
        modelBuilder.Entity<ViPham>(entity =>
        {
            entity.HasKey(e => e.MaViPham).HasName("PK__ViPham__D4639533B1E59DD0");

            entity.ToTable("ViPham");

            entity.Property(e => e.MaViPham)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.TenViPham).HasMaxLength(50);
        });

        modelBuilder.Entity<DonVi>(entity =>
        {
            entity.HasKey(e => e.MaDonVi).HasName("PK_DaiDoi");

            entity.ToTable("DonVi");

            entity.Property(e => e.MaDonVi)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.MauSac).HasMaxLength(50);
            entity.Property(e => e.TenDonVi).HasMaxLength(50);
        });

        modelBuilder.Entity<HocVien>(entity =>
        {
            entity.HasKey(e => e.MaHocVien).HasName("PK__HocVien__685B0E6A0785028D");

            entity.ToTable("HocVien");

            entity.Property(e => e.MaHocVien)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.GioiTinh).HasMaxLength(4);
            entity.Property(e => e.LastModified).HasColumnType("datetime");
            entity.Property(e => e.MaCapBac)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.MaChucVu)
                .HasMaxLength(10)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.MaDaiDoi)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.NgaySinh).HasColumnType("date");
            entity.Property(e => e.TenHocVien).HasMaxLength(150);

            entity.HasOne(d => d.MaCapBacNavigation).WithMany(p => p.HocViens)
                .HasForeignKey(d => d.MaCapBac)
                .HasConstraintName("FK_HocVien_CapBac");

            entity.HasOne(d => d.MaChucVuNavigation).WithMany(p => p.HocViens)
                .HasForeignKey(d => d.MaChucVu)
                .HasConstraintName("FK_HocVien_ChucVu");

            entity.HasOne(d => d.MaDaiDoiNavigation).WithMany(p => p.HocViens)
                .HasForeignKey(d => d.MaDaiDoi)
                .HasConstraintName("FK_HocVien_DonVi");
        });

        modelBuilder.Entity<KiemTraGac>(entity =>
        {
            entity.HasKey(e => e.MaKTG); // ✅ MaKTG là PRIMARY KEY và IDENTITY

            entity.ToTable("KiemTraGac");

            entity.Property(e => e.MaKTG)
                  .HasColumnName("MaKTG")
                  .ValueGeneratedOnAdd(); // ✅ Báo cho EF đây là cột tự tăng

            entity.Property(e => e.MaSqkt).HasColumnName("MaSqkt");
            entity.Property(e => e.Ngay).HasColumnType("date");
            entity.Property(e => e.TrangThai).HasMaxLength(200);

            // Khóa ngoại
            entity.HasOne(d => d.MaSqktNavigation)
                .WithMany(p => p.KiemTraGacs)
                .HasForeignKey(d => d.MaSqkt)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_KiemTraGac_SyQuanKiemTra");

            entity.HasOne(d => d.MaViPhamNavigation)
                .WithMany(p => p.KiemTraGacs)
                .HasForeignKey(d => d.MaViPham)
                .HasConstraintName("FK_KiemTraGac_ViPham");

            entity.HasOne(d => d.NgayNavigation)
                .WithMany(p => p.KiemTraGacs)
                .HasForeignKey(d => d.Ngay)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_KiemTraGac_ThongTinGac");

            entity.HasOne(d => d.NhiemVuHocVienNavigation)
                .WithMany(p => p.KiemTraGacs)
                .HasForeignKey(d => d.NhiemVuHocVien)
                .HasConstraintName("FK_KiemTraGac_NhiemVu");
        });

        modelBuilder.Entity<LichSuNghiGac>(entity =>
        {
            entity.HasKey(e => e.MaNghiGac);

            entity.ToTable("LichSuNghiGac");

            entity.Property(e => e.MaNghiGac)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.MaHocVien)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.NgayBatDau).HasColumnType("date");
            entity.Property(e => e.NgayKetThuc).HasColumnType("date");
            entity.Property(e => e.NguoiCapNhat)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.SlgacBatDau).HasColumnName("SLGacBatDau");
            entity.Property(e => e.SlgacKetThuc).HasColumnName("SLGacKetThuc");

            entity.HasOne(d => d.MaHocVienNavigation).WithMany(p => p.LichSuNghiGacs)
                .HasForeignKey(d => d.MaHocVien)
                .HasConstraintName("FK_LichSuNghiGac_HocVien");
        });

        modelBuilder.Entity<NhatKyTruyCap>(entity =>
        {
            entity.ToTable("NhatKyTruyCap");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.AccountId).HasColumnName("AccountID");
            entity.Property(e => e.Action).HasMaxLength(50);
            entity.Property(e => e.Ipaddress)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("IPAddress");
            entity.Property(e => e.TableAffected).HasMaxLength(50);
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");

            entity.HasOne(d => d.Account).WithMany(p => p.NhatKyTruyCaps)
                .HasForeignKey(d => d.AccountId)
                .HasConstraintName("FK_NhatKyTruyCap_Account");
        });

        modelBuilder.Entity<NhiemVu>(entity =>
        {
            entity.HasKey(e => e.MaNhiemVu);

            entity.ToTable("NhiemVu");

            entity.Property(e => e.TenNhiemVu).HasMaxLength(50);

            entity.HasOne(d => d.MaVongGacNavigation).WithMany(p => p.NhiemVus)
                .HasForeignKey(d => d.MaVongGac)
                .HasConstraintName("FK_NhiemVu_VongGac");
        });

        modelBuilder.Entity<PasswordHistory>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_PasswordHistory_1");

            entity.ToTable("PasswordHistory");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.AccountId).HasColumnName("AccountID");
            entity.Property(e => e.ChangeDate).HasColumnType("datetime");
            entity.Property(e => e.PasswordHash).HasMaxLength(50);

            entity.HasOne(d => d.Account).WithMany(p => p.PasswordHistories)
                .HasForeignKey(d => d.AccountId)
                .HasConstraintName("FK_PasswordHistory_Account1");
        });

        modelBuilder.Entity<Pcgac>(entity =>
        {
            entity.HasKey(e => new { e.Ngay, e.MaHocVien });

            entity.ToTable("PCGac");

            entity.Property(e => e.Ngay).HasColumnType("date");
            entity.Property(e => e.MaHocVien)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.MaCaGacNavigation).WithMany(p => p.Pcgacs)
                .HasForeignKey(d => d.MaCaGac)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PCGac_CaGac");

            entity.HasOne(d => d.MaHocVienNavigation).WithMany(p => p.Pcgacs)
                .HasForeignKey(d => d.MaHocVien)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PCGac_HocVien");

            entity.HasOne(d => d.MaNhiemVuNavigation).WithMany(p => p.Pcgacs)
                .HasForeignKey(d => d.MaNhiemVu)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PCGac_NhiemVu");

            entity.HasOne(d => d.NgayNavigation).WithMany(p => p.Pcgacs)
                .HasForeignKey(d => d.Ngay)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PCGac_ThongTinGac");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.Description).HasMaxLength(50);
            entity.Property(e => e.RoleName).HasMaxLength(50);
        });

        modelBuilder.Entity<SesionLog>(entity =>
        {
            entity.HasKey(e => e.SessionId);

            entity.ToTable("SesionLog");

            entity.Property(e => e.SessionId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("SessionID");
            entity.Property(e => e.AccountId).HasColumnName("AccountID");
            entity.Property(e => e.Ipaddress)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("IPAddress");
            entity.Property(e => e.LoginTime).HasColumnType("datetime");
            entity.Property(e => e.LogoutTime).HasColumnType("datetime");

            entity.HasOne(d => d.Account).WithMany(p => p.SesionLogs)
                .HasForeignKey(d => d.AccountId)
                .HasConstraintName("FK_SesionLog_Account");
        });

        modelBuilder.Entity<SyQuanKiemTra>(entity =>
        {
            entity.HasKey(e => e.MaSqkt);

            entity.ToTable("SyQuanKiemTra");

            entity.Property(e => e.MaSqkt)
                .ValueGeneratedNever()
                .HasColumnName("MaSqkt");
            entity.Property(e => e.NghiepVu).HasMaxLength(50);
        });

        modelBuilder.Entity<ThongTinGac>(entity =>
        {
            entity.HasKey(e => e.Ngay);

            entity.ToTable("ThongTinGac");

            entity.Property(e => e.Ngay).HasColumnType("date");
            entity.Property(e => e.Dap).HasMaxLength(50);
            entity.Property(e => e.Hoi).HasMaxLength(50);
            entity.Property(e => e.MaDonVi)
                .HasMaxLength(20)
                .IsUnicode(false);

            entity.HasOne(d => d.MaDonViNavigation).WithMany(p => p.ThongTinGacs)
                .HasForeignKey(d => d.MaDonVi)
                .HasConstraintName("FK_ThongTinGac_DonVi");
        });

        modelBuilder.Entity<ViPham>(entity =>
        {
            entity.HasKey(e => e.MaViPham);

            entity.ToTable("ViPham");

            entity.Property(e => e.MaViPham).ValueGeneratedNever();
            entity.Property(e => e.TenViPham).HasMaxLength(50);
        });

        modelBuilder.Entity<VongGac>(entity =>
        {
            entity.HasKey(e => e.MaVongGac);

            entity.ToTable("VongGac");

            entity.Property(e => e.TenVongGac).HasMaxLength(50);
            entity.Property(e => e.ViTri).HasMaxLength(250);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
