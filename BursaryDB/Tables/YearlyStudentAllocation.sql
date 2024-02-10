CREATE TABLE [dbo].[YearlyStudentAllocation]
(
  [AllocationID] INT IDENTITY NOT NULL PRIMARY KEY,
  [StudentID] INT NOT NULL,
  [AllocatedAmount] MONEY NOT NULL,
  [DateAllocated] DATE NOT NULL
);
GO

ALTER TABLE [dbo].[YearlyStudentAllocation]
  ADD CONSTRAINT [FK_YearlyStudentAllocation_Student_StudentID]
      FOREIGN KEY ([StudentID])
      REFERENCES [dbo].[Student]([StudentID])
GO