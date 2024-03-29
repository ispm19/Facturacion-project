USE [master]
GO
/****** Object:  Database [DBREALGAS]    Script Date: 1/10/2024 11:34:58 PM ******/
CREATE DATABASE [DBREALGAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBREALGAS_Data', FILENAME = N'C:\DBREALGAS.mdf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 LOG ON 
( NAME = N'DBREALGAS_Logs', FILENAME = N'C:\DBREALGAS.ldf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBREALGAS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBREALGAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBREALGAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBREALGAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBREALGAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBREALGAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBREALGAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBREALGAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBREALGAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBREALGAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBREALGAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBREALGAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBREALGAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBREALGAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBREALGAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBREALGAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBREALGAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBREALGAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBREALGAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBREALGAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBREALGAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBREALGAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBREALGAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBREALGAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBREALGAS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBREALGAS] SET  MULTI_USER 
GO
ALTER DATABASE [DBREALGAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBREALGAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBREALGAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBREALGAS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBREALGAS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBREALGAS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBREALGAS', N'ON'
GO
ALTER DATABASE [DBREALGAS] SET QUERY_STORE = OFF
GO
USE [DBREALGAS]
GO
/****** Object:  User [ispm19_SQLLogin_1]    Script Date: 1/10/2024 11:34:58 PM ******/
CREATE USER [ispm19_SQLLogin_1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ispm19_SQLLogin_1]
GO
/****** Object:  Schema [ispm19_SQLLogin_1]    Script Date: 1/10/2024 11:34:58 PM ******/
CREATE SCHEMA [ispm19_SQLLogin_1]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 1/10/2024 11:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 1/10/2024 11:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](50) NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](40) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[Descuento] [float] NULL,
	[Domicilio] [float] NULL,
	[Negocio] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [cliente_numerodoc] UNIQUE NONCLUSTERED 
(
	[NumeroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 1/10/2024 11:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdProveedor] [int] NULL,
	[IdTienda] [int] NULL,
	[TotalCosto] [float] NULL,
	[TipoComprobante] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_COMPRA]    Script Date: 1/10/2024 11:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_COMPRA](
	[IdDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [float] NULL,
	[PrecioUnitarioCompra] [float] NULL,
	[PrecioUnitarioVenta] [float] NULL,
	[TotalCosto] [float] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 1/10/2024 11:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnidad] [float] NULL,
	[ImporteTotal] [float] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 1/10/2024 11:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Icono] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS]    Script Date: 1/10/2024 11:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS](
	[IdPermisos] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NULL,
	[IdSubMenu] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPermisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[ValorCodigo] [int] NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](100) NULL,
	[IdCategoria] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO_TIENDA]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO_TIENDA](
	[IdProductoTienda] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[IdTienda] [int] NULL,
	[PrecioUnidadCompra] [float] NULL,
	[PrecioUnidadVenta] [float] NULL,
	[Stock] [bigint] NULL,
	[Activo] [bit] NULL,
	[Iniciado] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProductoTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RUC] [varchar](50) NULL,
	[RazonSocial] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBMENU]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBMENU](
	[IdSubMenu] [int] IDENTITY(1,1) NOT NULL,
	[IdMenu] [int] NULL,
	[Nombre] [varchar](60) NULL,
	[NombreFormulario] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSubMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIENDA]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIENDA](
	[IdTienda] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	[RUC] [varchar](60) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](60) NULL,
	[Apellidos] [varchar](60) NULL,
	[Correo] [varchar](60) NULL,
	[Usuario] [varchar](60) NULL,
	[Clave] [varchar](60) NULL,
	[IdTienda] [int] NULL,
	[IdRol] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[ValorCodigo] [int] NULL,
	[IdTienda] [int] NULL,
	[IdUsuario] [int] NULL,
	[IdCliente] [int] NULL,
	[TipoDocumento] [varchar](50) NULL,
	[CantidadProducto] [int] NULL,
	[CantidadTotal] [int] NULL,
	[TotalCosto] [float] NULL,
	[ImporteRecibido] [float] NULL,
	[ImporteCambio] [float] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[MetodoPago] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT ((0)) FOR [TotalCosto]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT ('Boleta') FOR [TipoComprobante]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_VENTA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[DETALLE_VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [PrecioUnidadCompra]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [PrecioUnidadVenta]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [Iniciado]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PROVEEDOR] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PROVEEDOR] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[SUBMENU] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[SUBMENU] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[TIENDA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[TIENDA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[PROVEEDOR] ([IdProveedor])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[TIENDA] ([IdTienda])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[COMPRA] ([IdCompra])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[VENTA] ([IdVenta])
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD FOREIGN KEY([IdSubMenu])
REFERENCES [dbo].[SUBMENU] ([IdSubMenu])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[TIENDA] ([IdTienda])
GO
ALTER TABLE [dbo].[SUBMENU]  WITH CHECK ADD FOREIGN KEY([IdMenu])
REFERENCES [dbo].[MENU] ([IdMenu])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[TIENDA] ([IdTienda])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[TIENDA] ([IdTienda])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[TIENDA] ([IdTienda])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarPermisos]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ACTUALIZAR PERMISOS
create procedure [dbo].[usp_ActualizarPermisos](
@Detalle xml,
@Resultado bit output
)
as
begin
begin try

	BEGIN TRANSACTION
	declare @permisos table(idpermisos int,activo bit)

	insert into @permisos(idpermisos,activo)
	select 
	idpermisos = Node.Data.value('(IdPermisos)[1]','int'),
	activo = Node.Data.value('(Activo)[1]','bit')
	FROM @Detalle.nodes('/DETALLE/PERMISO') Node(Data)

	select * from @permisos

	update p set p.Activo = pe.activo from PERMISOS p
	inner join @permisos pe on pe.idpermisos = p.IdPermisos

	COMMIT
	set @Resultado = 1

end try
begin catch
	ROLLBACK
	set @Resultado = 0
end catch
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ControlarStock]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA STOCK PRODUCTO_TIENDA

