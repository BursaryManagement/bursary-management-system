CREATE FUNCTION [dbo].[udfGetStudentBursaryAmount] (
    @StudentID INT
)
RETURNS MONEY
AS
BEGIN
    DECLARE @BursaryAmount MONEY
    SELECT @BursaryAmount = [BursaryAmount]
    FROM [dbo].[StudentBursaryApplication]
    WHERE [StudentID] = @StudentID
    RETURN @BursaryAmount
END
GO
