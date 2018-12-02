
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/02/2018 16:04:52
-- Generated from EDMX file: C:\Users\Admin\CURSOMVC18\SlnInventario\Inventario\Models\ModeloInventario.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [dbinventario];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Productos_Categorias]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Productos] DROP CONSTRAINT [FK_Productos_Categorias];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categorias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categorias];
GO
IF OBJECT_ID(N'[dbo].[Productos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Productos];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categoria'
CREATE TABLE [dbo].[Categoria] (
    [idCategoria] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(50)  NOT NULL,
    [descripcion] nvarchar(50)  NOT NULL,
    [esActivo] bit  NOT NULL
);
GO

-- Creating table 'Producto'
CREATE TABLE [dbo].[Producto] (
    [idProducto] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(50)  NOT NULL,
    [descripcion] varchar(max)  NOT NULL,
    [cantidad] int  NOT NULL,
    [marca] nvarchar(50)  NOT NULL,
    [fechaCreacion] datetime  NOT NULL,
    [idCategoria] int  NOT NULL,
    [esActivo] bit  NOT NULL,
    [UnidadMedida] nvarchar(15)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idCategoria] in table 'Categoria'
ALTER TABLE [dbo].[Categoria]
ADD CONSTRAINT [PK_Categoria]
    PRIMARY KEY CLUSTERED ([idCategoria] ASC);
GO

-- Creating primary key on [idProducto] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [PK_Producto]
    PRIMARY KEY CLUSTERED ([idProducto] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [idCategoria] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [FK_Productos_Categorias]
    FOREIGN KEY ([idCategoria])
    REFERENCES [dbo].[Categoria]
        ([idCategoria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Productos_Categorias'
CREATE INDEX [IX_FK_Productos_Categorias]
ON [dbo].[Producto]
    ([idCategoria]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------