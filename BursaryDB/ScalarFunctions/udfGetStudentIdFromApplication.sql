CREATE FUNCTION [dbo].[udfGetStudentIdFromApplication] (
    @ApplicationID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @StudentID INT
    SELECT @StudentID = [StudentID]
    FROM [dbo].[StudentBursaryApplication]
    WHERE [ApplicationID] = @ApplicationID
    RETURN @StudentID
END
GO