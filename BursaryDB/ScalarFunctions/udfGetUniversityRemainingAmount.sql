CREATE FUNCTION [dbo].[udfGetUniversityRemainingAmount]
(
    @UniversityID INT,
    @YearToCheck INT
)
RETURNS MONEY
AS
BEGIN
    DECLARE @RemainingAmount MONEY = 0;
    DECLARE @TotalAmountAllocated MONEY = 0;
    DECLARE @TotalAmountAllocatedToStudents MONEY = 0;

    SELECT @TotalAmountAllocated = [AllocatedAmount] 
    FROM 
        [dbo].[YearlyUniversityAllocation]
    WHERE
        Year([DateAllocated]) = @YearToCheck
        AND [UniversityID] = @UniversityID


    SELECT @TotalAmountAllocatedToStudents = @TotalAmountAllocatedToStudents +  [dbo].[YearlyStudentAllocation].[AllocatedAmount]
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