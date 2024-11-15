USE [master]
GO
/****** Object:  Database [kazik1]    Script Date: 15.11.2024 9:13:26 ******/
CREATE DATABASE [kazik1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kazik1', FILENAME = N'C:\Users\User\OneDrive\Рабочий стол\Базы данных\kazik1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kazik1_log', FILENAME = N'C:\Users\User\OneDrive\Рабочий стол\Базы данных\kazik1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [kazik1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kazik1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kazik1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kazik1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kazik1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kazik1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kazik1] SET ARITHABORT OFF 
GO
ALTER DATABASE [kazik1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kazik1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kazik1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kazik1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kazik1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kazik1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kazik1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kazik1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kazik1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kazik1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kazik1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kazik1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kazik1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kazik1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kazik1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kazik1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kazik1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kazik1] SET RECOVERY FULL 
GO
ALTER DATABASE [kazik1] SET  MULTI_USER 
GO
ALTER DATABASE [kazik1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kazik1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kazik1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kazik1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kazik1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kazik1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [kazik1] SET QUERY_STORE = OFF
GO
USE [kazik1]
GO
/****** Object:  Table [dbo].[Bets]    Script Date: 15.11.2024 9:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bets](
	[BetID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [int] NOT NULL,
	[BetAmount] [decimal](18, 2) NOT NULL,
	[Result] [nvarchar](50) NOT NULL,
	[WinAmount] [int] NULL,
 CONSTRAINT [PK_Bets] PRIMARY KEY CLUSTERED 
(
	[BetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 15.11.2024 9:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[GameName] [nvarchar](max) NOT NULL,
	[Descr] [nvarchar](max) NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameSessions]    Script Date: 15.11.2024 9:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameSessions](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[BetAmount] [decimal](18, 2) NULL,
	[WinAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_GameSessions] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 15.11.2024 9:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ID_Report] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[GameCount] [int] NULL,
	[Wins] [int] NULL,
	[Losses] [int] NULL,
	[AmountResult] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ID_Report] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15.11.2024 9:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 15.11.2024 9:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TransactionType] [nchar](10) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15.11.2024 9:13:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[PassHash] [nvarchar](max) NOT NULL,
	[IsBanned] [bit] NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[Balance] [int] NOT NULL,
	[Telegram] [nvarchar](50) NULL,
	[TelegramChatID] [int] NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([GameID], [GameName], [Descr]) VALUES (1, N'Crash', N'Raketka')
INSERT [dbo].[Game] ([GameID], [GameName], [Descr]) VALUES (2, N'Monetka', N'Monetka')
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
SET IDENTITY_INSERT [dbo].[GameSessions] ON 

INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (4, 2, 1, CAST(N'2024-09-24T11:00:44.220' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(-50.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (5, 2, 2, CAST(N'2024-09-24T11:01:26.833' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (6, 2, 2, CAST(N'2024-09-24T11:01:28.997' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (7, 2, 2, CAST(N'2024-09-24T11:01:30.323' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (8, 2, 2, CAST(N'2024-09-24T11:01:31.397' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (9, 2, 2, CAST(N'2024-09-24T11:01:32.477' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (10, 2, 2, CAST(N'2024-09-24T11:01:33.450' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (11, 2, 2, CAST(N'2024-09-24T11:01:34.377' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (12, 2, 2, CAST(N'2024-09-24T11:01:37.487' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (13, 2, 2, CAST(N'2024-09-24T11:01:38.073' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (14, 2, 2, CAST(N'2024-09-24T11:01:38.750' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (15, 2, 2, CAST(N'2024-09-24T11:01:39.270' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (16, 2, 2, CAST(N'2024-09-24T11:01:40.137' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (17, 2, 2, CAST(N'2024-09-24T11:01:40.787' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (18, 2, 2, CAST(N'2024-09-24T11:01:41.443' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (19, 2, 2, CAST(N'2024-09-24T11:01:42.040' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (20, 2, 2, CAST(N'2024-09-24T11:01:42.347' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (21, 2, 2, CAST(N'2024-09-24T11:01:42.520' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (22, 2, 2, CAST(N'2024-09-24T11:01:42.723' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (23, 2, 2, CAST(N'2024-09-24T11:01:43.040' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (24, 2, 2, CAST(N'2024-09-24T11:01:43.223' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (25, 2, 2, CAST(N'2024-09-24T11:01:43.400' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (26, 2, 2, CAST(N'2024-09-24T11:01:43.593' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (27, 2, 2, CAST(N'2024-09-24T11:01:43.773' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (28, 2, 2, CAST(N'2024-09-24T11:01:43.940' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (29, 2, 2, CAST(N'2024-09-24T11:01:44.123' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (30, 2, 2, CAST(N'2024-09-24T11:01:44.623' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (31, 2, 2, CAST(N'2024-09-24T11:01:44.853' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (32, 2, 2, CAST(N'2024-09-24T11:01:45.040' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (33, 2, 2, CAST(N'2024-09-24T11:01:45.277' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (34, 2, 2, CAST(N'2024-09-24T11:01:45.447' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (35, 2, 2, CAST(N'2024-09-24T11:01:45.640' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (36, 2, 1, CAST(N'2024-09-24T11:01:53.380' AS DateTime), CAST(4.00 AS Decimal(18, 2)), CAST(5.16 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (37, 2, 1, CAST(N'2024-09-24T11:02:05.530' AS DateTime), CAST(6.00 AS Decimal(18, 2)), CAST(7.74 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (38, 2, 1, CAST(N'2024-09-24T11:06:32.617' AS DateTime), CAST(5.00 AS Decimal(18, 2)), CAST(7.45 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (39, 2, 1, CAST(N'2024-09-24T11:10:47.043' AS DateTime), CAST(5.00 AS Decimal(18, 2)), CAST(6.90 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (40, 2, 1, CAST(N'2024-09-24T11:10:56.443' AS DateTime), CAST(5.00 AS Decimal(18, 2)), CAST(6.10 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (41, 1, 1, CAST(N'2024-09-24T11:22:48.060' AS DateTime), CAST(500.00 AS Decimal(18, 2)), CAST(975.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (42, 1, 1, CAST(N'2024-09-24T12:50:29.033' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(71.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (43, 1, 2, CAST(N'2024-09-24T12:51:27.357' AS DateTime), CAST(60.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (44, 1, 2, CAST(N'2024-09-24T12:51:31.317' AS DateTime), CAST(60.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (45, 4, 2, CAST(N'2024-09-24T12:58:18.040' AS DateTime), CAST(100.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (46, 4, 2, CAST(N'2024-09-24T12:58:19.467' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (47, 4, 1, CAST(N'2024-09-24T12:58:30.023' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(74.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (48, 5, 2, CAST(N'2024-09-28T13:24:03.873' AS DateTime), CAST(50.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (49, 5, 2, CAST(N'2024-09-28T13:24:05.557' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (50, 5, 2, CAST(N'2024-09-28T13:24:11.207' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (51, 5, 1, CAST(N'2024-09-28T13:24:31.950' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(82.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[GameSessions] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (1, 2, N'Пополнение', CAST(600.00 AS Decimal(18, 2)), CAST(N'2024-09-24T10:53:58.997' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (2, 2, N'Ставка    ', CAST(-50.00 AS Decimal(18, 2)), CAST(N'2024-09-24T11:00:47.877' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (3, 2, N'Выигрыш   ', CAST(5.16 AS Decimal(18, 2)), CAST(N'2024-09-24T11:01:56.260' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (4, 2, N'Выигрыш   ', CAST(7.74 AS Decimal(18, 2)), CAST(N'2024-09-24T11:02:08.903' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (5, 2, N'Выигрыш   ', CAST(7.45 AS Decimal(18, 2)), CAST(N'2024-09-24T11:06:36.477' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (6, 2, N'Вывод     ', CAST(5.00 AS Decimal(18, 2)), CAST(N'2024-09-24T11:10:01.547' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (7, 2, N'Выигрыш   ', CAST(6.90 AS Decimal(18, 2)), CAST(N'2024-09-24T11:10:50.710' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (8, 2, N'Выигрыш   ', CAST(6.10 AS Decimal(18, 2)), CAST(N'2024-09-24T11:10:58.667' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (9, 1, N'Пополнение', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-09-24T11:21:36.027' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (10, 1, N'Выигрыш   ', CAST(975.00 AS Decimal(18, 2)), CAST(N'2024-09-24T11:22:53.360' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (11, 1, N'Выигрыш   ', CAST(71.00 AS Decimal(18, 2)), CAST(N'2024-09-24T12:50:32.050' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (12, 4, N'Пополнение', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-09-24T12:58:12.550' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (13, 4, N'Выигрыш   ', CAST(74.00 AS Decimal(18, 2)), CAST(N'2024-09-24T12:58:34.533' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (14, 5, N'Пополнение', CAST(500.00 AS Decimal(18, 2)), CAST(N'2024-09-28T13:23:25.700' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (15, 5, N'Выигрыш   ', CAST(82.50 AS Decimal(18, 2)), CAST(N'2024-09-28T13:24:37.963' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (1, N'Арсений', N'WZRHGrsBESr8wYFZ9sx0tPURuZgG2lmzyvWpwXPKz8U=', 0, CAST(N'2024-09-24' AS Date), 996, NULL, NULL, 2)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (2, N'Эдик', N'WZRHGrsBESr8wYFZ9sx0tPURuZgG2lmzyvWpwXPKz8U=', 0, CAST(N'2024-09-24' AS Date), 48, NULL, NULL, 1)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (4, N'Арс', N'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 0, CAST(N'2024-09-24' AS Date), 524, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (5, N'Пастух Эдик', N'WZRHGrsBESr8wYFZ9sx0tPURuZgG2lmzyvWpwXPKz8U=', 0, CAST(N'2024-09-28' AS Date), 582, NULL, NULL, 2)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (6, N'Arsss267', N'SfnitXmI2GAOeeJPgBvLDYi3iZHXEW7gTj/U6vKGp18=', 0, CAST(N'2024-11-15' AS Date), 0, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Balance]  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[Bets]  WITH CHECK ADD  CONSTRAINT [FK_Bets_GameSessions] FOREIGN KEY([SessionID])
REFERENCES [dbo].[GameSessions] ([SessionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bets] CHECK CONSTRAINT [FK_Bets_GameSessions]
GO
ALTER TABLE [dbo].[GameSessions]  WITH CHECK ADD  CONSTRAINT [FK_GameSessions_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GameSessions] CHECK CONSTRAINT [FK_GameSessions_Game]
GO
ALTER TABLE [dbo].[GameSessions]  WITH CHECK ADD  CONSTRAINT [FK_GameSessions_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GameSessions] CHECK CONSTRAINT [FK_GameSessions_User]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [kazik1] SET  READ_WRITE 
GO
