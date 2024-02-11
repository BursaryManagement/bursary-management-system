CREATE PROCEDURE [dbo].[uspGetUniversityApplicationStatus]
  @UniversityID INT
AS
BEGIN TRY
  SELECT [University].[UniversityName], [ApplicationStatus].[Status]
  FROM [University]
  INNER JOIN [UniversityApplication]
  ON [University].[UniversityID] = [UniversityApplication].[UniversityID]
  INNER JOIN [ApplicationStatus]
  ON [UniversityApplication].[StatusID] = [ApplicationStatus].[StatusID]
  WHERE [University].[UniversityID] = @UniversityID;

  IF @@ROWCOUNT = 0
    PRINT 'The specified UniversityID does not exist in the database.';
END TRY
BEGIN CATCH
  THROW 51000, 'An error occurred when retrieving the university application status.', 1;
END CATCH
GO
