CREATE FUNCTION [dbo].[udfGetStatusName]
  (
    @StatusID INT
  )
RETURNS VARCHAR(10)
AS
  BEGIN
    DECLARE @StatusName VARCHAR(10)
    SELECT @StatusName = [Status]
    FROM [dbo].[ApplicationStatus]
    WHERE [StatusID] = @StatusID
    RETURN @StatusName
  END
GO