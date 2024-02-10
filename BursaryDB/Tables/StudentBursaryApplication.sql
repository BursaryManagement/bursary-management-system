CREATE TABLE [dbo].[StudentBursaryApplication]
(
  [ApplicationID] INT IDENTITY NOT NULL PRIMARY KEY,
  [ApplicationMotivation] TEXT NOT NULL,
  [ApplicationRejectionReason] TEXT NOT NULL DEFAULT 'N/A',
  [BursaryAmount] MONEY NOT NULL,
  [StudentID] VARCHAR(13) NOT NULL UNIQUE,
  [StatusID] INT NOT NULL DEFAULT 2,
  [ApplicationDate] DATE NOT NULL DEFAULT GETDATE()
)
GO


ALTER TABLE [dbo].[StudentBursaryApplication]
  ADD CONSTRAINT [FK_StudentID_Application] FOREIGN KEY([StudentID]) REFERENCES [dbo].[Student](StudentID)
GO
