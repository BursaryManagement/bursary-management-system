CREATE TABLE [dbo].[Student]
(
  [StudentID] VARCHAR(13) NOT NULL,
  [FirstName] VARCHAR(50) NOT NULL,
  [LastName] VARCHAR(50) NOT NULL,
  [AverageMark] INT NOT NULL,
  [ContactNumber] CHAR(10) NOT NULL,
  [StudentEmail] CHAR(100) NOT NULL,
  [DateOfBirth] DATE NOT NULL,
  [CONSTRAINT] PK_StudentID
    PRIMARY KEY CLUSTERED (StudentID)
)

--TODO: Add gender/sex, RaceID, UniversityID, and DepartmentID