CREATE PROCEDURE [dbo].[usp_ControlarStock](
@IdProducto int,
@IdTienda int,
@Cantidad int,
@Restar bit,
@Resultado bit output)
as
begin
	set @Resultado = 1
	begin try
		if(@Restar = 1)
			update PRODUCTO_TIENDA set Stock = Stock - @Cantidad where IdProducto = @IdProducto and IdTienda = @IdTienda and Iniciado = 1
		else
			update PRODUCTO_TIENDA set Stock = Stock + @Cantidad where IdProducto = @IdProducto and IdTienda = @IdTienda and Iniciado = 1
	end try
	begin catch
		set @Resultado = 0
	end catch
end


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCategoria]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR CATEGORIA
create procedure [dbo].[usp_EliminarCategoria](
@IdCategoria int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ninguna categoria este relacionada a un producto
	IF not EXISTS (select * from CATEGORIA c
	inner join PRODUCTO p on c.IdCategoria  = p.IdCategoria
	where c.IdCategoria = @IdCategoria)

		delete from CATEGORIA where IdCategoria = @IdCategoria

	ELSE
		SET @Resultado = 0

end



GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProducto]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PRODUCTO
create procedure [dbo].[usp_EliminarProducto](
@IdProducto int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ningun producto se encuentre relacionado a una tienda
	IF not EXISTS (select top 1 * from PRODUCTO_TIENDA PT
INNER JOIN PRODUCTO P ON P.IdProducto = PT.IdProducto
WHERE P.IdProducto = @IdProducto)
		delete from PRODUCTO where IdProducto = @IdProducto

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProductoTienda]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PRODUCTO_TIENDA
create procedure [dbo].[usp_EliminarProductoTienda](
@IdProductoTienda int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	IF NOT EXISTS (SELECT * FROM PRODUCTO_TIENDA WHERE IdProductoTienda = @IdProductoTienda and Iniciado = 1 )

		delete from PRODUCTO_TIENDA where IdProductoTienda = @IdProductoTienda

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProveedor]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PROVEEDOR
create procedure [dbo].[usp_EliminarProveedor](
@IdProveedor int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	--validamos que ningun proveedor se encuentre asignado a una compra
	IF not EXISTS (select top 1 * from COMPRA c
inner join PROVEEDOR p on p.IdProveedor = c.IdProveedor
where p.IdProveedor = @IdProveedor)

		delete from PROVEEDOR where IdProveedor = @IdProveedor
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarRol]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR ROL
create procedure [dbo].[usp_EliminarRol](
@IdRol int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que el rol no se encuentre asignado a algun usuario
	IF not EXISTS (select * from USUARIO u
	inner join ROL r on r.IdRol  = u.IdRol
	where r.IdRol = @IdRol)
	begin	
		delete from PERMISOS where IdRol = @IdRol
		delete from ROL where IdRol = @IdRol
	end
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarTienda]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA ELIMINAR TIENDA
create procedure [dbo].[usp_EliminarTienda](
@IdTienda int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que la tienda no se encuentre asignada a un usuario y una venta
	IF not EXISTS (select * from USUARIO u
	inner join TIENDA t on t.IdTienda = u.IdTienda
	where t.IdTienda = @IdTienda)

		delete from TIENDA where IdTienda = @IdTienda

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarUsuario]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR USUARIO
create procedure [dbo].[usp_EliminarUsuario](
@IdUsuario int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ningun usuario se encuentre relacionado a una tienda
	IF (not EXISTS (select c.* from COMPRA c 
		inner join USUARIO u on u.IdUsuario = c.IdUsuario 
		where u.IdUsuario = @IdUsuario
		) and 
		not EXISTS (select v.* from VENTA v 
		inner join USUARIO u on u.IdUsuario = v.IdUsuario 
		where u.IdUsuario = @IdUsuario
		)
	)
		delete from USUARIO where IdUsuario = @IdUsuario
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_LoginUsuario]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIO

