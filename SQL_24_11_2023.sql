
USE [Canh_gac]
GO
/****** Object:  User [bao]    Script Date: 12/12/2023 10:03:15 AM ******/
CREATE USER [bao] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/12/2023 10:03:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[TenDonVi] [nvarchar](50) NULL,
	[Pasword] [nvarchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[RoleID] [int] NULL,
	[LastLogin] [date] NULL,
	[CreateDate] [date] NULL,
	[Salt] [nchar](6) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaGac]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaGac](
	[MaCaGac] [int] NOT NULL,
	[TuGio] [time](7) NULL,
	[DenGio] [time](7) NULL,
 CONSTRAINT [PK_CaGac] PRIMARY KEY CLUSTERED 
(
	[MaCaGac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapBac]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapBac](
	[MaCapBac] [char](10) NOT NULL,
	[TenCapBac] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCapBac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [char](10) NOT NULL,
	[TenChucVu] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonVi]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonVi](
	[MaDonVi] [varchar](20) NOT NULL,
	[TenDonVi] [nvarchar](50) NOT NULL,
	[QuanSo] [int] NULL,
	[MauSac] [nvarchar](50) NULL,
 CONSTRAINT [PK_DaiDoi] PRIMARY KEY CLUSTERED 
(
	[MaDonVi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocVien]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocVien](
	[MaHocVien] [varchar](50) NOT NULL,
	[TenHocVien] [nvarchar](150) NULL,
	[NgaySinh] [date] NULL,
	[MaDaiDoi] [varchar](20) NULL,
	[GioiTinh] [nvarchar](4) NULL,
	[Gac] [bit] NULL,
	[SoLanGac] [int] NULL,
	[MaCapBac] [char](10) NULL,
	[MaChucVu] [char](10) NULL,
	[LastModified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHocVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KiemTraGac]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KiemTraGac](
	[MaSQKT] [int] NOT NULL,
	[Ngay] [date] NOT NULL,
	[Gio] [time](7) NULL,
	[TrangThai] [nvarchar](200) NULL,
	[NhiemVuHocVien] [int] NULL,
	[MaViPham] [int] NULL,
 CONSTRAINT [PK_KiemTraGac] PRIMARY KEY CLUSTERED 
(
	[MaSQKT] ASC,
	[Ngay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhatKyTruyCap]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhatKyTruyCap](
	[ID] [int] NOT NULL,
	[AccountID] [int] NULL,
	[Action] [nvarchar](50) NULL,
	[TableAffected] [nvarchar](50) NULL,
	[TimeStamp] [datetime] NULL,
	[IPAddress] [varchar](15) NULL,
 CONSTRAINT [PK_NhatKyTruyCap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhiemVu]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhiemVu](
	[MaNhiemVu] [int] IDENTITY(1,1) NOT NULL,
	[TenNhiemVu] [nvarchar](50) NULL,
	[MaVongGac] [int] NULL,
 CONSTRAINT [PK_NhiemVu] PRIMARY KEY CLUSTERED 
(
	[MaNhiemVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordHistory]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordHistory](
	[ID] [int] NOT NULL,
	[AccountID] [int] NULL,
	[PasswordHash] [nvarchar](50) NULL,
	[ChangeDate] [datetime] NULL,
 CONSTRAINT [PK_PasswordHistory_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCGac]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCGac](
	[Ngay] [date] NOT NULL,
	[MaHocVien] [varchar](50) NOT NULL,
	[MaNhiemVu] [int] NOT NULL,
	[MaCaGac] [int] NOT NULL,
 CONSTRAINT [PK_PCGac] PRIMARY KEY CLUSTERED 
(
	[Ngay] ASC,
	[MaHocVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SesionLog]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SesionLog](
	[SessionID] [varchar](50) NOT NULL,
	[AccountID] [int] NULL,
	[LoginTime] [datetime] NULL,
	[LogoutTime] [datetime] NULL,
	[IPAddress] [varchar](15) NULL,
 CONSTRAINT [PK_SesionLog] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SyQuanKiemTra]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SyQuanKiemTra](
	[MaSQKT] [int] NOT NULL,
	[NghiepVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_SyQuanKiemTra] PRIMARY KEY CLUSTERED 
(
	[MaSQKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinGac]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinGac](
	[Ngay] [date] NOT NULL,
	[Hoi] [nvarchar](50) NULL,
	[Dap] [nvarchar](50) NULL,
	[MaDonVi] [varchar](20) NULL,
 CONSTRAINT [PK_ThongTinGac] PRIMARY KEY CLUSTERED 
(
	[Ngay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViPham]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViPham](
	[MaViPham] [int] NOT NULL,
	[TenViPham] [nvarchar](50) NULL,
 CONSTRAINT [PK_ViPham] PRIMARY KEY CLUSTERED 
(
	[MaViPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VongGac]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VongGac](
	[MaVongGac] [int] IDENTITY(1,1) NOT NULL,
	[TenVongGac] [nvarchar](50) NULL,
	[ViTri] [nvarchar](250) NULL,
 CONSTRAINT [PK_VongGac] PRIMARY KEY CLUSTERED 
(
	[MaVongGac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CaGac] ([MaCaGac], [TuGio], [DenGio]) VALUES (1, CAST(N'19:00:00' AS Time), CAST(N'20:30:00' AS Time))
INSERT [dbo].[CaGac] ([MaCaGac], [TuGio], [DenGio]) VALUES (2, CAST(N'20:30:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[CaGac] ([MaCaGac], [TuGio], [DenGio]) VALUES (3, CAST(N'22:00:00' AS Time), CAST(N'23:00:00' AS Time))
INSERT [dbo].[CaGac] ([MaCaGac], [TuGio], [DenGio]) VALUES (4, CAST(N'23:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[CaGac] ([MaCaGac], [TuGio], [DenGio]) VALUES (5, CAST(N'00:00:00' AS Time), CAST(N'01:00:00' AS Time))
INSERT [dbo].[CaGac] ([MaCaGac], [TuGio], [DenGio]) VALUES (6, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time))
INSERT [dbo].[CaGac] ([MaCaGac], [TuGio], [DenGio]) VALUES (7, CAST(N'02:00:00' AS Time), CAST(N'03:00:00' AS Time))
INSERT [dbo].[CaGac] ([MaCaGac], [TuGio], [DenGio]) VALUES (8, CAST(N'03:00:00' AS Time), CAST(N'04:00:00' AS Time))
INSERT [dbo].[CaGac] ([MaCaGac], [TuGio], [DenGio]) VALUES (9, CAST(N'04:00:00' AS Time), CAST(N'05:30:00' AS Time))
GO
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'1/        ', N'Thiếu úy')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'1//       ', N'Thiếu tá')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'2/        ', N'Trung úy')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'2//       ', N'Trung tá')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'3/        ', N'Thượng úy')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'3//       ', N'Thượng tá')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'4/        ', N'Đại úy')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'4//       ', N'Đại tá')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'B1        ', N'Binh nhất')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'B2        ', N'Binh nhì')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'H1        ', N'Hạ sỹ')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'H2        ', N'Trung sỹ')
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac]) VALUES (N'H3        ', N'Thượng sỹ')
GO
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'1         ', N'Lớp trưởng')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'2         ', N'Học viên')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'3         ', N'Đại đội trưởng')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'4         ', N'Chính trị viên')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'5         ', N'Phó đại đội trưởng')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'6         ', N'Phó chính trị viên')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'7         ', N'Công tác tiểu đoàn')
GO
INSERT [dbo].[DonVi] ([MaDonVi], [TenDonVi], [QuanSo], [MauSac]) VALUES (N'c155', N'Đại đội 155', NULL, NULL)
INSERT [dbo].[DonVi] ([MaDonVi], [TenDonVi], [QuanSo], [MauSac]) VALUES (N'c156', N'Đại đội 156', NULL, NULL)
INSERT [dbo].[DonVi] ([MaDonVi], [TenDonVi], [QuanSo], [MauSac]) VALUES (N'c157', N'Đại đội 157', NULL, NULL)
INSERT [dbo].[DonVi] ([MaDonVi], [TenDonVi], [QuanSo], [MauSac]) VALUES (N'c158', N'Đại đội 158', NULL, NULL)
INSERT [dbo].[DonVi] ([MaDonVi], [TenDonVi], [QuanSo], [MauSac]) VALUES (N'd1', N'Tiểu đoàn 1', NULL, NULL)
GO
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000201', N'Nguyễn Đức Anh', CAST(N'2001-02-24' AS Date), N'c155', N'Nam', 1, 12, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000202', N'Hoàng Quốc Đạt', CAST(N'2001-01-14' AS Date), N'c155', N'Nam', 0, 14, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000203', N'Nguyễn Vân Oanh', CAST(N'2001-04-11' AS Date), N'c155', N'Nữ', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000204', N'Trần Quỳnh Lan', CAST(N'2001-07-08' AS Date), N'c155', N'Nữ', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000205', N'Ngô Minh Ngân', CAST(N'2001-09-09' AS Date), N'c155', N'Nữ', 1, 12, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000206', N'Phạm Nguyên Thái', CAST(N'2001-09-14' AS Date), N'c155', N'Nam', 0, 10, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000207', N'Vũ Linh Tâm', CAST(N'2001-02-05' AS Date), N'c155', N'Nữ', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000208', N'Vũ Đình Xuân', CAST(N'2000-09-22' AS Date), N'c155', N'Nam', 1, 14, N'H3        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000209', N'Lê Bá Đạt', CAST(N'2001-07-13' AS Date), N'c155', N'Nam', 1, 11, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000210', N'Phạm Khánh Hương', CAST(N'2001-03-16' AS Date), N'c155', N'Nữ', 0, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000211', N'Huỳnh Trang Mai', CAST(N'2001-12-11' AS Date), N'c155', N'Nữ', 1, 11, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000212', N'Huỳnh Mạnh Phúc', CAST(N'2001-11-22' AS Date), N'c155', N'Nam', 1, 11, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000213', N'Ngô Sơn Trí', CAST(N'2000-08-01' AS Date), N'c155', N'Nam', 1, 11, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000214', N'Vũ Việt Chí', CAST(N'2001-01-17' AS Date), N'c155', N'Nam', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000215', N'Nguyễn Tuấn Sơn', CAST(N'2001-05-04' AS Date), N'c155', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000216', N'Đặng Xuân Uyên', CAST(N'2001-08-06' AS Date), N'c155', N'Nữ', 0, 13, N'H3        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000217', N'Vũ Thái Đạt', CAST(N'2000-01-24' AS Date), N'c155', N'Nam', 1, 12, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000218', N'Lê My Thảo', CAST(N'2001-04-21' AS Date), N'c155', N'Nữ', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000219', N'Võ Thái An', CAST(N'2001-03-14' AS Date), N'c155', N'Nam', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000220', N'Võ Hữu Thuận', CAST(N'2000-02-17' AS Date), N'c155', N'Nam', 0, 13, N'H3        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000221', N'Vũ Trang Nga', CAST(N'2000-03-08' AS Date), N'c155', N'Nữ', 1, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000222', N'Lê Tuấn Khải', CAST(N'2001-06-16' AS Date), N'c155', N'Nam', 1, 12, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000223', N'Võ Tuấn Nguyên', CAST(N'2001-07-17' AS Date), N'c155', N'Nam', 1, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000224', N'Lê Thành Trung', CAST(N'2001-03-11' AS Date), N'c155', N'Nam', 1, 12, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000225', N'Ngô Thế Minh', CAST(N'2001-12-12' AS Date), N'c155', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000226', N'Huỳnh Hùng Tuấn', CAST(N'2001-01-15' AS Date), N'c155', N'Nam', 1, 14, N'H3        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000227', N'Đỗ Bá Tuấn', CAST(N'2001-10-19' AS Date), N'c155', N'Nam', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000228', N'Võ Anh Thanh', CAST(N'2000-09-01' AS Date), N'c155', N'Nữ', 1, 11, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000229', N'Võ Nhật Khải', CAST(N'2001-11-03' AS Date), N'c155', N'Nam', 1, 14, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000230', N'Trần Trang Lệ', CAST(N'2001-09-21' AS Date), N'c155', N'Nữ', 1, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000231', N'Huỳnh Tùng Thái', CAST(N'2001-06-27' AS Date), N'c155', N'Nam', 1, 14, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000232', N'Bùi Bá Phong', CAST(N'2001-12-26' AS Date), N'c155', N'Nam', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000233', N'Đỗ Thái Nhật', CAST(N'2001-01-25' AS Date), N'c155', N'Nam', 0, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000234', N'Đỗ Việt Thắng', CAST(N'2001-01-23' AS Date), N'c155', N'Nam', 1, 11, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000235', N'Hoàng Hoàng Chí', CAST(N'2001-11-13' AS Date), N'c155', N'Nam', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000236', N'Huỳnh Tùng Quốc', CAST(N'2001-04-20' AS Date), N'c155', N'Nam', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000237', N'Ngô Lệ Phương', CAST(N'2001-11-07' AS Date), N'c155', N'Nữ', 1, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000238', N'Bùi Thái Hùng', CAST(N'2001-03-26' AS Date), N'c155', N'Nam', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000239', N'Nguyễn Trang Tú', CAST(N'2001-03-04' AS Date), N'c155', N'Nữ', 0, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000240', N'Nguyễn Văn Gia', CAST(N'2001-03-07' AS Date), N'c155', N'Nam', 1, 11, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000241', N'Lê Hoàng Xuân', CAST(N'2001-02-01' AS Date), N'c155', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000242', N'Lê Lan Hồng', CAST(N'2000-09-28' AS Date), N'c155', N'Nữ', 1, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000243', N'Đỗ Trọng An', CAST(N'2000-04-12' AS Date), N'c155', N'Nam', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000244', N'Huỳnh Thiên Tú', CAST(N'2000-09-01' AS Date), N'c155', N'Nữ', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000245', N'Đặng Việt Việt', CAST(N'2001-11-16' AS Date), N'c155', N'Nam', 1, 12, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000246', N'Bùi Trọng Hiếu', CAST(N'2000-08-25' AS Date), N'c155', N'Nam', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000247', N'Đặng Hùng Khang', CAST(N'2001-07-13' AS Date), N'c155', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000248', N'Đặng Minh Khánh', CAST(N'2000-09-04' AS Date), N'c155', N'Nam', 1, 12, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000249', N'Ngô Hoàng Đăng', CAST(N'2001-08-28' AS Date), N'c155', N'Nam', 0, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000250', N'Ngô Trung Khánh', CAST(N'2001-12-03' AS Date), N'c155', N'Nam', 1, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000251', N'Lê Hữu Bình', CAST(N'2001-10-18' AS Date), N'c155', N'Nam', 1, 11, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000252', N'Võ Hồng Ngọc', CAST(N'2001-07-19' AS Date), N'c155', N'Nữ', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000253', N'Vũ Hạnh Minh', CAST(N'2001-06-06' AS Date), N'c155', N'Nữ', 0, 10, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000254', N'Lê Tuấn Phú', CAST(N'2001-12-25' AS Date), N'c155', N'Nam', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000255', N'Đặng Phương Bích', CAST(N'2001-03-26' AS Date), N'c155', N'Nữ', 0, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000256', N'Lê Thế Nguyễn', CAST(N'2001-06-23' AS Date), N'c155', N'Nam', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000257', N'Đỗ Ngọc Trí', CAST(N'2001-12-28' AS Date), N'c155', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000258', N'Huỳnh Quỳnh Trinh', CAST(N'2001-04-04' AS Date), N'c155', N'Nữ', 0, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000259', N'Đỗ Hải Phúc', CAST(N'2001-04-02' AS Date), N'c155', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000260', N'Nguyễn Hồng Anh', CAST(N'2001-03-06' AS Date), N'c155', N'Nữ', 1, 12, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000261', N'Vũ Huy Thiên', CAST(N'2001-05-13' AS Date), N'c155', N'Nam', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000262', N'Đỗ Uyên Tâm', CAST(N'2000-08-09' AS Date), N'c155', N'Nữ', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000263', N'Đỗ Khắc Thắng', CAST(N'2001-03-26' AS Date), N'c155', N'Nam', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000264', N'Võ Nhung Lan', CAST(N'2000-08-09' AS Date), N'c155', N'Nữ', 1, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000265', N'Trần Trọng Đạt', CAST(N'2001-06-15' AS Date), N'c155', N'Nam', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000266', N'Bùi Hữu Đạt', CAST(N'2000-05-09' AS Date), N'c155', N'Nam', 1, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000267', N'Bùi Thái Anh', CAST(N'2001-10-22' AS Date), N'c155', N'Nam', 0, 11, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000268', N'Bùi Thanh Trí', CAST(N'2001-12-10' AS Date), N'c155', N'Nam', 0, 12, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000269', N'Phạm Sơn Gia', CAST(N'2000-08-10' AS Date), N'c155', N'Nam', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000270', N'Đỗ Trung Lâm', CAST(N'2001-08-17' AS Date), N'c155', N'Nam', 1, 15, N'H3        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000271', N'Lê Thiên Tú', CAST(N'2001-09-22' AS Date), N'c155', N'Nữ', 1, 12, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000272', N'Nguyễn Văn Khánh', CAST(N'2001-02-18' AS Date), N'c155', N'Nam', 1, 12, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000273', N'Võ Tuấn Hưng', CAST(N'2002-04-27' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000274', N'Huỳnh Việt Tùng', CAST(N'2002-06-19' AS Date), N'c156', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000275', N'Lê Bình Tùng', CAST(N'2002-04-11' AS Date), N'c156', N'Nam', 1, 14, N'H3        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000276', N'Phạm Đức Anh', CAST(N'2002-01-23' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000277', N'Đỗ Minh Thuận', CAST(N'2002-09-26' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000278', N'Huỳnh Thủy Vân', CAST(N'2002-09-07' AS Date), N'c156', N'Nữ', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000279', N'Bùi Phương Hiếu', CAST(N'2002-02-26' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000280', N'Võ Liên Hạnh', CAST(N'2002-11-22' AS Date), N'c156', N'Nữ', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000281', N'Hoàng Hữu Chiến', CAST(N'2002-09-20' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000282', N'Hoàng Thanh Quốc', CAST(N'2002-10-17' AS Date), N'c156', N'Nam', 0, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000283', N'Lê Trọng Đạt', CAST(N'2001-08-23' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000284', N'Phạm Hoàng Nguyên', CAST(N'2002-02-14' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000285', N'Nguyễn Việt Hưng', CAST(N'2002-05-21' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000286', N'Phạm Tâm Anh', CAST(N'2002-12-24' AS Date), N'c156', N'Nữ', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000287', N'Ngô Tuyết Trinh', CAST(N'2002-03-01' AS Date), N'c156', N'Nữ', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000288', N'Bùi Nguyên Thái', CAST(N'2002-08-11' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000289', N'Huỳnh Tâm Xuân', CAST(N'2002-08-05' AS Date), N'c156', N'Nữ', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000290', N'Lê Đình Công', CAST(N'2002-11-02' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000291', N'Hoàng Quang Hưng', CAST(N'2002-11-10' AS Date), N'c156', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000292', N'Lê Thanh Vinh', CAST(N'2002-11-19' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000293', N'Trần Thành Nhật', CAST(N'2001-09-27' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000294', N'Lê Đức Nguyên', CAST(N'2002-01-14' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000295', N'Hoàng Bình Sơn', CAST(N'2002-08-02' AS Date), N'c156', N'Nam', 1, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000296', N'Lê Nhung Minh', CAST(N'2001-12-12' AS Date), N'c156', N'Nữ', 0, 11, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000297', N'Hoàng Nga Hương', CAST(N'2002-12-13' AS Date), N'c156', N'Nữ', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000298', N'Vũ Tuấn Khánh', CAST(N'2002-01-18' AS Date), N'c156', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000299', N'Đỗ Việt Đạt', CAST(N'2001-06-12' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000300', N'Trần Thủy Thủy', CAST(N'2002-01-04' AS Date), N'c156', N'Nữ', 1, 15, N'H2        ', N'2         ', NULL)
GO
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000301', N'Trần Lâm Thanh', CAST(N'2002-10-07' AS Date), N'c156', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000302', N'Đỗ Ngọc Nguyệt', CAST(N'2002-04-09' AS Date), N'c156', N'Nữ', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000303', N'Vũ My Phương', CAST(N'2001-04-02' AS Date), N'c156', N'Nữ', 0, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000304', N'Võ Hồng Nhung', CAST(N'2002-10-10' AS Date), N'c156', N'Nữ', 0, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000305', N'Hoàng Mạnh Quân', CAST(N'2002-01-11' AS Date), N'c156', N'Nam', 0, 10, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000306', N'Võ Lâm Thái', CAST(N'2002-09-24' AS Date), N'c156', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000307', N'Võ Hùng Bình', CAST(N'2002-02-11' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000308', N'Vũ Hữu Bình', CAST(N'2002-11-25' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000309', N'Bùi Văn Hùng', CAST(N'2002-07-09' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000310', N'Đặng Trọng Trung', CAST(N'2002-07-15' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000311', N'Võ Uyên Xuân', CAST(N'2001-11-12' AS Date), N'c156', N'Nữ', 0, 10, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000312', N'Hoàng Quỳnh Lan', CAST(N'2002-12-05' AS Date), N'c156', N'Nữ', 1, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000313', N'Huỳnh Liên Thiên', CAST(N'2002-07-26' AS Date), N'c156', N'Nữ', 1, 14, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000314', N'Ngô Huy Thành', CAST(N'2002-01-06' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000315', N'Huỳnh Lan Tâm', CAST(N'2002-07-21' AS Date), N'c156', N'Nữ', 1, 14, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000316', N'Hoàng Trọng Công', CAST(N'2002-02-08' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000317', N'Võ Lâm Đạt', CAST(N'2002-06-17' AS Date), N'c156', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000318', N'Nguyễn Ngân Nhung', CAST(N'2002-06-13' AS Date), N'c156', N'Nữ', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000319', N'Huỳnh Trọng Khôi', CAST(N'2002-07-21' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000320', N'Ngô Hoàng Đạt', CAST(N'2002-06-13' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000321', N'Ngô Bá Hiếu', CAST(N'2002-07-26' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000322', N'Phạm Văn Lâm', CAST(N'2002-11-17' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000323', N'Đỗ Thái Vinh', CAST(N'2002-06-08' AS Date), N'c156', N'Nam', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000324', N'Nguyễn Đình Dũng', CAST(N'2002-03-05' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000325', N'Huỳnh Hùng Thắng', CAST(N'2002-04-24' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000326', N'Phạm Lâm Thanh', CAST(N'2001-06-10' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000327', N'Võ Quốc Chí', CAST(N'2002-08-20' AS Date), N'c156', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000328', N'Bùi Cẩm Linh', CAST(N'2002-08-28' AS Date), N'c156', N'Nữ', 0, 14, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000329', N'Lê Oanh Linh', CAST(N'2002-04-22' AS Date), N'c156', N'Nữ', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000330', N'Võ Đức Ngọc', CAST(N'2002-06-03' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000331', N'Huỳnh Thái Chiến', CAST(N'2002-02-16' AS Date), N'c156', N'Nam', 0, 10, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000332', N'Vũ Phương Khang', CAST(N'2002-05-26' AS Date), N'c156', N'Nam', 0, 15, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000333', N'Phạm Nguyên Thái', CAST(N'2002-05-07' AS Date), N'c156', N'Nam', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000334', N'Phạm Vân Thanh', CAST(N'2002-05-15' AS Date), N'c156', N'Nữ', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000335', N'Huỳnh Thanh Oanh', CAST(N'2002-05-09' AS Date), N'c156', N'Nữ', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000336', N'Phạm Ngân Oanh', CAST(N'2001-11-26' AS Date), N'c156', N'Nữ', 0, 14, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000337', N'Phạm Thanh Tuấn', CAST(N'2002-01-12' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000338', N'Đặng Tùng Minh', CAST(N'2002-04-27' AS Date), N'c156', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000339', N'Huỳnh Tùng Khải', CAST(N'2002-03-01' AS Date), N'c156', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000340', N'Phạm Huy Khôi', CAST(N'2002-11-16' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000341', N'Hoàng Đình Nhật', CAST(N'2001-12-22' AS Date), N'c156', N'Nam', 0, 11, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000342', N'Hoàng Phương Chiến', CAST(N'2002-04-04' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000343', N'Vũ Tùng Nguyên', CAST(N'2002-04-04' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000344', N'Đặng Tuấn Quân', CAST(N'2002-06-09' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000345', N'Ngô Cẩm Cẩm', CAST(N'2002-06-15' AS Date), N'c156', N'Nữ', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000346', N'Nguyễn Đình Sơn', CAST(N'2002-12-13' AS Date), N'c156', N'Nam', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000347', N'Nguyễn Liên Vân', CAST(N'2001-02-03' AS Date), N'c156', N'Nữ', 1, 14, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000348', N'Lê Ngọc Trung', CAST(N'2001-11-21' AS Date), N'c156', N'Nam', 1, 15, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000349', N'Hoàng Bá Nguyễn', CAST(N'2002-01-22' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000350', N'Bùi Linh Trinh', CAST(N'2002-01-21' AS Date), N'c156', N'Nữ', 1, 14, N'H3        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000351', N'Vũ Khắc Việt', CAST(N'2002-02-17' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000352', N'Nguyễn Khắc Đạt', CAST(N'2002-01-01' AS Date), N'c156', N'Nam', 1, 15, N'H3        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000353', N'Vũ Nhật Bình', CAST(N'2002-02-15' AS Date), N'c156', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000354', N'Nguyễn Lâm Nam', CAST(N'2002-04-20' AS Date), N'c156', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000355', N'Vũ Phương Trinh', CAST(N'2002-07-19' AS Date), N'c156', N'Nữ', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000356', N'Đặng Bá Phúc', CAST(N'2002-12-25' AS Date), N'c156', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000357', N'Phạm Mạnh Vũ', CAST(N'2001-10-08' AS Date), N'c156', N'Nam', 1, 13, N'H3        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000358', N'Ngô Khắc Nguyên', CAST(N'2002-01-07' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000359', N'Lê Tùng Thanh', CAST(N'2002-09-10' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000360', N'Ngô Nguyên Khang', CAST(N'2002-03-06' AS Date), N'c156', N'Nam', 1, 15, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000361', N'Lê Yến Nhi', CAST(N'2002-01-15' AS Date), N'c156', N'Nữ', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000362', N'Đỗ Việt Nguyên', CAST(N'2003-05-08' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000363', N'Trần Trọng Đạt', CAST(N'2003-10-23' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000364', N'Bùi Ngọc Tuyết', CAST(N'2002-08-16' AS Date), N'c157', N'Nữ', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000365', N'Ngô Đức Thanh', CAST(N'2003-02-07' AS Date), N'c157', N'Nam', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000366', N'Đỗ Quốc Chiến', CAST(N'2003-07-17' AS Date), N'c157', N'Nam', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000367', N'Phạm Trọng Tuấn', CAST(N'2002-06-06' AS Date), N'c157', N'Nam', 1, 14, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000368', N'Phạm Thành Việt', CAST(N'2003-05-05' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000369', N'Ngô Quốc Đức', CAST(N'2003-10-20' AS Date), N'c157', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000370', N'Ngô Thanh Gia', CAST(N'2003-05-11' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000371', N'Nguyễn Minh Dũng', CAST(N'2003-06-26' AS Date), N'c157', N'Nam', 1, 11, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000372', N'Bùi Bích Linh', CAST(N'2003-05-13' AS Date), N'c157', N'Nữ', 1, 14, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000373', N'Hoàng Khắc Thành', CAST(N'2003-09-24' AS Date), N'c157', N'Nam', 1, 11, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000374', N'Vũ Thanh Tuấn', CAST(N'2003-04-02' AS Date), N'c157', N'Nam', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000375', N'Võ Thanh Trung', CAST(N'2003-05-25' AS Date), N'c157', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000376', N'Lê Quốc Đạt', CAST(N'2003-10-18' AS Date), N'c157', N'Nam', 0, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000377', N'Lê Sơn Chiến', CAST(N'2003-05-05' AS Date), N'c157', N'Nam', 1, 15, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000378', N'Võ Văn Thiên', CAST(N'2003-04-12' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000379', N'Đặng Trinh Minh', CAST(N'2003-07-02' AS Date), N'c157', N'Nữ', 1, 12, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000380', N'Trần Huy Phong', CAST(N'2003-10-18' AS Date), N'c157', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000381', N'Đặng Tùng Hiếu', CAST(N'2003-06-24' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000382', N'Trần Hải Chí', CAST(N'2003-03-14' AS Date), N'c157', N'Nam', 0, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000383', N'Hoàng Trung Hùng', CAST(N'2002-07-15' AS Date), N'c157', N'Nam', 0, 11, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000384', N'Đặng Đức Gia', CAST(N'2002-07-21' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000385', N'Nguyễn Bình Xuân', CAST(N'2003-03-15' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000386', N'Vũ Nguyệt Loan', CAST(N'2003-04-19' AS Date), N'c157', N'Nữ', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000387', N'Võ Yến Xuân', CAST(N'2003-11-28' AS Date), N'c157', N'Nữ', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000388', N'Lê Quang Đại', CAST(N'2002-10-21' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000389', N'Nguyễn Bình Chiến', CAST(N'2003-12-07' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000390', N'Huỳnh Khánh Hồng', CAST(N'2003-10-20' AS Date), N'c157', N'Nữ', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000391', N'Huỳnh Đức Chí', CAST(N'2003-06-11' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000392', N'Đỗ Lâm An', CAST(N'2003-05-04' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000393', N'Phạm Hải Quang', CAST(N'2002-05-20' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000394', N'Vũ Lâm Thanh', CAST(N'2003-06-09' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000395', N'Đỗ Sơn Minh', CAST(N'2003-12-02' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000396', N'Võ Công Nhật', CAST(N'2003-12-24' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000397', N'Võ Minh Đạt', CAST(N'2003-01-04' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000398', N'Ngô Văn Đại', CAST(N'2003-06-03' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000399', N'Nguyễn Hùng Đạt', CAST(N'2003-02-16' AS Date), N'c157', N'Nam', 1, 12, N'H2        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000400', N'Võ Sơn Trung', CAST(N'2003-01-01' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
GO
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000401', N'Huỳnh Yến Tuyết', CAST(N'2003-10-22' AS Date), N'c157', N'Nữ', 0, 10, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000402', N'Vũ Nhật Long', CAST(N'2003-08-16' AS Date), N'c157', N'Nam', 1, 15, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000403', N'Lê Mạnh Nguyên', CAST(N'2002-02-03' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000404', N'Phạm Sơn Thanh', CAST(N'2003-07-01' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000405', N'Hoàng Hùng Hưng', CAST(N'2003-10-19' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000406', N'Hoàng Đức Quốc', CAST(N'2003-10-17' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000407', N'Vũ Trung Đăng', CAST(N'2002-06-27' AS Date), N'c157', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000408', N'Nguyễn Minh Lâm', CAST(N'2003-06-23' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000409', N'Lê Bích Tuyết', CAST(N'2003-10-27' AS Date), N'c157', N'Nữ', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000410', N'Đỗ Hải Quân', CAST(N'2002-04-05' AS Date), N'c157', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000411', N'Nguyễn Khánh Linh', CAST(N'2002-08-26' AS Date), N'c157', N'Nữ', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000412', N'Hoàng Xuân Tú', CAST(N'2003-06-15' AS Date), N'c157', N'Nữ', 1, 11, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000413', N'Ngô Hải Long', CAST(N'2003-09-16' AS Date), N'c157', N'Nam', 1, 14, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000414', N'Võ Lan Bích', CAST(N'2003-10-22' AS Date), N'c157', N'Nữ', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000415', N'Đặng Nga Linh', CAST(N'2002-03-13' AS Date), N'c157', N'Nữ', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000416', N'Ngô Việt Phong', CAST(N'2003-05-12' AS Date), N'c157', N'Nam', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000417', N'Đỗ Mạnh Nam', CAST(N'2003-02-21' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000418', N'Phạm Hoàng An', CAST(N'2003-04-01' AS Date), N'c157', N'Nam', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000419', N'Võ Bình Nam', CAST(N'2003-08-14' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000420', N'Vũ Đình Gia', CAST(N'2003-10-02' AS Date), N'c157', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000421', N'Võ Đình Quân', CAST(N'2003-06-19' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000422', N'Ngô Hữu Phong', CAST(N'2003-09-07' AS Date), N'c157', N'Nam', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000423', N'Đặng Nhung Trang', CAST(N'2003-03-15' AS Date), N'c157', N'Nữ', 1, 13, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000424', N'Đỗ Ngân Hồng', CAST(N'2003-10-04' AS Date), N'c157', N'Nữ', 1, 11, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000425', N'Vũ Hữu Anh', CAST(N'2003-03-16' AS Date), N'c157', N'Nam', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000426', N'Vũ Tùng Chí', CAST(N'2002-08-20' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000427', N'Huỳnh Phương Đăng', CAST(N'2002-05-07' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000428', N'Lê Ngọc Việt', CAST(N'2003-07-13' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000429', N'Võ Trọng Khánh', CAST(N'2002-10-07' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000430', N'Trần Minh Ngọc', CAST(N'2003-03-26' AS Date), N'c157', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000431', N'Trần Thanh Đức', CAST(N'2003-01-19' AS Date), N'c157', N'Nam', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000432', N'Ngô Văn Hưng', CAST(N'2003-01-12' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000433', N'Nguyễn Hùng Đăng', CAST(N'2002-01-09' AS Date), N'c157', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000434', N'Bùi Trọng Đăng', CAST(N'2002-12-10' AS Date), N'c157', N'Nam', 1, 14, N'H2        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000435', N'Trần Thế Quân', CAST(N'2003-10-28' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000436', N'Vũ Huy Công', CAST(N'2003-07-07' AS Date), N'c157', N'Nam', 0, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000437', N'Hoàng Phương Công', CAST(N'2003-07-04' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000438', N'Vũ Lâm Thiên', CAST(N'2003-11-06' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000439', N'Vũ Hùng Nguyễn', CAST(N'2003-09-12' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000440', N'Trần Lệ Liên', CAST(N'2003-11-21' AS Date), N'c157', N'Nữ', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000441', N'Ngô Thanh Khôi', CAST(N'2003-03-09' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000442', N'Vũ Nguyên Chiến', CAST(N'2003-01-27' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000443', N'Huỳnh Trung Dũng', CAST(N'2003-03-01' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000444', N'Đỗ Thái Xuân', CAST(N'2003-09-17' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000445', N'Lê Thế Đức', CAST(N'2003-08-13' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000446', N'Đỗ Trọng Bình', CAST(N'2003-10-14' AS Date), N'c157', N'Nam', 1, 12, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000447', N'Đặng Linh Trinh', CAST(N'2003-06-02' AS Date), N'c157', N'Nữ', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000448', N'Võ Tâm Lan', CAST(N'2003-01-18' AS Date), N'c157', N'Nữ', 0, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000449', N'Hoàng Nguyệt Thảo', CAST(N'2003-02-15' AS Date), N'c157', N'Nữ', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000450', N'Võ Hải Nam', CAST(N'2003-10-01' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000451', N'Võ Lâm An', CAST(N'2003-07-02' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000452', N'Bùi Minh Quang', CAST(N'2003-07-27' AS Date), N'c157', N'Nam', 1, 11, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000453', N'Bùi Hoàng Nhật', CAST(N'2003-10-13' AS Date), N'c157', N'Nam', 1, 13, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000454', N'Phạm Phương Khang', CAST(N'2004-01-04' AS Date), N'c158', N'Nam', 0, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000455', N'Hoàng Tâm Khánh', CAST(N'2004-07-13' AS Date), N'c158', N'Nữ', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000456', N'Lê Thanh Gia', CAST(N'2004-07-17' AS Date), N'c158', N'Nam', 1, 14, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000457', N'Trần Hùng Chiến', CAST(N'2004-09-01' AS Date), N'c158', N'Nam', 1, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000458', N'Hoàng Tuấn Minh', CAST(N'2004-06-15' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000459', N'Bùi Sơn Đạt', CAST(N'2004-02-08' AS Date), N'c158', N'Nam', 1, 14, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000460', N'Bùi Nguyên Tuấn', CAST(N'2004-10-15' AS Date), N'c158', N'Nam', 1, 12, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000461', N'Bùi Việt Vinh', CAST(N'2003-05-05' AS Date), N'c158', N'Nam', 1, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000462', N'Huỳnh Huy Hưng', CAST(N'2004-06-13' AS Date), N'c158', N'Nam', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000463', N'Phạm Minh Thiên', CAST(N'2003-06-24' AS Date), N'c158', N'Nữ', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000464', N'Hoàng Ngọc Minh', CAST(N'2004-03-06' AS Date), N'c158', N'Nam', 1, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000465', N'Vũ Đức Lâm', CAST(N'2004-06-21' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000466', N'Trần Thanh Anh', CAST(N'2004-01-05' AS Date), N'c158', N'Nam', 0, 11, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000467', N'Võ Mạnh Thành', CAST(N'2003-02-14' AS Date), N'c158', N'Nam', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000468', N'Đỗ Ngọc Vinh', CAST(N'2004-06-14' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000469', N'Võ Hồng Yến', CAST(N'2004-06-06' AS Date), N'c158', N'Nữ', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000470', N'Võ Việt Xuân', CAST(N'2004-01-18' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000471', N'Trần Minh Thành', CAST(N'2004-09-15' AS Date), N'c158', N'Nam', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000472', N'Bùi Huy Thiên', CAST(N'2004-01-18' AS Date), N'c158', N'Nam', 1, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000473', N'Nguyễn Mạnh An', CAST(N'2004-10-21' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000474', N'Nguyễn Huy Phúc', CAST(N'2004-05-27' AS Date), N'c158', N'Nam', 1, 12, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000475', N'Ngô Thái Đăng', CAST(N'2004-01-21' AS Date), N'c158', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000476', N'Trần Thành Bình', CAST(N'2004-01-13' AS Date), N'c158', N'Nam', 1, 12, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000477', N'Đỗ Phương Sơn', CAST(N'2004-09-17' AS Date), N'c158', N'Nam', 0, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000478', N'Đặng Minh Quân', CAST(N'2003-03-08' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000479', N'Nguyễn Hữu Hùng', CAST(N'2004-07-19' AS Date), N'c158', N'Nam', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000480', N'Bùi Phương Trí', CAST(N'2004-02-27' AS Date), N'c158', N'Nam', 1, 12, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000481', N'Nguyễn Ngọc Đăng', CAST(N'2004-04-17' AS Date), N'c158', N'Nam', 1, 12, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000482', N'Đỗ Văn Việt', CAST(N'2004-11-24' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000483', N'Vũ Hồng Nguyệt', CAST(N'2003-11-10' AS Date), N'c158', N'Nữ', 1, 14, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000484', N'Phạm Tú Trinh', CAST(N'2004-12-01' AS Date), N'c158', N'Nữ', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000485', N'Bùi Huy Đăng', CAST(N'2004-05-26' AS Date), N'c158', N'Nam', 0, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000486', N'Lê Thế Khang', CAST(N'2004-09-25' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000487', N'Lê Tùng Chí', CAST(N'2004-08-21' AS Date), N'c158', N'Nam', 0, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000488', N'Phạm Hải Anh', CAST(N'2004-05-19' AS Date), N'c158', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000489', N'Hoàng Cẩm Nhi', CAST(N'2004-07-16' AS Date), N'c158', N'Nữ', 1, 14, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000490', N'Huỳnh Sơn Phú', CAST(N'2004-07-20' AS Date), N'c158', N'Nam', 1, 12, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000491', N'Đặng Hùng Thành', CAST(N'2004-05-10' AS Date), N'c158', N'Nam', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000492', N'Huỳnh Đức Thắng', CAST(N'2004-11-14' AS Date), N'c158', N'Nam', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000493', N'Nguyễn Xuân Vân', CAST(N'2004-12-19' AS Date), N'c158', N'Nữ', 1, 15, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000494', N'Huỳnh Phương Yến', CAST(N'2004-11-15' AS Date), N'c158', N'Nữ', 1, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000495', N'Đỗ Khắc Đại', CAST(N'2004-08-06' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000496', N'Võ Thế Lâm', CAST(N'2004-11-18' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000497', N'Đỗ Hoàng Chí', CAST(N'2004-01-08' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000498', N'Lê Hùng Khánh', CAST(N'2004-09-26' AS Date), N'c158', N'Nam', 1, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000499', N'Trần Thành Bình', CAST(N'2003-05-23' AS Date), N'c158', N'Nam', 1, 12, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000500', N'Vũ Ngọc Xuân', CAST(N'2004-06-07' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
GO
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000501', N'Ngô Hùng Nguyễn', CAST(N'2004-04-20' AS Date), N'c158', N'Nam', 0, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000502', N'Hoàng Thế Minh', CAST(N'2004-01-25' AS Date), N'c158', N'Nam', 1, 15, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000503', N'Nguyễn Sương Tâm', CAST(N'2004-09-06' AS Date), N'c158', N'Nữ', 1, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000504', N'Đỗ Quốc Đại', CAST(N'2004-01-24' AS Date), N'c158', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000505', N'Trần Hùng Đại', CAST(N'2004-10-11' AS Date), N'c158', N'Nam', 1, 13, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000506', N'Đỗ Tuấn Thanh', CAST(N'2004-01-11' AS Date), N'c158', N'Nam', 1, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000507', N'Hoàng Tuấn Hùng', CAST(N'2004-09-23' AS Date), N'c158', N'Nam', 0, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000508', N'Trần Công Thành', CAST(N'2004-01-07' AS Date), N'c158', N'Nam', 1, 14, N'H1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000509', N'Hoàng Văn Đại', CAST(N'2004-07-24' AS Date), N'c158', N'Nam', 1, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000510', N'Ngô Hương Tuyết', CAST(N'2004-11-28' AS Date), N'c158', N'Nữ', 1, 15, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000511', N'Đặng Quốc Phong', CAST(N'2004-10-28' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000512', N'Bùi Quốc Việt', CAST(N'2004-04-22' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000513', N'Đặng Hữu Anh', CAST(N'2004-10-10' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000514', N'Vũ Quang Chí', CAST(N'2004-07-18' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000515', N'Phạm Lâm Quốc', CAST(N'2004-12-28' AS Date), N'c158', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000516', N'Vũ Phương Nhật', CAST(N'2004-12-16' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000517', N'Trần Bình Phúc', CAST(N'2004-04-15' AS Date), N'c158', N'Nam', 1, 14, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000518', N'Vũ Trọng Long', CAST(N'2003-01-16' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000519', N'Lê Thành Khôi', CAST(N'2004-01-27' AS Date), N'c158', N'Nam', 0, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000520', N'Đỗ Hải Nam', CAST(N'2004-12-20' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000521', N'Bùi Ngọc Trung', CAST(N'2004-08-23' AS Date), N'c158', N'Nam', 1, 14, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000522', N'Lê Lệ Phương', CAST(N'2004-08-09' AS Date), N'c158', N'Nữ', 0, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000523', N'Ngô Minh Mai', CAST(N'2003-10-13' AS Date), N'c158', N'Nữ', 0, 16, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000524', N'Võ Hữu Đăng', CAST(N'2004-10-16' AS Date), N'c158', N'Nam', 1, 13, N'B1        ', N'1         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000525', N'Phạm Trọng Minh', CAST(N'2004-02-20' AS Date), N'c158', N'Nam', 1, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000526', N'Bùi Hải Công', CAST(N'2004-07-14' AS Date), N'c158', N'Nam', 1, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000527', N'Ngô Nga Cẩm', CAST(N'2004-04-15' AS Date), N'c158', N'Nữ', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000528', N'Lê Thế Khang', CAST(N'2003-01-03' AS Date), N'c158', N'Nam', 0, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000529', N'Lê Mạnh Nguyễn', CAST(N'2004-09-09' AS Date), N'c158', N'Nam', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000530', N'Lê Thế Chiến', CAST(N'2003-12-12' AS Date), N'c158', N'Nam', 0, 15, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000531', N'Đỗ Thế Nguyên', CAST(N'2004-12-07' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000532', N'Nguyễn Phương Cẩm', CAST(N'2004-04-28' AS Date), N'c158', N'Nữ', 1, 13, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000533', N'Vũ Quang Chiến', CAST(N'2004-11-15' AS Date), N'c158', N'Nam', 1, 14, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000534', N'Huỳnh Bá Thanh', CAST(N'2004-12-11' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000535', N'Phạm Sơn Phú', CAST(N'2004-07-14' AS Date), N'c158', N'Nam', 1, 12, N'B1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000536', N'Bùi Khắc Chiến', CAST(N'2004-03-19' AS Date), N'c158', N'Nam', 0, 12, N'H1        ', N'2         ', NULL)
INSERT [dbo].[HocVien] ([MaHocVien], [TenHocVien], [NgaySinh], [MaDaiDoi], [GioiTinh], [Gac], [SoLanGac], [MaCapBac], [MaChucVu], [LastModified]) VALUES (N'HV000537', N'Vũ Quang Vinh', CAST(N'2004-08-16' AS Date), N'c158', N'Nam', 1, 15, N'B1        ', N'2         ', NULL)
GO
SET IDENTITY_INSERT [dbo].[NhiemVu] ON 

INSERT [dbo].[NhiemVu] ([MaNhiemVu], [TenNhiemVu], [MaVongGac]) VALUES (1, N'Đốc gác', 1)
INSERT [dbo].[NhiemVu] ([MaNhiemVu], [TenNhiemVu], [MaVongGac]) VALUES (4, N' Đứng gác', 2)
INSERT [dbo].[NhiemVu] ([MaNhiemVu], [TenNhiemVu], [MaVongGac]) VALUES (5, N'Đi tuần', 2)
INSERT [dbo].[NhiemVu] ([MaNhiemVu], [TenNhiemVu], [MaVongGac]) VALUES (6, N'Đứng gác', 3)
INSERT [dbo].[NhiemVu] ([MaNhiemVu], [TenNhiemVu], [MaVongGac]) VALUES (7, N'Đi tuần', 3)
SET IDENTITY_INSERT [dbo].[NhiemVu] OFF
GO
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000275', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000276', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000277', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000278', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000279', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000283', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000284', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000285', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000288', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000289', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000291', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000295', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000297', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000298', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000299', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000300', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000301', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000306', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000307', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000308', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000309', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000313', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000314', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000315', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000317', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000321', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000323', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000333', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000335', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000337', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000338', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000339', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000340', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000343', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000344', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000345', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000346', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000348', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000350', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000352', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000353', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000354', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000355', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000356', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-10' AS Date), N'HV000357', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000275', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000276', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000277', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000278', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000279', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000280', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000281', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000283', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000284', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000285', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000288', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000291', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000295', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000297', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000298', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000299', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000300', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000301', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000306', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000308', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000309', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000313', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000314', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000317', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000318', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000321', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000324', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000327', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000329', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000335', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000338', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000339', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000342', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000343', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000344', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000345', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000346', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000348', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000350', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000352', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000353', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000354', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000356', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000357', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-11' AS Date), N'HV000358', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000201', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000203', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000209', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000211', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000212', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000213', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000214', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000217', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000219', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000222', 6, 4)
GO
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000223', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000224', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000226', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000228', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000229', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000231', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000234', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000235', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000236', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000238', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000240', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000241', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000242', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000243', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000244', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000245', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000246', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000247', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000248', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000250', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000251', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000252', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000254', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000256', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000259', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000260', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000261', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000262', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000263', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000264', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000265', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000266', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000269', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000271', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-12' AS Date), N'HV000272', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000457', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000459', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000460', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000461', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000462', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000463', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000464', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000465', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000467', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000468', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000470', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000471', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000472', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000473', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000474', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000475', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000476', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000479', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000480', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000481', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000488', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000490', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000491', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000492', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000495', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000498', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000499', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000503', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000505', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000506', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000508', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000509', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000510', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000511', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000513', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000517', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000521', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000524', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000526', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000527', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000529', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000532', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000533', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000534', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-13' AS Date), N'HV000535', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000362', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000363', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000364', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000368', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000370', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000371', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000373', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000378', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000381', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000384', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000387', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000388', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000390', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000391', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000392', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000393', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000394', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000395', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000399', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000404', 4, 3)
GO
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000405', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000406', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000407', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000408', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000417', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000419', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000421', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000424', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000427', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000428', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000429', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000432', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000437', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000438', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000439', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000440', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000441', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000443', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000444', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000445', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000446', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000450', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000451', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000452', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-14' AS Date), N'HV000453', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000273', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000274', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000275', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000276', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000277', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000278', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000279', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000281', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000283', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000284', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000285', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000288', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000289', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000290', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000291', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000292', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000295', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000297', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000298', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000299', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000301', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000302', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000306', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000307', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000308', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000309', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000310', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000312', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000313', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000314', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000315', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000316', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000317', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000318', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000329', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000333', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000334', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000337', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000338', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000339', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000346', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000353', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000354', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000356', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-15' AS Date), N'HV000357', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000201', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000203', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000205', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000208', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000209', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000211', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000212', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000213', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000214', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000217', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000219', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000222', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000223', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000224', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000225', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000226', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000227', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000228', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000229', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000231', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000232', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000234', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000235', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000238', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000240', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000241', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000244', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000245', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000246', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000247', 5, 6)
GO
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000248', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000250', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000251', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000252', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000254', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000259', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000260', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000262', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000263', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000264', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000266', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000269', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000270', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000271', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-16' AS Date), N'HV000272', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000273', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000274', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000275', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000276', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000277', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000279', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000281', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000283', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000284', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000285', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000288', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000289', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000290', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000291', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000292', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000295', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000297', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000298', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000299', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000301', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000302', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000306', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000307', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000308', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000309', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000310', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000312', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000313', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000314', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000315', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000316', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000317', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000318', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000329', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000333', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000334', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000335', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000337', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000338', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000339', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000346', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000353', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000354', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000356', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-17' AS Date), N'HV000357', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000201', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000203', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000205', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000208', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000209', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000211', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000212', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000213', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000214', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000217', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000219', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000222', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000223', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000224', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000225', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000226', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000227', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000228', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000229', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000231', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000232', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000234', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000235', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000238', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000240', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000241', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000244', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000245', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000246', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000247', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000248', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000250', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000251', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000252', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000254', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000259', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000260', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000262', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000263', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000264', 7, 2)
GO
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000266', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000269', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000270', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000271', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-18' AS Date), N'HV000272', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000456', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000457', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000459', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000460', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000461', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000462', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000463', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000464', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000467', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000471', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000472', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000474', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000476', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000479', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000480', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000481', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000490', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000491', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000492', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000494', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000498', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000499', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000503', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000505', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000506', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000508', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000509', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000511', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000512', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000513', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000517', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000518', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000520', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000521', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000524', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000525', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000526', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000527', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000529', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000531', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000532', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000533', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000534', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000535', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-19' AS Date), N'HV000537', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000456', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000457', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000459', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000460', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000461', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000462', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000463', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000464', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000467', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000471', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000472', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000474', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000476', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000479', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000480', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000481', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000490', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000491', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000492', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000494', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000498', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000499', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000503', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000505', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000506', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000508', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000509', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000511', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000512', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000513', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000517', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000518', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000520', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000521', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000524', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000525', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000526', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000527', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000529', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000531', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000532', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000533', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000534', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000535', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-20' AS Date), N'HV000537', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000456', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000457', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000459', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000460', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000461', 1, 5)
GO
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000462', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000463', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000464', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000467', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000471', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000472', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000474', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000476', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000479', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000480', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000481', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000490', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000491', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000492', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000494', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000498', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000499', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000503', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000505', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000506', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000508', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000509', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000511', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000512', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000513', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000517', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000518', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000520', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000521', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000524', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000525', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000526', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000527', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000529', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000531', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000532', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000533', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000534', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000535', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-25' AS Date), N'HV000537', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000456', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000457', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000459', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000460', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000461', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000462', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000463', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000464', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000467', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000471', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000472', 7, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000474', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000476', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000479', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000480', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000481', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000490', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000491', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000492', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000494', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000498', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000503', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000505', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000506', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000508', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000509', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000511', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000512', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000513', 7, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000514', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000517', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000518', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000520', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000521', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000524', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000525', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000526', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000527', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000529', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000531', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000532', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000533', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000534', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000535', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-28' AS Date), N'HV000537', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000273', 4, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000274', 5, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000275', 7, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000276', 1, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000277', 4, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000279', 5, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000281', 6, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000283', 7, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000284', 1, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000285', 6, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000288', 7, 7)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000289', 5, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000290', 1, 8)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000291', 6, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000292', 7, 9)
GO
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000295', 1, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000297', 4, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000298', 5, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000299', 6, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000301', 1, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000302', 6, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000306', 4, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000307', 7, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000308', 1, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000309', 4, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000310', 5, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000312', 7, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000313', 1, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000314', 6, 6)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000315', 4, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000316', 4, 9)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000317', 5, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000318', 5, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000329', 6, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000333', 4, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000334', 7, 2)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000335', 1, 1)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000337', 5, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000338', 6, 5)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000339', 7, 3)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000346', 1, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000353', 4, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000354', 5, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000356', 6, 4)
INSERT [dbo].[PCGac] ([Ngay], [MaHocVien], [MaNhiemVu], [MaCaGac]) VALUES (CAST(N'2023-12-30' AS Date), N'HV000357', 7, 4)
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Tiểu đoàn', NULL)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Đại đội', NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-01' AS Date), N'ThanhHoa', N'HaNoi', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-02' AS Date), N'Ðà Nẵng', N'Tiền Giang', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-03' AS Date), N'H? Chí Minh', N'Bến Tre', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-04' AS Date), N'Thái Bình', N'Quảng Trị', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-05' AS Date), N'Thanh Hóa', N'Phú Thọ', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-06' AS Date), N'Bình Dương', N'An Giang', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-07' AS Date), N'Ninh Thuận', N'Bình Dương', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-08' AS Date), N'Bình Dương', N'Thừa Thiên Huế', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-09' AS Date), N'Hải Dương', N'Cần Thơ', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-10' AS Date), N'An Giang', N'Lâm Ðồng', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-11' AS Date), N'Đắk Nông', N'Bình Phước', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-12' AS Date), N'Bến Tre ', N'Đắk Nông', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-13' AS Date), N'Bắc Ninh', N'Gia Lai', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-14' AS Date), N'Cần Thơ', N'Thái Bình', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-15' AS Date), N'Cà Mau', N'Vinh Long', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-16' AS Date), N'Quảng Trị', N'Hà Nội', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-17' AS Date), N'Bình Phước', N'Cần Thơ', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-18' AS Date), N'Tiền Giang', N'Ðồng Nai', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-19' AS Date), N'Lâm Đồng', N'Bình Phước', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-20' AS Date), N'An Giang', N'Tiền Giang', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-21' AS Date), N'Cà Mau', N'Hải Phòng', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-22' AS Date), N'Hòa Bình', N'Long An', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-23' AS Date), N'Quảng Ngãi', N'Đắk Nông', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-24' AS Date), N'Bình Ðịnh', N'Ngh? An', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-25' AS Date), N'Cần Thơ', N'Long An', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-26' AS Date), N'Cao Bằng', N'Nam Ðịnh', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-27' AS Date), N'Bình Thuận', N'Cần Thơ', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-28' AS Date), N'Thừa Thiên Huế', N'Sóc Trang', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-29' AS Date), N'Ðắk Nông', N'Quảng Nam', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-11-30' AS Date), N'Đồng Tháp', N'Vinh Phúc', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-01' AS Date), N'Thái Nguyên', N'Bắc Ninh', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-02' AS Date), N'Lai Châu', N'Bắc Giang', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-03' AS Date), N'Thái Nguyên', N'Lâm Đồng', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-04' AS Date), N'Ninh Thuận', N'Lai Châu', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-05' AS Date), N'Hà Nam', N'Sóc Trăng', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-06' AS Date), N'Gia Lai', N'Thái Nguyên', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-07' AS Date), N'Ninh Bình', N'Long An', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-08' AS Date), N'Thái Nguyên', N'Lào Cai', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-09' AS Date), N'Hồ Chí Minh', N'Ninh Bình', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-10' AS Date), N'Bình Thuận', N'Điện Biên', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-11' AS Date), N'Bắc Giang', N'Đồng Tháp', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-12' AS Date), N'Hải Dương', N'Phú Yên', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-13' AS Date), N'Cà Mau', N'Bình Phước', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-14' AS Date), N'Hậu Giang', N'Bạc Liêu', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-15' AS Date), N'Đồng Nai', N'Ninh Bình', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-16' AS Date), N'Gia Lai', N'Bình Phước', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-17' AS Date), N'Quảng Ninh', N'Hà Giang', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-18' AS Date), N'Điện Biên', N'Điện Biên', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-19' AS Date), N'Bến Tre', N'Tiền Giang', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-20' AS Date), N'Bắc Ninh', N'Hồ Chí Minh', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-21' AS Date), N'Hà Nội', N'Quảng Ninh', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-22' AS Date), N'Lạng Sơn', N'Quảng Nam', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-23' AS Date), N'Cà Mau', N'Bạc Liêu', N'c155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-24' AS Date), N'Kiên Giang', N'Lai Châu', N'c157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-25' AS Date), N'Lâm Đồng', N'Lai Châu', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-27' AS Date), N'Vĩnh Long', N'Hồ Chí Minh', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-28' AS Date), N'Thái Nguyên', N'Lạng Sơn', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-29' AS Date), N'Hòa Bình', N'Đồng Tháp', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-30' AS Date), N'Lạng Sơn', N'Thừa Thiên Huế', N'c156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2023-12-31' AS Date), N'Bình Dương', N'Quảng Trị', N'c158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-01' AS Date), NULL, NULL, N'C156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-02' AS Date), NULL, NULL, N'C157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-03' AS Date), NULL, NULL, N'C158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-04' AS Date), NULL, NULL, N'C155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-05' AS Date), NULL, NULL, N'C156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-06' AS Date), NULL, NULL, N'C157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-07' AS Date), NULL, NULL, N'C158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-08' AS Date), NULL, NULL, N'C155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-09' AS Date), NULL, NULL, N'C156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-10' AS Date), NULL, NULL, N'C157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-11' AS Date), NULL, NULL, N'C158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-12' AS Date), NULL, NULL, N'C155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-13' AS Date), NULL, NULL, N'C156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-14' AS Date), NULL, NULL, N'C157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-15' AS Date), NULL, NULL, N'C158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-16' AS Date), NULL, NULL, N'C155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-17' AS Date), NULL, NULL, N'C156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-18' AS Date), NULL, NULL, N'C157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-19' AS Date), NULL, NULL, N'C158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-20' AS Date), NULL, NULL, N'C155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-21' AS Date), NULL, NULL, N'C156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-22' AS Date), NULL, NULL, N'C157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-23' AS Date), NULL, NULL, N'C158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-24' AS Date), NULL, NULL, N'C155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-25' AS Date), NULL, NULL, N'C156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-26' AS Date), NULL, NULL, N'C157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-27' AS Date), NULL, NULL, N'C158')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-28' AS Date), NULL, NULL, N'C155')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-29' AS Date), NULL, NULL, N'C156')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-30' AS Date), NULL, NULL, N'C157')
INSERT [dbo].[ThongTinGac] ([Ngay], [Hoi], [Dap], [MaDonVi]) VALUES (CAST(N'2024-01-31' AS Date), NULL, NULL, N'C158')
GO
INSERT [dbo].[ViPham] ([MaViPham], [TenViPham]) VALUES (1, N'Sai tác phong')
GO
SET IDENTITY_INSERT [dbo].[VongGac] ON 

