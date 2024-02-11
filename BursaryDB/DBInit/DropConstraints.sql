-- This file contains SQL statements that will be executed before the build script.
-- Write your own SQL object definition here, and it'll be included in your package.
-- Write your own SQL object definition here, and it'll be included in your package.
ALTER TABLE [dbo].[BBDAdministrator]
DROP CONSTRAINT IF EXISTS UQ_AdminID 
GO

ALTER TABLE [dbo].[BBDAdministrator]
DROP CONSTRAINT IF EXISTS [FK_UserID]  
GO

ALTER TABLE [dbo].[HeadOfDepartment]
  DROP CONSTRAINT IF EXISTS [FK_HeadOfDepartment_Department_DepartmentID] 
      
GO

ALTER TABLE [dbo].[HeadOfDepartment]
    DROP CONSTRAINT IF EXISTS [FK_HeadOfDepartment_University_UniversityID]
     
GO

ALTER TABLE [dbo].[HeadOfDepartment]
    DROP  CONSTRAINT IF EXISTS [FK_HeadOfDepartment_User_UserID]
      

ALTER TABLE [dbo].[Student]
DROP CONSTRAINT IF EXISTS [F_KUserID] 
GO

ALTER TABLE [dbo].[Student]
DROP CONSTRAINT IF EXISTS [F_KRace] 
GO

ALTER TABLE [dbo].[Student]
DROP CONSTRAINT IF EXISTS [F_KDepartmentID] 
GO

ALTER TABLE [dbo].[StudentBursaryApplication]
  DROP CONSTRAINT IF EXISTS [FK_StudentID_Application] 
GO

ALTER TABLE [dbo].[StudentBursaryDocuments]
  DROP CONSTRAINT IF EXISTS [FK_StudentBursaryDocuments_StudentBursaryApplication_ApplicationID]
GO

ALTER TABLE [dbo].[UniversityApplication]
DROP CONSTRAINT IF EXISTS [FK_UniversityID]
GO

ALTER TABLE [dbo].[UniversityApplication]
DROP CONSTRAINT IF EXISTS [FK_StatusID] 
GO


ALTER TABLE [dbo].[User]
DROP CONSTRAINT IF EXISTS FK_UserRole 
GO

ALTER TABLE [dbo].[User]
DROP CONSTRAINT IF EXISTS FK_Gender
GO

ALTER TABLE [dbo].[User]
DROP CONSTRAINT IF EXISTS FK_Contact 
GO

ALTER TABLE [dbo].[YearlyStudentAllocation]
  DROP CONSTRAINT IF EXISTS [FK_YearlyStudentAllocation_Student_StudentID]
GO

ALTER TABLE [dbo].[YearlyUniversityAllocation]
  DROP CONSTRAINT IF EXISTS [FK_YearlyUniversityAllocation_University_UniversityID]
GO