create procedure [dbo].[usp_LoginUsuario](
@Usuario varchar(60),
@Clave varchar(60),
@IdUsuario int output
)
as
begin
	set @IdUsuario = 0
	if exists(select * from USUARIO where [Usuario] COLLATE Latin1_General_CS_AS = @Usuario and Clave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
		set @IdUsuario = (select top 1 IdUsuario from USUARIO where [Usuario]  COLLATE Latin1_General_CS_AS = @Usuario and Clave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarCategoria]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure [dbo].[usp_ModificarCategoria](
@IdCategoria int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarCliente]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR CLIENTES
CREATE procedure [dbo].[usp_ModificarCliente](
@IdCliente int,
@Nombre varchar(50),
@Negocio varchar (30),
@TipoDocumento varchar(50),
@NumeroDocumento varchar(50),
@Direccion varchar(50),
@Telefono varchar(40),
@Descuento float,
@Domicilio float,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
--	IF NOT EXISTS (SELECT * FROM CLIENTE WHERE TipoDocumento = @TipoDocumento and IdCliente != @IdCliente)
		
		update CLIENTE set 
		Nombre = @Nombre,
		Negocio = @Negocio,
		TipoDocumento = @TipoDocumento,
		NumeroDocumento = @NumeroDocumento,
		Direccion = @Direccion,
		Telefono = @Telefono,
		Descuento = @Descuento,
		Domicilio = @Domicilio
		where IdCliente = @IdCliente
--	ELSE
	--	SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProducto]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PRODUCTO
create procedure [dbo].[usp_ModificarProducto](
@IdProducto int,
@Nombre varchar(50),
@Descripcion varchar(50),
@IdCategoria int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE rtrim(ltrim(Nombre)) = rtrim(ltrim(@Nombre)) and IdProducto != @IdProducto)
		
		update PRODUCTO set
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdCategoria = @IdCategoria,
		Activo = @Activo
		where IdProducto = @IdProducto
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProductoTienda]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA MODIFICAR PRODUCTO_TIENDA
CREATE procedure [dbo].[usp_ModificarProductoTienda](
@IdProductoTienda int,
@PrecioUnidadVenta float,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	
	update PRODUCTO_TIENDA set 
		PrecioUnidadVenta = @PrecioUnidadVenta
		
		where IdProductoTienda = @IdProductoTienda
	

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProductoTienda1]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PRODUCTO_TIENDA
CREATE procedure [dbo].[usp_ModificarProductoTienda1](
@IdProductoTienda int,
@PrecioUnidadVenta float,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_TIENDA WHERE @IdProductoTienda = @IdProductoTienda)
		
		update PRODUCTO_TIENDA set 
		PrecioUnidadVenta = @PrecioUnidadVenta
		
		where IdProductoTienda = @IdProductoTienda
	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProveedor]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA MODIFICAR PROVEEDOR
create procedure [dbo].[usp_ModificarProveedor](
@IdProveedor int,
@Ruc varchar(50),
@RazonSocial varchar(100),
@Telefono varchar(50),
@Correo varchar(50),
@Direccion varchar(50),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PROVEEDOR WHERE RUC = @Ruc and IdProveedor != @IdProveedor)
		
		update PROVEEDOR set 
		RUC = @Ruc,
		RazonSocial = @RazonSocial,
		Telefono = @Telefono,
		Correo = @Correo,
		Direccion = @Direccion,
		Activo = @Activo
		where IdProveedor = @IdProveedor
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarRol]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR ROLES
create procedure [dbo].[usp_ModificarRol](
@IdRol int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion =@Descripcion and IdRol != @IdRol)
		
		update ROL set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdRol = @IdRol
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarTienda]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR TIENDA
create procedure [dbo].[usp_ModificarTienda](
@IdTienda int,
@Nombre varchar(60),
@Ruc varchar(60),
@Direccion varchar(60),
@Telefono varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM TIENDA WHERE Nombre =@Nombre and IdTienda != @IdTienda)
		
		update TIENDA set 
		Nombre = @Nombre,
		RUC = @Ruc,
		Direccion = @Direccion,
		Telefono = @Telefono,
		Activo = @Activo
		where IdTienda = @IdTienda

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarUsuario]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR USUARIO
create procedure [dbo].[usp_ModificarUsuario](
@IdUsuario int,
@Nombres varchar(50),
@Apellidos varchar(50),
@Correo varchar(50),
@Usuario varchar(50),
@Clave varchar(50),
@IdTienda int,
@IdRol int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Usuario = @Usuario and IdUsuario != @IdUsuario)
		
		update USUARIO set 
		Nombres = @Nombres,
		Apellidos = @Apellidos,
		Correo = @Correo,
		Usuario = @Usuario,
		Clave = @Clave,
		IdTienda = @IdTienda,
		IdRol = @IdRol,
		Activo = @Activo
		where IdUsuario = @IdUsuario

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_NuevoPago]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_NuevoPago]
    @IdVenta INT,
    @NuevoImporteRecibido float,
	@Resultado bit output
