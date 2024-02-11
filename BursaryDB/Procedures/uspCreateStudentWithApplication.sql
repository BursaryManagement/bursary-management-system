CREATE PROCEDURE [dbo].[uspCreateStudentWithApplication]
  @FirstName VARCHAR(50),
  @LastName VARCHAR(50),
  @IDNumber CHAR(13),
  @GenderID INT,
  @ContactNumber CHAR(10),
  @Email VARCHAR(100),
  @UserRoleID INT,
  @AverageMark INT,
  @RaceID INT,
  @UniversityID INT,
  @DepartmentID INT,
  @ApplicationMotivation TEXT,
  @BursaryAmount MONEY
AS
BEGIN TRY
  BEGIN TRANSACTION
    INSERT INTO [dbo].[Contact] (
      [ContactNumber],
      [Email]
    ) VALUES (
      @ContactNumber,
      @Email
    )
    DECLARE @ContactID INT = SCOPE_IDENTITY()
    SELECT @ContactID = IDENT_CURRENT('Contact')

    INSERT INTO [dbo].[User] (
      [FirstName],
      [LastName],
      [IDNumber],
      [GenderID],
      [ContactID],
      [UserRoleID]
    ) VALUES (
      @FirstName,
      @LastName,
      @IDNumber,
      @GenderID,
      @ContactID,
      @UserRoleID
    )
    DECLARE @UserID INT = SCOPE_IDENTITY()
    SELECT @UserID = IDENT_CURRENT('User')

    INSERT INTO [dbo].[Student] (
      [AverageMark],
      [UserID],
      [RaceID],
      [UniversityID],
      [DepartmentID]
    ) VALUES (
      @AverageMark,
      @UserID,
      @RaceID,
      @UniversityID,
      @DepartmentID
    )
    DECLARE @StudentID INT = SCOPE_IDENTITY()
    SELECT @StudentID = IDENT_CURRENT('Student')

    INSERT INTO [dbo].[StudentBursaryApplication] (
      [ApplicationMotivation],
      [StudentID],
      [BursaryAmount],
      [ApplicationDate]
    ) VALUES (
      @ApplicationMotivation,
      @StudentID,
      @BursaryAmount,
      GETDATE()
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