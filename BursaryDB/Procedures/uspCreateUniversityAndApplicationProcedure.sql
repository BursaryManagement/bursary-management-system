CREATE PROCEDURE [dbo].[uspCreateUniversityAndApplicationProcedure]
  @UniversityName VARCHAR(120)
AS
BEGIN TRY
  BEGIN TRANSACTION
    INSERT INTO [dbo].[University] (
      [UniversityName]
    ) VALUES (
      @UniversityName
    )

    DECLARE @UniversityID INT = SCOPE_IDENTITY();

    SELECT @UniversityID = IDENT_CURRENT('University')

    INSERT INTO [dbo].[UniversityApplication] (
      [UniversityID],
      [StatusID]
    ) VALUES (
      @UniversityID,
      2
    )
  COMMIT TRANSACTION
END TRY
BEGIN CATCH
  ROLLBACK TRANSACTION
  THROW
END CATCH
GO

/*
SELECT * FROM [dbo].[ApplicationStatus];
GO

SELECT * FROM [dbo].[University];
GO

SELECT * FROM [dbo].[UniversityApplication];
GO

EXEC [dbo].[uspCreateUniversityAndApplicationProcedure]
  @UniversityName = 'University Of Testing'*/