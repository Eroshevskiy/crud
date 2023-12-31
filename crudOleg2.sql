USE [master]
GO
/****** Object:  Database [crudOleg]    Script Date: 14.11.2023 19:38:13 ******/
CREATE DATABASE [crudOleg]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'crudOleg', FILENAME = N'D:\sql2\MSSQL15.SQLEXPRESS\MSSQL\DATA\crudOleg.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'crudOleg_log', FILENAME = N'D:\sql2\MSSQL15.SQLEXPRESS\MSSQL\DATA\crudOleg_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [crudOleg] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [crudOleg].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [crudOleg] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [crudOleg] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [crudOleg] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [crudOleg] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [crudOleg] SET ARITHABORT OFF 
GO
ALTER DATABASE [crudOleg] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [crudOleg] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [crudOleg] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [crudOleg] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [crudOleg] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [crudOleg] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [crudOleg] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [crudOleg] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [crudOleg] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [crudOleg] SET  DISABLE_BROKER 
GO
ALTER DATABASE [crudOleg] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [crudOleg] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [crudOleg] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [crudOleg] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [crudOleg] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [crudOleg] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [crudOleg] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [crudOleg] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [crudOleg] SET  MULTI_USER 
GO
ALTER DATABASE [crudOleg] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [crudOleg] SET DB_CHAINING OFF 
GO
ALTER DATABASE [crudOleg] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [crudOleg] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [crudOleg] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [crudOleg] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [crudOleg] SET QUERY_STORE = OFF
GO
USE [crudOleg]
GO
/****** Object:  Table [dbo].[entry]    Script Date: 14.11.2023 19:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entry] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_entry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 14.11.2023 19:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workers]    Script Date: 14.11.2023 19:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_role] [int] NULL,
	[fio] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[data] [date] NULL,
	[time] [time](7) NULL,
	[id_entry] [int] NULL,
	[photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_workers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[entry] ON 

INSERT [dbo].[entry] ([id], [entry]) VALUES (0, N'Неуспешно')
INSERT [dbo].[entry] ([id], [entry]) VALUES (1, N'Успешно')
SET IDENTITY_INSERT [dbo].[entry] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [role]) VALUES (1, N'Продавец')
INSERT [dbo].[role] ([id], [role]) VALUES (2, N'Администратор')
INSERT [dbo].[role] ([id], [role]) VALUES (3, N'Старший смены')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[workers] ON 

INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (101, 1, N'Иванов Иван Иванович', N'Ivanov@namecomp.rubble', N'2L6KZG', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), 1, N'/img/Иванов.jpeg')
INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (102, 1, N'Петров Петр Петрович', N'petrov@namecomp.ru', N'uzWC67', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), 1, N'/img/Петров.jpeg')
INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (103, 2, N'Федоров Федор Федорович', N'fedorov@namecomp.ru', N'8ntwUp', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), 1, N'/img/Федоров.jpeg')
INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (104, 3, N'Миронов Вениамин Куприянович', N'mironov@namecomp.ru', N'YOyhfR', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), 1, N'/img/Миронов.jpeg')
INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (105, 3, N'Ширяев Ермолай Вениаминович', N'shiryev@namecomp.ru', N'RSbvHv', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), 0, N'/img/Ширяев.jpeg')
INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (106, 3, N'Игнатов Кассиан Васильевич', N'ignatov@namecomp.ru', N'rwVDh9', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), 1, N'/img/Игнатов.jpg')
INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (107, 1, N'Хохлов Владимир Мэлсович', N'hohlov@namecomp.ru', N'LdNyos', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), 1, N'/img/Хохлов.jpeg')
INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (108, 1, N'Стрелков Мстислав Георгьевич', N'strelkov@namecomp.ru', N'gynQMT', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), 0, N'/img/Стрелков.jpeg')
INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (109, 1, N'Беляева Лилия Наумовна', N'belyeva@@namecomp.ru', N'AtnDjr', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), 1, N'/img/Беляева.jpeg')
INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (117, NULL, N'1', N'1', N'1', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), NULL, NULL)
INSERT [dbo].[workers] ([id], [id_role], [fio], [login], [password], [data], [time], [id_entry], [photo]) VALUES (118, NULL, N'1', N'1', N'1', CAST(N'2022-05-15' AS Date), CAST(N'13:13:00' AS Time), NULL, NULL)
SET IDENTITY_INSERT [dbo].[workers] OFF
GO
ALTER TABLE [dbo].[workers]  WITH CHECK ADD  CONSTRAINT [FK_workers_entry] FOREIGN KEY([id_entry])
REFERENCES [dbo].[entry] ([id])
GO
ALTER TABLE [dbo].[workers] CHECK CONSTRAINT [FK_workers_entry]
GO
ALTER TABLE [dbo].[workers]  WITH CHECK ADD  CONSTRAINT [FK_workers_role] FOREIGN KEY([id_role])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[workers] CHECK CONSTRAINT [FK_workers_role]
GO
USE [master]
GO
ALTER DATABASE [crudOleg] SET  READ_WRITE 
GO
