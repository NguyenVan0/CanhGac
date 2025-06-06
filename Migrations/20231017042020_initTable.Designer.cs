﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using CanhGac.Models;

#nullable disable

namespace MyPhamCheilinus.Migrations
{
    [DbContext(typeof(CanhGacContext))]
    [Migration("20231017042020_initTable")]
    partial class initTable
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.11")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("MyPhamCheilinus.Models.Account", b =>
                {
                    b.Property<int>("AccountId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AccountId"));

                    b.Property<string>("AccountEmail")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("AccountPassword")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<bool>("Active")
                        .HasColumnType("bit");

                    b.Property<DateTime?>("CreateDate")
                        .HasColumnType("datetime");

                    b.Property<string>("FullName")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<DateTime?>("LastLogin")
                        .HasColumnType("datetime");

                    b.Property<string>("Phone")
                        .HasMaxLength(12)
                        .IsUnicode(false)
                        .HasColumnType("varchar(12)");

                    b.Property<int?>("RoleId")
                        .HasColumnType("int");

                    b.Property<string>("Sail")
                        .HasMaxLength(6)
                        .HasColumnType("nchar(6)")
                        .IsFixedLength();

                    b.HasKey("AccountId");

                    b.HasIndex("RoleId");

                    b.ToTable("Account", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.ChiTietDonHang", b =>
                {
                    b.Property<string>("MaDonHang")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("MaSanPham")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<double?>("GiaBan")
                        .HasColumnType("float");

                    b.Property<int?>("SoLuong")
                        .HasColumnType("int");

                    b.HasKey("MaDonHang", "MaSanPham");

                    b.HasIndex("MaSanPham");

                    b.ToTable("ChiTietDonHang", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.ChiTietLoHang", b =>
                {
                    b.Property<string>("MaLoHang")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("MaSanPham")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<double?>("GiaNhap")
                        .HasColumnType("float");

                    b.Property<int?>("SoLuong")
                        .HasColumnType("int");

                    b.HasKey("MaLoHang", "MaSanPham");

                    b.HasIndex("MaSanPham");

                    b.ToTable("ChiTietLoHang", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.Ctloai", b =>
                {
                    b.Property<string>("MaCtloai")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("MaCTLoai");

                    b.Property<string>("MaLoai")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("TenCtloai")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("TenCTLoai");

                    b.HasKey("MaCtloai");

                    b.HasIndex("MaLoai");

                    b.ToTable("CTLoai", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.DanhMucSanPham", b =>
                {
                    b.Property<string>("MaDanhMuc")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<double?>("DanhGia")
                        .HasColumnType("float");

                    b.Property<double?>("Gia")
                        .HasColumnType("float");

                    b.Property<string>("HinhAnh")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)");

                    b.Property<string>("MaCtloai")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("MaCTLoai");

                    b.Property<string>("MaHang")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("MoTa")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("TenDanhMuc")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)");

                    b.HasKey("MaDanhMuc");

                    b.HasIndex("MaCtloai");

                    b.HasIndex("MaHang");

                    b.ToTable("DanhMucSanPham", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.DonHang", b =>
                {
                    b.Property<string>("MaDonHang")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("MaKhachHang")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<DateTime?>("NgayDatHang")
                        .HasColumnType("date");

                    b.Property<double?>("PhiVanChuyen")
                        .HasColumnType("float");

                    b.Property<bool?>("ThanhToan")
                        .HasColumnType("bit");

                    b.Property<double?>("TongTien")
                        .HasColumnType("float");

                    b.Property<int?>("TrangThaiDonHang")
                        .HasColumnType("int");

                    b.Property<int?>("VanChuyen")
                        .HasColumnType("int");

                    b.HasKey("MaDonHang");

                    b.HasIndex("MaKhachHang");

                    b.ToTable("DonHang", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.Hang", b =>
                {
                    b.Property<string>("MaHang")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("TenHang")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)");

                    b.Property<string>("XuatXu")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("MaHang");

                    b.ToTable("Hang", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.HoaDon", b =>
                {
                    b.Property<string>("MaHoaDon")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("MaDonHang")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<DateTime?>("NgayLap")
                        .HasColumnType("date");

                    b.Property<double?>("TongTien")
                        .HasColumnType("float");

                    b.HasKey("MaHoaDon");

                    b.HasIndex("MaDonHang");

                    b.ToTable("HoaDon", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.KhachHang", b =>
                {
                    b.Property<string>("MaKhachHang")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("DiaChi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("SoDienThoai")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("TenKhachHang")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)");

                    b.HasKey("MaKhachHang");

                    b.ToTable("KhachHang", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.LoHang", b =>
                {
                    b.Property<string>("MaLoHang")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<double?>("GiaLo")
                        .HasColumnType("float");

                    b.Property<string>("MaNhaPp")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("MaNhaPP");

                    b.Property<DateTime?>("NgayNhan")
                        .HasColumnType("date");

                    b.HasKey("MaLoHang");

                    b.HasIndex("MaNhaPp");

                    b.ToTable("LoHang", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.Loai", b =>
                {
                    b.Property<string>("MaLoai")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("TenLoai")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)");

                    b.HasKey("MaLoai");

                    b.ToTable("Loai", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.NhaPhanPhoi", b =>
                {
                    b.Property<string>("MaNhaPp")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("MaNhaPP");

                    b.Property<string>("DiaChi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .HasMaxLength(150)
                        .HasColumnType("nvarchar(150)");

                    b.Property<string>("Sdt")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("SDT");

                    b.Property<string>("TenNhaPp")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("TenNhaPP");

                    b.HasKey("MaNhaPp");

                    b.ToTable("NhaPhanPhoi", (string)null);
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.Role", b =>
                {
                    b.Property<int>("RoleId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("RoleId"));

                    b.Property<string>("Description")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("RoleName")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("RoleId")
                        .HasName("PK_Role");

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.SanPham", b =>
                {
                    b.Property<string>("MaSanPham")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Anh")
                        .HasColumnType("nvarchar(max)");

                    b.Property<double?>("Gia")
                        .HasColumnType("float");

                    b.Property<double?>("KhuyenMai")
                        .HasColumnType("float");

                    b.Property<int?>("LuotMua")
                        .HasColumnType("int");

                    b.Property<string>("MaDanhMuc")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Mau")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<DateTime?>("NgaySx")
                        .HasColumnType("date")
                        .HasColumnName("NgaySX");

                    b.Property<int?>("Slkho")
                        .HasColumnType("int")
                        .HasColumnName("SLKho");

                    b.Property<string>("TenSanPham")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)");

                    b.HasKey("MaSanPham");

                    b.HasIndex("MaDanhMuc");

                    b.ToTable("SanPham", null, t =>
                        {
                            t.HasTrigger("UpdateGiaDanhMucSanPham");
                        });
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.Account", b =>
                {
                    b.HasOne("MyPhamCheilinus.Models.Role", "Role")
                        .WithMany("Accounts")
                        .HasForeignKey("RoleId")
                        .HasConstraintName("FK_Account_Role");

                    b.Navigation("Role");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.ChiTietDonHang", b =>
                {
                    b.HasOne("MyPhamCheilinus.Models.DonHang", "MaDonHangNavigation")
                        .WithMany("ChiTietDonHangs")
                        .HasForeignKey("MaDonHang")
                        .IsRequired()
                        .HasConstraintName("FK_ChiTietDonHang_DonHang");

                    b.HasOne("MyPhamCheilinus.Models.SanPham", "MaSanPhamNavigation")
                        .WithMany("ChiTietDonHangs")
                        .HasForeignKey("MaSanPham")
                        .IsRequired()
                        .HasConstraintName("FK_ChiTietDonHang_SanPham");

                    b.Navigation("MaDonHangNavigation");

                    b.Navigation("MaSanPhamNavigation");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.ChiTietLoHang", b =>
                {
                    b.HasOne("MyPhamCheilinus.Models.LoHang", "MaLoHangNavigation")
                        .WithMany("ChiTietLoHangs")
                        .HasForeignKey("MaLoHang")
                        .IsRequired()
                        .HasConstraintName("FK_ChiTietLoHang_LoHang");

                    b.HasOne("MyPhamCheilinus.Models.SanPham", "MaSanPhamNavigation")
                        .WithMany("ChiTietLoHangs")
                        .HasForeignKey("MaSanPham")
                        .IsRequired()
                        .HasConstraintName("FK_ChiTietLoHang_SanPham");

                    b.Navigation("MaLoHangNavigation");

                    b.Navigation("MaSanPhamNavigation");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.Ctloai", b =>
                {
                    b.HasOne("MyPhamCheilinus.Models.Loai", "MaLoaiNavigation")
                        .WithMany("Ctloais")
                        .HasForeignKey("MaLoai")
                        .HasConstraintName("FK_CTLoai_Loai");

                    b.Navigation("MaLoaiNavigation");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.DanhMucSanPham", b =>
                {
                    b.HasOne("MyPhamCheilinus.Models.Ctloai", "MaCtloaiNavigation")
                        .WithMany("DanhMucSanPhams")
                        .HasForeignKey("MaCtloai")
                        .HasConstraintName("FK_DanhMucSanPham_CTLoai");

                    b.HasOne("MyPhamCheilinus.Models.Hang", "MaHangNavigation")
                        .WithMany("DanhMucSanPhams")
                        .HasForeignKey("MaHang")
                        .HasConstraintName("FK_DanhMucSanPham_Hang");

                    b.Navigation("MaCtloaiNavigation");

                    b.Navigation("MaHangNavigation");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.DonHang", b =>
                {
                    b.HasOne("MyPhamCheilinus.Models.KhachHang", "MaKhachHangNavigation")
                        .WithMany("DonHangs")
                        .HasForeignKey("MaKhachHang")
                        .HasConstraintName("FK_DonHang_KhachHang");

                    b.Navigation("MaKhachHangNavigation");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.HoaDon", b =>
                {
                    b.HasOne("MyPhamCheilinus.Models.DonHang", "MaDonHangNavigation")
                        .WithMany("HoaDons")
                        .HasForeignKey("MaDonHang")
                        .HasConstraintName("FK_HoaDon_DonHang");

                    b.Navigation("MaDonHangNavigation");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.LoHang", b =>
                {
                    b.HasOne("MyPhamCheilinus.Models.NhaPhanPhoi", "MaNhaPpNavigation")
                        .WithMany("LoHangs")
                        .HasForeignKey("MaNhaPp")
                        .HasConstraintName("FK_LoHang_NhaPhanPhoi");

                    b.Navigation("MaNhaPpNavigation");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.SanPham", b =>
                {
                    b.HasOne("MyPhamCheilinus.Models.DanhMucSanPham", "MaDanhMucNavigation")
                        .WithMany("SanPhams")
                        .HasForeignKey("MaDanhMuc")
                        .HasConstraintName("FK_SanPham_DanhMucSanPham");

                    b.Navigation("MaDanhMucNavigation");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.Ctloai", b =>
                {
                    b.Navigation("DanhMucSanPhams");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.DanhMucSanPham", b =>
                {
                    b.Navigation("SanPhams");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.DonHang", b =>
                {
                    b.Navigation("ChiTietDonHangs");

                    b.Navigation("HoaDons");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.Hang", b =>
                {
                    b.Navigation("DanhMucSanPhams");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.KhachHang", b =>
                {
                    b.Navigation("DonHangs");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.LoHang", b =>
                {
                    b.Navigation("ChiTietLoHangs");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.Loai", b =>
                {
                    b.Navigation("Ctloais");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.NhaPhanPhoi", b =>
                {
                    b.Navigation("LoHangs");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.Role", b =>
                {
                    b.Navigation("Accounts");
                });

            modelBuilder.Entity("MyPhamCheilinus.Models.SanPham", b =>
                {
                    b.Navigation("ChiTietDonHangs");

                    b.Navigation("ChiTietLoHangs");
                });
#pragma warning restore 612, 618
        }
    }
}
