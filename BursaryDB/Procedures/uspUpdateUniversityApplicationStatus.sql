CREATE PROCEDURE [dbo].[uspUpdateUniversityApplicationStatus]
@ApplicationID INT,
@StatusID INT
AS
      UPDATE [dbo].[UniversityApplication]
      SET [StatusID] = @StatusID
      WHERE [UniversityApplicationID] = @ApplicationID
      IF @@ROWCOUNT = 0
        RAISERROR('Application %d does not exist', 16, 1, @ApplicationID)
      ELSE
        DECLARE @StatusName VARCHAR(10)
        SELECT @StatusName = [dbo].[udfGetStatusName](@StatusID)
        PRINT 'Application ' + CAST(@ApplicationID AS VARCHAR(10)) + ' has been ' + CAST(@StatusName AS VARCHAR(10)) + '.'
        GO