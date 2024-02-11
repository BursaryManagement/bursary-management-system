CREATE FUNCTION [dbo].[udfCheckStudentAllocation] (
   @StudentID INT
)
RETURNS BIT
AS
BEGIN
   DECLARE @Allocated BIT
   SELECT @Allocated = 1
   FROM [dbo].[YearlyStudentAllocation]
   WHERE [StudentID] = @StudentID
   AND YEAR([DateAllocated]) = YEAR(GETDATE())
   RETURN @Allocated
END
GO