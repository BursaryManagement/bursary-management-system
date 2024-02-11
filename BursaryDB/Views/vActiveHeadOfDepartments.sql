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