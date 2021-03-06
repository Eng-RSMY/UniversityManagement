USE [master]
GO
/****** Object:  Database [UniversityDB_GreyHat]    Script Date: 9/30/2018 5:29:58 PM ******/
CREATE DATABASE [UniversityDB_GreyHat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDB_GreyHat', FILENAME = N'E:\BITM TASKS\UniversityManagementSystemWebApp\UniversitySystemGreyHat\UniversityDB_GreyHat.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityDB_GreyHat_log', FILENAME = N'E:\BITM TASKS\UniversityManagementSystemWebApp\UniversitySystemGreyHat\UniversityDB_GreyHat_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityDB_GreyHat] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDB_GreyHat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDB_GreyHat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET RECOVERY FULL 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDB_GreyHat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniversityDB_GreyHat] SET DELAYED_DURABILITY = DISABLED 
GO
USE [UniversityDB_GreyHat]
GO
/****** Object:  Table [dbo].[AssignCourseToTeacher]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssignCourseToTeacher](
	[AssignCourseToTeacherId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_AssignCourseToTeacherInfo] PRIMARY KEY CLUSTERED 
(
	[AssignCourseToTeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClassRoomAllocation]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClassRoomAllocation](
	[ClassRoomAllocationId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[FromTime] [varchar](50) NOT NULL,
	[ToTime] [varchar](50) NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClassRoomAllocationInfo] PRIMARY KEY CLUSTERED 
(
	[ClassRoomAllocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_CourseInfo] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Day]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[DayId] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DayInfo] PRIMARY KEY CLUSTERED 
(
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DepartmentInfo] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](50) NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[EnrollCourseId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_EnrollCourseInfo] PRIMARY KEY CLUSTERED 
(
	[EnrollCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GradeLetter]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeLetter](
	[GradeLetterId] [int] IDENTITY(1,1) NOT NULL,
	[GradeLetterName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GradeLetterInfo] PRIMARY KEY CLUSTERED 
(
	[GradeLetterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mytable]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mytable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NULL,
	[Unit] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [varchar](50) NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_RoomInfo] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[SemesterId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SemesterInfo] PRIMARY KEY CLUSTERED 
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNo] [nvarchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_StudentInfo_1] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[StudentResultId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
 CONSTRAINT [PK_StudentResultInfo] PRIMARY KEY CLUSTERED 
(
	[StudentResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNumber] [varchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TakenCredit] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TeacherInfo] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AssignCourseToTeacher] ON 

INSERT [dbo].[AssignCourseToTeacher] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId], [Status]) VALUES (6, 1, 6, 7, N'Assigned')
INSERT [dbo].[AssignCourseToTeacher] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId], [Status]) VALUES (7, 1, 6, 8, N'Assigned')
INSERT [dbo].[AssignCourseToTeacher] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId], [Status]) VALUES (8, 1, 6, 9, N'Assigned')
INSERT [dbo].[AssignCourseToTeacher] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId], [Status]) VALUES (9, 1, 8, 10, N'Assigned')
INSERT [dbo].[AssignCourseToTeacher] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId], [Status]) VALUES (10, 2, 10, 11, N'Assigned')
INSERT [dbo].[AssignCourseToTeacher] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId], [Status]) VALUES (11, 2, 10, 13, N'Assigned')
INSERT [dbo].[AssignCourseToTeacher] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId], [Status]) VALUES (12, 2, 11, 12, N'Assigned')
INSERT [dbo].[AssignCourseToTeacher] ([AssignCourseToTeacherId], [DepartmentId], [TeacherId], [CourseId], [Status]) VALUES (13, 2, 12, 14, N'Assigned')
SET IDENTITY_INSERT [dbo].[AssignCourseToTeacher] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseId], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [Status]) VALUES (7, N'CSE-101', N'Computer Fundamental', CAST(3.00 AS Decimal(18, 2)), N'Theoritical Subject.', 1, 1, N'Assigned')
INSERT [dbo].[Course] ([CourseId], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [Status]) VALUES (8, N'CSE-102', N'Computer Networks', CAST(3.00 AS Decimal(18, 2)), N'Theoritical Subject.', 1, 1, N'Assigned')
INSERT [dbo].[Course] ([CourseId], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [Status]) VALUES (9, N'CSE-103', N'Data Mining', CAST(3.00 AS Decimal(18, 2)), N'Theoritical Subject.', 1, 1, N'Assigned')
INSERT [dbo].[Course] ([CourseId], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [Status]) VALUES (10, N'CSE-104', N'Algorithm', CAST(3.00 AS Decimal(18, 2)), N'Theoritical Subject.', 1, 1, N'Assigned')
INSERT [dbo].[Course] ([CourseId], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [Status]) VALUES (11, N'EEE-101', N'Electrical fundamental', CAST(3.00 AS Decimal(18, 2)), N'Theoritical Subject.', 2, 1, N'Assigned')
INSERT [dbo].[Course] ([CourseId], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [Status]) VALUES (12, N'EEE-102', N'Electrical Drive', CAST(3.00 AS Decimal(18, 2)), N'Theoritical Subject.', 2, 1, N'Assigned')
INSERT [dbo].[Course] ([CourseId], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [Status]) VALUES (13, N'EEE-103', N'Electrical Drive Sessional', CAST(1.50 AS Decimal(18, 2)), N'Theoritical Subject.', 2, 1, N'Assigned')
INSERT [dbo].[Course] ([CourseId], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [Status]) VALUES (14, N'EEE-104', N'Electrical Engineering', CAST(3.00 AS Decimal(18, 2)), N'Theoritical Subject.', 2, 1, N'Assigned')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (7, N'Friday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (3, N'Monday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (1, N'Saturday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (2, N'Sunday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (6, N'Thursday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (4, N'Tuesday')
INSERT [dbo].[Day] ([DayId], [DayName]) VALUES (5, N'Wednesday')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (1, N'CSE', N'Computer Science & Engineering')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (2, N'EEE', N'Electrical & Electronic Engineering')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (4, N'ETE', N'Electrical & Telecommunication Engineering')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (5, N'BBA', N'Bachelor of Business Adminstration')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (6, N'ELL', N'English Language & Literature')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (9, N'LLB', N'Bachelor of Laws')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (10, N'PH', N'Pharmacy')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (11, N'Text', N'Textile Engineering')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (2, N'Assistant Lecturer')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (4, N'Associate Professor')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([DesignationId], [DesignationName]) VALUES (5, N'Professor')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourse] ON 

INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [CourseId], [Date], [Status]) VALUES (14, 6, 7, N'9/30/2018', N'Allocate')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [CourseId], [Date], [Status]) VALUES (15, 6, 9, N'9/30/2018', N'Allocate')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [CourseId], [Date], [Status]) VALUES (16, 7, 7, N'9/30/2018', N'Allocate')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [CourseId], [Date], [Status]) VALUES (17, 7, 8, N'9/30/2018', N'Allocate')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [CourseId], [Date], [Status]) VALUES (18, 9, 12, N'9/30/2018', N'Allocate')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [CourseId], [Date], [Status]) VALUES (19, 9, 13, N'9/30/2018', N'Allocate')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [CourseId], [Date], [Status]) VALUES (20, 10, 12, N'9/30/2018', N'Allocate')
INSERT [dbo].[EnrollCourse] ([EnrollCourseId], [StudentId], [CourseId], [Date], [Status]) VALUES (21, 10, 14, N'9/30/2018', N'Allocate')
SET IDENTITY_INSERT [dbo].[EnrollCourse] OFF
SET IDENTITY_INSERT [dbo].[GradeLetter] ON 

INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (2, N'A')
INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (1, N'A+')
INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (3, N'A-')
INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (5, N'B')
INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (4, N'B+')
INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (6, N'B-')
INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (8, N'C')
INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (7, N'C+')
INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (9, N'C-')
INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (10, N'D')
INSERT [dbo].[GradeLetter] ([GradeLetterId], [GradeLetterName]) VALUES (11, N'F')
SET IDENTITY_INSERT [dbo].[GradeLetter] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([LoginId], [Username], [Password]) VALUES (1, N'isfar', N'isharchy1')
INSERT [dbo].[Login] ([LoginId], [Username], [Password]) VALUES (2, N'sakib', N'123')
INSERT [dbo].[Login] ([LoginId], [Username], [Password]) VALUES (3, N'jobair', N'101')
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[mytable] ON 

INSERT [dbo].[mytable] ([id], [PersonID], [Unit]) VALUES (1, 1, N'Che')
INSERT [dbo].[mytable] ([id], [PersonID], [Unit]) VALUES (2, 1, N'Mat')
INSERT [dbo].[mytable] ([id], [PersonID], [Unit]) VALUES (3, 1, N'Phy')
INSERT [dbo].[mytable] ([id], [PersonID], [Unit]) VALUES (4, 2, N'Che2')
INSERT [dbo].[mytable] ([id], [PersonID], [Unit]) VALUES (5, 2, N'Mat2')
INSERT [dbo].[mytable] ([id], [PersonID], [Unit]) VALUES (6, 2, N'Phy2')
INSERT [dbo].[mytable] ([id], [PersonID], [Unit]) VALUES (7, 3, N'Phy3')
SET IDENTITY_INSERT [dbo].[mytable] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (1, N'101', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (2, N'102', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (3, N'103', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (4, N'104', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (5, N'105', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (6, N'106', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (7, N'107', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (8, N'108', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (9, N'109', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (10, N'110', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (11, N'201', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (12, N'202', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (13, N'203', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (14, N'204', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (15, N'205', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (16, N'206', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (17, N'207', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (18, N'208', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (19, N'209', N'UnAllocated')
INSERT [dbo].[Room] ([RoomId], [RoomNo], [Status]) VALUES (20, N'210', N'UnAllocated')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([SemesterId], [Name]) VALUES (1, N'1st Semester')
INSERT [dbo].[Semester] ([SemesterId], [Name]) VALUES (2, N'2nd Semester')
INSERT [dbo].[Semester] ([SemesterId], [Name]) VALUES (3, N'3rd Semester')
INSERT [dbo].[Semester] ([SemesterId], [Name]) VALUES (4, N'4th Semester')
INSERT [dbo].[Semester] ([SemesterId], [Name]) VALUES (5, N'5th Semester')
INSERT [dbo].[Semester] ([SemesterId], [Name]) VALUES (6, N'6th Semester')
INSERT [dbo].[Semester] ([SemesterId], [Name]) VALUES (7, N'7th Semester')
INSERT [dbo].[Semester] ([SemesterId], [Name]) VALUES (8, N'8th Semester')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (6, N'CSE-2018-001', N'Jobairul Islam', N'Raees@gmail.com', N'01822445566', N'9/30/2018', N'Ctg', 1)
INSERT [dbo].[Student] ([StudentId], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (7, N'CSE-2018-002', N'Tirtha Talukder', N'Tirtha.4u@gmail.com', N'01835000729', N'9/30/2018', N'Ctg', 1)
INSERT [dbo].[Student] ([StudentId], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (8, N'CSE-2018-003', N'Sayem Uddin', N'Sayem@gmail.com', N'01547850213', N'9/30/2018', N'Ctg', 1)
INSERT [dbo].[Student] ([StudentId], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (9, N'EEE-2018-001', N'Anik Ahmed', N'Anik@gmail.com', N'01754201235', N'9/30/2018', N'Ctg', 2)
INSERT [dbo].[Student] ([StudentId], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (10, N'EEE-2018-002', N'Rocky Barua', N'Rocky@gmail.com', N'01658243202', N'9/30/2018', N'Ctg', 2)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([StudentResultId], [StudentId], [CourseId], [GradeId]) VALUES (20, 6, 7, 1)
INSERT [dbo].[StudentResult] ([StudentResultId], [StudentId], [CourseId], [GradeId]) VALUES (21, 6, 9, 2)
INSERT [dbo].[StudentResult] ([StudentResultId], [StudentId], [CourseId], [GradeId]) VALUES (22, 7, 7, 3)
INSERT [dbo].[StudentResult] ([StudentResultId], [StudentId], [CourseId], [GradeId]) VALUES (23, 9, 12, 1)
INSERT [dbo].[StudentResult] ([StudentResultId], [StudentId], [CourseId], [GradeId]) VALUES (24, 9, 13, 2)
INSERT [dbo].[StudentResult] ([StudentResultId], [StudentId], [CourseId], [GradeId]) VALUES (25, 10, 12, 2)
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNumber], [DesignationId], [DepartmentId], [TakenCredit]) VALUES (6, N'Sakib Hossain', N'Ctg.', N'shfsakib@gmail.com', N'01685685506', 4, 1, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNumber], [DesignationId], [DepartmentId], [TakenCredit]) VALUES (7, N'Sazid Hossain', N'Ctg.', N'sazid@gmail.com', N'01845789850', 4, 1, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNumber], [DesignationId], [DepartmentId], [TakenCredit]) VALUES (8, N'Sana Ullah Chy', N'Ctg.', N'SanaullahCU@gmail.com', N'01547852042', 1, 1, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNumber], [DesignationId], [DepartmentId], [TakenCredit]) VALUES (9, N'Iqbal Ahmed', N'Ctg.', N'Iqbal@gmail.com', N'01954201530', 2, 1, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNumber], [DesignationId], [DepartmentId], [TakenCredit]) VALUES (10, N'Warid Bin Azad', N'Ctg.', N'Warid@gmail.com', N'01547850210', 3, 2, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNumber], [DesignationId], [DepartmentId], [TakenCredit]) VALUES (11, N'Isfar Chowdhury', N'Ctg.', N'Isfar@gmail.com', N'01547852010', 4, 2, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([TeacherId], [Name], [Address], [Email], [ContactNumber], [DesignationId], [DepartmentId], [TakenCredit]) VALUES (12, N'Irfan Hossain', N'Ctg.', N'Irfan@gmail.com', N'01742301015', 1, 2, CAST(7.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Teacher] OFF
/****** Object:  Index [IX_AssignCourseToTeacherInfo]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[AssignCourseToTeacher] ADD  CONSTRAINT [IX_AssignCourseToTeacherInfo] UNIQUE NONCLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CourseInfo]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_CourseInfo] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CourseInfo_1]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_CourseInfo_1] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DayInfo]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Day] ADD  CONSTRAINT [IX_DayInfo] UNIQUE NONCLUSTERED 
(
	[DayName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DepartmentInfo]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_DepartmentInfo] UNIQUE NONCLUSTERED 
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DepartmentInfo_1]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_DepartmentInfo_1] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Designation]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Designation] ADD  CONSTRAINT [IX_Designation] UNIQUE NONCLUSTERED 
(
	[DesignationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GradeLetterInfo]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[GradeLetter] ADD  CONSTRAINT [IX_GradeLetterInfo] UNIQUE NONCLUSTERED 
(
	[GradeLetterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoomInfo]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [IX_RoomInfo] UNIQUE NONCLUSTERED 
(
	[RoomNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SemesterInfo]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Semester] ADD  CONSTRAINT [IX_SemesterInfo] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentInfo]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [IX_StudentInfo] UNIQUE NONCLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_StudentInfo_1]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [IX_StudentInfo_1] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_StudentInfo_2]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [IX_StudentInfo_2] UNIQUE NONCLUSTERED 
(
	[ContactNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Student]    Script Date: 9/30/2018 5:29:58 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student] ON [dbo].[Student]
(
	[RegistrationNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TeacherInfo]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Teacher] ADD  CONSTRAINT [IX_TeacherInfo] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TeacherInfo_1]    Script Date: 9/30/2018 5:29:58 PM ******/
