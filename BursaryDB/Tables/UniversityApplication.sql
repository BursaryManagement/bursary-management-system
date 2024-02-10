CREATE TABLE [dbo].[UniversityApplication]
(
  [UniversityApplicationID]  INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [UniversityID] INT NOT NULL,
  [Motivation] TEXT NOT NULL,
  [StatusID] INT NOT NULL DEFAULT 2,
  [ApplicationStatusReason] TEXT NOT NULL DEFAULT 'N/A',
  [ApplicationDate] DATE NOT NULL DEFAULT GETDATE(),
)
GO

