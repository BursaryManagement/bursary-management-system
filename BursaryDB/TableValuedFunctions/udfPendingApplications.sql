-- Write your own SQL object definition here, and it'll be included in your package.

-- Create a table-valued function that returns the application status and amount for each student
CREATE FUNCTION dbo.udfStudentApplicationStatus 
(
  @StatusID int 
)
 RETURNS TABLE
 RETURN
 (
  SELECT s.StudentID, a.Status, s.BursaryAmount
  FROM dbo.StudentBursaryApplication s
  INNER JOIN dbo.ApplicationStatus a
  ON s.StatusID = a.StatusID
  WHERE s.StatusID = @StatusID
 );

  -- Insert rows into the output table by joining the two tables

  
  -- Return the output table


