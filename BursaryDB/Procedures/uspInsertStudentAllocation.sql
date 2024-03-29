CREATE PROCEDURE [dbo].[uspInsertStudentAllocation]
	@ApplicationID INT
AS
	  DECLARE @StudentID INT
	  DECLARE @BursaryAmount MONEY

	  SELECT @StudentID = [dbo].[udfGetStudentIdFromApplication](@ApplicationID)

	  SELECT @BursaryAmount = [dbo].[udfGetStudentBursaryAmount](@StudentID)

		EXEC [dbo].[uspUpdateStudentApplicationStatus] @ApplicationID, 1
	  EXEC [dbo].[uspAddStudentYearlyAllocation] @StudentID, @BursaryAmount
GO