USE [master]
GO

/****** Object:  Database [AkirasBoutiques]    Script Date: 01/02/2025 05:40:44 p. m. ******/
CREATE DATABASE [AkirasBoutiques]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AkirasBoutiques', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AkirasBoutiques.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AkirasBoutiques_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AkirasBoutiques_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
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

ALTER DATABASE [AkirasBoutiques] SET  READ_WRITE 
GO


/*ACTIVIDAD  #2 CONSULTAS */


 /*CONSULTA #1: La cantidad de clientes en el año 2021.*/

SELECT COUNT (DISTINCT id_cliente)
from factura
where YEAR (fecha) = 2021


/*CONSULTA #2:La cantidad de clientes en lo que va del año 2022.*/

SELECT COUNT(DISTINCT id_cliente) AS cantidad_clientes
FROM factura
WHERE fecha BETWEEN '2022/01/01' AND '2022/01/31'

 /*CONSULTA #3:Los clientes que tuvieron en diciembre de 2021.*/

 SELECT COUNT(DISTINCT id_cliente) AS cantidad_clientes
FROM factura
WHERE YEAR(fecha) = 2021 AND MONTH(fecha) = 12;

/*CONSULTA #4:¿Qué compras han realizado algunos clientes en específico?*/

/*¿Qué compras han realizado los siguientes clientes?:
- Valentina Anastasia Huerta Corral
- Zayra Manuela Gómez López
- Dante Eduardo Dolores Meza
- Ana Maribel Cedillo Núñez
- Rodrigo Ismael Silva Ugarte*/

SELECT c.nombre, c.apellido, f.id_factura, f.fecha
FROM cliente c
JOIN factura f ON c.id_cliente = f.id_cliente
WHERE (c.nombre, c.apellido) IN (
    ('Valentina', 'Anastasia Huerta Corral'),
    ('Zayra', 'Manuela Gómez López'),
    ('Dante', 'Eduardo Dolores Meza'),
    ('Ana', 'Maribel Cedillo Núñez'),
    ('Rodrigo', 'Ismael Silva Ugarte')
);


/*tendre que convertir la columnas de tipo text a varchar, porque me esta arrojando error por no ser el mismo tipo de datos */

/*CONSULTA #4:¿Qué compras han realizado algunos clientes en específico?*/

/*¿Qué compras han realizado los siguientes clientes?:
- Valentina Anastasia Huerta Corral
- Zayra Manuela Gómez López
- Dante Eduardo Dolores Meza
- Ana Maribel Cedillo Núñez
- Rodrigo Ismael Silva Ugarte*/
   SELECT c.nombre, c.apellido, f.id_factura, f.fecha
FROM cliente c
JOIN factura f ON c.id_cliente = f.id_cliente
WHERE (CAST(c.nombre AS VARCHAR(55)) = 'Valentina Anastasia' AND CAST(c.apellido AS VARCHAR(55)) = 'Huerta Corral')
   OR (CAST(c.nombre AS VARCHAR(55)) = 'Zayra Manuela' AND CAST(c.apellido AS VARCHAR(55)) = 'Gómez López')
   OR (CAST(c.nombre AS VARCHAR(55)) = 'Dante Eduardo' AND CAST(c.apellido AS VARCHAR(55)) = 'Dolores Meza')
   OR (CAST(c.nombre AS VARCHAR(55)) = 'Ana Maribel' AND CAST(c.apellido AS VARCHAR(55)) = 'Cedillo Núñez')
   OR (CAST(c.nombre AS VARCHAR(55)) = 'Rodrigo Ismael' AND CAST(c.apellido AS VARCHAR(55)) = 'Silva Ugarte');

   /*CONSULTA #5: ¿Qué producto es el que más ventas ha tenido?*/

   SELECT TOP 1 p.nombre, SUM(dd.cantidad) AS total_vendido
FROM detalle dd
JOIN producto p ON dd.id_producto = p.id_producto
GROUP BY p.nombre
ORDER BY total_vendido DESC;

/*tendre que convertir la columna producto a tipo nvarchar, porque me 
esta arrojando error por no ser el mismo tipo de datos */

ALTER TABLE producto
ALTER COLUMN nombre NVARCHAR(55);

//*CONSULTA #6: ¿Qué producto tiene más cantidad en stock?*//

SELECT TOP 3 id_producto, nombre, stock
FROM producto
ORDER BY stock DESC;

//*CONSULTA #7 (opcion "a") Ordenar por fecha las compras que ha habido 
en la tienda.*//
//*CONSULTA #7 Ordenar, de la más antigua a la más reciente, las compras que ha habido en la
tienda.*//

SELECT fecha, id_factura, id_cliente  
FROM factura
ORDER BY fecha ASC;

//*CONSULTA #7 (opcion "b") Ordenar por fecha las compras que ha habido 
en la tienda.*//
SELECT id_factura, fecha
FROM factura
ORDER BY fecha ASC;

/*CONSULTA #8 Ordenar alfabéticamente los nombres de los 
clientes de la tienda.*/

SELECT nombre, apellido
FROM cliente
ORDER BY nombre ASC;

ALTER TABLE cliente
ALTER COLUMN nombre NVARCHAR(55);


/*CONSULTA #9 Seleccionar cuántos productos hay en cada categoría: falda, pantalón, chamarra,
zapatos y accesorios.*/ 


SELECT c.nombre AS categoria, SUM(p.stock) AS total_stock
FROM producto p
JOIN categoria c ON p.id_categoria = c.id_categoria
WHERE c.nombre IN ('Falda', 'Pantalón', 'Chamarra', 'Zapatos', 'Accesorios')
GROUP BY c.nombre;

ALTER TABLE categoria
ALTER COLUMN nombre VARCHAR(55); 

/*CONSULTA #9 opcion b Seleccionar cuáles productos pertenecen a cada categoría:
- Falda	- Pantalón	- Chamarra	- Zapatos	- Accesorios opcion b*/

SELECT p.nombre AS producto, c.nombre AS categoria
FROM producto p
JOIN categoria c ON p.id_categoria = c.id_categoria
WHERE CAST(c.nombre AS VARCHAR(MAX)) IN ('Falda', 'Pantalón', 'Chamarra', 'Zapatos', 'Accesorios')
ORDER BY c.nombre, p.nombre;

/*CONSULTA #10 ¿Cuáles son los encargados en cada sucursal de Akira's Boutique?*/

SELECT nombre_de_la_sucursal, nombre_del_encargado
FROM empleado_AkirasBoutiques


//*CONSULTA #12 ¿Cuáles clientes son mayores de 30 años?*//

SELECT nombre, apellido, fec_nac
FROM cliente
WHERE DATEDIFF(YEAR, fec_nac, GETDATE()) > 30;