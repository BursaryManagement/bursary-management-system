CREATE PROCEDURE [dbo].[uspUpdateStudentApplicationStatus]
@ApplicationID INT,
@StatusID INT
AS
      UPDATE [dbo].[StudentBursaryApplication]
      SET [StatusID] = @StatusID
      WHERE [ApplicationID] = @ApplicationID
      IF @@ROWCOUNT = 0
        RAISERROR('Application %d does not exist', 16, 1, @ApplicationID)
      ELSE
        DECLARE @StatusName VARCHAR(10)
        SELECT @StatusName = [dbo].[udfGetStatusName](@StatusID)
        PRINT 'Application ' + CAST(@ApplicationID AS VARCHAR(10)) + ' has been ' + CAST(@StatusName AS VARCHAR(10)) + '.'
        GO