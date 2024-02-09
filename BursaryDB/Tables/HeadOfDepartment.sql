CREATE TABLE [dbo].[HeadOfDepartment]
(
  [HeadOfDepartmentID] INT IDENTITY NOT NULL PRIMARY KEY,
  [DepartmentID] INT NOT NULL,
  [UniversityID] INT NOT NULL,
  [UserID] INT NOT NULL
)
