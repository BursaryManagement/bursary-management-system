CREATE TABLE [dbo].[StudentBursaryApplication]
(
  [ApplicationID] INT IDENTITY NOT NULL PRIMARY KEY,
  [ApplicationMotivation] TEXT NOT NULL,
  [ApplicationRejectionReason] TEXT DEFAULT '',
  [BursaryAmount] MONEY NOT NULL,
  [StudentID] VARCHAR(13) NOT NULL UNIQUE,
  [StatusID] INT NOT NULL
)
GO

ALTER TABLE [dbo].[StudentBursaryApplication] 
  ADD CONSTRAINT [FK_StudentBursaryApplication_Student_StudentID]
      FOREIGN KEY ([StudentID])
      REFERENCES [dbo].[Student]([StudentID]),

      CONSTRAINT [FK_StudentBursaryApplication_ApplicationStatus_StatusID]
      FOREIGN KEY ([StatusID])
      REFERENCES [dbo].[ApplicationStatus]([StatusID])
GO