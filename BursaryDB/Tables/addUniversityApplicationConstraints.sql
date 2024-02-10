ALTER TABLE [dbo].[UniversityApplication]
ADD CONSTRAINT [FK_UniversityID] FOREIGN KEY([UniversityID]) REFERENCES [dbo].[University]
GO

ALTER TABLE [dbo].[UniversityApplication]
ADD CONSTRAINT [FK_StatusID] FOREIGN KEY([StatusID]) REFERENCES [dbo].[ApplicationStatus]
GO
