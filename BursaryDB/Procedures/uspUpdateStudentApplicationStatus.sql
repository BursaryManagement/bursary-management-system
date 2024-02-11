CREATE PROCEDURE [dbo].[uspUpdateStudentApplicationStatus]
@ApplicationID INT,
@StatusID INT
AS
  BEGIN TRY
    BEGIN TRANSACTION
      UPDATE [dbo].[StudentBursaryApplication]
      SET [StatusID] = @StatusID
      WHERE [ApplicationID] = @ApplicationID
      IF @@ROWCOUNT = 0
      BEGIN
        RAISERROR('Application %d does not exist', 16, 1, @ApplicationID)
      END
      ELSE
      BEGIN
        DECLARE @StatusName VARCHAR(10)
        SELECT @StatusName = [dbo].[udfGetStatusName]

        COMMIT TRANSACTION
        
        PRINT 'Application ' + CAST(@ApplicationID AS VARCHAR(10)) + ' has been ' + CAST(@StatusName AS VARCHAR(10)) + '.'

      END
  END TRY
  BEGIN CATCH
    ROLLBACK TRANSACTION
    PRINT 'An error occurred: ' + ERROR_MESSAGE()
  END CATCH
GO