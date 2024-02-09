CREATE FUNCTION udfTotalBursaryAmount()
    RETURNS MONEY
AS
BEGIN
    DECLARE @TotalAmount MONEY
    SET @TotalAmount = 0
    SELECT @TotalAmount = [TotalAmount] FROM [dbo].[BursaryDetails]
    RETURN @TotalAmount
END
GO