AS
BEGIN
SET @Resultado = 1
    UPDATE VENTA
    SET ImporteRecibido = @NuevoImporteRecibido
    WHERE IdVenta = @IdVenta
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerCategorias]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER CATEGORIA
CREATE PROC [dbo].[usp_ObtenerCategorias]
as
begin
 select IdCategoria,Descripcion,Activo from CATEGORIA
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerClientes]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_ObtenerClientes]
as
begin
 select IdCliente,Nombre,Negocio,TipoDocumento,NumeroDocumento,Telefono,Direccion,Descuento,Domicilio from CLIENTE

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleCompra]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE COMPRA
create proc [dbo].[usp_ObtenerDetalleCompra](
@IdCompra int
)
as
begin


select  RIGHT('000000' + convert(varchar(max),c.IdCompra),6)[Codigo],
CONVERT(char(10),c.FechaRegistro,103)[FechaCompra],
CONVERT(decimal(10,2), c.TotalCosto)[TotalCosto],

(select p.RUC,p.RazonSocial from PROVEEDOR P
 where p.IdProveedor = c.IdProveedor
FOR XML PATH (''),TYPE) AS 'DETALLE_PROVEEDOR',

(select T.RUC, T.Nombre, T.Direccion from TIENDA T
 where T.IdTienda = c.IdTienda
FOR XML PATH (''),TYPE) AS 'DETALLE_TIENDA',

(select convert(int, dc.Cantidad)[Cantidad],concat(p.Nombre,' - ',p.Descripcion)[NombreProducto],
CONVERT(decimal(10,2),dc.PrecioUnitarioCompra)PrecioUnitarioCompra,
CONVERT(decimal(10,2),dc.TotalCosto)[TotalCosto] 
from DETALLE_COMPRA dc
inner join PRODUCTO p on p.IdProducto = dc.IdProducto
where dc.IdCompra = c.IdCompra
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from COMPRA c
where c.IdCompra =@IdCompra
FOR XML PATH(''), ROOT('DETALLE_COMPRA') 
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleUsuario]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE USUARIO
create proc [dbo].[usp_ObtenerDetalleUsuario](
@IdUsuario int
)
as
begin

 select 
*,
(select * from TIENDA t
 where t.IdTienda = up.IdTienda
FOR XML PATH (''),TYPE) AS 'DetalleTienda'
,
(select * from ROL r
 where r.IdRol = up.IdRol
FOR XML PATH (''),TYPE) AS 'DetalleRol'
,
 (
 select t.NombreMenu,t.Icono,
 (select sm.Nombre[NombreSubMenu],sm.NombreFormulario,p.Activo
	 from PERMISOS p
	 inner join ROL r on r.IdRol = p.IdRol
	 inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
	 inner join MENU m on m.IdMenu = sm.IdMenu
	 inner join USUARIO u on u.IdRol = r.IdRol and u.IdUsuario = up.IdUsuario
	where sm.IdMenu = t.IdMenu
  FOR XML PATH ('SubMenu'),TYPE) AS 'DetalleSubMenu' 

 from (
 select distinct m.Nombre[NombreMenu],m.IdMenu,m.Icono
 from PERMISOS p
 inner join ROL r on r.IdRol = p.IdRol
 inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
 inner join MENU m on m.IdMenu = sm.IdMenu
 inner join USUARIO u on u.IdRol = r.IdRol and u.IdUsuario = up.IdUsuario
 where p.Activo = 1) t
 FOR XML PATH ('Menu'),TYPE) AS 'DetalleMenu'  
 from USUARIO up
 where UP.IdUsuario = @IdUsuario
 FOR XML PATH(''), ROOT('Usuario')  

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleVenta]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE VENTA
CREATE proc [dbo].[usp_ObtenerDetalleVenta](
@IdVenta int
)
as
begin


select V.TipoDocumento, V.Codigo, V.MetodoPago,
CONVERT(decimal(10,2), V.TotalCosto)[TotalCosto],
CONVERT(decimal(10,2),V.ImporteRecibido)[ImporteRecibido],
CONVERT(decimal(10,2), V.ImporteCambio)[ImporteCambio],
convert(char(10),v.fechaRegistro,103)[FechaRegistro],
(select u.Nombres,u.Apellidos from USUARIO U
 where U.IdUsuario = v.IdUsuario
FOR XML PATH (''),TYPE) AS 'DETALLE_USUARIO',

(select T.RUC, T.Nombre, T.Direccion from TIENDA T
 where T.IdTienda = V.IdTienda
FOR XML PATH (''),TYPE) AS 'DETALLE_TIENDA',

(select C.Nombre,C.Direccion,C.NumeroDocumento,C.Telefono,C.Descuento from CLIENTE c
 where c.IdCliente = V.IdCliente
FOR XML PATH (''),TYPE) AS 'DETALLE_CLIENTE',

