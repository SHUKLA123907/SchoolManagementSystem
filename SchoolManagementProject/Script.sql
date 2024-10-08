USE [master]
GO
/****** Object:  Database [SchoolWebAPI]    Script Date: 10-09-2024 17:28:28 ******/
CREATE DATABASE [SchoolWebAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolWebAPI', FILENAME = N'C:\Users\susha\SchoolWebAPI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolWebAPI_log', FILENAME = N'C:\Users\susha\SchoolWebAPI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SchoolWebAPI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolWebAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolWebAPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SchoolWebAPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolWebAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolWebAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SchoolWebAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolWebAPI] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SchoolWebAPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SchoolWebAPI] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolWebAPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolWebAPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolWebAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolWebAPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolWebAPI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolWebAPI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SchoolWebAPI] SET QUERY_STORE = OFF
GO
USE [SchoolWebAPI]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[ISBN] [nvarchar](max) NULL,
	[PublishedDate] [nvarchar](max) NOT NULL,
	[AvailableCopies] [int] NOT NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[issues]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[issues](
	[IssueId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IssueDate] [nvarchar](max) NOT NULL,
	[ReturnDate] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[LateFee] [decimal](18, 2) NULL,
 CONSTRAINT [PK_issues] PRIMARY KEY CLUSTERED 
(
	[IssueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ReservationDate] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Password] [nvarchar](max) NULL,
	[Urole] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CalculateLateFee]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateLateFee]
    @IssueId INT,
    @ReturnDate varchar(50)
AS
BEGIN
    DECLARE @IssueDate varchar(50)
    DECLARE @LateFee DECIMAL(18,2)
    SELECT @IssueDate = IssueDate FROM issue WHERE IssueId = @IssueId

    IF DATEDIFF(DAY, @IssueDate, @ReturnDate) > 14
    BEGIN
        SET @LateFee = (DATEDIFF(DAY, @IssueDate, @ReturnDate) - 14) * 5
    END
    ELSE
    BEGIN
        SET @LateFee = 0
    END

    UPDATE issues
    SET LateFee = @LateFee
    WHERE IssueId = @IssueId

    SELECT @LateFee
END
GO
/****** Object:  StoredProcedure [dbo].[CalculateLateFee1]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateLateFee1]
    @IssueId INT,
    @ReturnDate varchar(50)
AS
BEGIN
    DECLARE @IssueDate varchar(50)
    DECLARE @LateFee DECIMAL(18,2)
    SELECT @IssueDate = IssueDate FROM issue WHERE IssueId = @IssueId

    IF DATEDIFF(DAY, @IssueDate, @ReturnDate) > 7
    BEGIN
        SET @LateFee = (DATEDIFF(DAY, @IssueDate, @ReturnDate) - 7) * 5
    END
    ELSE
    BEGIN
        SET @LateFee = 0
    END

    UPDATE issues
    SET LateFee = @LateFee
    WHERE IssueId = @IssueId

    SELECT @LateFee
END
GO
/****** Object:  StoredProcedure [dbo].[CalculateLateFee2]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateLateFee2]
    @IssueId INT,
    @ReturnDate varchar(50)
AS
BEGIN
    DECLARE @IssueDate varchar(50)
    DECLARE @LateFee DECIMAL(18,2)
    SELECT @IssueDate = IssueDate FROM issues WHERE IssueId = @IssueId

    IF DATEDIFF(DAY, @IssueDate, @ReturnDate) > 7
    BEGIN
        SET @LateFee = (DATEDIFF(DAY, @IssueDate, @ReturnDate) - 7) * 5
    END
    ELSE
    BEGIN
        SET @LateFee = 0
    END

    UPDATE issues
    SET LateFee = @LateFee
    WHERE IssueId = @IssueId

    SELECT @LateFee
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllBooks]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllBooks]
   
AS
BEGIN
    SELECT * FROM Books 
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllIssuedBooks]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllIssuedBooks]
AS
BEGIN
    SELECT * FROM issues
END
GO
/****** Object:  StoredProcedure [dbo].[GetBookById]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetBookById]
    @BookId INT
AS
BEGIN
    SELECT * FROM Books WHERE BookId = @BookId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetIssuedBookById]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIssuedBookById]
    @IssueId INT
AS
BEGIN
    SELECT * FROM issues WHERE IssueId = @IssueId
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBook1]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBook1]
    @Title NVARCHAR(255),
    @Author NVARCHAR(255),
    @ISBN NVARCHAR(50),
    @PublishedDate NVARCHAR(50),
    @AvailableCopies INT
AS
BEGIN
    INSERT INTO Books (Title, Author, ISBN, PublishedDate, AvailableCopies)
    VALUES (@Title, @Author, @ISBN, @PublishedDate, @AvailableCopies);
END
GO
/****** Object:  StoredProcedure [dbo].[IssueBook]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IssueBook]
    @BookId INT,
    @UserId INT,
    @IssueDate Varchar(50)
AS
BEGIN
    INSERT INTO issues (BookId, UserId, IssueDate, Status)
    VALUES (@BookId, @UserId, @IssueDate, 'Issued')
END
GO
/****** Object:  StoredProcedure [dbo].[IssueBook1]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IssueBook1]
    @BookId INT,
    @UserId INT,
    @IssueDate Varchar(50),
	@ReturnDate Varchar(50),
	@LateFee decimal(10,2)
	
AS
BEGIN
    INSERT INTO issues (BookId, UserId, IssueDate,ReturnDate, Status,LateFee)
    VALUES (@BookId, @UserId, @IssueDate,@IssueDate, 'Issued',@LateFee)
END
GO
/****** Object:  StoredProcedure [dbo].[ReturnBook]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReturnBook]
    @IssueId INT,
    @ReturnDate varchar(50)
AS
BEGIN
    UPDATE issues
    SET ReturnDate = @ReturnDate, Status = 'Returned'
    WHERE IssueId = @IssueId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAll1]    Script Date: 10-09-2024 17:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAll1]
   @BookId int,
    @Title NVARCHAR(255),
    @Author NVARCHAR(255),
    @ISBN NVARCHAR(50),
    @PublishedDate DATE,
    @AvailableCopies INT
AS
BEGIN
    UPDATE Books
    SET 
        Title = @Title,
        Author = @Author,
        ISBN = @ISBN,
        PublishedDate = @PublishedDate,
        AvailableCopies = @AvailableCopies
    WHERE 
        BookId = @BookId;
END
GO
USE [master]
GO
ALTER DATABASE [SchoolWebAPI] SET  READ_WRITE 
GO
