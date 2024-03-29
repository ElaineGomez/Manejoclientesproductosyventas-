
/*Nombre: Elaine Gomez  Matricula: 22-EIIT-1-109     Seccion: 0541*/


USE [master]
GO
/****** Object:  Database [Farmacia]    Script Date: 23/8/2023 5:39:12 a. m. ******/
CREATE DATABASE [Farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2023\MSSQL\DATA\Farmacia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Farmacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2023\MSSQL\DATA\Farmacia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Farmacia] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacia] SET RECOVERY FULL 
GO
ALTER DATABASE [Farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Farmacia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Farmacia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Farmacia', N'ON'
GO
ALTER DATABASE [Farmacia] SET QUERY_STORE = ON
GO
ALTER DATABASE [Farmacia] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Farmacia]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 23/8/2023 5:39:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClientesId] [int] NOT NULL,
	[Nombre] [varchar](15) NULL,
	[Sexo] [char](1) NULL,
	[Aseguradora] [varchar](15) NULL,
	[Email] [varchar](25) NULL,
	[Direccion] [varchar](50) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClientesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 23/8/2023 5:39:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratorio](
	[LaboratorioId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](13) NULL,
 CONSTRAINT [PK_Laboratorio] PRIMARY KEY CLUSTERED 
(
	[LaboratorioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 23/8/2023 5:39:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[MedicamentosId] [int] NOT NULL,
	[Nombre] [varchar](25) NULL,
	[Precio] [int] NULL,
	[FechaVencimiento] [datetime] NULL,
	[LaboratorioId] [int] NULL,
 CONSTRAINT [PK_Medicamentos] PRIMARY KEY CLUSTERED 
(
	[MedicamentosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 23/8/2023 5:39:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[VendedorId] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Sexo] [char](1) NULL,
	[Email] [varchar](50) NULL,
	[Telefono] [varchar](13) NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[VendedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 23/8/2023 5:39:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[VentasId] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Precio] [int] NULL,
	[VendedorId] [int] NULL,
	[ClienteId] [int] NULL,
	[MedicamentoId] [int] NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[VentasId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clientes] ([ClientesId], [Nombre], [Sexo], [Aseguradora], [Email], [Direccion]) VALUES (1, N'Laura Marte', N'f', N'ARSHUMANO', N'LMarte@hotmail.com', N'calle Flor #38')
INSERT [dbo].[Clientes] ([ClientesId], [Nombre], [Sexo], [Aseguradora], [Email], [Direccion]) VALUES (2, N'Lucas Felix', N'm', N'UNIVERSAL', N'LFelix@gmail.com', N'calle Mirador #2')
INSERT [dbo].[Clientes] ([ClientesId], [Nombre], [Sexo], [Aseguradora], [Email], [Direccion]) VALUES (3, N'Lina Cuello', N'f', N'UNIVERSAL', N'LCuello@hotmail.com', N'Mata Hambre')
INSERT [dbo].[Clientes] ([ClientesId], [Nombre], [Sexo], [Aseguradora], [Email], [Direccion]) VALUES (4, N'Melissa Perez', N'f', N'ARSHUMANO', N'MPerez@Gmail.com', N'Alma Rosa 2da')
INSERT [dbo].[Clientes] ([ClientesId], [Nombre], [Sexo], [Aseguradora], [Email], [Direccion]) VALUES (5, N'Elaine Morel', N'f', N'UNIVERSAL', N'EMorel@hotmail.com', N'El Portal')
INSERT [dbo].[Clientes] ([ClientesId], [Nombre], [Sexo], [Aseguradora], [Email], [Direccion]) VALUES (6, N'Nancy Helena', N'f', N'ARS FUTURO', N'NHelena@gmail.com', N'calle El Sol #57')
INSERT [dbo].[Clientes] ([ClientesId], [Nombre], [Sexo], [Aseguradora], [Email], [Direccion]) VALUES (7, N'Placido Moreaux', N'm', N'MAPFRE SALUD', N'PMoreaux@hotmail.com', N'La Romana')
INSERT [dbo].[Clientes] ([ClientesId], [Nombre], [Sexo], [Aseguradora], [Email], [Direccion]) VALUES (8, N'Armando Lopez', N'm', N'LA COLONIAL', N'ALopez@gmail.com', N'Mirador Sur #14')
INSERT [dbo].[Clientes] ([ClientesId], [Nombre], [Sexo], [Aseguradora], [Email], [Direccion]) VALUES (9, N'Francisco Prado', N'm', N'ARSHUMANO', N'FPrado@hotmail.com', N'Ensache La Fe')
INSERT [dbo].[Clientes] ([ClientesId], [Nombre], [Sexo], [Aseguradora], [Email], [Direccion]) VALUES (10, N'Natalia Puello', N'f', N'MAPFRE SALUD', N'NPuello@gmail.com', N'Los Almirantes #2')
GO
SET IDENTITY_INSERT [dbo].[Laboratorio] ON 

INSERT [dbo].[Laboratorio] ([LaboratorioId], [Nombre], [Direccion], [Telefono]) VALUES (1, N'Laboratorios Orbis', N'Avenida Prol. Mirador Sur', N'809-534-4567')
INSERT [dbo].[Laboratorio] ([LaboratorioId], [Nombre], [Direccion], [Telefono]) VALUES (2, N'Laboratorios Sued', N'Carretera La Isabela', N'809-543-8760')
INSERT [dbo].[Laboratorio] ([LaboratorioId], [Nombre], [Direccion], [Telefono]) VALUES (3, N'Laboratorios Mamey', N'Carretera Esperanza', N'809-604-3211')
INSERT [dbo].[Laboratorio] ([LaboratorioId], [Nombre], [Direccion], [Telefono]) VALUES (4, N'Laboratorios Rama', N'AV. Nuñez de Cáceres', N'809-522-0302')
INSERT [dbo].[Laboratorio] ([LaboratorioId], [Nombre], [Direccion], [Telefono]) VALUES (5, N'Laboratorios Peratri', N'Terry Francois Street', N'809-432-2200')
INSERT [dbo].[Laboratorio] ([LaboratorioId], [Nombre], [Direccion], [Telefono]) VALUES (6, N'Laboratorios Dronena', N'AV. España', N'809-544-3367')
INSERT [dbo].[Laboratorio] ([LaboratorioId], [Nombre], [Direccion], [Telefono]) VALUES (10, N'Laboratorios Meterag', N'Gazcue', N'809-522-5679')
INSERT [dbo].[Laboratorio] ([LaboratorioId], [Nombre], [Direccion], [Telefono]) VALUES (11, N'Laboratorio Sosua', N'Carretera Sanchez', N'809-355-4325')
INSERT [dbo].[Laboratorio] ([LaboratorioId], [Nombre], [Direccion], [Telefono]) VALUES (12, N'Laboratorio Caribe', N'Punta Cana', N'809-455-6549')
INSERT [dbo].[Laboratorio] ([LaboratorioId], [Nombre], [Direccion], [Telefono]) VALUES (17, N'Laboratorios Proquin', N'Barahona', N'809-534-6605')
SET IDENTITY_INSERT [dbo].[Laboratorio] OFF
GO
INSERT [dbo].[Medicamentos] ([MedicamentosId], [Nombre], [Precio], [FechaVencimiento], [LaboratorioId]) VALUES (1, N'Apirina', 35, CAST(N'2025-04-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Medicamentos] ([MedicamentosId], [Nombre], [Precio], [FechaVencimiento], [LaboratorioId]) VALUES (2, N'Penicilina', 250, CAST(N'2026-07-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Medicamentos] ([MedicamentosId], [Nombre], [Precio], [FechaVencimiento], [LaboratorioId]) VALUES (3, N'Resfridol', 25, CAST(N'2024-05-03T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Medicamentos] ([MedicamentosId], [Nombre], [Precio], [FechaVencimiento], [LaboratorioId]) VALUES (4, N'Aliviol Ultra', 100, CAST(N'2025-07-09T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Medicamentos] ([MedicamentosId], [Nombre], [Precio], [FechaVencimiento], [LaboratorioId]) VALUES (5, N'Panadol Forte', 95, CAST(N'2026-07-06T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Medicamentos] ([MedicamentosId], [Nombre], [Precio], [FechaVencimiento], [LaboratorioId]) VALUES (6, N'Ponstan', 15, CAST(N'2023-08-01T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Medicamentos] ([MedicamentosId], [Nombre], [Precio], [FechaVencimiento], [LaboratorioId]) VALUES (7, N'Sertal Simple', 20, CAST(N'2026-09-04T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Medicamentos] ([MedicamentosId], [Nombre], [Precio], [FechaVencimiento], [LaboratorioId]) VALUES (8, N'Loratadina', 50, CAST(N'2025-08-09T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Medicamentos] ([MedicamentosId], [Nombre], [Precio], [FechaVencimiento], [LaboratorioId]) VALUES (9, N'Sertal Forte', 55, CAST(N'2023-04-05T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Medicamentos] ([MedicamentosId], [Nombre], [Precio], [FechaVencimiento], [LaboratorioId]) VALUES (10, N'Algho', 40, CAST(N'2026-05-09T00:00:00.000' AS DateTime), 17)
GO
INSERT [dbo].[Vendedor] ([VendedorId], [Nombre], [Sexo], [Email], [Telefono]) VALUES (1, N'Patricia Gonzales', N'f', N'PGonzales@hotmail.com', N'809-332-2122')
INSERT [dbo].[Vendedor] ([VendedorId], [Nombre], [Sexo], [Email], [Telefono]) VALUES (2, N'Maria Cuevas', N'f', N'MCuevas@gmail.com', N'829-234-5661')
INSERT [dbo].[Vendedor] ([VendedorId], [Nombre], [Sexo], [Email], [Telefono]) VALUES (3, N'Pedro Alonso', N'm', N'PAlonso@hotmail.com', N'809-344-6598')
INSERT [dbo].[Vendedor] ([VendedorId], [Nombre], [Sexo], [Email], [Telefono]) VALUES (4, N'Patria Gomez', N'f', N'PGomez@hotmail.com', N'849-542-1298')
INSERT [dbo].[Vendedor] ([VendedorId], [Nombre], [Sexo], [Email], [Telefono]) VALUES (5, N'Natividad Sanchez', N'f', N'NSanchez@gmail.com', N'829-533-6578')
INSERT [dbo].[Vendedor] ([VendedorId], [Nombre], [Sexo], [Email], [Telefono]) VALUES (6, N'Manuel Oleo', N'm', N'MOleo@gmail.com', N'829-978-123')
INSERT [dbo].[Vendedor] ([VendedorId], [Nombre], [Sexo], [Email], [Telefono]) VALUES (7, N'Alfonso Cuaron', N'm', N'ACuaron@hotmail.com', N'809-345-8670')
INSERT [dbo].[Vendedor] ([VendedorId], [Nombre], [Sexo], [Email], [Telefono]) VALUES (8, N'Ana Perez', N'f', N'APerez@hotmail.com', N'829-432-890')
INSERT [dbo].[Vendedor] ([VendedorId], [Nombre], [Sexo], [Email], [Telefono]) VALUES (9, N'Mary Franco', N'f', N'MFranco@gmail.com', N'809-456-3214')
INSERT [dbo].[Vendedor] ([VendedorId], [Nombre], [Sexo], [Email], [Telefono]) VALUES (10, N'Tania Vaez', N'f', N'TVaez@gmail.com', N'809-654-3865')
GO
INSERT [dbo].[Ventas] ([VentasId], [Fecha], [Precio], [VendedorId], [ClienteId], [MedicamentoId]) VALUES (1, CAST(N'2024-02-12T00:00:00.000' AS DateTime), 35, 1, 1, 1)
INSERT [dbo].[Ventas] ([VentasId], [Fecha], [Precio], [VendedorId], [ClienteId], [MedicamentoId]) VALUES (2, CAST(N'2023-05-03T00:00:00.000' AS DateTime), 250, 2, 2, 2)
INSERT [dbo].[Ventas] ([VentasId], [Fecha], [Precio], [VendedorId], [ClienteId], [MedicamentoId]) VALUES (3, CAST(N'2023-02-01T00:00:00.000' AS DateTime), 25, 3, 3, 3)
INSERT [dbo].[Ventas] ([VentasId], [Fecha], [Precio], [VendedorId], [ClienteId], [MedicamentoId]) VALUES (4, CAST(N'2023-03-01T00:00:00.000' AS DateTime), 100, 4, 4, 4)
INSERT [dbo].[Ventas] ([VentasId], [Fecha], [Precio], [VendedorId], [ClienteId], [MedicamentoId]) VALUES (5, CAST(N'2023-05-04T00:00:00.000' AS DateTime), 95, 5, 5, 5)
INSERT [dbo].[Ventas] ([VentasId], [Fecha], [Precio], [VendedorId], [ClienteId], [MedicamentoId]) VALUES (6, CAST(N'2023-07-04T00:00:00.000' AS DateTime), 15, 6, 6, 6)
INSERT [dbo].[Ventas] ([VentasId], [Fecha], [Precio], [VendedorId], [ClienteId], [MedicamentoId]) VALUES (7, CAST(N'2023-04-07T00:00:00.000' AS DateTime), 20, 7, 7, 7)
INSERT [dbo].[Ventas] ([VentasId], [Fecha], [Precio], [VendedorId], [ClienteId], [MedicamentoId]) VALUES (8, CAST(N'2024-01-01T00:00:00.000' AS DateTime), 50, 8, 8, 8)
INSERT [dbo].[Ventas] ([VentasId], [Fecha], [Precio], [VendedorId], [ClienteId], [MedicamentoId]) VALUES (9, CAST(N'2023-05-09T00:00:00.000' AS DateTime), 55, 9, 9, 9)
INSERT [dbo].[Ventas] ([VentasId], [Fecha], [Precio], [VendedorId], [ClienteId], [MedicamentoId]) VALUES (10, CAST(N'2023-06-07T00:00:00.000' AS DateTime), 40, 10, 10, 10)
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Medicamentos_Laboratorio] FOREIGN KEY([LaboratorioId])
REFERENCES [dbo].[Laboratorio] ([LaboratorioId])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Medicamentos_Laboratorio]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClientesId])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Medicamentos] FOREIGN KEY([MedicamentoId])
REFERENCES [dbo].[Medicamentos] ([MedicamentosId])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Medicamentos]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Vendedor] FOREIGN KEY([VendedorId])
REFERENCES [dbo].[Vendedor] ([VendedorId])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Vendedor]
GO
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO

