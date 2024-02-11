CREATE PROCEDURE [dbo].[uspCreateStudentBursaryDocuments]
  @ApplicationID INT,
  @IdCopyLoc NVARCHAR(200),
  @TranscriptLoc NVARCHAR(200),
  @CurriculumVitaeLoc NVARCHAR(200)
AS
BEGIN TRY
  BEGIN TRANSACTION
    DECLARE @IdCopy VARBINARY(MAX)
    SELECT @IdCopy = BulkColumn
    FROM OPENROWSET(BULK ''' + @IdCopyLoc + ''', SINGLE_BLOB) AS Document;

    DECLARE @Transcript VARBINARY(MAX)
    SELECT @Transcript = BulkColumn
    FROM OPENROWSET(BULK ''' + @TranscriptLoc + ''', SINGLE_BLOB) AS Document;

    DECLARE @CurriculumVitae VARBINARY(MAX)
    SELECT @CurriculumVitae = BulkColumn
    FROM OPENROWSET(BULK ''' + @CurriculumVitaeLoc + ''', SINGLE_BLOB) AS Document;

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
