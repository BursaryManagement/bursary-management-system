-- This file contains SQL statements that will be executed after the build script.
CREATE FUNCTION [dbo].[udfGetUniversityRemainingAmount]
(
    @UniversityID INT,
    @YearToCheck INT
)
RETURNS MONEY
AS
BEGIN
    DECLARE @RemainingAmount MONEY
    DECLARE @TotalAmountAllocated MONEY
    DECLARE @TotalAmountAllocatedToStudents MONEY

    SELECT @TotalAmountAllocated = [AllocatedAmount] 
    FROM 
        [dbo].[YearlyUniversityAllocation]
    WHERE
        Year([DateAllocated]) = @YearToCheck
        AND [UniversityID] = @UniversityID


    SELECT @TotalAmountAllocatedToStudents = SUM([dbo].[YearlyStudentAllocation].[AllocatedAmount]) 
    FROM 
        [dbo].[YearlyStudentAllocation]
        INNER JOIN
        [dbo].[Student]
        ON
            Year([dbo].[YearlyStudentAllocation].[DateAllocated]) = @YearToCheck
            AND [dbo].[Student].[UniversityID] = @UniversityID

    SET @RemainingAmount = @TotalAmountAllocated -  @TotalAmountAllocatedToStudents
    
    RETURN @RemainingAmount
END

GO