CREATE TABLE [dbo].[StudentBursaryApplication]
(
  [ApplicationID] INT IDENTITY NOT NULL PRIMARY KEY,
  [ApplicationMotivation] TEXT NOT NULL,
  [ApplicationRejectionReason] TEXT DEFAULT '',
  [BursaryAmount] MONEY NOT NULL,
  [StudentID] VARCHAR(13) NOT NULL
)
