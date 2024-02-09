CREATE TABLE [dbo].[University]
(
  [UniversityID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [UniversityName] VARCHAR(120) NOT NULL,
  [AmountAllocated] MONEY NOT NULL DEFAULT 0,
  [RemainingAmount] MONEY  NOT NULL DEFAULT 0
)
GO