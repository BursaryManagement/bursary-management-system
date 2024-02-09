CREATE PROCEDURE [dbo].[uspCreateStudentBursaryDocuments]
  @IdCopy VARBINARY(MAX),
  @Transcript VARBINARY(MAX),
  @CurriculumVitae VARBINARY(MAX),
  @ApplicationID INT
AS
BEGIN TRY
  BEGIN TRANSACTION
    INSERT INTO [dbo].[StudentBursaryDocuments] (
      [IdCopy],
      [Transcript],
      [CurriculumVitae],
      [ApplicationID]
    ) VALUES (
      @IdCopy,
      @Transcript,
      @CurriculumVitae,
      @ApplicationID
    )
  COMMIT TRANSACTION
END TRY
BEGIN CATCH
  ROLLBACK TRANSACTION
  THROW
END CATCH
GO