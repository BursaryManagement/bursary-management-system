CREATE PROCEDURE [dbo].[uspCreateStudentBursaryDocuments]
  @ApplicationID INT,
  @IdCopy VARBINARY(MAX),
  @Transcript VARBINARY(MAX),
  @CurriculumVitae VARBINARY(MAX)
AS
BEGIN TRY
  BEGIN TRANSACTION
    INSERT INTO [dbo].[StudentBursaryDocuments] (
      [ApplicationID],
      [IdCopy],
      [Transcript],
      [CurriculumVitae]
    ) VALUES(
      @ApplicationID,
      @IdCopy,
      @Transcript,
      @CurriculumVitae
    )
  COMMIT
END TRY
BEGIN CATCH
  IF (@@TRANCOUNT > 0)
    ROLLBACK TRANSACTION;
  THROW
  PRINT 'Transaction failed! ' + error_message() 
END CATCH
GO
