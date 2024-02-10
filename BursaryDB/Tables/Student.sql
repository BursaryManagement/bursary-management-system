CREATE TABLE [dbo].[Student]
(
  [StudentID] VARCHAR(13) IDENTITY(1,1)  PRIMARY KEY NOT NULL,
  [AverageMark] INT NOT NULL,
  [UserID] INT NOT NULL,
  [RaceID] INT NOT NULL, 
  [UniversityID] INT NOT NULL,
  [DepartmentID] INT NOT NULL,
)
GO