CREATE TABLE [dbo].[Student]
(
  [StudentID] INT IDENTITY(1,1)  PRIMARY KEY NOT NULL,
  [AverageMark] INT NOT NULL,
  [UserID] INT UNIQUE NOT NULL,
  [RaceID] INT NOT NULL, 
  [UniversityID] INT NOT NULL,
  [DepartmentID] INT NOT NULL
)
GO

ALTER TABLE [dbo].[Student]
ADD CONSTRAINT [F_KUserID] FOREIGN KEY ([UserID]) REFERENCES [dbo].[User]
GO

ALTER TABLE [dbo].[Student]
ADD CONSTRAINT [F_KRace] FOREIGN KEY ([RaceID]) REFERENCES [dbo].[Race]
GO

ALTER TABLE [dbo].[Student]
ADD CONSTRAINT [F_KDepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department]
GO