(select dv.Cantidad,concat(p.Nombre,'-',p.Descripcion)[NombreProducto],
CONVERT(decimal(10,2),dv.PrecioUnidad)[PrecioUnidad],
CONVERT(decimal(10,2),dv.ImporteTotal)[ImporteTotal] 
from DETALLE_VENTA dv
inner join PRODUCTO p on p.IdProducto = dv.IdProducto
where dv.IdVenta = v.IdVenta
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from VENTA v
where v.IdVenta = @IdVenta
FOR XML PATH(''), ROOT('DETALLE_VENTA') 

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerListaCompra]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER LISTA COMPRA
create procedure [dbo].[usp_ObtenerListaCompra](
@FechaInicio date,
@FechaFin date,
@IdProveedor int = 0 ,
@IdTienda int = 0
)
as
begin
SET DATEFORMAT dmy;
select c.IdCompra,RIGHT('000000' + convert(varchar(max),c.IdCompra),6)[NumeroCompra], p.RazonSocial,t.Nombre,
convert(char(10),c.FechaRegistro,103)[FechaCompra],c.TotalCosto from COMPRA c
inner join PROVEEDOR p on p.IdProveedor = c.IdProveedor
inner join TIENDA t on t.IdTienda = c.IdTienda
where 
CONVERT(date,c.FechaRegistro) between @FechaInicio and @FechaFin and
p.IdProveedor = iif(@IdProveedor = 0,p.IdProveedor,@IdProveedor) and
t.IdTienda =iif(@IdTienda = 0,t.IdTienda,@IdTienda) 

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerListaFPendientes]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER LISTA VENTA

CREATE procedure [dbo].[usp_ObtenerListaFPendientes]
as
begin
SELECT v.IdVenta, v.Codigo, v.TotalCosto, v.ImporteRecibido, v.TipoDocumento, v.FechaRegistro, c.Nombre, c.NumeroDocumento 
FROM VENTA v 
INNER JOIN CLIENTE c ON c.IdCliente = v.IdCliente
WHERE EXISTS (SELECT 1 FROM VENTA WHERE IdVenta = v.IdVenta AND ImporteRecibido < TotalCosto)


end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerListaVenta]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER LISTA VENTA

CREATE procedure [dbo].[usp_ObtenerListaVenta](
@Codigo varchar(50) = '',
@FechaInicio date,
@FechaFin date,
@NumeroDocumento varchar(50) = '',
@Nombre varchar(100) = ''
)
as
begin
SET DATEFORMAT dmy;
select v.IdVenta, v.TipoDocumento,v.Codigo,v.FechaRegistro,c.NumeroDocumento,c.Nombre,v.TotalCosto, v.MetodoPago from VENTA v 
inner join CLIENTE c on c.IdCliente = v.IdCliente
where 
v.Codigo = iif(@Codigo='',v.Codigo,@Codigo) and
CONVERT(date,v.FechaRegistro) between @FechaInicio and @FechaFin and
c.NumeroDocumento like CONCAT('%',@NumeroDocumento,'%') and
c.Nombre like CONCAT('%',@Nombre,'%')

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerPermisos]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER PERMISOS
create procedure [dbo].[usp_ObtenerPermisos](
@IdRol int)
as
begin
select p.IdPermisos,m.Nombre[Menu],sm.Nombre[SubMenu],p.Activo from PERMISOS p
inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
inner join MENU m on m.IdMenu = sm.IdMenu
where p.IdRol = @IdRol
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProductos]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEMIENTO PARA OBTENER PRODUCTO
CREATE PROC [dbo].[usp_ObtenerProductos]
as
begin
 select IdProducto,Codigo,ValorCodigo,Nombre,p.Descripcion[DescripcionProducto],p.IdCategoria,p.Activo,c.Descripcion[DescripcionCategoria] from PRODUCTO p
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProductoTienda]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************* PRODUCTO_TIENDA **************************/


--PROCEDMIENTO PARA OBTENER PRODUCTO_TIENDA
CREATE PROC [dbo].[usp_ObtenerProductoTienda]
as
begin
 select pt.IdProductoTienda,p.IdProducto,p.Codigo[CodigoProducto], p.Nombre[NombreProducto],p.Descripcion[DescripcionProducto],
 t.IdTienda,t.RUC,t.Nombre[NombreTienda] ,t.Direccion[DireccionTienda],pt.PrecioUnidadCompra,pt.PrecioUnidadVenta,pt.Stock,pt.Iniciado
 from PRODUCTO_TIENDA pt
 inner join PRODUCTO p on p.IdProducto = pt.IdProducto
 inner join TIENDA t on t.IdTienda = pt.IdTienda
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProveedores]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA OBTENER PROVEEDORES
CREATE PROC [dbo].[usp_ObtenerProveedores]
as
begin
 select IdProveedor,RUC,RazonSocial,Telefono,Correo,Direccion,Activo from PROVEEDOR
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerRoles]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER ROLES
CREATE PROC [dbo].[usp_ObtenerRoles]
as
begin
 select IdRol, Descripcion,Activo from ROL
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerTienda]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA OBTENER TIENDAS
CREATE PROC [dbo].[usp_ObtenerTienda]
as
begin
 select IdTienda,Nombre,RUC,Direccion,Telefono,Activo from TIENDA
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerUsuario]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIOS
CREATE PROC [dbo].[usp_ObtenerUsuario]
as
begin
 select u.IdUsuario,u.Nombres,u.Apellidos,u.Correo,u.Usuario,u.Clave,u.IdTienda,u.IdRol,u.Activo,u.FechaRegistro,r.Descripcion[DescripcionRol],u.Activo from USUARIO u
 inner join ROL r on r.IdRol = u.IdRol
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCategoria]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC [dbo].[usp_RegistrarCategoria](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCliente]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_RegistrarCliente](
@Nombre varchar(50),
@Negocio varchar(30),
@TipoDocumento varchar(50),
@NumeroDocumento varchar(50),
@Direccion varchar(50),
@Telefono varchar(40),
@Descuento float,
@Domocilio float,

@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CLIENTE WHERE NumeroDocumento = @NumeroDocumento)

		insert into CLIENTE(Nombre,Negocio,TipoDocumento,NumeroDocumento,Direccion,Telefono,Descuento,Domicilio) values (
		@Nombre,@Negocio,@TipoDocumento,@NumeroDocumento,@Direccion,@Telefono,@Descuento,@Domocilio
		)
	ELSE
		SET @Resultado = 0
	
