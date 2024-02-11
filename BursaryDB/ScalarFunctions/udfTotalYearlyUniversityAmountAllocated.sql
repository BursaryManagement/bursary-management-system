CREATE FUNCTION [dbo].[udfTotalYearlyUniversityAmountAllocated] (@FinancialDate DATE)
    RETURNS MONEY
AS
BEGIN
    DECLARE @TotalAmountAllocated MONEY = 0;
    SELECT 
        @TotalAmountAllocated = @TotalAmountAllocated + ([AllocatedAmount]) 
    FROM 
        [dbo].[YearlyUniversityAllocation]
    WHERE
        Year([DateAllocated]) = Year(@FinancialDate)
    RETURN @TotalAmountAllocated
END
GO


CREATE FUNCTION [dbo].[udfTotalAmountForYear] (@BursaryDetailYear INT)
    RETURNS MONEY
AS
BEGIN
    DECLARE @TotalAmount MONEY = 0
    SELECT 
        @TotalAmount = ([TotalAmount]) 
    FROM 
        [dbo].[BursaryDetails]
    WHERE
        [Year] = @BursaryDetailYear
    RETURN @TotalAmount
END
GO


ALTER TABLE [dbo].[YearlyUniversityAllocation]
    ADD CONSTRAINT [CHK_YearlyUniversityAllocation_AllocatedAmount]
        CHECK ([dbo].[udfTotalYearlyUniversityAmountAllocated](GETDATE()) + [AllocatedAmount] <= [dbo].[udfTotalAmountForYear] (Year([DateAllocated])))
GO