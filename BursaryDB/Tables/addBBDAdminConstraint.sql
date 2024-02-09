-- Write your own SQL object definition here, and it'll be included in your package.
ALTER TABLE [dbo].[BBDAdministrator]
ADD CONSTRAINT UQ_AdminID UNIQUE(UserID)
GO

ALTER TABLE [dbo].[BBDAdministrator]
ADD CONSTRAINT [FK_UserID] FOREIGN KEY([UserID]) REFERENCES [dbo].[User]
GO