-- Write your own SQL object definition here, and it'll be included in your package.
ALTER TABLE [dbo].[User]
ADD CONSTRAINT FK_UserRole FOREIGN KEY([UserRoleID]) REFERENCES [dbo].[UserRole]
GO
