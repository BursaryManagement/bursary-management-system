CREATE TABLE [dbo].[YearlyUniversityAllocation]
(
  [AllocationID] INT IDENTITY NOT NULL PRIMARY KEY,
  [UniversityID] INT NOT NULL,
  [AllocatedAmount] MONEY NOT NULL,
  [DateAllocated] DATE NOT NULL
);
GO

ALTER TABLE [dbo].[YearlyUniversityAllocation]
  ADD CONSTRAINT [FK_YearlyUniversityAllocation_University_UniversityID]
      FOREIGN KEY ([UniversityID])
      REFERENCES [dbo].[University]([UniversityID])
GO

ALTER TABLE [dbo].[YearlyUniversityAllocation]
    ADD CONSTRAINT [CHK_YearlyUniversityAllocation_AllocatedAmount]
        CHECK ([dbo].[udfTotalYearlyUniversityAmountAllocated](GETDATE()) + [AllocatedAmount] <= [dbo].[udfTotalAmountForYear] (Year([DateAllocated])))
GO