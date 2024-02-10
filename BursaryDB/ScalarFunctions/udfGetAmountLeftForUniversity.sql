-- Write your own SQL object definition here, and it'll be included in your package.
-- Write your own SQL object definition here, and it'll be included in your package.
CREATE FUNCTION [dbo].[udfGetAmountLeftForUniversity](
    @UniversityID INT
)
RETURNS MONEY
AS
BEGIN
    DECLARE @AmountLeft MONEY
    IF NOT EXISTS (SELECT 1 FROM [dbo].[University] WHERE UniversityID=@UniversityID)
    BEGIN
        RETURN 0
    END
    SELECT @AmountLeft = [ReamingAmount] FROM [dbo].[University] WHERE [UniversityID] = @UniversityID

    RETURN @AmountLeft
END

GO

SELECT [dbo].[udfGetAmountLeftForUniversity](4)
GO

-- Function will RETURN 0 when the UniversityID Does not exist