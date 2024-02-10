CREATE TABLE [dbo].[ApplicationStatus]
(
  [StatusID] INT IDENTITY NOT NULL PRIMARY KEY,
  [Status] VARCHAR(10) NOT NULL DEFAULT 'Review'
);
GO