ALTER TABLE [dbo].[Teacher] ADD  CONSTRAINT [IX_TeacherInfo_1] UNIQUE NONCLUSTERED 
(
	[ContactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssignCourseToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_AssignCourseToTeacherInfo_CourseInfo] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[AssignCourseToTeacher] CHECK CONSTRAINT [FK_AssignCourseToTeacherInfo_CourseInfo]
GO
ALTER TABLE [dbo].[AssignCourseToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_AssignCourseToTeacherInfo_DepartmentInfo] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[AssignCourseToTeacher] CHECK CONSTRAINT [FK_AssignCourseToTeacherInfo_DepartmentInfo]
GO
ALTER TABLE [dbo].[AssignCourseToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_AssignCourseToTeacherInfo_TeacherInfo] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
GO
ALTER TABLE [dbo].[AssignCourseToTeacher] CHECK CONSTRAINT [FK_AssignCourseToTeacherInfo_TeacherInfo]
GO
ALTER TABLE [dbo].[ClassRoomAllocation]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoomAllocationInfo_CourseInfo] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[ClassRoomAllocation] CHECK CONSTRAINT [FK_ClassRoomAllocationInfo_CourseInfo]
GO
ALTER TABLE [dbo].[ClassRoomAllocation]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoomAllocationInfo_DayInfo] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([DayId])
GO
ALTER TABLE [dbo].[ClassRoomAllocation] CHECK CONSTRAINT [FK_ClassRoomAllocationInfo_DayInfo]
GO
ALTER TABLE [dbo].[ClassRoomAllocation]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoomAllocationInfo_RoomInfo] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[ClassRoomAllocation] CHECK CONSTRAINT [FK_ClassRoomAllocationInfo_RoomInfo]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_CourseInfo_DepartmentInfo] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_CourseInfo_DepartmentInfo]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_CourseInfo_SemesterInfo] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([SemesterId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_CourseInfo_SemesterInfo]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourseInfo_CourseInfo] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourseInfo_CourseInfo]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourseInfo_StudentInfo] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourseInfo_StudentInfo]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_StudentInfo_DepartmentInfo] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_StudentInfo_DepartmentInfo]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResultInfo_GradeLetterInfo] FOREIGN KEY([GradeId])
REFERENCES [dbo].[GradeLetter] ([GradeLetterId])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResultInfo_GradeLetterInfo]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResultInfo_StudentInfo] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResultInfo_StudentInfo]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_TeacherInfo_DepartmentInfo] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_TeacherInfo_DepartmentInfo]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_TeacherInfo_DesignationInfo] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([DesignationId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_TeacherInfo_DesignationInfo]
GO
/****** Object:  StoredProcedure [dbo].[RemainingCredit]    Script Date: 9/30/2018 5:29:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemainingCredit]
@teacherId int
AS

 BEGIN
SELECT * ,(SELECT SUM(TCR)-(SUM(RCR)) RemainingCredit FROM (
SELECT SUM(TakenCredit) TCR,0 RCR  FROM Teacher WHERE Teacher.TeacherId=X.TeacherId
UNION
SELECT 0 TCR,SUM(Credit) RCR  FROM Course WHERE  Course.CourseId=X.CourseId

)A) AS RemainingCredit FROM (


SELECT   DISTINCT     Teacher.TeacherId AS TeacherId, Course.CourseId AS CourseId, AssignCourseToTeacher.DepartmentId, Course.Credit, Teacher.TakenCredit
FROM            Teacher INNER JOIN
                         AssignCourseToTeacher ON Teacher.TeacherId = AssignCourseToTeacher.TeacherId INNER JOIN
                         Course ON AssignCourseToTeacher.CourseId = Course.CourseId WHERE Teacher.TeacherId=@teacherId)X 
						 END

						

GO
USE [master]
GO
ALTER DATABASE [UniversityDB_GreyHat] SET  READ_WRITE 
GO
