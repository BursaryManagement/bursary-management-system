CREATE PROCEDURE [dbo].[uspAddStudentYearlyAllocation]
  @StudentID INT,
  @AllocatedAmount MONEY
 
AS
  BEGIN TRY
    DECLARE @StudentAllocated BIT
    SELECT @StudentAllocated = [dbo].[udfCheckAllocation](@StudentID)

    IF(@StudentAllocated = 1)
    BEGIN
      RAISERROR('Student has been funded for this year', 16, 1)
    END
    INSERT INTO [dbo].[YearlyStudentAllocation]
    ([StudentID], [AllocatedAmount], [DateAllocated])
    VALUES
    (@StudentID, @AllocatedAmount, GETDATE())
  END TRY
  BEGIN CATCH
    PRINT ERROR_MESSAGE()
  END CATCH
GO