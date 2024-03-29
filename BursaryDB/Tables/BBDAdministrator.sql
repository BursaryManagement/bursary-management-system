CREATE TABLE [dbo].[BBDAdministrator]
(
  [AdministratorID] INT  IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [UserID] INT UNIQUE NOT NULL
)
GO

ALTER TABLE [dbo].[BBDAdministrator]
ADD CONSTRAINT UQ_AdminID UNIQUE(UserID)
GO

ALTER TABLE [dbo].[BBDAdministrator]
ADD CONSTRAINT [FK_UserID] FOREIGN KEY([UserID]) REFERENCES [dbo].[User]
GO