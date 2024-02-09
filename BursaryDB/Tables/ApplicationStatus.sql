CREATE TABLE [dbo].[ApplicationStatus]
(
  [Id] INT IDENTITY NOT NULL PRIMARY KEY,
  [Status] VARCHAR(10) NOT NULL DEFAULT 'Review'
);
