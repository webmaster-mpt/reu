USE [master]
GO
/****** Object:  Database [Reu]    Script Date: 30.05.2021 19:29:59 ******/
CREATE DATABASE [Reu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Reu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Reu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Reu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Reu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Reu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Reu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Reu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Reu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Reu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Reu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Reu] SET ARITHABORT OFF 
GO
ALTER DATABASE [Reu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Reu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Reu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Reu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Reu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Reu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Reu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Reu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Reu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Reu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Reu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Reu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Reu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Reu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Reu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Reu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Reu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Reu] SET RECOVERY FULL 
GO
ALTER DATABASE [Reu] SET  MULTI_USER 
GO
ALTER DATABASE [Reu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Reu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Reu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Reu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Reu] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Reu', N'ON'
GO
ALTER DATABASE [Reu] SET QUERY_STORE = OFF
GO
USE [Reu]
GO
/****** Object:  Table [dbo].[Fakultet]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fakultet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Fakultet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cause]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cause](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [text] NOT NULL,
 CONSTRAINT [PK_Cause] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Received]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Received](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[fname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[sname] [nvarchar](50) NULL,
	[group] [text] NOT NULL,
	[fakultet_id] [int] NOT NULL,
	[telephone_number] [text] NOT NULL,
	[cause_id] [int] NOT NULL,
	[info] [text] NOT NULL,
	[datecl] [date] NOT NULL,
	[status] [nvarchar](8) NOT NULL,
	[whynot] [text] NULL,
 CONSTRAINT [PK_Received] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [varchar](9) NOT NULL,
	[email] [varchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_3]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3]
AS
SELECT        dbo.[User].login AS Пользователь, dbo.Received.fname + ' ' + dbo.Received.name + ' ' + dbo.Received.sname AS ФИО, dbo.Received.[group] AS Группа, dbo.Fakultet.name AS Факультет, 
                         dbo.Received.telephone_number AS Телефон, dbo.Cause.name AS Причина, dbo.Received.info AS Объяснительная, dbo.Received.datecl AS ДатаПодачиЗаявки, dbo.Received.status AS Статус, 
                         dbo.Received.whynot AS ПричинаВСлучаеОтказа
FROM            dbo.Received INNER JOIN
                         dbo.[User] ON dbo.Received.user_id = dbo.[User].id INNER JOIN
                         dbo.Fakultet ON dbo.Received.fakultet_id = dbo.Fakultet.id INNER JOIN
                         dbo.Cause ON dbo.Received.cause_id = dbo.Cause.id
GO
/****** Object:  View [dbo].[View_2]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.Received.id, dbo.[User].login AS Пользователь, dbo.Received.fname AS Фамилия, dbo.Received.name AS Имя, dbo.Received.sname AS Отчество, dbo.Received.[group] AS Группа, dbo.Fakultet.name AS Факультет, 
                         dbo.Received.telephone_number AS Телефон, dbo.Cause.name AS Причина, dbo.Received.info AS Объяснительная, dbo.Received.datecl AS ДатаПодачиЗаявки, dbo.Received.status AS Статус, 
                         dbo.Received.whynot AS ПричинаВСлучаеОтказа
FROM            dbo.Received INNER JOIN
                         dbo.[User] ON dbo.Received.user_id = dbo.[User].id INNER JOIN
                         dbo.Fakultet ON dbo.Received.fakultet_id = dbo.Fakultet.id INNER JOIN
                         dbo.Cause ON dbo.Received.cause_id = dbo.Cause.id
GO
ALTER TABLE [dbo].[Received]  WITH CHECK ADD  CONSTRAINT [FK_Received_Cause] FOREIGN KEY([cause_id])
REFERENCES [dbo].[Cause] ([id])
GO
ALTER TABLE [dbo].[Received] CHECK CONSTRAINT [FK_Received_Cause]
GO
ALTER TABLE [dbo].[Received]  WITH CHECK ADD  CONSTRAINT [FK_Received_Fakultet] FOREIGN KEY([fakultet_id])
REFERENCES [dbo].[Fakultet] ([id])
GO
ALTER TABLE [dbo].[Received] CHECK CONSTRAINT [FK_Received_Fakultet]
GO
ALTER TABLE [dbo].[Received]  WITH CHECK ADD  CONSTRAINT [FK_Received_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Received] CHECK CONSTRAINT [FK_Received_User]
GO
/****** Object:  StoredProcedure [dbo].[Fakultet_Add]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Fakultet_Add]
@Name varchar(100)
as 
insert into Fakultet values (@Name)
GO
/****** Object:  StoredProcedure [dbo].[Fakultet_Del]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Fakultet_Del]
@id int
as
delete from Fakultet where id = @id
GO
/****** Object:  StoredProcedure [dbo].[Fakultet_Edit]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Fakultet_Edit]
@id int,@Name varchar(100)
as
UPDATE Fakultet
set
 name = @Name WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[Statement_Del]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Statement_Del]
@id int
as
delete from Statement where id = @id
GO
/****** Object:  StoredProcedure [dbo].[Statement_Edit]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Statement_Edit]
@id int, @User_id int,  @Fname nvarchar(50),@Name nvarchar(50),@Sname nvarchar(50),@Group text,@Fakultet_id int,
@Telephone_number varchar(11),@Cause_id int,@Info text,@DateCl date
as
UPDATE Statement
set
 user_id = @User_id,fname = @Fname, name = @Name,sname = @Sname, [group] = @Group,fakultet_id = Fakultet_id,
 telephone_number = @Telephone_number,cause_id = @Cause_id,info = @Info,DateCl =@DateCl
 WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[User_Del]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_Del]
@id int
as
delete from [User] where id = @id
GO
/****** Object:  StoredProcedure [dbo].[User_Edit]    Script Date: 30.05.2021 19:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_Edit]
@id int,@login varchar(50),@password varchar(50),@role varchar(9)
as
UPDATE [User]
set
 login = @login, password = @password, role = @role WHERE id = @id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[5] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Received"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 265
               Bottom = 136
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Fakultet"
            Begin Extent = 
               Top = 6
               Left = 477
               Bottom = 102
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cause"
            Begin Extent = 
               Top = 6
               Left = 689
               Bottom = 102
               Right = 863
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Received"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 265
               Bottom = 136
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Fakultet"
            Begin Extent = 
               Top = 6
               Left = 477
               Bottom = 102
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cause"
            Begin Extent = 
               Top = 6
               Left = 689
               Bottom = 102
               Right = 863
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
USE [master]
GO
ALTER DATABASE [Reu] SET  READ_WRITE 
GO
