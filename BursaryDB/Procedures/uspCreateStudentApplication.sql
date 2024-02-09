CREATE PROCEDURE [dbo].[uspCreateStudentApplication]
  @StudentID VARCHAR(13),
  @FirstName VARCHAR(50),
  @LastName VARCHAR(50),
  @AverageMark INT,
  @ContantNumber CHAR(10),
  @StudentEmail VARCHAR(100),
  @DateOfBirth DATE,
  @RaceID INT,
  @UniversityID INT,
  @DepartmentID INT,
  @ApplicationMotivation TEXT,
  @BursaryAmount MONEY,
  @StatusID INT
AS
BEGIN TRY
  BEGIN TRANSACTION
    INSERT INTO Student (
      [StudentID],
      [FirstName],
      [LastName],
      [AverageMark],
      [ContactNumber],
      [StudentEmail],
      [DateOfBirth],
      [RaceID],
      [UniversityID],
      [DepartmentID]
    ) VALUES (
      @StudentID,
      @FirstName,
      @LastName,
      @AverageMark,
      @ContantNumber,
      @StudentEmail,
      @DateOfBirth,
      @RaceID,
      @UniversityID,
      @DepartmentID
    )

    INSERT INTO [dbo].[StudentBursaryApplication] (
      [ApplicationMotivation],
      [BursaryAmount],
      [StudentID],
      [StatusID]
    ) VALUES (
      @ApplicationMotivation,
      @BursaryAmount,
      @StudentID,
      @StatusID
    )
  COMMIT TRANSACTION
END TRY
BEGIN CATCH
  ROLLBACK TRANSACTION
  THROW
END CATCH
GO
