CREATE TABLE [dbo].[BursaryDetails]
(
  [BursaryDetailsID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Year] INT NOT NULL,
  [TotalAmount] MONEY NOT NULL,
  [CapAmountPerStudent] MONEY NOT NULL
);
GO