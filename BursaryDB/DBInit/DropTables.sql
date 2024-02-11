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
-- This file contains SQL statements that will be executed before the build script.
-- Write your own SQL object definition here, and it'll be included in your package.

-- Write your own SQL object definition here, and it'll be included in your package.
DROP TABLE IF EXISTS [dbo].[ApplicationStatus]

GO

DROP TABLE IF EXISTS [dbo].[BBDAdministrator]

GO

DROP TABLE IF EXISTS [dbo].[BursaryDetails]

GO

DROP TABLE IF EXISTS [dbo].[Contact]

GO

DROP TABLE IF EXISTS [dbo].[Department]

GO
DROP TABLE IF EXISTS [dbo].[Gender]

GO

DROP TABLE IF EXISTS [dbo].[HeadOfDepartment]

GO

DROP TABLE IF EXISTS [dbo].[Race]

GO

DROP TABLE IF EXISTS [dbo].[Student]

GO

DROP TABLE IF EXISTS [dbo].[StudentBursaryApplication]

GO


DROP TABLE IF EXISTS [dbo].[StudentBursaryDocuments]

GO

DROP TABLE IF EXISTS [dbo].[University]

GO

DROP TABLE IF EXISTS [dbo].[UniversityApplication]

GO

DROP TABLE IF EXISTS [dbo].[User]

GO

DROP TABLE IF EXISTS [dbo].[UserRole]

GO

DROP TABLE IF EXISTS [dbo].[YearlyStudentAllocation]

GO

DROP TABLE IF EXISTS [dbo].[YearlyUniversityAllocation]

GO
