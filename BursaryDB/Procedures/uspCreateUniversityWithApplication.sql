CREATE PROCEDURE [dbo].[uspCreateUniversityWithApplication]
  @UniversityName VARCHAR(100),
  @AllocatedAmount MONEY
AS
BEGIN TRY
  BEGIN TRANSACTION
    INSERT INTO [dbo].[University] (
      [UniversityName]
    ) VALUES (
      @UniversityName
    )
    DECLARE @UniversityID INT = SCOPE_IDENTITY()
    SELECT @UniversityID = IDENT_CURRENT('University')

    INSERT INTO [dbo].[YearlyUniversityAllocation] (
      [UniversityID],
      [AllocatedAmount],
      [DateAllocated]
    ) VALUES (
      @UniversityID,
      @AllocatedAmount,
      GETDATE()
    )
  COMMIT
END TRY
BEGIN CATCH
  IF (@@TRANCOUNT > 0)
    ROLLBACK TRANSACTION;
  THROW
  PRINT 'Transaction failed! ' + error_message() 
END CATCH
GO