end
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCompra]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************* COMPRA **************************/

--PROCEDIMIENTO PARA REGITRAR COMPRA
create procedure [dbo].[usp_RegistrarCompra](
@Detalle xml,
@Resultado bit output
)
as
begin


begin try

	BEGIN TRANSACTION

	declare @compra table(idusuario int,idproveedor int,idtienda int,totalcosto float)
	declare @detallecompra table(idcompra int,idproducto int,cantidad int,preciounidadcompra float,preciounidadventa float,totalcosto float)
	declare @tiendaproducto table(idtienda int,idproducto int,cantidad int,preciounidadcompra float,preciounidadventa float,totalcosto float)

	 insert into @compra(idusuario,idproveedor,idtienda,totalcosto)
	 select 
	 IdUsuario = Node.Data.value('(IdUsuario)[1]','int'),
	 IdProveedor = Node.Data.value('(IdProveedor)[1]','int'),
	 IdTienda = Node.Data.value('(IdTienda)[1]','int'),
	 TotalCosto = Node.Data.value('(TotalCosto)[1]','float')
	 FROM @Detalle.nodes('/DETALLE/COMPRA') Node(Data)
 
	 insert into @detallecompra(idcompra,idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto)
	 select 
	 IdCompra = Node.Data.value('(IdCompra)[1]','int'),
	 IdProducto = Node.Data.value('(IdProducto)[1]','int'),
	 Cantidad = Node.Data.value('(Cantidad)[1]','int'),
	 PrecioUnidadCompra = Node.Data.value('(PrecioUnidadCompra)[1]','float'),
	 PrecioUnidadVenta = Node.Data.value('(PrecioUnidadVenta)[1]','float'),
	 TotalCosto = Node.Data.value('(TotalCosto)[1]','float')
	 FROM @Detalle.nodes('/DETALLE/DETALLE_COMPRA/DETALLE') Node(Data)

	 insert into @tiendaproducto(idtienda,idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto)
	 select
	 (select top 1 idtienda from @compra),
	 idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto
	 from @detallecompra


	 --******************* AREA DE TRABAJO *************************
	 declare @IdCompra int = 0

	 insert into COMPRA(IdUsuario,IdProveedor,IdTienda,TotalCosto)
	 select idusuario,idproveedor,idtienda,totalcosto from @compra

	 set @IdCompra = Scope_identity()
	 update @detallecompra set idcompra = @IdCompra

	 insert into DETALLE_COMPRA(IdCompra,IdProducto,Cantidad,PrecioUnitarioCompra,PrecioUnitarioVenta,TotalCosto)
	 select idcompra,idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto from @detallecompra

	 update pt set 
	 pt.PrecioUnidadCompra = tp.preciounidadcompra, 
	 pt.PrecioUnidadVenta = tp.preciounidadventa,
	 pt.Stock = pt.Stock + tp.cantidad,
	 pt.Iniciado = 1
	 from PRODUCTO_TIENDA pt
	 inner join @tiendaproducto tp on tp.idtienda = pt.IdTienda and tp.idproducto = pt.IdProducto

	 COMMIT
	 set @Resultado = 1

 end try
 begin catch
	ROLLBACK
	set @Resultado = 0
 end catch
end



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProducto]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR PRODUCTO
CREATE PROC [dbo].[usp_RegistrarProducto](
@Nombre varchar(50),
@Descripcion varchar(50),
@IdCategoria int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE rtrim(ltrim(Nombre)) = rtrim(ltrim(@Nombre)))

		insert into PRODUCTO(Codigo,ValorCodigo,Nombre,Descripcion,IdCategoria) values (
		RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO)),6),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO),@Nombre,@Descripcion,@IdCategoria
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProductoTienda]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PRODUCTO_TIENDA
CREATE PROC [dbo].[usp_RegistrarProductoTienda](
@IdProducto int,
@IdTienda int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_TIENDA WHERE IdProducto = @IdProducto and IdTienda = @IdTienda)

		insert into PRODUCTO_TIENDA(IdProducto,IdTienda) values (
		@IdProducto,@IdTienda
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProveedor]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PROVEEDOR
CREATE PROC [dbo].[usp_RegistrarProveedor](
@Ruc varchar(50),
@RazonSocial varchar(100),
@Telefono varchar(50),
@Correo varchar(50),
@Direccion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PROVEEDOR WHERE RUC = @Ruc)

		insert into PROVEEDOR(RUC,RazonSocial,Telefono,Correo,Direccion)
		values(@Ruc,@RazonSocial,@Telefono,@Correo,@Direccion)

	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarRol]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR ROL
