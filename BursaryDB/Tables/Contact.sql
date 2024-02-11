CREATE TABLE [dbo].[Contact]
(
  [ContactID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [ContactNumber] CHAR(10) NOT NULL,
  [Email] VARCHAR(100) NOT NULL
);
GO
