CREATE DATABASE BursaryDB;
GO

USE BursaryDB;
GO
/****** Object:  UserDefinedFunction [dbo].[udfCheckStudentAllocation]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udfCheckStudentAllocation] (
   @StudentID INT
)
RETURNS BIT
AS
BEGIN
   DECLARE @Allocated BIT
   SELECT @Allocated = 1
   FROM [dbo].[YearlyStudentAllocation]
   WHERE [StudentID] = @StudentID
   AND YEAR([DateAllocated]) = YEAR(GETDATE())
   RETURN @Allocated
END
GO
/****** Object:  UserDefinedFunction [dbo].[udfGetStatusName]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udfGetStatusName]
  (
    @StatusID INT
  )
RETURNS VARCHAR(10)
AS
  BEGIN
    DECLARE @StatusName VARCHAR(10)
    SELECT @StatusName = [Status]
    FROM [dbo].[ApplicationStatus]
    WHERE [StatusID] = @StatusID
    RETURN @StatusName
  END
GO
/****** Object:  UserDefinedFunction [dbo].[udfGetStudentApplicationStatusID]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udfGetStudentApplicationStatusID]
  (
    @ApplicationID INT
  )
RETURNS INT
AS
  BEGIN
    DECLARE @StatusID INT
    SELECT @StatusID = [StatusID]
    FROM [dbo].[StudentBursaryApplication]
    WHERE [ApplicationID] = @ApplicationID
    RETURN @StatusID
END
GO
/****** Object:  UserDefinedFunction [dbo].[udfGetStudentBursaryAmount]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udfGetStudentBursaryAmount] (
    @StudentID INT
)
RETURNS MONEY
AS
BEGIN
    DECLARE @BursaryAmount MONEY
    SELECT @BursaryAmount = [BursaryAmount]
    FROM [dbo].[StudentBursaryApplication]
    WHERE [StudentID] = @StudentID
    RETURN @BursaryAmount
END
GO
/****** Object:  UserDefinedFunction [dbo].[udfGetStudentIdFromApplication]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udfGetStudentIdFromApplication] (
    @ApplicationID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @StudentID INT
    SELECT @StudentID = [StudentID]
    FROM [dbo].[StudentBursaryApplication]
    WHERE [ApplicationID] = @ApplicationID
    RETURN @StudentID
END
GO
/****** Object:  UserDefinedFunction [dbo].[udfTotalAmountForYear]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udfTotalAmountForYear] (@BursaryDetailYear INT)
    RETURNS MONEY
AS
BEGIN
    DECLARE @TotalAmount MONEY = 0
    SELECT 
        @TotalAmount = ([TotalAmount]) 
    FROM 
        [dbo].[BursaryDetails]
    WHERE
        [Year] = @BursaryDetailYear
    RETURN @TotalAmount
END
GO
/****** Object:  UserDefinedFunction [dbo].[udfTotalYearlyUniversityAmountAllocated]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udfTotalYearlyUniversityAmountAllocated] (@FinancialDate DATE)
    RETURNS MONEY
AS
BEGIN
    DECLARE @TotalAmountAllocated MONEY = 0;
    SELECT 
        @TotalAmountAllocated = @TotalAmountAllocated + ([AllocatedAmount]) 
    FROM 
        [dbo].[YearlyUniversityAllocation]
    WHERE
        Year([DateAllocated]) = Year(@FinancialDate)
    RETURN @TotalAmountAllocated
END
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[AverageMark] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[RaceID] [int] NOT NULL,
	[UniversityID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentBursaryApplication]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentBursaryApplication](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationMotivation] [text] NOT NULL,
	[ApplicationRejectionReason] [text] NOT NULL,
	[BursaryAmount] [money] NOT NULL,
	[StudentID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[ApplicationDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StudentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[University]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[UniversityID] [int] IDENTITY(1,1) NOT NULL,
	[UniversityName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UniversityID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UniversityName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](120) NOT NULL,
	[IDNumber] [char](13) NOT NULL,
	[GenderID] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
	[UserRoleID] [int] NOT NULL,
	[IsUserActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[IDNumber] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vApprovedStudents]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vApprovedStudents]
AS
	SELECT [User].[FirstName], [User].[LastName], [StudentBursaryApplication].[BursaryAmount], [University].[UniversityName], [ApplicationStatus].[Status]
	FROM [User]
	INNER JOIN [Student]
	ON [Student].[UserID] = [User].[UserID]
	INNER JOIN StudentBursaryApplication
	ON [Student].[StudentID] = [StudentBursaryApplication].[StudentID]
	INNER JOIN [ApplicationStatus]
	ON
	[StudentBursaryApplication].[StatusID] = [ApplicationStatus].[StatusID]
 INNER JOIN [University]
 ON [Student].[UniversityID] = [University].[UniversityID]
	WHERE [StudentBursaryApplication].[StatusID] = 1;
GO
/****** Object:  View [dbo].[vStudentsInReview]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vStudentsInReview]
AS
	SELECT [User].[FirstName], [User].[LastName], [ApplicationStatus].[Status]
	FROM [User]
	INNER JOIN [Student]
	ON [Student].[UserID] = [User].[UserID]
	INNER JOIN StudentBursaryApplication
	ON [Student].[StudentID] = [StudentBursaryApplication].[StudentID]
	INNER JOIN [ApplicationStatus]
	ON
	[StudentBursaryApplication].[StatusID] = [ApplicationStatus].[StatusID]
	WHERE [StudentBursaryApplication].[StatusID] = 2;
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeadOfDepartment]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeadOfDepartment](
	[HeadOfDepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[UniversityID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HeadOfDepartmentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vHeadOfDepartments]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vHeadOfDepartments]
  AS SELECT [User].[FirstName], [User].[LastName], [University].[UniversityName], [Department].[DepartmentName]
  FROM [User]
  INNER JOIN [HeadOfDepartment]
  ON [User].[UserID] = [HeadOfDepartment].[UserID]
  INNER JOIN [Department]
  ON [HeadOfDepartment].[DepartmentID] = [Department].[DepartmentID]
  INNER JOIN [University]
  ON [HeadOfDepartment].[UniversityID] = [University].[UniversityID]
  WHERE [User].[IsUserActive] = 1;
GO
/****** Object:  Table [dbo].[BBDAdministrator]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BBDAdministrator](
	[AdministratorID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdministratorID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_AdminID] UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BursaryDetails]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BursaryDetails](
	[BursaryDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[TotalAmount] [money] NOT NULL,
	[CapAmountPerStudent] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BursaryDetailsID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactNumber] [char](10) NOT NULL,
	[Email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Race]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Race](
	[RaceID] [int] IDENTITY(1,1) NOT NULL,
	[RaceName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Race] PRIMARY KEY CLUSTERED 
(
	[RaceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentBursaryDocuments]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentBursaryDocuments](
	[StudentDocumentID] [int] IDENTITY(1,1) NOT NULL,
	[IdCopy] [varbinary](max) NOT NULL,
	[Transcript] [varbinary](max) NOT NULL,
	[CurriculumVitae] [varbinary](max) NOT NULL,
	[ApplicationID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentDocumentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UniversityApplication]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UniversityApplication](
	[UniversityApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[UniversityID] [int] NOT NULL,
	[Motivation] [text] NOT NULL,
	[StatusID] [int] NOT NULL,
	[ApplicationStatusReason] [text] NOT NULL,
	[ApplicationDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UniversityApplicationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YearlyStudentAllocation]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YearlyStudentAllocation](
	[AllocationID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[AllocatedAmount] [money] NOT NULL,
	[DateAllocated] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AllocationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YearlyUniversityAllocation]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YearlyUniversityAllocation](
	[AllocationID] [int] IDENTITY(1,1) NOT NULL,
	[UniversityID] [int] NOT NULL,
	[AllocatedAmount] [money] NOT NULL,
	[DateAllocated] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AllocationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentBursaryApplication] ADD  DEFAULT ('N/A') FOR [ApplicationRejectionReason]
GO
ALTER TABLE [dbo].[StudentBursaryApplication] ADD  DEFAULT ((2)) FOR [StatusID]
GO
ALTER TABLE [dbo].[StudentBursaryApplication] ADD  DEFAULT (getdate()) FOR [ApplicationDate]
GO
ALTER TABLE [dbo].[UniversityApplication] ADD  DEFAULT ((2)) FOR [StatusID]
GO
ALTER TABLE [dbo].[UniversityApplication] ADD  DEFAULT ('N/A') FOR [ApplicationStatusReason]
GO
ALTER TABLE [dbo].[UniversityApplication] ADD  DEFAULT (getdate()) FOR [ApplicationDate]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((1)) FOR [IsUserActive]
GO
ALTER TABLE [dbo].[BBDAdministrator]  WITH CHECK ADD  CONSTRAINT [FK_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BBDAdministrator] CHECK CONSTRAINT [FK_UserID]
GO
ALTER TABLE [dbo].[HeadOfDepartment]  WITH CHECK ADD  CONSTRAINT [FK_HeadOfDepartment_Department_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[HeadOfDepartment] CHECK CONSTRAINT [FK_HeadOfDepartment_Department_DepartmentID]
GO
ALTER TABLE [dbo].[HeadOfDepartment]  WITH CHECK ADD  CONSTRAINT [FK_HeadOfDepartment_University_UniversityID] FOREIGN KEY([UniversityID])
REFERENCES [dbo].[University] ([UniversityID])
GO
ALTER TABLE [dbo].[HeadOfDepartment] CHECK CONSTRAINT [FK_HeadOfDepartment_University_UniversityID]
GO
ALTER TABLE [dbo].[HeadOfDepartment]  WITH CHECK ADD  CONSTRAINT [FK_HeadOfDepartment_User_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[HeadOfDepartment] CHECK CONSTRAINT [FK_HeadOfDepartment_User_UserID]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [F_KDepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [F_KDepartmentID]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [F_KRace] FOREIGN KEY([RaceID])
REFERENCES [dbo].[Race] ([RaceID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [F_KRace]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [F_KUserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [F_KUserID]
GO
ALTER TABLE [dbo].[StudentBursaryApplication]  WITH CHECK ADD  CONSTRAINT [FK_StudentID_Application] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentBursaryApplication] CHECK CONSTRAINT [FK_StudentID_Application]
GO
ALTER TABLE [dbo].[StudentBursaryDocuments]  WITH CHECK ADD  CONSTRAINT [FK_StudentBursaryDocuments_StudentBursaryApplication_ApplicationID] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[StudentBursaryApplication] ([ApplicationID])
GO
ALTER TABLE [dbo].[StudentBursaryDocuments] CHECK CONSTRAINT [FK_StudentBursaryDocuments_StudentBursaryApplication_ApplicationID]
GO
ALTER TABLE [dbo].[UniversityApplication]  WITH CHECK ADD  CONSTRAINT [FK_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ApplicationStatus] ([StatusID])
GO
ALTER TABLE [dbo].[UniversityApplication] CHECK CONSTRAINT [FK_StatusID]
GO
ALTER TABLE [dbo].[UniversityApplication]  WITH CHECK ADD  CONSTRAINT [FK_UniversityID] FOREIGN KEY([UniversityID])
REFERENCES [dbo].[University] ([UniversityID])
GO
ALTER TABLE [dbo].[UniversityApplication] CHECK CONSTRAINT [FK_UniversityID]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_Contact] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contact] ([ContactID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_Contact]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_Gender]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_UserRole] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UserRole] ([UserRoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_UserRole]
GO
ALTER TABLE [dbo].[YearlyStudentAllocation]  WITH CHECK ADD  CONSTRAINT [FK_YearlyStudentAllocation_Student_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[YearlyStudentAllocation] CHECK CONSTRAINT [FK_YearlyStudentAllocation_Student_StudentID]
GO
ALTER TABLE [dbo].[YearlyUniversityAllocation]  WITH CHECK ADD  CONSTRAINT [FK_YearlyUniversityAllocation_University_UniversityID] FOREIGN KEY([UniversityID])
REFERENCES [dbo].[University] ([UniversityID])
GO
ALTER TABLE [dbo].[YearlyUniversityAllocation] CHECK CONSTRAINT [FK_YearlyUniversityAllocation_University_UniversityID]
GO
ALTER TABLE [dbo].[YearlyUniversityAllocation]  WITH CHECK ADD  CONSTRAINT [CHK_YearlyUniversityAllocation_AllocatedAmount] CHECK  ((([dbo].[udfTotalYearlyUniversityAmountAllocated](getdate())+[AllocatedAmount])<=[dbo].[udfTotalAmountForYear](datepart(year,[DateAllocated]))))
GO
ALTER TABLE [dbo].[YearlyUniversityAllocation] CHECK CONSTRAINT [CHK_YearlyUniversityAllocation_AllocatedAmount]
GO
/****** Object:  StoredProcedure [dbo].[upsInsertUserInfo]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[uspInsertContactInfo]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspInsertContactInfo]
  @ContactNumber CHAR(10)
  ,@Email VARCHAR(100)
AS
  INSERT INTO [dbo].[Contact](
    [ContactNumber]
    ,[Email]
  )
  VALUES(
    @ContactNumber,
    @Email
  )

  RETURN SCOPE_IDENTITY()
GO
CREATE PROCEDURE [dbo].[upsInsertUserInfo]
    @FirstName VARCHAR(50)
    ,@LastName VARCHAR(50)
    ,@IDNumber CHAR(13)
    ,@GenderID INT
    ,@ContactID INT
    ,@UserRoleID INT
    ,@IsUserActive BIT
AS
  INSERT INTO [dbo].[User](
    [FirstName]
    ,[LastName]
    ,[IDNumber]
    ,[GenderID]
    ,[ContactID]
    ,[UserRoleID]
    ,[IsUserActive]
  )
  VALUES(@FirstName
    ,@LastName
    ,@IDNumber
    ,@GenderID
    ,@ContactID
    ,@UserRoleID
    ,@IsUserActive)

  RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[uspCreateStudentBursaryDocuments]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspCreateStudentBursaryDocuments]
  @ApplicationID INT,
  @IdCopyLoc NVARCHAR(200),
  @TranscriptLoc NVARCHAR(200),
  @CurriculumVitaeLoc NVARCHAR(200)
AS
BEGIN TRY
  BEGIN TRANSACTION
    DECLARE @IdCopy VARBINARY(MAX)
    SELECT @IdCopy = BulkColumn
    FROM OPENROWSET(BULK ''' + @IdCopyLoc + ''', SINGLE_BLOB) AS Document;

    DECLARE @Transcript VARBINARY(MAX)
    SELECT @Transcript = BulkColumn
    FROM OPENROWSET(BULK ''' + @TranscriptLoc + ''', SINGLE_BLOB) AS Document;

    DECLARE @CurriculumVitae VARBINARY(MAX)
    SELECT @CurriculumVitae = BulkColumn
    FROM OPENROWSET(BULK ''' + @CurriculumVitaeLoc + ''', SINGLE_BLOB) AS Document;

    INSERT INTO [dbo].[StudentBursaryDocuments] (
      [ApplicationID],
      [IdCopy],
      [Transcript],
      [CurriculumVitae]
    ) VALUES(
      @ApplicationID,
      @IdCopy,
      @Transcript,
      @CurriculumVitae
    )
  COMMIT
END TRY
BEGIN CATCH
  IF (@@TRANCOUNT > 0)
    ROLLBACK TRANSACTION;
  THROW
  PRINT 'Transaction failed! ' + error_message() 
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspCreateStudentWithApplication]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspCreateStudentWithApplication]
  @FirstName VARCHAR(50),
  @LastName VARCHAR(50),
  @IDNumber CHAR(13),
  @GenderID INT,
  @ContactNumber CHAR(10),
  @Email VARCHAR(100),
  @UserRoleID INT,
  @AverageMark INT,
  @RaceID INT,
  @UniversityID INT,
  @DepartmentID INT,
  @ApplicationMotivation TEXT,
  @BursaryAmount MONEY
AS
BEGIN TRY
  BEGIN TRANSACTION
    INSERT INTO [dbo].[Contact] (
      [ContactNumber],
      [Email]
    ) VALUES (
      @ContactNumber,
      @Email
    )
    DECLARE @ContactID INT = SCOPE_IDENTITY()
    SELECT @ContactID = IDENT_CURRENT('Contact')

    INSERT INTO [dbo].[User] (
      [FirstName],
      [LastName],
      [IDNumber],
      [GenderID],
      [ContactID],
      [UserRoleID]
    ) VALUES (
      @FirstName,
      @LastName,
      @IDNumber,
      @GenderID,
      @ContactID,
      @UserRoleID
    )
    DECLARE @UserID INT = SCOPE_IDENTITY()
    SELECT @UserID = IDENT_CURRENT('User')

    INSERT INTO [dbo].[Student] (
      [AverageMark],
      [UserID],
      [RaceID],
      [UniversityID],
      [DepartmentID]
    ) VALUES (
      @AverageMark,
      @UserID,
      @RaceID,
      @UniversityID,
      @DepartmentID
    )
    DECLARE @StudentID INT = SCOPE_IDENTITY()
    SELECT @StudentID = IDENT_CURRENT('Student')

    INSERT INTO [dbo].[StudentBursaryApplication] (
      [ApplicationMotivation],
      [StudentID],
      [BursaryAmount],
      [ApplicationDate]
    ) VALUES (
      @ApplicationMotivation,
      @StudentID,
      @BursaryAmount,
      GETDATE()
    )
  COMMIT
END TRY
BEGIN CATCH
  IF (@@TRANCOUNT > 0)
    ROLLBACK TRANSACTION;
  THROW
  PRINT 'Transaction failed! ' + error_message() 
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspCreateUniversityWithApplication]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspCreateUniversityWithApplication]
  @UniversityName VARCHAR(100),
  @Motivation TEXT
AS
BEGIN TRY
  BEGIN TRANSACTION
    INSERT INTO [dbo].[University] (
      [UniversityName]
    ) VALUES (
      @UniversityName
    )
    DECLARE @UniversityID INT = SCOPE_IDENTITY()
    SELECT @UniversityID = IDENT_CURRENT('University')

    INSERT INTO [dbo].[UniversityApplication] (
      [UniversityID],
      [Motivation],
      [ApplicationDate]
    ) VALUES (
      @UniversityID,
      @Motivation,
      GETDATE()
    )
  COMMIT
END TRY
BEGIN CATCH
  IF (@@TRANCOUNT > 0)
    ROLLBACK TRANSACTION;
  THROW
  PRINT 'Transaction failed! ' + error_message() 
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGetErrorInfo]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetErrorInfo]
AS
  SELECT
    ERROR_NUMBER() AS ErrorNumber
    ,ERROR_SEVERITY() AS ErrorSeverity
    ,ERROR_STATE() AS ErrorState
    ,ERROR_PROCEDURE() AS ErrorProcedure
    ,ERROR_LINE() AS ErrorLine
    ,ERROR_MESSAGE() AS ErrorMessage;
GO
/****** Object:  StoredProcedure [dbo].[uspInsertBbbAdmin]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspInsertBbbAdmin]
  @FirstName VARCHAR(50),
  @LastName VARCHAR(50),
  @IDNumber CHAR(13),
  @ContactNumber CHAR(10),
  @Email VARCHAR(100),
  @GenderID INT,
  @UserRoleID INT,
  @IsUserActive BIT

AS
    BEGIN TRY
      BEGIN TRANSACTION
        DECLARE @ContactID INT
        DECLARE @UserID INT
        
        EXEC @ContactID =   [dbo].[uspInsertContactInfo] @ContactNumber,@Email

        EXEC @UserID = [dbo].[upsInsertUserInfo] @FirstName,@LastName,@IDNumber,@GenderID,@ContactID,@UserRoleID,1

        INSERT INTO [dbo].[BBDAdministrator](
            [UserID]
        )VALUES (
          @UserID
        )
      COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
          EXEC [dbo].[uspGetErrorInfo]
          ROLLBACK TRANSACTION
    END CATCH
GO

/****** Object:  StoredProcedure [dbo].[uspInsertHeadOfDepartment]    Script Date: 2024/02/11 19:47:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspInsertHeadOfDepartment]
  @FirstName VARCHAR(50),
  @LastName VARCHAR(50),
  @IDNumber CHAR(13),
  @ContactNumber CHAR(10),
  @Email VARCHAR(100),
  @GenderID INT,
  @UserRoleID INT,
  @IsUserActive BIT,
  @DepartmentID INT,
  @UniversityID INT

AS
  BEGIN TRY
    BEGIN TRANSACTION
      DECLARE @ContactID INT
      DECLARE @UserID INT
      
      EXEC @ContactID =   [dbo].[uspInsertContactInfo] @ContactNumber,@Email

      EXEC @UserID = [dbo].[upsInsertUserInfo] @FirstName,@LastName,@IDNumber,@GenderID,@ContactID,@UserRoleID,1

      INSERT INTO [dbo].[HeadOfDepartment](
        [DepartmentID]
        ,[UniversityID]
        ,[UserID]
      )VALUES (
        @DepartmentID,
        @UniversityID,
        @UserID
      )
    COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
      EXEC [dbo].[uspGetErrorInfo]
      ROLLBACK TRANSACTION
  END CATCH
GO