CREATE PROC [dbo].[usp_RegistrarRol](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion = @Descripcion)
	begin
		declare @idrol int = 0
		insert into ROL(Descripcion) values (
		@Descripcion
		)
		set @idrol  = Scope_identity()

		insert into PERMISOS(IdRol,IdSubMenu,Activo)
		select @idrol, IdSubMenu,0 from SUBMENU
	end
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarTienda]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA GUARDAR TIENDA
CREATE PROC [dbo].[usp_RegistrarTienda](
@Nombre varchar(50),
@Ruc varchar(50),
@Direccion varchar(50),
@Telefono varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM TIENDA WHERE Nombre = @Nombre)

		insert into TIENDA(Nombre,RUC,Direccion,Telefono) values (
		@Nombre,@Ruc,@Direccion,@Telefono
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarUsuario]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA REGISTRAR USUARIO
CREATE PROC [dbo].[usp_RegistrarUsuario](
@Nombres varchar(50),
@Apellidos varchar(50),
@Correo varchar(50),
@Usuario varchar(50),
@Clave varchar(50),
@IdTienda int,
@IdRol int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Usuario = @Usuario)

		insert into USUARIO(Nombres,Apellidos,Correo,Usuario,Clave,IdTienda,IdRol) values (
		@Nombres,@Apellidos,@Correo,@Usuario,@Clave,@IdTienda,@IdRol
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarVenta]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/********************* VENTA **************************/

--PROCEDIMIENTO PARA REGITRAR VENTA
CREATE procedure [dbo].[usp_RegistrarVenta](
@Detalle xml,
@Resultado int output
)
as
begin


begin try

	BEGIN TRANSACTION
	
	declare @cliente table (tipodocumento varchar(50),numerodocumento varchar(50),nombre varchar(100),direccion varchar(100),telefono varchar(50))
	declare @venta table (idtienda int,idusuario int,idcliente int default 0,tipodocumento varchar(50),cantidadproducto int,cantidadtotal int,totalcosto float,importerecibido float,importecambio float, metodopago varchar(30))
	declare @detalleventa table (idventa int,idproducto int,cantidad int,preciounidad float,importetotal float)

	insert into @cliente(tipodocumento,numerodocumento,nombre,direccion,telefono)
		 select 
		 tipodocumento = Node.Data.value('(TipoDocumento)[1]','varchar(50)'),
		 numerodocumento = Node.Data.value('(NumeroDocumento)[1]','varchar(50)'),
		 nombre = Node.Data.value('(Nombre)[1]','varchar(100)'),
		 direccion = Node.Data.value('(Direccion)[1]','varchar(100)'),
		 telefono = Node.Data.value('(Telefono)[1]','varchar(50)')

		 FROM @Detalle.nodes('/DETALLE/DETALLE_CLIENTE/DATOS') Node(Data)

	insert into @venta(idtienda,idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal,totalcosto,importerecibido,importecambio,metodopago)
	select 
		 IdTienda = Node.Data.value('(IdTienda)[1]','varchar(50)'),
		 IdUsuario = Node.Data.value('(IdUsuario)[1]','varchar(50)'),
		 IdCliente = Node.Data.value('(IdCliente)[1]','varchar(100)'),
		 TipoDocumento = Node.Data.value('(TipoDocumento)[1]','varchar(100)'),
		 CantidadProducto = Node.Data.value('(CantidadProducto)[1]','varchar(50)'),
		 CantidadTotal = Node.Data.value('(CantidadTotal)[1]','varchar(50)'),
		 TotalCosto = Node.Data.value('(TotalCosto)[1]','varchar(50)'),
		 ImporteRecibido = Node.Data.value('(ImporteRecibido)[1]','varchar(50)'),
		 ImporteCambio = Node.Data.value('(ImporteCambio)[1]','varchar(50)'),
		 MetodoPago = Node.Data.value ('(MetodoPago)[1]','varchar(30)')
		 FROM @Detalle.nodes('/DETALLE/VENTA') Node(Data)

	insert into @detalleventa(idventa,idproducto,cantidad,preciounidad,importetotal)
		 select 
		 IdVenta = Node.Data.value('(IdVenta)[1]','int'),
		 IdProducto = Node.Data.value('(IdProducto)[1]','int'),
		 Cantidad = Node.Data.value('(Cantidad)[1]','int'),
		 PrecioUnidad = Node.Data.value('(PrecioUnidad)[1]','float'),
		 ImporteTotal = Node.Data.value('(ImporteTotal)[1]','float')
		 FROM @Detalle.nodes('/DETALLE/DETALLE_VENTA/DATOS') Node(Data)

	--******************* AREA DE TRABAJO *************************
	declare @identity as table(ID int)
	declare @nc varchar (50)
	set @nc = (select numerodocumento from @cliente)
	IF NOT EXISTS (select IdCliente from CLIENTE where NumeroDocumento = @nc )
		begin
	insert into CLIENTE(TipoDocumento,NumeroDocumento,Nombre,Direccion,Telefono)
	output inserted.IdCliente into @identity
	select tipodocumento,numerodocumento,nombre,direccion,telefono from @cliente
	update @venta set idcliente = (select ID from @identity)
	delete from @identity
		end
	ELSE
		begin