INSERT [dbo].[VongGac] ([MaVongGac], [TenVongGac], [ViTri]) VALUES (1, N'S9', N'Tầng 2 tòa nhà S9')
INSERT [dbo].[VongGac] ([MaVongGac], [TenVongGac], [ViTri]) VALUES (2, N'S3', N'Tòa giám đốc')
INSERT [dbo].[VongGac] ([MaVongGac], [TenVongGac], [ViTri]) VALUES (3, N'H2', N'Thư viện')
SET IDENTITY_INSERT [dbo].[VongGac] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Roles]
GO
ALTER TABLE [dbo].[HocVien]  WITH CHECK ADD  CONSTRAINT [FK_HocVien_CapBac] FOREIGN KEY([MaCapBac])
REFERENCES [dbo].[CapBac] ([MaCapBac])
GO
ALTER TABLE [dbo].[HocVien] CHECK CONSTRAINT [FK_HocVien_CapBac]
GO
ALTER TABLE [dbo].[HocVien]  WITH CHECK ADD  CONSTRAINT [FK_HocVien_ChucVu] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[HocVien] CHECK CONSTRAINT [FK_HocVien_ChucVu]
GO
ALTER TABLE [dbo].[HocVien]  WITH CHECK ADD  CONSTRAINT [FK_HocVien_DonVi] FOREIGN KEY([MaDaiDoi])
REFERENCES [dbo].[DonVi] ([MaDonVi])
GO
ALTER TABLE [dbo].[HocVien] CHECK CONSTRAINT [FK_HocVien_DonVi]
GO
ALTER TABLE [dbo].[KiemTraGac]  WITH CHECK ADD  CONSTRAINT [FK_KiemTraGac_NhiemVu] FOREIGN KEY([NhiemVuHocVien])
REFERENCES [dbo].[NhiemVu] ([MaNhiemVu])
GO
ALTER TABLE [dbo].[KiemTraGac] CHECK CONSTRAINT [FK_KiemTraGac_NhiemVu]
GO
ALTER TABLE [dbo].[KiemTraGac]  WITH CHECK ADD  CONSTRAINT [FK_KiemTraGac_SyQuanKiemTra] FOREIGN KEY([MaSQKT])
REFERENCES [dbo].[SyQuanKiemTra] ([MaSQKT])
GO
ALTER TABLE [dbo].[KiemTraGac] CHECK CONSTRAINT [FK_KiemTraGac_SyQuanKiemTra]
GO
ALTER TABLE [dbo].[KiemTraGac]  WITH CHECK ADD  CONSTRAINT [FK_KiemTraGac_ThongTinGac] FOREIGN KEY([Ngay])
REFERENCES [dbo].[ThongTinGac] ([Ngay])
GO
ALTER TABLE [dbo].[KiemTraGac] CHECK CONSTRAINT [FK_KiemTraGac_ThongTinGac]
GO
ALTER TABLE [dbo].[KiemTraGac]  WITH CHECK ADD  CONSTRAINT [FK_KiemTraGac_ViPham] FOREIGN KEY([MaViPham])
REFERENCES [dbo].[ViPham] ([MaViPham])
GO
ALTER TABLE [dbo].[KiemTraGac] CHECK CONSTRAINT [FK_KiemTraGac_ViPham]
GO
ALTER TABLE [dbo].[NhatKyTruyCap]  WITH CHECK ADD  CONSTRAINT [FK_NhatKyTruyCap_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[NhatKyTruyCap] CHECK CONSTRAINT [FK_NhatKyTruyCap_Account]
GO
ALTER TABLE [dbo].[NhiemVu]  WITH CHECK ADD  CONSTRAINT [FK_NhiemVu_VongGac] FOREIGN KEY([MaVongGac])
REFERENCES [dbo].[VongGac] ([MaVongGac])
GO
ALTER TABLE [dbo].[NhiemVu] CHECK CONSTRAINT [FK_NhiemVu_VongGac]
GO
ALTER TABLE [dbo].[PasswordHistory]  WITH CHECK ADD  CONSTRAINT [FK_PasswordHistory_Account1] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[PasswordHistory] CHECK CONSTRAINT [FK_PasswordHistory_Account1]
GO
ALTER TABLE [dbo].[PCGac]  WITH CHECK ADD  CONSTRAINT [FK_PCGac_CaGac] FOREIGN KEY([MaCaGac])
REFERENCES [dbo].[CaGac] ([MaCaGac])
GO
ALTER TABLE [dbo].[PCGac] CHECK CONSTRAINT [FK_PCGac_CaGac]
GO
ALTER TABLE [dbo].[PCGac]  WITH CHECK ADD  CONSTRAINT [FK_PCGac_HocVien] FOREIGN KEY([MaHocVien])
REFERENCES [dbo].[HocVien] ([MaHocVien])
GO
ALTER TABLE [dbo].[PCGac] CHECK CONSTRAINT [FK_PCGac_HocVien]
GO
ALTER TABLE [dbo].[PCGac]  WITH CHECK ADD  CONSTRAINT [FK_PCGac_NhiemVu] FOREIGN KEY([MaNhiemVu])
REFERENCES [dbo].[NhiemVu] ([MaNhiemVu])
GO
ALTER TABLE [dbo].[PCGac] CHECK CONSTRAINT [FK_PCGac_NhiemVu]
GO
ALTER TABLE [dbo].[PCGac]  WITH CHECK ADD  CONSTRAINT [FK_PCGac_ThongTinGac] FOREIGN KEY([Ngay])
REFERENCES [dbo].[ThongTinGac] ([Ngay])
GO
ALTER TABLE [dbo].[PCGac] CHECK CONSTRAINT [FK_PCGac_ThongTinGac]
GO
ALTER TABLE [dbo].[SesionLog]  WITH CHECK ADD  CONSTRAINT [FK_SesionLog_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[SesionLog] CHECK CONSTRAINT [FK_SesionLog_Account]
GO
ALTER TABLE [dbo].[ThongTinGac]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinGac_DonVi] FOREIGN KEY([MaDonVi])
REFERENCES [dbo].[DonVi] ([MaDonVi])
GO
ALTER TABLE [dbo].[ThongTinGac] CHECK CONSTRAINT [FK_ThongTinGac_DonVi]
GO
/****** Object:  StoredProcedure [dbo].[GetPhanCongGac]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPhanCongGac]
    @Ngay DATE
AS
BEGIN
    SELECT
        HV.TenHocVien,
        HV.GioiTinh,
        NV.TenNhiemVu,
        VG.TenVongGac,
        CG.TuGio,
        CG.DenGio
    FROM
        PCGac PCG
    JOIN HocVien HV ON PCG.MaHocVien = HV.MaHocVien
    JOIN NhiemVu NV ON PCG.MaNhiemVu = NV.MaNhiemVu
    JOIN CaGac CG ON PCG.MaCaGac = CG.MaCaGac
    JOIN VongGac VG ON NV.MaVongGac = VG.MaVongGac
    WHERE PCG.Ngay = @Ngay
    ORDER BY CG.MaCaGac;
END;
GO
/****** Object:  StoredProcedure [dbo].[PhanCongGac]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PhanCongGac]
    @Ngay DATE
AS
BEGIN
    -- Lấy MaDonVi từ bảng ThongTinGac
    DECLARE @MaDonVi VARCHAR(20)
    SELECT @MaDonVi = MaDonVi FROM ThongTinGac WHERE Ngay = @Ngay

    -- Xóa dữ liệu cũ
    DELETE FROM PCGac
    WHERE Ngay = @Ngay
    AND MaCaGac IN (SELECT MaCaGac FROM ThongTinGac WHERE MaDonVi = @MaDonVi)

    -- Lấy thông tin về quân số nữ trong đội
    DECLARE @QuanSoNu INT
    SELECT @QuanSoNu = COUNT(*)
    FROM HocVien
    WHERE MaDaiDoi = @MaDonVi
    AND GioiTinh = N'Nữ'

    -- Lặp qua tất cả các ca gác
    DECLARE @MaCaGac INT
    DECLARE caGac_cursor CURSOR FOR
    SELECT MaCaGac
    FROM CaGac

    OPEN caGac_cursor
    FETCH NEXT FROM caGac_cursor INTO @MaCaGac

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Lặp qua tất cả các nhiệm vụ
        DECLARE @MaNhiemVu INT
        DECLARE nhiemVu_cursor CURSOR FOR
        SELECT MaNhiemVu
        FROM NhiemVu

        OPEN nhiemVu_cursor
        FETCH NEXT FROM nhiemVu_cursor INTO @MaNhiemVu

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Điều kiện phân công học viên
            DECLARE @Gac Bit
            DECLARE @GioiTinh NVARCHAR(4)

            IF @QuanSoNu > 20
            BEGIN
                SET @Gac = 1
                IF @MaCaGac IN (1, 2)
                    SET @GioiTinh = N'Nữ'
                ELSE
                    SET @GioiTinh = N'Nam'
            END
            ELSE IF @QuanSoNu > 10
            BEGIN
                SET @Gac = 1
                IF @MaCaGac = 1
                    SET @GioiTinh = N'Nữ'
                ELSE
                    SET @GioiTinh = N'Nam'
            END
            ELSE
            BEGIN
                SET @Gac = 1
                SET @GioiTinh = N'Nam'
            END

            -- Lựa chọn học viên phân công
            INSERT INTO PCGac (Ngay, MaHocVien, MaNhiemVu, MaCaGac)
            SELECT TOP 1 @Ngay, MaHocVien, @MaNhiemVu, @MaCaGac
            FROM HocVien
            WHERE MaDaiDoi = @MaDonVi
            AND GioiTinh = @GioiTinh
            AND Gac = @Gac
            AND MaHocVien NOT IN (SELECT MaHocVien FROM PCGac WHERE Ngay = @Ngay)
            ORDER BY SoLanGac ASC

            FETCH NEXT FROM nhiemVu_cursor INTO @MaNhiemVu
        END

        CLOSE nhiemVu_cursor
        DEALLOCATE nhiemVu_cursor

        FETCH NEXT FROM caGac_cursor INTO @MaCaGac
    END

    CLOSE caGac_cursor
    DEALLOCATE caGac_cursor
END
GO
/****** Object:  StoredProcedure [dbo].[ThayTheHocVien]    Script Date: 12/12/2023 10:03:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThayTheHocVien]
    @MaHocVienCu VARCHAR(50),
    @Ngay DATE
AS
BEGIN
    -- Lấy Giới tính của học viên cũ
    DECLARE @GioiTinhCu NVARCHAR(4)
    SELECT @GioiTinhCu = GioiTinh
    FROM HocVien
    WHERE MaHocVien = @MaHocVienCu

    -- Thay thế MaHocVien
    UPDATE PCGac
    SET MaHocVien = (
        SELECT TOP 1 MaHocVien
        FROM HocVien
        WHERE MaDaiDoi = (
            SELECT MaDaiDoi
            FROM HocVien
            WHERE MaHocVien = @MaHocVienCu
        )
            AND Gac = 1
            AND GioiTinh = @GioiTinhCu
            AND MaHocVien <> @MaHocVienCu
            AND MaHocVien NOT IN (SELECT MaHocVien FROM PCGac WHERE Ngay = @Ngay)
        ORDER BY SoLanGac ASC
    )
    WHERE MaHocVien = @MaHocVienCu AND Ngay = @Ngay
END
GO


EXEC PhanCongGac @Ngay = '2023-12-10';
