CREATE TABLE [dbo].[University]
(
  [UniversityID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [UniversityName] VARCHAR(100) UNIQUE NOT NULL
);
GO

