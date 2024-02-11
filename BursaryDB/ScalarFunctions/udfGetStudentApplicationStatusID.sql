CREATE FUNCTION [dbo].[udfGetStudentApplicationStatusID]
  (
    @ApplicationID INT
  )
RETURNS INT
AS
  BEGIN
    DECLARE @StatusID INT
    SELECT @StatusID = [StatusID]
    FROM [dbo].[StudentBursaryApplication]
    WHERE [ApplicationID] = @ApplicationID
    RETURN @StatusID
  END
GO