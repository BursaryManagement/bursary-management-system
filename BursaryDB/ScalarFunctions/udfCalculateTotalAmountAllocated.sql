CREATE FUNCTION [dbo].[udfCalculateTotalAmountAllocated] (@UniversityID INT)
    RETURNS MONEY
AS
BEGIN
    DECLARE @TotalAmountAllocated MONEY
    SET @TotalAmountAllocated = 0
    SELECT @TotalAmountAllocated = SUM(AmountAllocated) FROM [dbo].[University] WHERE UniversityID != @UniversityID
    RETURN @TotalAmountAllocated
END
GO