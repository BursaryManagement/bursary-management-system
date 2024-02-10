CREATE TABLE [dbo].[HeadOfDepartment]
(
  [HeadOfDepartmentID] INT IDENTITY NOT NULL PRIMARY KEY,
  [DepartmentID] INT NOT NULL,
  [UniversityID] INT NOT NULL,
  [UserID] INT NOT NULL UNIQUE
)
GO

ALTER TABLE [dbo].[HeadOfDepartment]
  ADD CONSTRAINT [FK_HeadOfDepartment_Department_DepartmentID] 
      FOREIGN KEY ([DepartmentID]) 
      REFERENCES [dbo].[Department]([DepartmentID])
GO

ALTER TABLE [dbo].[HeadOfDepartment]
    ADD CONSTRAINT [FK_HeadOfDepartment_University_UniversityID]
      FOREIGN KEY ([UniversityID])
      REFERENCES [dbo].[University]([UniversityID])
GO

ALTER TABLE [dbo].[HeadOfDepartment]
    ADD  CONSTRAINT [FK_HeadOfDepartment_User_UserID]
      FOREIGN KEY ([UserID])
      REFERENCES [dbo].[User]([UserID])
GO