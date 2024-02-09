CREATE TABLE [dbo].[UniversityApplication]
(
  [UniversityApplicationID]  INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [UniversityID] INT NOT NULL,
  [StatusID] INT NOT NULL,
  [ApplicationStatusReason] VARCHAR(300) DEFAULT ''
)
GO