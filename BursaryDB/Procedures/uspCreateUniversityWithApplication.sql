CREATE PROCEDURE [dbo].[uspCreateUniversityWithApplication]
  @UniversityName VARCHAR(100),
  @Motivation TEXT
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

    INSERT INTO [dbo].[UniversityApplication] (
      [UniversityID],
      [Motivation],
      [ApplicationDate]
    ) VALUES (
      @UniversityID,
      @Motivation,
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