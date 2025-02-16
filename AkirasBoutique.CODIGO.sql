USE [AkirasBoutique]
GO
/****** Object:  Database [AkirasBoutiques]    Script Date: 26/7/2022 17:11:20 ******/
CREATE DATABASE [AkirasBoutiques]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AkirasBoutiques', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\AkirasBoutiques.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AkirasBoutiques_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\AkirasBoutiques_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AkirasBoutiques] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AkirasBoutiques].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ARITHABORT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AkirasBoutiques] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AkirasBoutiques] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AkirasBoutiques] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AkirasBoutiques] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AkirasBoutiques] SET  MULTI_USER 
GO
ALTER DATABASE [AkirasBoutiques] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AkirasBoutiques] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AkirasBoutiques] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AkirasBoutiques] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AkirasBoutiques] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AkirasBoutiques] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AkirasBoutiques] SET QUERY_STORE = OFF
GO
USE [AkirasBoutiques]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 26/7/2022 17:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] NOT NULL,
	[nombre] [text] NOT NULL,
	[descripcion] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 26/7/2022 17:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] NOT NULL,
	[nombre] [text] NOT NULL,
	[apellido] [text] NOT NULL,
	[direccion] [text] NOT NULL,
	[fec_nac] [date] NOT NULL,
	[telefono] [int] NOT NULL,
	[email] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 26/7/2022 17:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[id_detalle] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 26/7/2022 17:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id_factura] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha] [date] NULL,
	[id_detalle] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 26/7/2022 17:11:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id_producto] [int] NOT NULL,
	[nombre] [text] NOT NULL,
	[precio] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (1, N'Blusa', N'Prenda abierta de tela fina , similar a la camisa , que usan las mujeres y los niños , y que cubre la parte superior del cuerpo')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (2, N'Falda', N'Prenda de vestir que cuelga de la cintura y cubre las piernas, al menos en parte. ')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (3, N'Pantalón', N'Prenda de vestir que se ajusta a la cintura y llega generalmente hasta el pie , cubriendo cada pierna separadamente .')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (4, N'Pijama', N'Conjunto de chaqueta o camiseta y pantalón a juego que se usa para dormir.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (5, N'Camisa', N'Prenda de vestir que cubre el tronco hasta la cadera o medio muslo, con cuello, manga corta o larga, que se abrocha por delante con botones; suele llevar un canesú en la espalda que permite dar amplitud al cuerpo de la prenda.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (6, N'Zapato', N'pieza de calzado que protege al pie, brindándole comodidad a la persona a la hora de llevar a cabo diferentes acciones')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (7, N'Chamarra', N'Prenda amplia de vestir, rústica, de abrigo, que cubre el cuerpo hasta medio muslo, hecha de piel con lana o pelo por fuera o por dentro.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (8, N'Suéter', N'Prenda de punto elástico, manual o mecánico, de lana, algodón o alguna fibra sintética, cerrado o abierto por delante, con escote o cuello de distinto tipo y generalmente manga larga, que cubre el cuerpo hasta la cadera o medio muslo.')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (9, N'Vestido', N'Prenda que se asocia con la elegancia femenina y clásica. ')
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (10, N'Accesorios', N'Completan el look, le dan un aire renovado a nuestras prendas. Collares, accesorios para el pelo, joyas, zapatos, carteras, cinturones')
GO
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (0, N'María Antonieta', N'García Meléndez ', N'Calle las Girasol #305 col. Jardines ', CAST(N'1989-06-15' AS Date), 1828921321, N'mariantonia@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (1, N'Óscar Germán', N'Wong Tabares ', N'Calle Revolución #879 col. México', CAST(N'1994-01-28' AS Date), 2035672143, N'germanwong@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (2, N'Valentina Anastasia', N'Huerta Corral', N'Calle Flamenco #3493 col. Aviar', CAST(N'1992-07-03' AS Date), 0, N'valehue92@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (3, N'Luisa Beatriz ', N'Rodríguez Estrada', N'Calle Ruiseño #1903 col. Aviar', CAST(N'1995-02-21' AS Date), 2034598383, N'betyrodri@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (4, N'Ana Maribel ', N'Cedillo Núñez ', N'Calle Ecuador #278 col. Latinoamérica', CAST(N'1986-09-25' AS Date), 1783920982, N'anamari86@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (5, N'Sara Valeria ', N'Jiménez Sánchez', N'calle Amarillo #890 col. Colores', CAST(N'1990-10-23' AS Date), 1025675109, N'valesarita@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (6, N'Rodrigo Enrique', N'García Monreal ', N'Calle Guadiana #905 fracc. Guadiana', CAST(N'1993-03-29' AS Date), 2146982372, N'rodrimonreal@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (7, N'Marina Gabriela', N'Villanueva Barrios', N'Calle Luna #560 fracc. Cosmos', CAST(N'1993-06-04' AS Date), 1161728372, N'marigaby@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (8, N'Luis Francisco', N'Bernal Casas', N'Calle Porfirio #246 col. Revolución', CAST(N'1996-01-22' AS Date), 2034573621, N'luispacober@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (9, N'Rebeca Elizabeth ', N'Puentes Ríos', N'Calle Domingo #1929 col. Buendia', CAST(N'1988-10-18' AS Date), 123459834, N'rebepuentes88@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (10, N'Yesenia Beatriz', N'Quintanilla Torres', N'Calle Roble #405 col. Singapur', CAST(N'1984-01-24' AS Date), 1328902183, N'betyquintanilla@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (11, N'Rodrigo Ismael', N'Silva Ugarte', N'Calle Tamarino #1209 fracc. Mezquital', CAST(N'1996-05-14' AS Date), 1436784145, N'rodriisma@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (12, N'Rosa Hortencia ', N'Rosas Morales', N'Calle Margarita #2892 col Jardines', CAST(N'1983-01-15' AS Date), 1923925489, N'rositarosas@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (13, N'Gabriela Cassandra', N'Quiñones Escobar', N'Calle Dolores #239 col. Del Río', CAST(N'1987-11-15' AS Date), 2113840192, N'cassqui87@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (14, N'Sara Roberta ', N'Moreno Moreno', N'Calle Colinas #912 col. Colinas del norte', CAST(N'1982-12-14' AS Date), 1244930285, N'saritarober@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (15, N'María Fernanda', N'Ávila Nuñez', N'Calle Nunó #594 col. Personajes', CAST(N'1995-09-13' AS Date), 1207583929, N'mariafer95@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (16, N'Camilo Isaac', N'Peña Huerta', N'Calle Niños Héroes #1239 col. México ', CAST(N'1987-01-20' AS Date), 1293904389, N'camisac@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (17, N'Zayra Manuela', N'Gómez López ', N'Calle Rosales #390 Fracc. Las flores', CAST(N'1977-10-28' AS Date), 1283094033, N'zaygom77@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (18, N'Rosa Alicia ', N'Reyes Nájera ', N'Calle Flautín #1459 col. La Orquesta', CAST(N'1984-11-20' AS Date), 125940940, N'rosealice84@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (19, N'Juan Roberto  ', N'Ortega Rincón', N'Calle Los Álamos #4902 Fracc. Monreal', CAST(N'1986-07-31' AS Date), 1489328581, N'roberortega@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (21, N'Sandra Isabella ', N'Pereyra Félix ', N'Calle Azalea #901 Fracc. Las Flores', CAST(N'1990-04-09' AS Date), 1289394301, N'peyfex90@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (22, N'Rogelia Margarita ', N'Cruz Santos ', N'Calle Golondrinas #9023 col. Felipe Ángeles', CAST(N'1986-05-11' AS Date), 1925678302, N'margaritacruz@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (23, N'Julieta Odette ', N'Rocha Ramazzoti', N'Calle Río Bravo #2013 Fracc. TierraBlanca', CAST(N'1993-07-16' AS Date), 1293391028, N'julyramazzoti@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (24, N'Dante Eduardo', N'Dolores Meza', N'Calle Miguel Ángel #439 col. Renacimiento', CAST(N'1993-07-15' AS Date), 2023950349, N'danteduardo93@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (25, N'Bianca Alejandra', N'Rosales Rosas', N'Calle Rueda #1924 col. Emprendedores ', CAST(N'1987-06-26' AS Date), 1821039583, N'rosasbianca@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (26, N'Fabiola Elena', N'Reséndiz Amador ', N'Calle Melchor Ocampo #901 col. Libertadores', CAST(N'1994-08-18' AS Date), 1294024901, N'fabielle94@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (27, N'Miriam Karina', N'Lara Ruíz', N'Sta. María del Oro #423 col. Nazas', CAST(N'1990-07-26' AS Date), 2014893018, N'mirilara@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (28, N'Valeria Jimena', N'De la O Tabares ', N'Calle Crisantema #311 col. PRI Amp', CAST(N'1986-08-15' AS Date), 1024792478, N'valejimena@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (29, N'Juan Humberto', N'Martínez Fuentes', N'Calle Agustín de Anda #608 fracc. Valle del Guadiana', CAST(N'1989-10-17' AS Date), 1924802840, N'juanmar@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (30, N'Melissa Ximena', N'Zaragoza Suárez', N'Calle Río Piaxtla #4380 col Valle del Sur', CAST(N'1986-05-15' AS Date), 2018438929, N'melizara@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (31, N'Cristina Miranda ', N'Morales Rueda ', N'Calle Magnolia #113 Fracc Jardines', CAST(N'1987-08-16' AS Date), 1034920394, N'crismiranda@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (32, N'Bruno Alejandro', N'Miranda López', N'Calle del Roble #702, fracc. Jardines del Real IV', CAST(N'1988-06-29' AS Date), 1893019749, N'brunomiranda@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (33, N'Helena Emilia', N'Robles Espinoza ', N'Calle Plan de Agua Prieta #128 Col Emiliano Zapata', CAST(N'1987-10-28' AS Date), 1892081803, N'helenarobles@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (34, N'Teresa Renata', N'Zavala Piña', N'Calle Chiapas #205 col. Morga', CAST(N'1985-02-20' AS Date), 1029482019, N'terezavala@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (35, N'Wendy Carolina ', N'Piña Quiñones', N'Calle Gral Fco. Arrieta #211 col. Gral Domingo Arrieta', CAST(N'1995-07-19' AS Date), 1928001001, N'carowendy@gmail.com')
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fec_nac], [telefono], [email]) VALUES (36, N'Jesús Alberto', N'Hidalgo Correa ', N'Calle 3 de Agosto #308, col Tierra y Libertad', CAST(N'1985-01-18' AS Date), 1890290832, N'chuybeto@gmail.com')
GO
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (1, 32, 4, 1600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (2, 8, 3, 690)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (3, 39, 4, 200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (4, 26, 1, 110)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (5, 30, 4, 1800)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (6, 2, 5, 750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (7, 14, 4, 1600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (8, 36, 2, 1500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (9, 25, 1, 1050)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (10, 34, 1, 1350)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (11, 12, 6, 1500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (12, 13, 1, 150)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (13, 21, 1, 150)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (14, 24, 8, 1600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (15, 31, 2, 900)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (16, 22, 1, 600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (17, 5, 7, 1750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (18, 3, 4, 400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (19, 11, 2, 558)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (20, 4, 6, 600)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (21, 7, 6, 720)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (22, 10, 4, 1200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (23, 33, 4, 2400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (24, 39, 10, 500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (25, 20, 8, 2400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (26, 27, 2, 1400)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (27, 35, 4, 4200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (28, 29, 4, 1200)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (29, 38, 6, 450)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (30, 28, 1, 750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (31, 18, 6, 1620)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (32, 25, 6, 6300)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (33, 30, 3, 1350)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (34, 26, 5, 5500)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (35, 40, 10, 1000)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (36, 21, 9, 4950)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (37, 12, 3, 750)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (38, 8, 6, 1380)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (39, 11, 4, 1116)
INSERT [dbo].[detalle] ([id_detalle], [id_producto], [cantidad], [precio]) VALUES (40, 4, 8, 800)
GO
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (1, 9, CAST(N'2021-12-22' AS Date), 1)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (2, 9, CAST(N'2021-10-11' AS Date), 2)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (3, 4, CAST(N'2021-12-07' AS Date), 3)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (4, 4, CAST(N'2021-08-24' AS Date), 4)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (5, 1, CAST(N'2021-09-24' AS Date), 5)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (6, 1, CAST(N'2022-01-08' AS Date), 6)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (7, 0, CAST(N'2022-01-01' AS Date), 7)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (8, 0, CAST(N'2021-12-28' AS Date), 8)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (9, 3, CAST(N'2022-01-11' AS Date), 9)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (10, 3, CAST(N'2022-01-16' AS Date), 10)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (11, 2, CAST(N'2021-07-13' AS Date), 11)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (12, 2, CAST(N'2022-01-05' AS Date), 12)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (13, 6, CAST(N'2022-01-12' AS Date), 13)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (14, 6, CAST(N'2021-12-22' AS Date), 14)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (15, 5, CAST(N'2021-11-18' AS Date), 15)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (16, 5, CAST(N'2022-01-09' AS Date), 16)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (17, 7, CAST(N'2021-10-12' AS Date), 17)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (18, 7, CAST(N'2021-12-30' AS Date), 18)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (19, 8, CAST(N'2022-01-17' AS Date), 19)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (20, 8, CAST(N'2021-12-21' AS Date), 20)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (21, 26, CAST(N'2021-10-08' AS Date), 21)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (22, 30, CAST(N'2022-01-19' AS Date), 22)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (23, 31, CAST(N'2021-07-16' AS Date), 23)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (24, 35, CAST(N'2021-09-23' AS Date), 24)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (25, 25, CAST(N'2021-06-14' AS Date), 25)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (26, 29, CAST(N'2021-08-19' AS Date), 26)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (27, 27, CAST(N'2021-11-10' AS Date), 27)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (28, 24, CAST(N'2022-01-22' AS Date), 28)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (29, 26, CAST(N'2022-01-11' AS Date), 29)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (30, 36, CAST(N'2022-01-04' AS Date), 30)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (31, 12, CAST(N'2021-12-07' AS Date), 31)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (32, 14, CAST(N'2022-01-06' AS Date), 32)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (33, 24, CAST(N'2022-01-03' AS Date), 33)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (34, 17, CAST(N'2021-11-11' AS Date), 34)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (35, 31, CAST(N'2021-11-16' AS Date), 35)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (36, 36, CAST(N'2022-01-10' AS Date), 36)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (37, 23, CAST(N'2021-11-17' AS Date), 37)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (38, 29, CAST(N'2022-01-03' AS Date), 38)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (39, 26, CAST(N'2021-12-14' AS Date), 39)
INSERT [dbo].[factura] ([id_factura], [id_cliente], [fecha], [id_detalle]) VALUES (40, 18, CAST(N'2022-01-20' AS Date), 40)
GO
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (1, N'Blusa de flores', 200, 70, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (2, N'Blusa tipo escocesa ', 150, 35, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (3, N'Blusa rayada manga larga', 100, 37, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (4, N'Blusa con estampado animado', 100, 26, 1)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (5, N'Falda larga', 200, 45, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (6, N'Falda tipo escocesa ', 250, 12, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (7, N'Falda tipo escolar ', 120, 68, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (8, N'Falda ejecutiva ', 230, 20, 2)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (9, N'Pantalón acampanado ', 350, 23, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (10, N'Skinny Jeans', 300, 56, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (11, N'Pantalón Pants ', 279, 30, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (12, N'Shorts de Mezclilla', 250, 48, 3)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (13, N'Camisón', 150, 9, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (14, N'Conjunto de pijama', 400, 26, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (15, N'Blusa de pijama', 100, 45, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (16, N'Pantalón de pijama', 150, 20, 4)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (17, N'Camisa ejecutiva ', 240, 36, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (18, N'Camisa de flores', 270, 40, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (19, N'Camisa tipo escolar', 290, 59, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (20, N'Camisa con bordado', 300, 10, 5)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (21, N'Tennis suela alta', 550, 9, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (22, N'Zapato de tacón ', 600, 23, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (23, N'Bota alta', 650, 1, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (24, N'Pantuflas', 200, 24, 6)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (25, N'Abrigo largo', 1050, 3, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (26, N'Chamarra pluma de ganso', 1100, 17, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (27, N'Chamarra delgada ', 700, 20, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (28, N'Cazadora', 750, 12, 7)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (29, N'Suéter cerrado', 300, 23, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (30, N'Sudadera deportiva', 450, 45, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (31, N'Suéter tejido', 450, 35, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (32, N'Suéter estampado', 400, 19, 8)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (33, N'Vestido corto de día', 600, 3, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (34, N'Vestido de noche largo ', 1350, 23, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (35, N'Vestido ejecutivo', 1050, 67, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (36, N'Vestido fantasía para niña', 750, 5, 9)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (37, N'Collar', 150, 9, 10)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (38, N'Pulseras', 75, 78, 10)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (39, N'Aretes', 50, 59, 10)
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (40, N'Accesorios para el cabello ', 100, 30, 10)
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [id_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [id_producto]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [id_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [id_cliente]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [id_detalle] FOREIGN KEY([id_detalle])
REFERENCES [dbo].[detalle] ([id_detalle])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [id_detalle]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [id_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [id_categoria]
GO
USE [master]
GO
ALTER DATABASE [AkirasBoutiques] SET  READ_WRITE 
GO


/*****crear tabla [empleado_AkirasBoutiques]*****/

CREATE TABLE [dbo].[empleado_AkirasBoutiques](
	[nombre] [text] NOT NULL,
	[apellido] [text] NOT NULL,
	[direccion] [text] NOT NULL,
	[telefono] [int] NOT NULL,
	[edad] [int] NOT NULL,
	[sucursal] [text] NOT NULL,
	[email] [text] NOT NULL,
	[contraseña] [varchar] NOT NULL
	);

	/*****AGREGAR COLUMNA [nombre_del_encargado]*****/

	ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ADD [nombre_del_encargado] [varchar](max) NOT NULL;

/*****MODIFICAR COLUMNA [TELEFONO]*****/

		ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ALTER COLUMN [telefono] VARCHAR(15) NOT NULL;


/*****crear tabla [SUCURSALES]*****/

CREATE TABLE [dbo].[sucursales_AkirasBoutique](
	[numero_sucursal] [int] NOT NULL,
	[nombre_de_la_sucursal] [text] NOT NULL,
	[nombre_del_encargado] [text] NOT NULL,
	[direccion] [text] NOT NULL,
	[ciudad] [text] NOT NULL,
    [estado] [text] NOT NULL,
	[telefono] VARCHAR(15) NOT NULL
	);

	//*agregaremos los valores a la tabla llamada "sucursales_akirasboutique"*//

INSERT INTO [dbo].[sucursales_AkirasBoutique] (numero_sucursal, nombre_de_la_sucursal, nombre_del_encargado, direccion, telefono, ciudad, estado)
VALUES 
(1, 'Akiras_Boutique:LasMercedes', 'Sonia_Alejandra_Fernandez_Moreno', 'Calle_Roble#507fracc.LasMercedes', '4447831225', 'San_Luis_Potosi','San_Luis_Potosi'),
(2, 'Akiras_Boutique:Obraje', 'Fernando_Calderon_Ayala', 'Calle_Dr.Jesus_Diaz_De_Leon#438col.Obraje', '4493780921', 'Aguascalientes', 'Aguascalientes'),
(3, 'Akiras_Boutique:Galerias_Mazatlan', 'Daniela_Fernanda_Diaz_Ordaz', 'Av.de_la_Marina#6204;Marina,local35', '6692932059', 'Mazatlan', 'Sinaloa'),
(4, 'Akiras_Boutique:Zapopan', 'Mario_Alberto_Jimenez_Salcido', 'Av.Manuel_J.Clouthier525col.BenitoJuarez', '3337841230', 'Zapopan', 'Jalisco'),
(5, 'Akiras_Boutique:Melchor', 'Yesenia_Guadalupe_Campos_Rojo', 'Av.Melchor_Ocampo#2528zona_centro', '6143906721', 'Chihuahua', 'Chihuahua'),
(6, 'Akiras_Boutique:constitucion', 'Tamara_Alejandra_Bernal_Ramos', 'calle_Constitucion#106Zona_Centro', '6181962954', 'Durango', 'Durango'),
(7, 'Akiras_Boutique:Centro', 'Samuel_Enrique_Barrios_Enciso', 'Av.hidalgo#338Zacatecas_centro', '4929301250', 'Zacatecas', 'Zacatecas');


/**agregaremos los valores a la tabla llamada "[empleado_AkirasBoutiques]"**/
	
	/**Registrar un mínimo de 40 empleados (5 por sucursal). Incluir, además, el nombre
del encargado de la sucursal**/

INSERT INTO [dbo].[empleado_AkirasBoutiques] 
(
    [nombre], 
    [apellido], 
    [direccion], 
    [telefono], 
    [edad], 
    [sucursal], 
    [email], 
    [contraseña],
	[nombre_del_encargado]
)

VALUES
    ('Juan', 'Pérez', 'Calle_5de_Mayo_123', '4444567892', 30, 'Akiras_Boutique_Las_Mercedes', 'juan.perez@akirasboutiques.com', 'contraseña123', 'Sonia_Alejandra_Fernandez_Moreno'),
    ('Ana', 'Gómez', 'Avenida_Universidad_456', '4449173291', 30,  'Akiras_Boutique_Las_Mercedes', 'ana.gomez@akirasboutiques.com', 'contraseña456', 'Sonia_Alejandra_Fernandez_Moreno'),
    ('Carlos', 'Martínez', 'Calle_Hidalgo789,Tequisquiapan', '444136514', 35,  'Akiras_Boutique_Las_Mercedes', 'carlos.martinez@akirasboutiques.com', 'contraseña789', 'Sonia_Alejandra_Fernandez_Moreno'),
    ('Laura', 'Hernández', 'Avenida_Carranza_101,Polanco', '4449823667', 25,  'Akiras_Boutique_Las_Mercedes', 'laura.hernandez@akirasboutiques.com', 'contraseña101', 'Sonia_Alejandra_Fernandez_Moreno'),
    ('Pedro', 'López', 'Calle_Morelos 202,Tangamanga', '4444677201', 40,  'Akiras_Boutique_Las_Mercedes', 'pedro.lopez@akirasboutiques.com', 'contraseña202', 'Sonia_Alejandra_Fernandez_Moreno'),
	('Perla', 'Casillas', 'Calle_Morelos 256,Tangamanga', '4444677203', 42,  'Akiras_Boutique_Las_Mercedes', 'perla.casillas@akirasboutiques.com', 'contraseña000', 'Sonia_Alejandra_Fernandez_Moreno'),

	('Maricela', 'Estrada', 'Calle_Madero_123,Centro', '4777079394', 21, 'Akiras_Boutique_Obraje', 'maricela.estrada@akirasboutiques.com', 'contraseña2.0', 'Fernando_Calderon_Ayala'),
	('Brenda', 'Arce', 'Avenida_Universidad_456,San_Marcos', '4492805129', 27, 'Akiras_Boutique_Obraje', 'brenda.arce@akirasboutiques.com', 'contraseña2.1', 'Fernando_Calderon_Ayala'),
	('Luis', 'Zarate', 'Calle_Zaragoza_789,Las Américas', '4499964515', 39, 'Akiras_Boutique_Obraje', 'luis.zarate@akirasboutiques.com', 'contraseña2.2', 'Fernando_Calderon_Ayala'),
	('Aurelio', 'Casillas', 'Avenida_López_Mateos_101,Jardines_de_la_Asunción', '4499180908', 24, 'Akiras_Boutique_Obraje', 'aurelio.casillas@akirasboutiques.com', 'contraseña2.3', 'Fernando_Calderon_Ayala'),
	('Perla', 'Lopez', 'Calle_Morelos_202,Bosques_del_Prado', '4492897223', 33, 'Akiras_Boutique_Obraje', 'perla.lopez@akirasboutiques.com', 'contraseña2.4', 'Fernando_Calderon_Ayala'),
	('Ana', 'Perez', 'Avenida_Universidad_456,San_Marcos', '4492797223', 26, 'Akiras_Boutique_Obraje', 'ana.perez@akirasboutiques.com','contraseña222', 'Fernando_Calderon_Ayala'),

	('Benito', 'Bodoque', 'Calle_de_los_Misterios_123,Centro', '6677297828', 35, 'Akiras_Boutique_Galerias_Mazatlan', 'benito.bodoque@akirasboutiques.com', 'contraseña3.5', 'Daniela_Fernanda_Diaz_Ordaz'),
	('Daniela', 'Lujan', 'Blvd.Río_2020,#115,Col.Benito_Juárez', '6675872264', 37, 'Akiras_Boutique_Galerias_Mazatlan', 'daniela.lujan@akirasboutiques.com', 'contraseña3.6', 'Daniela_Fernanda_Diaz_Ordaz'),
	('Miguel', 'Moreno', ' Av.Camarón_Sábalo_409,Zona Dorada', '6676581266', 41, 'Akiras_Boutique_Galerias_Mazatlan', 'miguel.moreno@akirasboutiques.com', 'contraseña3.7', 'Daniela_Fernanda_Diaz_Ordaz'),
	('Esteban', 'Ruiz', 'Av.Rafael_Buelna#619,Zona_Centro', '6676712345', 24, 'Akiras_Boutique_Galerias_Mazatlan', 'esteba.ruiz@akirasboutiques.com', 'contraseña3.8', 'Daniela_Fernanda_Diaz_Ordaz'),
	('Ana', 'Guevara', 'Avenida_Insurgentes#1800', '6679876543', 26, 'Akiras_Boutique_Galerias_Mazatlan', 'ana.guevara@akirasboutiques.com', 'contraseña3.9', 'Daniela_Fernanda_Diaz_Ordaz'),
	('sofia', 'Guevara', ' Av.langostin_Sábalo_400,Zona Dorada', '6679876533', 26, 'Akiras_Boutique_Galerias_Mazatlan', 'sofia.guevara@akirasboutiques.com', 'contraseña3.9', 'Daniela_Fernanda_Diaz_Ordaz'),

	('Beatriz', 'Alvarez', 'Calle_Hidalgo_123,Centro', '3747423577', 24, 'Akiras_Boutique_Zapopan', 'beatriz.alvarez@akirasboutiques.com', 'contraseña4.1', 'Mario_Alberto_Jimenez_Salcido'),
	('Georgina', 'Higuera', 'Avenida_Vallarta_456,Colonia_Americana', '3314009927', 26, 'Akiras_Boutique_Zapopan', 'georgina.higuera@akirasboutiques.com', 'contraseña4.2', 'Mario_Alberto_Jimenez_Salcido'),
	('Jorge', 'Campos', 'Calle_Juárez_789,Zapopan_Centro', '3336819421', 26, 'Akiras_Boutique_Zapopan', 'jorge.campos@akirasboutiques.com', 'contraseña4.3', 'Mario_Alberto_Jimenez_Salcido'),
	('Patricia', 'Talamantes', 'Avenida_Patria_101,Colonia_Jardines_del_Valle', '3747420167', 33, 'Akiras_Boutique_Zapopan', 'patricia.talamantes@akirasboutiques.com', 'contraseña4.4', 'Mario_Alberto_Jimenez_Salcido'),
	('Hugo', 'Sanchez', 'Calle_Morelos_202,Tlaquepaque_Centro', '3314009927', 39, 'Akiras_Boutique_Zapopan', 'hugo.sanchez@akirasboutiques.com', 'contraseña4.5', 'Mario_Alberto_Jimenez_Salcido'),
	('martin', 'Campos', 'Calle_Juárez_789,Zapopan_Centro', '3336819933', 28, 'Akiras_Boutique_Zapopan', 'martin.campos@akirasboutiques.com', 'contraseña413', 'Mario_Alberto_Jimenez_Salcido'),

	('Saul', 'Fernandez', 'Avenida_Mirador_700,Colonia_Mirador', '6142004800', 42, 'Akiras_Boutique_Melchor', 'saul.fernandez@akirasboutiques.com', 'contraseña5.1', 'Yesenia_Guadalupe_Campos_Rojo'),
	('Marlen', 'Osuna', 'Calle_20_de_Noviembre_800,Colonia_Obrera', '6144170557', 31, 'Akiras_Boutique_Melchor', 'marlen.osuna@akirasboutiques.com', 'contraseña5.2', 'Yesenia_Guadalupe_Campos_Rojo'),
	('Victor', 'Garcia', 'Calle_5_de_Febrero_1000,Colonia_Santa_Rosa', '614391800', 36, 'Akiras_Boutique_Melchor', 'victor.garcia@akirasboutiques.com', 'contraseña5.3', 'Yesenia_Guadalupe_Campos_Rojo'),
	('Josue', 'Salazar', 'Avenida_Tecnológico_400,Colonia_Santo_Niño', '6144293300', 29, 'Akiras_Boutique_Melchor', 'josue.salazar@akirasboutiques.com', 'contraseña5.4', 'Yesenia_Guadalupe_Campos_Rojo'),
	('Rita', 'Rendon', 'Avenida_de_las_Américas_900,Colonia_Panamericana', '6144150957', 42, 'Akiras_Boutique_Melchor', 'rita.rendon@akirasboutiques.com', 'contraseña5.5', 'Yesenia_Guadalupe_Campos_Rojo'),
	('jose', 'Osuna', 'Calle_20_de_Noviembre_800,Colonia_Obrera', '6144170912', 29, 'Akiras_Boutique_Melchor', 'jose.osuna@akirasboutiques.com', 'contraseña512', 'Yesenia_Guadalupe_Campos_Rojo'),

	('Teresa', 'Polanco', 'Calle_Cerro_de_la_Cruz_N°122', '6188258145', 25, 'Akiras_Boutique_constitucion', 'teresa.polanco@akirasboutiques.com', 'contraseña6.1', 'Tamara_Alejandra_Bernal_Ramos'),
	('Yahir', 'King', 'Av.Raymond_Bell_N.206,Col.20_de_Noviembre', '6181378420', 46, 'Akiras_Boutique_constitucion', 'yahir.king@akirasboutiques.com', 'contraseña6.3', 'Tamara_Alejandra_Bernal_Ramos'),
	('Felipe', 'Vaca', 'Av.20_de_noviembre,#905_entre_Hidalgo_y_Zaragoza', '6495260300', 29, 'Akiras_Boutique_constitucion', 'felipe.vaca@akirasboutiques.com', 'contraseña6.5', 'Tamara_Alejandra_Bernal_Ramos'),
	('Diana', 'Reyes', 'Blvd.Luis_Donaldo_Colosio_No.200,Fracc.San_Ignacio', '6181378480', 24, 'Akiras_Boutique_constitucion', 'teresa.reyes@akirasboutiques.com', 'contraseña6.2', 'Tamara_Alejandra_Bernal_Ramos'),
	('Paola', 'Talamantes', 'Belisario_Domínguez_No.504,Col.Hernandez', '6181300289', 33, 'Akiras_Boutique_constitucion', 'paola.talamantes@akirasboutiques.com', 'contraseña6.4', 'Tamara_Alejandra_Bernal_Ramos'),

	('Pablo', 'Jimenez', 'Av.Pedro_Coronel#711,Col.Lomas_del_Lago', '4929246500', 32, 'Akiras_Boutique_centro', 'pablo.jimenez@akirasboutiques.com', 'contraseña7.1', 'Samuel_Enrique_Barrios_Enciso'),
	('valeria', 'Gomez', 'Av.López_Mateos#825,Col.Centro', '4929220292', 44, 'Akiras_Boutique_centro', 'valeria.gomez@akirasboutiques.com', 'contraseña7.3', 'Samuel_Enrique_Barrios_Enciso'),
	('Francisco', 'Villa', 'Plaza_Bicentenario,Av.Hidalgo#112', '4921225705', 29, 'Akiras_Boutique_centro', 'francisco.villa@akirasboutiques.com', 'contraseña7.5', 'Samuel_Enrique_Barrios_Enciso'),
	('Valentin', 'Elizalde', 'Vía_Bella,Blvd.Adolfo_López_Mateos#1800', '4929290500', 21, 'Akiras_Boutique_centro', 'valentin.elizalde@akirasboutiques.com', 'contraseña7.2', 'Samuel_Enrique_Barrios_Enciso'),
	('Paulina', 'Rubio', 'Blvd.Adolfo_López_Mateos#1000', '4929241919', 33, 'Akiras_Boutique_centro', 'paulina.rubio@akirasboutiques.com', 'contraseña6.7', 'Samuel_Enrique_Barrios_Enciso');


	/*****MODIFICACIONES NECESARIAS DEBIDO A ERRORES ARROJADOS EN EL PROCESO*****/


/*****AGREGAR COLUMNA [nombre_del_encargado]*****/

	ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ADD [nombre_del_encargado] VARCHAR(100);

/*****MODIFICAR COLUMNA [TELEFONO]*****/

ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ALTER COLUMN [telefono] VARCHAR(20); 


/*****MODIFICAR COLUMNA [TELEFONO]*****/

ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ALTER COLUMN [contraseña] VARCHAR(15);  


//*agregaremos la columna id_producto de la tabla [dbo.producto]  a la tabla llamada "sucursales_akirasboutique" para convertirla en llave foranea posteriormente*//

ALTER TABLE [dbo].[sucursales_AkirasBoutique]
ADD id_productos INT;


//*cambie el nombre de la columna recien creada debido a un error ortografico [dbo.productos] 
por [dbo.producto]  en la tabla llamada "sucursales_akirasboutique" 
para que coincida con el nombre que esta en la tabla producto y no haya problema al crear
la llave foranea posteriormente*//

EXEC sp_rename 'dbo.sucursales_AkirasBoutique.id_productos', 'id_producto', 'COLUMN';


//*consulta para verificar si la columna se renombro correctamente*//

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sucursales_AkirasBoutique';


//*se agrego la columna (id_producto) como llave foranea*//

ALTER TABLE [dbo].[sucursales_AkirasBoutique]
ADD CONSTRAINT FK_id_producto FOREIGN KEY (id_producto)
REFERENCES [dbo].[producto] (id_producto);



SELECT nombre_de_la_sucursal, COUNT(*)
FROM [dbo].[sucursales_AkirasBoutique]
GROUP BY nombre_de_la_sucursal
HAVING COUNT(*) > 1;

//*DEBIDO A ESTE ERROR MODIFICARE EL CODIGO::
Msg 306, Nivel 16, Estado 2, Línea 534
Los tipos de datos text, ntext e image no
se pueden comparar ni ordenar, excepto 
cuando se utiliza el operador IS NULL o LIKE.*//

ALTER TABLE [dbo].[sucursales_AkirasBoutique]
ALTER COLUMN nombre_de_la_sucursal VARCHAR(255);

ALTER TABLE [dbo].[sucursales_AkirasBoutique]
ALTER COLUMN nombre_de_la_sucursal VARCHAR(255) NOT NULL;

//*se agrego la columna (nombre_de_la_sucursal) como llave primaria*//

ALTER TABLE [dbo].[sucursales_AkirasBoutique]
ADD CONSTRAINT PK_nombre_de_la_sucursal PRIMARY KEY (nombre_de_la_sucursal);


ALTER TABLE [dbo].[producto]
ADD nombre_de_la_sucursal  VARCHAR(255);

ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ALTER COLUMN nombre_de_la_sucursal VARCHAR(255);

ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ADD CONSTRAINT FK_nombre_de_la_sucursal
FOREIGN KEY (nombre_de_la_sucursal)
REFERENCES [dbo].[sucursales_AkirasBoutique] (nombre_de_la_sucursal);


ALTER TABLE [dbo].[producto]
ADD CONSTRAINT FK_nombre_de_la_sucursal FOREIGN KEY (nombre_de_la_sucursal)
REFERENCES [dbo].[sucursales_AkirasBoutique] (nombre_de_la_sucursal);

ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ADD CONSTRAINT FK_nombre_de_la_sucursal_nueva
FOREIGN KEY (nombre_de_la_sucursal)
REFERENCES [dbo].[sucursales_AkirasBoutique] (nombre_de_la_sucursal);

SELECT e.nombre_de_la_sucursal
FROM dbo.empleado_AkirasBoutiques e
LEFT JOIN dbo.sucursales_AkirasBoutique s
ON e.nombre_de_la_sucursal = s.nombre_de_la_sucursal
WHERE s.nombre_de_la_sucursal IS NULL;


EXEC sp_rename 'dbo.empleado_AkirasBoutiques.sucursal', 'nombre_de_la_sucursal', 'COLUMN';

ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ADD CONSTRAINT FK_nombre_del_encargado
FOREIGN KEY (nombre_del_encargado)
REFERENCES [dbo].[sucursales_AkirasBoutique] (nombre_del_encargado);

ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ADD CONSTRAINT PK_email PRIMARY KEY (email);

SELECT t1.*, t2.*
FROM dbo.sucursales_AkirasBoutique t1
JOIN dbo.producto t2 ON t1.nombre_de_la_sucursal = t2.nombre_de_la_sucursal;

ALTER TABLE [dbo].[empleado_AkirasBoutiques]
ADD CONSTRAINT FK_sucursal FOREIGN KEY (sucursal)
REFERENCES [dbo].[sucursales_AkirasBoutique] (nombre_de_la_sucursal);

-- Verificar columna en empleado_AkirasBoutiques
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'empleado_AkirasBoutiques' AND COLUMN_NAME = 'nombre_de_la_sucursal';

-- Verificar columna en sucursales_AkirasBoutique
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sucursales_AkirasBoutique' AND COLUMN_NAME = 'nombre_de_la_sucursal';
