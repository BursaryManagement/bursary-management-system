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

ALTER TABLE [dbo].[UniversityApplication]
ADD CONSTRAINT [FK_UniversityID] FOREIGN KEY([UniversityID]) REFERENCES [dbo].[University]
GO

ALTER TABLE [dbo].[UniversityApplication]
ADD CONSTRAINT [FK_StatusID] FOREIGN KEY([StatusID]) REFERENCES [dbo].[ApplicationStatus]
GO