/*	declare @pc varchar (50)
	set @pc = (select IdCliente from CLIENTE where NumeroDocumento = @nc)
	insert into CLIENTE(TipoDocumento,NumeroDocumento,Nombre,Direccion,Telefono)
	output inserted.IdCliente into @identity */
	INSERT INTO @identity
SELECT
    IdCliente
FROM
    CLIENTE
WHERE
    NumeroDocumento = (select numerodocumento from @cliente);
	select tipodocumento,numerodocumento,nombre,direccion,telefono from @cliente
	update @venta set idcliente = (select ID from @identity)
	delete from @identity
		end 
		
	
	declare @dep varchar(50)
	set @dep = (select tipodocumento from @cliente)
	
	IF (@dep = 'Cedula')
       begin
    insert into VENTA(Codigo,ValorCodigo,IdTienda,IdUsuario,IdCliente,TipoDocumento,CantidadProducto,CantidadTotal,TotalCosto,ImporteRecibido,ImporteCambio,MetodoPago)
	output inserted.IdVenta into @identity
	
	
	select 
	RIGHT('B02000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from VENTA) ),11),
	(select isnull(max(ValorCodigo),0) + 1 from VENTA),
	idtienda,idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal,totalcosto,importerecibido,importecambio,metodopago
	from @venta

        end
	ELSE 
		begin
		insert into VENTA(Codigo,ValorCodigo,IdTienda,IdUsuario,IdCliente,TipoDocumento,CantidadProducto,CantidadTotal,TotalCosto,ImporteRecibido,ImporteCambio,MetodoPago)
	output inserted.IdVenta into @identity
	
	
	select 
	RIGHT('B01000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from VENTA) ),11),
	(select isnull(max(ValorCodigo),0) + 1 from VENTA),
	idtienda,idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal,totalcosto,importerecibido,importecambio,metodopago
	from @venta
		end
	
	update @detalleventa set idventa = (select ID from @identity)

	insert into DETALLE_VENTA(IdVenta,IdProducto,Cantidad,PrecioUnidad,ImporteTotal)
	select idventa,idproducto,cantidad,preciounidad,importetotal from @detalleventa


	 COMMIT
	 set @Resultado = (select ID from @identity)
	
	

 end try
 begin catch
	ROLLBACK
	set @Resultado = 0
 end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_rptProductoTienda]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA REPORTE TIENDA PRODUCTO

 create procedure [dbo].[usp_rptProductoTienda](
 @IdTienda int = 0,
 @Codigo varchar(50)
 )
 as
 begin
 select 
 t.RUC[Ruc Tienda],t.Nombre[Nombre Tienda],t.Direccion[Direccion Tienda],
 p.Codigo[Codigo Producto],p.Nombre[Nombre Producto],p.Descripcion[Descripcion Producto],
 pt.Stock[Stock en tienda],convert(decimal(10,2),pt.PrecioUnidadCompra)[Precio Compra],convert(decimal(10,2),pt.PrecioUnidadVenta)[Precio Venta]
 from PRODUCTO_TIENDA pt
 inner join PRODUCTO p on p.IdProducto = pt.IdProducto
 inner join TIENDA t on t.IdTienda = pt.IdTienda
 where pt.IdTienda = iif(@IdTienda = 0,pt.IdTienda,@IdTienda) and
 p.Codigo like '%' + @Codigo + '%'
 end

GO
/****** Object:  StoredProcedure [dbo].[usp_rptVenta]    Script Date: 1/10/2024 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --PROCEDMIENTO PARA REPORTE VENTA

create procedure [dbo].[usp_rptVenta] (
@FechaInicio date,
@FechaFin date,
@IdTienda int = 0
)
as
begin

 select convert(char(10), v.FechaRegistro ,103)[Fecha Venta],v.Codigo[Numero Documento],v.TipoDocumento[Tipo Documento],
 t.Nombre[Nombre Tienda], t.RUC[Ruc Tienda],
 concat(u.Nombres,' ', u.apellidos)[Nombre Empleado],
 v.CantidadTotal[Cantidad Unidades Vendidas],v.CantidadProducto[Cantidad Productos],v.TotalCosto[Total Venta] 
 from VENTA v
 inner join TIENDA t on t.IdTienda = v.IdTienda
 inner join USUARIO u on u.IdUsuario = v.IdUsuario
 where 
 CONVERT(date,v.FechaRegistro) between @FechaInicio and @FechaFin 
 and v.IdTienda = iif(@IdTienda =0 ,v.IdTienda,@IdTienda)
end





GO
USE [master]
GO
ALTER DATABASE [DBREALGAS] SET  READ_WRITE 
GO
