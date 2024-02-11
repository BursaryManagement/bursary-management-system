-- This file contains SQL statements that will be executed before the build script.
-- Write your own SQL object definition here, and it'll be included in your package.
-- Write your own SQL object definition here, and it'll be included in your package.
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BBDAdministrator]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[BBDAdministrator]
  DROP CONSTRAINT IF EXISTS UQ_AdminID 
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BBDAdministrator]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[BBDAdministrator]
  DROP CONSTRAINT IF EXISTS [FK_UserID]  
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HeadOfDepartment]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[HeadOfDepartment]
    DROP CONSTRAINT IF EXISTS [FK_HeadOfDepartment_Department_DepartmentID] 
END      
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HeadOfDepartment]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[HeadOfDepartment]
      DROP CONSTRAINT IF EXISTS [FK_HeadOfDepartment_University_UniversityID]
END     
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HeadOfDepartment]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[HeadOfDepartment]
      DROP  CONSTRAINT IF EXISTS [FK_HeadOfDepartment_User_UserID]
END      
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[Student]
  DROP CONSTRAINT IF EXISTS [F_KUserID] 
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[Student]
  DROP CONSTRAINT IF EXISTS [F_KRace] 
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[Student]
  DROP CONSTRAINT IF EXISTS [F_KDepartmentID] 
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentBursaryApplication]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[StudentBursaryApplication]
    DROP CONSTRAINT IF EXISTS [FK_StudentID_Application] 
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentBursaryDocuments]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[StudentBursaryDocuments]
    DROP CONSTRAINT IF EXISTS [FK_StudentBursaryDocuments_StudentBursaryApplication_ApplicationID]
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UniversityApplication]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[UniversityApplication]
  DROP CONSTRAINT IF EXISTS [FK_UniversityID]
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UniversityApplication]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[UniversityApplication]
  DROP CONSTRAINT IF EXISTS [FK_StatusID] 
END
GO


IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[User]
  DROP CONSTRAINT IF EXISTS FK_UserRole 
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[User]
  DROP CONSTRAINT IF EXISTS FK_Gender
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[User]
  DROP CONSTRAINT IF EXISTS FK_Contact 
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[YearlyStudentAllocation]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[YearlyStudentAllocation]
    DROP CONSTRAINT IF EXISTS [FK_YearlyStudentAllocation_Student_StudentID]
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[YearlyUniversityAllocation]') AND type in (N'U'))
BEGIN
  ALTER TABLE [dbo].[YearlyUniversityAllocation]
    DROP CONSTRAINT IF EXISTS [FK_YearlyUniversityAllocation_University_UniversityID]
END
GO
ALTER TABLE [dbo].[YearlyUniversityAllocation]
    DROP CONSTRAINT IF EXISTS [CHK_YearlyUniversityAllocation_AllocatedAmount]
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
