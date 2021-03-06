USE [master]
GO
/****** Object:  Database [Examination]    Script Date: 2018/7/11 14:53:57 ******/
CREATE DATABASE [Examination]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'myOnlineExam', FILENAME = N'D:\Examination.MDF' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'myOnlineExam_log', FILENAME = N'D:\Examination.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Examination] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Examination].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Examination] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Examination] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Examination] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Examination] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Examination] SET ARITHABORT OFF 
GO
ALTER DATABASE [Examination] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Examination] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Examination] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Examination] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Examination] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Examination] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Examination] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Examination] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Examination] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Examination] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Examination] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Examination] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Examination] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Examination] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Examination] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Examination] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Examination] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Examination] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Examination] SET RECOVERY FULL 
GO
ALTER DATABASE [Examination] SET  MULTI_USER 
GO
ALTER DATABASE [Examination] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Examination] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Examination] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Examination] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Examination', N'ON'
GO
USE [Examination]
GO
/****** Object:  StoredProcedure [dbo].[Proc_JudgeProblemDetail]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Proc_JudgeProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[JudgeProblem]
where ID=@ID




GO
/****** Object:  StoredProcedure [dbo].[Proc_JudgeProblemModify]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Proc_JudgeProblemModify]
	(@ID		[int],
	 @c_id	[int],
	 @Title 	[varchar](1000),	 
	 @Answer	[bit])

AS UPDATE [Examination].[dbo].[JudgeProblem] 

SET  [c_id]	= @c_id,
	 [Title]	= @Title,	 
	 [Answer]	= @Answer 

WHERE 
	( [ID]	 = @ID)






GO
/****** Object:  StoredProcedure [dbo].[Proc_MultiProblemDetail]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Proc_MultiProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[MultiProblem]
where ID=@ID




GO
/****** Object:  StoredProcedure [dbo].[Proc_MultiProblemModify]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Proc_MultiProblemModify]
	(@ID		[int],
	 @c_id	[int],
	 @Title 	[varchar](1000),
	 @AnswerA 	[varchar](500),
	 @AnswerB 	[varchar](500),
	 @AnswerC 	[varchar](500),
	 @AnswerD 	[varchar](500),
	 @Answer	[varchar](50))

AS UPDATE [Examination].[dbo].[MultiProblem] 

SET  [c_id]	= @c_id,
	 [Title]	= @Title,
	 [AnswerA]	= @AnswerA,
	 [AnswerB]	= @AnswerB,
	 [AnswerC]	= @AnswerC,
	 [AnswerD]	= @AnswerD,
	 [Answer]	= @Answer 

WHERE 
	( [ID]	 = @ID)





GO
/****** Object:  StoredProcedure [dbo].[Proc_PaperDetail]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Proc_PaperDetail]
		(@PaperID		[int],
		 @Type			[varchar](10))
AS
begin 
	declare @sql nvarchar(1000)
if @Type='单选题'
 begin	
	set @sql='select * from TaoTiDetail,SingleProblem where [Type]=''单选题'' and TaoTiDetail.TitleID=SingleProblem.ID and [PaperID]= '+Cast(@PaperID AS varchar(10)) 
	exec sp_executesql @sql		
 end
else if @Type='多选题'
 begin	
	set @sql='select * from TaoTiDetail,MultiProblem where [Type]=''多选题'' and TaoTiDetail.TitleID=MultiProblem.ID and [PaperID]=' + +Cast(@PaperID AS varchar(10))
	exec sp_executesql @sql		
 end
else if @Type='判断题'
 begin	
	set @sql='select * from TaoTiDetail,JudgeProblem where [Type]=''判断题'' and TaoTiDetail.TitleID=JudgeProblem.ID and [PaperID]=' + +Cast(@PaperID AS varchar(10))
	exec sp_executesql @sql		
 end

end





GO
/****** Object:  StoredProcedure [dbo].[Proc_PaperList]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_PaperList]	
AS SELECT 	*,CASE  [dbo].[TaoTi].PaperState WHEN 1 THEN '可用'  ELSE  '不可用'  END AS state
FROM 		[dbo].[TaoTi],[dbo].[Course]
where [TaoTi].CourseID=[Course].ID





GO
/****** Object:  StoredProcedure [dbo].[Proc_PaperModify]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Proc_PaperModify]
	(@PaperID		[int],
	 @PaperState 	[bit])

AS UPDATE [Examination].[dbo].[TaoTi] 

SET  [PaperState]		= @PaperState

WHERE 
	( [PaperID]	 = @PaperID)




GO
/****** Object:  StoredProcedure [dbo].[Proc_ScoreAdd]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Proc_ScoreAdd]
	(@UserID	 	[varchar](20), 
	 @PaperID 		[int],
	 @Score 		[int],
	 @sscore 		[int],
	 @mscore 		[int],
	 @jscore 		[int])

AS INSERT INTO [Examination].[dbo].[Score] 
	 ([UserID], 
	 [PaperID],
	 [Score],
	 [sscore],
	 [mscore],
	 [jscore]) 
 
VALUES 
	( @UserID,	 
	 @PaperID,
	 @Score,
	 @sscore,
	 @mscore,
	 @jscore )




GO
/****** Object:  StoredProcedure [dbo].[Proc_SingleProblemDetail]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Proc_SingleProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[SingleProblem]
where ID=@ID





GO
/****** Object:  StoredProcedure [dbo].[Proc_SingleProblemModify]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Proc_SingleProblemModify]
	(@ID		[int],
	 @c_id	[int],
	 @Title 	[varchar](1000),
	 @AnswerA 	[varchar](500),
	 @AnswerB 	[varchar](500),
	 @AnswerC 	[varchar](500),
	 @AnswerD 	[varchar](500),
	 @Answer	[varchar](2))

AS UPDATE [Examination].[dbo].[SingleProblem] 

SET  [c_id]	= @c_id,
	 [Title]	= @Title,
	 [AnswerA]	= @AnswerA,
	 [AnswerB]	= @AnswerB,
	 [AnswerC]	= @AnswerC,
	 [AnswerD]	= @AnswerD,
	 [Answer]	= @Answer 

WHERE 
	( [ID]	 = @ID)





GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PWD] [varchar](50) NOT NULL,
	[JoinTime] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chapter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[c_id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Chapter] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [nvarchar](50) NOT NULL,
	[c_date] [varchar](50) NULL,
	[teacher_id] [varchar](50) NULL,
 CONSTRAINT [PK__Course__213EE77404E4BC85] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JudgeProblem]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JudgeProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[c_id] [varchar](50) NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[Answer] [bit] NOT NULL,
	[Chapter] [int] NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_JudgeProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Major]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Major](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MultiProblem]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MultiProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[c_id] [varchar](50) NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[AnswerA] [varchar](500) NOT NULL,
	[AnswerB] [varchar](500) NOT NULL,
	[AnswerC] [varchar](500) NOT NULL,
	[AnswerD] [varchar](500) NOT NULL,
	[Answer] [varchar](50) NOT NULL,
	[Chapter] [int] NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_MultiProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Score]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Score](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](20) NOT NULL,
	[PaperID] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[ExamTime] [datetime] NOT NULL,
	[sscore] [int] NULL,
	[mscore] [int] NULL,
	[jscore] [int] NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SingleProblem]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SingleProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[c_id] [varchar](50) NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[AnswerA] [varchar](500) NOT NULL,
	[AnswerB] [varchar](500) NOT NULL,
	[AnswerC] [varchar](500) NOT NULL,
	[AnswerD] [varchar](500) NOT NULL,
	[Answer] [varchar](2) NOT NULL,
	[Chapter] [int] NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK__SingleProblem__4E88ABD4] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[PWD] [varchar](50) NULL,
	[Sex] [varchar](50) NULL,
	[JoinTime] [varchar](50) NULL,
	[Question] [varchar](50) NULL,
	[Answer] [varchar](50) NULL,
	[profession] [varchar](50) NULL,
	[class] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaoTi]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaoTi](
	[PaperID] [int] IDENTITY(1,1) NOT NULL,
	[c_id] [int] NOT NULL,
	[PaperName] [varchar](200) NOT NULL,
	[PaperState] [varchar](50) NOT NULL,
	[JoinTime] [varchar](50) NOT NULL,
	[AnswerTime] [varchar](50) NULL,
	[Score] [int] NULL,
	[teacher_id] [varchar](50) NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_Paper] PRIMARY KEY CLUSTERED 
(
	[PaperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaoTiDetail]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaoTiDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaperID] [int] NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[TitleID] [int] NOT NULL,
	[Mark] [int] NOT NULL,
 CONSTRAINT [PK_ExamPaper] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[id] [varchar](50) NOT NULL,
	[name] [varchar](50) NULL,
	[pwd] [varchar](50) NULL,
	[JoinTime] [varchar](50) NULL,
	[degree] [varchar](50) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[student_score]    Script Date: 2018/7/11 14:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[student_score]
AS
SELECT   dbo.Course.c_name, dbo.TaoTi.PaperName, dbo.Score.ExamTime, dbo.Score.Score, dbo.Score.sscore, 
                dbo.Score.mscore, dbo.Score.jscore, dbo.Student.ID, dbo.Student.Name, dbo.TaoTi.teacher_id, 
                dbo.Score.ID AS ScoreID
FROM      dbo.Course INNER JOIN
                dbo.TaoTi ON dbo.Course.c_id = dbo.TaoTi.c_id INNER JOIN
                dbo.Score ON dbo.TaoTi.PaperID = dbo.Score.PaperID INNER JOIN
                dbo.Student ON dbo.Score.UserID = dbo.Student.ID





GO
INSERT [dbo].[Admin] ([ID], [Name], [PWD], [JoinTime]) VALUES (0, N'李宁', N'0', N'2013/05/06')
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([ID], [c_id], [Name], [Chapter]) VALUES (3, 102, N'第1章', N'第1节')
INSERT [dbo].[Chapter] ([ID], [c_id], [Name], [Chapter]) VALUES (2, 101, N'第3章', N'第3节')
INSERT [dbo].[Chapter] ([ID], [c_id], [Name], [Chapter]) VALUES (4, 102, N'第3章', N'第2节')
INSERT [dbo].[Chapter] ([ID], [c_id], [Name], [Chapter]) VALUES (5, 102, N'第2章', N'第2节')
INSERT [dbo].[Chapter] ([ID], [c_id], [Name], [Chapter]) VALUES (6, 102, N'第4章', N'第1节')
SET IDENTITY_INSERT [dbo].[Chapter] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([c_id], [c_name], [c_date], [teacher_id]) VALUES (100, N'Java', N'2018/7/11 10:23:01', N'2013')
INSERT [dbo].[Course] ([c_id], [c_name], [c_date], [teacher_id]) VALUES (101, N'会计基础', N'2018/7/11 10:23:01', N'2013')
INSERT [dbo].[Course] ([c_id], [c_name], [c_date], [teacher_id]) VALUES (102, N'C#高级应用开发', N'2018/7/11 10:23:01', N'a')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[JudgeProblem] ON 

INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (13, N'101', N'会计一开始就是以货币作为主要计量尺度，因为只有货币才具有综合性。   （    ）', 0, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (14, N'101', N'经济越发展，会计越重要。', 1, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (15, N'101', N'会计科目仅是名称而己，若要体现会计要素的增减变化及变化后的结果则要借助于帐户。(    )', 0, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (19, N'101', N'会计是以货币作为惟一的计量单位。（　）', 0, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (20, N'101', N'会计按其报告的对象不同，又有财务会计与管理会计之分。（　）', 1, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (21, N'88', N'核算职能是会计的惟一职能。（　）', 0, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (22, N'88', N'会计监督是指对特定主体经济活动的合法性、合理性的审查。（　）', 1, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (23, N'87', N'法人可以为会计主体，会计主体一定是法人。（　）', 0, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (24, N'87', N'会计要素是对会计对象的基本分类。（　）', 1, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (25, N'87', N'资产是指由于过去、现在、未来的事项和交易形成并由企业拥有或控制的经济资源，该资源预期会给企业带来经济利益。（　）', 1, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (26, N'87', N'负债是指过去交易、事项形成的现时义务，履行该义务预期会导致经济利益流出。（　）', 1, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (27, N'87', N'会计等式揭示了会计要素之间的内在联系，是设置账户、进行复式记账、编制会计报表的依据。（　）', 1, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (28, N'87', N'资产与权益恒等式关系是复式记账法的理论基础，也是企业编制资产负债表的依据。（　）', 1, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (29, N'84', N'312', 1, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (30, N'94', N'3213', 1, NULL, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (31, N'100', N'你是猪', 1, NULL, 9)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (32, N'100', N'你是猪', 1, 1, 9)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (33, N'102', N'不能指定接口中方法的修饰符', 1, 3, 1)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (34, N'102', N'在C#中，任何方法都是不能实现多继承', 0, 4, 2)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (35, N'102', N'在C#类中，this代表了当前类本身', 0, 5, 3)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (36, N'102', N'可以重写私有的虚方法', 0, 6, 4)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (37, N'102', N'在数据类型转化是，只能通过类型转换关键字或者Convert', 0, 3, 5)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (38, N'102', N'DotNet包含两个部分，及公共语言运行时的框架类库', 1, 4, 6)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (39, N'102', N'在同一行上可以书写多余语句，每条语句间隔用芬海分隔', 1, 5, 7)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (40, N'102', N'接口与类同样是面向对象程序设计的核心', 1, 6, 8)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (41, N'102', N'在C#中，所有类都是直接或间接地继承System.Object类而来的', 1, 3, 9)
INSERT [dbo].[JudgeProblem] ([ID], [c_id], [Title], [Answer], [Chapter], [Grade]) VALUES (42, N'102', N'可以阻止某一个类被其他类继承', 1, 4, 1)
SET IDENTITY_INSERT [dbo].[JudgeProblem] OFF
SET IDENTITY_INSERT [dbo].[MultiProblem] ON 

INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (30, N'101', N'会计核算的基本前提包括___(  )', N'会计主体', N'持续经营', N'会计分期', N'货币计量', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (31, N'101', N'下列各项中属于会计要素的是___(  )', N'资产', N'固定资产', N'负债', N'费用', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (32, N'101', N'反映企业财务状况的会计要素包括___(  )', N'资产', N'收入', N'费用', N'所有者权益', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (33, N'101', N'反映企业经营成果的会计要素包括___(  )', N'负债', N'资产', N'利润', N'费用', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (34, N'101', N'企业所有者权益包括___(  )', N'未分配利润', N'盈余公积', N'股本', N'资本公积', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (35, N'101', N'企业负债按其流动性可分为___(  )', N'固定资产', N'流动资产', N'无形资产', N'长期投资', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (36, N'101', N'下列项目中属于负债的是___()', N'应付账款', N'预提费用', N'预付账款', N'短期借款', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (37, N'101', N'收入包括___()', N'商品销售收入', N'劳务收入', N'营业外收入', N'他人使用本企业资产所取得的租金收入', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (39, N'101', N'企业发生费用的同时，可能会引起___（　）', N'资产的增加', N'资产的减少', N'负债的增加', N'负债的减少', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (40, N'101', N'企业发生费用的同时，可能会引起___（　）', N'资产的增加', N'资产的减少', N'负债的增加', N'负债的减少', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (41, N'101', N'款项主要包括___等。（　）', N'现金', N'银行存款', N'企业债券', N'银行本票', N'ABCD', NULL, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (42, N'100', N'你是猪吗', N'是', N'就是', N'一定是', N'肯定是', N'ABCD', NULL, 9)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (43, N'100', N'你是猪吗', N'是', N'就是', N'一定是', N'肯定是', N'ABCD', 1, 9)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (44, N'102', N'用来获取并显示数据库中的数据的数据控件是', N'GridView', N'MultiView', N'DetailsView', N'View', N'AC', 3, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (45, N'102', N'下列标记最好写在&lt;head&gt;中的是(   )', N'&lt;html&gt;', N'&lt;body&gt;', N'&lt;style&gt;', N'&lt;script&gt;', N'CD', 4, 2)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (46, N'102', N'在GridView中添加模板列用到的标记是（  )', N'&lt;asp:TemplateFeld&gt;', N'&lt;ItemTemplate&gt;', N'&lt;EditItemTemplate&gt;', N'&lt;asp:GridView&gt;', N'AB', 5, 3)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (47, N'102', N'在LINQ  to  SQL中，对数据进行插入用到的方法是（     ）', N'DeleteOnSubmit()', N'SubmitChanges()', N'InsertOnSubmit()', N'InsertAllOnSubmit()', N'CD', 6, 4)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (48, N'102', N'以下关于C#中方法重载的说法正确的是（CD）', N'如两个方法名字不同，而参数的数量不同，那么它们可以构成方法重载', N'如两个方法名字相同，而返回值的数据类型不同，那么它们可以构成方法重载', N'如两个方法名字相同，而参数的数据类型不同，那么它们可以构成方法重载', N'如两个方法名字相同，而参数的数量不同，那么它们可以构成方法重载', N'CD', 3, 5)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (49, N'102', N'如两个方法名字相同，而参数的数量不同，那么它们可以构成方法重载(   )', N'委托是一种类的成员', N'委托必须定义在类中', N'委托必须定义在类中', N'委托是一种数据类型', N'AD', 4, 6)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (50, N'102', N'以下关于?ref?和?out?的描述哪些项是正确的？??(?)', N'使用?ref?参数，传递到?ref?参数的参数必须最先初始化。', N'使用?out?参数，传递到out?参数的参数必须最先初始化。', N'使用?ref?参数，传递到ref参数的参数必须最先初方法。', N'使用?out?参数，传递到out?参数的参数必须最先初方法。', N'ACD', 5, 7)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (51, N'102', N'用来获取并显示数据库中的数据的数据控件是', N'GridView', N'MultiView', N'DetailsView', N'View', N'AC', 6, 8)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (52, N'102', N'下列标记最好写在&lt;head&gt;中的是(   )', N'&lt;html&gt;', N'&lt;body&gt;', N'&lt;style&gt;', N'&lt;script&gt;', N'CD', 3, 9)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (53, N'102', N'在GridView中添加模板列用到的标记是（  )', N'&lt;asp:TemplateFeld&gt;', N'&lt;ItemTemplate&gt;', N'&lt;EditItemTemplate&gt;', N'&lt;asp:GridView&gt;', N'AB', 4, 1)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (54, N'&nbsp;', N'&nbsp;', N'&nbsp;', N'&nbsp;', N'&nbsp;', N'&nbsp;', N'&nbsp;', 5, 2)
INSERT [dbo].[MultiProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (55, N'&nbsp;', N'&nbsp;', N'&nbsp;', N'&nbsp;', N'&nbsp;', N'&nbsp;', N'&nbsp;', 6, 3)
SET IDENTITY_INSERT [dbo].[MultiProblem] OFF
SET IDENTITY_INSERT [dbo].[SingleProblem] ON 

INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (6, N'7', N'在计算机硬件系统的基本组成中，完成解释指令、执行指令的功能部件是', N'运算器 ', N'控制器 ', N'存储器 ', N'输入输出设备', N'C', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (7, N'7', N'利用计算机对指纹进行识别、对图像和声音进行处理属于下列哪一个应用领域？', N'科学计算 ', N'过程控制', N'辅助设计 ', N'信息处理', N'A', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (8, N'7', N'多媒体网络应用及实时通信要求网络高速率传输，并且延迟低。下列哪一项技术满足这类应用的要求？', N'ATM ', N'FDDI ', N'FR ', N'X.25', N'C', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (9, N'7', N'下列协议中，哪一个是在传输层定义的？', N'FTP', N'RIP ', N'TCP ', N'IP', N'D', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (10, N'7', N'下列关于网络安全服务的叙述中，哪一个是错误的？', N'应提供访问控制服务以防止用户否认已接收的信息', N'应提供认证服务以保证用户身份的真实性', N'应提供数据完整性服务以防止信息在传输过程中被删除 ', N'应提供保密性服务以防止传输的数据被截获或篡改', N'D', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (11, N'7', N'以下关于数据结构的基本概念的叙述中哪一条是错误的？', N'数据元素是数据的基本单位', N'数据项是有独立含义的数据最小单位', N'数据结构概念包含的主要内容是数据的逻辑结构和数据的存储结构', N'数据的逻辑结构分为线性结构和非线性结构', N'A', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (12, N'7', N'以下关于链式存储结构的叙述中哪一条是错误的？', N'结点除自身信息外还包括指针域，因此存储密度小于顺序存储结构', N'逻辑上相邻的结点物理上不必邻接', N'可以通过计算直接确定第i个结点的存储地址', N'插入、删除运算操作方便，不必移动结点', N'A', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (13, N'7', N'栈结构不适用于下列哪一种应用？', N'表达式求值', N'表达式求值', N'二叉树对称序周游算法的实现', N'快速排序算法的实现', N'B', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (30, N'101', N'下列项目中，属于会计基本职能的是___(  )', N'计划职能、核算职能', N'预测职能、监督职能', N'核算职能、监督职能', N'决策职能、监督职能', N'C', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (31, N'101', N'会计对象是企事业单位的___(  )', N'资金运动', N'经济活动', N'经济资源', N'劳动成果', N'A', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (32, N'101', N'___是将一个会计主体持续经营的生成经营活动人划分为若干个相等的会计期间。（ ）', N'会计时段', N'会计分期', N'会计区间', N'会计年度', N'B', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (33, N'101', N'下列各项中属于企业资产的是___（ ）', N'应付账款', N'实收资本', N'销售收入', N'原材料', N'D', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (34, N'101', N'最基本的会计等式是___（ ）', N'收入-费用=利润', N'收入-成本=利润', N'资产=负债+所有者利润', N'负债+资产=所有者权益', N'C', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (35, N'101', N'企业期末所有者权益总额等于___（ ）', N'期末资产-期末负债', N'本期收入-本期费用', N'期末资产-本期费用', N'期末资产+本期费用', N'A', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (36, N'88', N'下列项目中不属于有价证券的是___（ ）', N'国库券', N'股票', N'信用证存款', N'企业债券', N'C', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (37, N'88', N'下列项目中不属于企业的款项范围是___（ ）', N'现金', N'银行存款', N'外埠存款', N'企业债券', N'A', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (38, N'88', N'下列项目中，利益关系比较明确，用途基本定向的有___（ ）', N'无形资产', N'资本', N'财物', N'款项', N'B', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (39, N'88', N'____是指公司、企业在销售商品、提供劳务及让渡资产使用权等日常活动中形成的经济利益总流入(  )', N'现金', N'银行存款', N'货币资金', N'收入', N'D', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (40, N'88', N'采用借贷记账法时，资产账户的结构特点是__(  )', N'借方登记增加、贷方登记减少，期末余额在借方', N'借方登记减少、贷方登记增加，期末余额在贷方', N'借方登记增加、贷方登记减少，期末一般无余额', N'借方登记减少、贷方登记增加，期末一般无余额', N'A', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (41, N'88', N'采用借贷记账法时，负债账户的结构特点是__(  )', N'借方登记增加、贷方登记减少，期末余额在借方', N'借方登记减少、贷方登记增加，期末余额在贷方', N'借方登记增加、贷方登记减少，期末一般无余额', N'借方登记减少、贷方登记增加，期末一般无余额', N'B', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (42, N'87', N'复合会计分录是指__(  )', N'涉及四个账户的会计分录', N'涉及两个或两个以上账户的会计分录', N'及三个或三个以上账户的会计记录', N'涉及四个或四个以上账户的会计记录', N'B', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (43, N'87', N'简单会计分录是指__(  )', N'一借一贷的会计分录', N'一借多贷的会计分录', N'一贷多借的会计分录取', N'多借多贷会计分录', N'A', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (44, N'87', N'“累计折旧”账户按照会计要素分类属于__(  )', N'资产类账户', N'损益类账户', N'负债类账户', N'成本类', N'A', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (45, N'87', N'“制造费用”账户按照会计要素分类属于__(  )', N'资产类账户', N'损益类账户', N'负债类账户', N'成本类', N'D', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (46, N'87', N'“生产成本”账户的期末借方余额表示__(  )', N'生产成本的增加数', N'生产费用总和', N'未完工的在产品和半成品的成本', N'完工产品的实际成本', N'C', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (47, N'87', N'“预提费用”账户的期末贷方余额表示__(  )', N'待摊费用', N'已在本期支付应由本期和以后各期负担的费用', N'定时期内的费用支出', N'已在本期及以前各期预提但尚未支付的费用', N'D', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (48, N'87', N'“待摊费用”账户的期末借方余额表示__(  )', N'已经分摊但尚未支付的费用', N'已经支付但尚未分摊的费用', N'已经支付且已经分摊的费用', N'已经计入产品成本中的费用', N'B', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (49, N'87', N'企业生产过程中的期间费用不包括__(  )', N'管理费用', N'制造费用', N'营业费用', N'财务费用', N'B', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (50, N'87', N'企业取得6个月借款20万存入银行。下述分录正确的是__(  )', N'借：银行存款20万            贷：短期借款20万', N'借：银行存款200000       贷：短期借款200000', N'借：短期借款20000        贷：银行存款20000', N'货：短期借款200000       借：银行存款200000', N'C', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (51, N'87', N'企业购入一批材料，买价5万元，别发生运杂费400元，材料已经入库，款以银行存款支付。则原材料的成本是__(  )', N'50400', N'50000', N'400', N'54000', N'A', NULL, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (83, N'102', N'用户自定义控件文件的扩展名是(     )', N'.asp', N'.aspx', N'.asmx', N'.ascx', N'D', 3, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (84, N'102', N'当WEB窗体使用代码分离技术时，需要使用@Page指令链接页面文件和代码文件。以下是@Page指令的属性，与链接代码文件无关的属性有(     )', N'Language', N'AutoEventWireup', N'CodeFile', N'Inherits', N'B', 4, 2)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (85, N'102', N'下面关于ASP.NET页面中的脚本不能使用以下哪一种语言编写(   )', N'Html', N'Javascript', N'C#.Net', N'VB.Net', N'A', 5, 3)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (86, N'102', N'在ASP.NET的内建对象中，必须要有Lock和Unlock方法以确保多个用户无法同时改变某一变量的对象是(   )', N'Cache', N'Session', N'Request', N'Application', N'D', 6, 4)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (87, N'102', N'下列哪个函数可以将数值转换为字符串？(    )', N'Cdate', N'Cint', N'CStr', N'CDbl', N'C', 3, 5)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (88, N'102', N'有关ASP.NET脚本和HTML说法正确的是（      ）', N'HTML元素的ID属性值直接对应ASP.NET脚本的一个对象名', N'一个HTML元素不需要添加“runat=server”，ASP.NET脚本也可以引用该HTML元素', N'一个ASP.NET页面中脚本可以直接引用另一个ASP.NET页面的HTML元素', N'ASP.NET在原有的HTML元素的基础之上，又新增加一整套Web Server控件，加强页面内容和脚本的设计能力', N'C', 4, 6)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (89, N'102', N'.Net Framework的的核心组件是（       ）', N'ASP.NET', N'ADO.NET', N'COM+', N'.Net Framework基础类库和公共语言运行库', N'D', 5, 7)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (90, N'102', N'Application对象的默认有效期为多少分钟？', N'10', N'15', N'20', N'应用程序从启动到结束', N'C', 6, 1)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (91, N'102', N'Application对象的默认有效期是（    ）', N'10分钟', N'20分钟', N'30分钟', N'从网站启动到终止', N'D', 3, 2)
INSERT [dbo].[SingleProblem] ([ID], [c_id], [Title], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [Answer], [Chapter], [Grade]) VALUES (92, N'102', N'下面不属于Request对象集合成员的是（    ）', N'Cookies', N'Form', N'QueryString', N'Server', N'D', 4, 3)
SET IDENTITY_INSERT [dbo].[SingleProblem] OFF
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'12345678', N'马宏宇', N'123', N'男', N'2013/5/3 星期五 18:09:06', N'您的生日是？', N'123', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'2010114113', N'黄强辉', N'1234', N'男', N'2013/5/7 星期二 22:06:13', N'您的生日是？', N'12321', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'21234561', N'林君雄', N'123', N'男', N'2013/5/4 星期六 0:25:39', N'您的生日是？', N'123', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'12345679', N'谭平山', N'12345', N'男', N'2013/5/3 星期五 18:10:56', N'您的生日是？', N'123', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'12345676', N'朱希亮', N'123', N'男', N'2013/5/3 星期五 18:11:08', N'您的生日是？', N'123', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'21234564', N'马继祖', N'123', N'男', N'2013/5/4 星期六 0:26:03', N'您的生日是？', N'123', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'20101141', N'于学忠', N'111', N'男', N'2013/5/19 星期日 22:04:59', N'您的生日是？', N'12321', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'20101142', N'汤念祖', N'123', N'男', N'2013/5/23 星期四 23:28:45', N'您的生日是？', N'123', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'12345670', N'李厚福', N'123', N'男', N'2013/5/3 星期五 18:11:17', N'您的生日是？', N'123', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'21234562', N'刘长胜', N'21234567', N'男', N'2013/5/4 星期六 0:25:47', N'您的生日是？', N'21234567', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'21234560', N'吕德榜', N'123', N'男', N'2013/5/4 星期六 0:26:17', N'您的生日是？', N'123', N'信息管理与信息系统', NULL)
INSERT [dbo].[Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [Question], [Answer], [profession], [class]) VALUES (N'21234567', N'马连良', N'123', N'男', N'2013/5/4 星期六 0:25:30', N'您的生日是？', N'123', N'信息管理与信息系统', NULL)
SET IDENTITY_INSERT [dbo].[TaoTi] ON 

INSERT [dbo].[TaoTi] ([PaperID], [c_id], [PaperName], [PaperState], [JoinTime], [AnswerTime], [Score], [teacher_id], [Grade]) VALUES (25, 101, N'会计1', N'1', N'2013/5/19 星期日 11:37:22', N'60', 9, N'2013', 1)
INSERT [dbo].[TaoTi] ([PaperID], [c_id], [PaperName], [PaperState], [JoinTime], [AnswerTime], [Score], [teacher_id], [Grade]) VALUES (26, 101, N'会计2', N'1', N'2013/5/19 星期日 11:46:18', N'30', 5, N'2013', 1)
INSERT [dbo].[TaoTi] ([PaperID], [c_id], [PaperName], [PaperState], [JoinTime], [AnswerTime], [Score], [teacher_id], [Grade]) VALUES (38, 100, N'c', N'1', N'2018/7/10 11:19:51', N'30', 8, N'a', 1)
INSERT [dbo].[TaoTi] ([PaperID], [c_id], [PaperName], [PaperState], [JoinTime], [AnswerTime], [Score], [teacher_id], [Grade]) VALUES (40, 101, N'acd', N'1', N'2018/7/11 9:11:10', N'30', 8, N'a', 1)
SET IDENTITY_INSERT [dbo].[TaoTi] OFF
SET IDENTITY_INSERT [dbo].[TaoTiDetail] ON 

INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (294, 25, N'单选题', 33, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (295, 25, N'单选题', 34, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (296, 25, N'单选题', 35, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (297, 25, N'多选题', 39, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (298, 25, N'多选题', 30, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (299, 25, N'多选题', 41, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (300, 25, N'判断题', 20, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (301, 25, N'判断题', 15, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (302, 25, N'判断题', 14, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (303, 26, N'单选题', 35, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (304, 26, N'多选题', 32, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (305, 26, N'多选题', 39, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (306, 26, N'多选题', 35, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (307, 26, N'判断题', 14, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (308, 38, N'单选题', 78, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (309, 38, N'单选题', 31, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (310, 38, N'单选题', 35, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (311, 38, N'多选题', 39, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (312, 38, N'多选题', 33, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (313, 38, N'多选题', 36, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (314, 38, N'判断题', 13, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (315, 38, N'判断题', 20, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (316, 38, N'单选题', 78, 2)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (317, 38, N'单选题', 75, 2)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (318, 38, N'单选题', 33, 2)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (319, 38, N'单选题', 34, 2)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (320, 38, N'单选题', 79, 2)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (321, 38, N'多选题', 33, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (322, 38, N'多选题', 41, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (323, 38, N'多选题', 31, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (324, 38, N'多选题', 32, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (325, 38, N'多选题', 37, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (326, 38, N'多选题', 30, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (327, 38, N'判断题', 15, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (328, 38, N'判断题', 13, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (329, 38, N'判断题', 14, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (330, 38, N'判断题', 19, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (331, 38, N'单选题', 74, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (332, 38, N'单选题', 34, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (333, 38, N'单选题', 35, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (334, 38, N'多选题', 33, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (335, 38, N'多选题', 37, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (336, 38, N'多选题', 34, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (337, 38, N'判断题', 13, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (338, 38, N'判断题', 20, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (339, 38, N'单选题', 75, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (340, 38, N'单选题', 76, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (341, 38, N'单选题', 31, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (342, 38, N'多选题', 31, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (343, 38, N'多选题', 35, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (344, 38, N'多选题', 32, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (345, 38, N'判断题', 20, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (346, 38, N'判断题', 13, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (347, 40, N'单选题', 31, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (348, 40, N'单选题', 74, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (349, 40, N'单选题', 35, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (350, 40, N'多选题', 37, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (351, 40, N'多选题', 39, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (352, 40, N'多选题', 34, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (353, 40, N'判断题', 15, 1)
INSERT [dbo].[TaoTiDetail] ([ID], [PaperID], [Type], [TitleID], [Mark]) VALUES (354, 40, N'判断题', 13, 1)
SET IDENTITY_INSERT [dbo].[TaoTiDetail] OFF
INSERT [dbo].[Teacher] ([id], [name], [pwd], [JoinTime], [degree]) VALUES (N'1', N'苏佳', N'a', N'2013/5/2 星期四 23:27:15', N'副教授')
INSERT [dbo].[Teacher] ([id], [name], [pwd], [JoinTime], [degree]) VALUES (N'3', N'张璇', N'b', N'2018/7/9 14:58:35', N'教授')
ALTER TABLE [dbo].[JudgeProblem] ADD  CONSTRAINT [DF_JudgeProblem_Grade]  DEFAULT ((1)) FOR [Grade]
GO
ALTER TABLE [dbo].[MultiProblem] ADD  CONSTRAINT [DF_MultiProblem_Grade]  DEFAULT ((1)) FOR [Grade]
GO
ALTER TABLE [dbo].[Score] ADD  CONSTRAINT [DF_Score_ExamTime]  DEFAULT (getdate()) FOR [ExamTime]
GO
ALTER TABLE [dbo].[SingleProblem] ADD  CONSTRAINT [DF_SingleProblem_Grade]  DEFAULT ((1)) FOR [Grade]
GO
ALTER TABLE [dbo].[TaoTi] ADD  CONSTRAINT [DF_TaoTi_Grade]  DEFAULT ((1)) FOR [Grade]
GO
ALTER TABLE [dbo].[TaoTiDetail]  WITH CHECK ADD  CONSTRAINT [FK_PaperDetail_Paper1] FOREIGN KEY([PaperID])
REFERENCES [dbo].[TaoTi] ([PaperID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaoTiDetail] CHECK CONSTRAINT [FK_PaperDetail_Paper1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[26] 2[14] 3) )"
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
         Begin Table = "Course"
            Begin Extent = 
               Top = 35
               Left = 834
               Bottom = 333
               Right = 1090
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TaoTi"
            Begin Extent = 
               Top = 44
               Left = 571
               Bottom = 336
               Right = 809
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Score"
            Begin Extent = 
               Top = 28
               Left = 327
               Bottom = 311
               Right = 549
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 27
               Left = 99
               Bottom = 346
               Right = 295
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
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'student_score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'student_score'
GO
USE [master]
GO
ALTER DATABASE [Examination] SET  READ_WRITE 
GO
