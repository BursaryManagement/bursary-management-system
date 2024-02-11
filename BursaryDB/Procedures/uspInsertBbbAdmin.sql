CREATE PROCEDURE [dbo].[uspInsertBbbAdmin]
  @FirstName VARCHAR(50),
  @LastName VARCHAR(50),
  @IDNumber CHAR(13),
  @ContactNumber CHAR(10),
  @Email VARCHAR(100),
  @GenderID INT,
  @UserRoleID INT,
  @IsUserActive BIT

AS
    BEGIN TRY
      BEGIN TRANSACTION
        DECLARE @ContactID INT
        DECLARE @UserID INT
        
        EXEC @ContactID =   [dbo].[uspInsertContactInfo] @ContactNumber,@Email

        EXEC @UserID = [dbo].[upsInsertUserInfo] @FirstName,@LastName,@IDNumber,@GenderID,@ContactID,@UserRoleID,1

        INSERT INTO [dbo].[BBDAdministrator](
            [UserID]
        )VALUES (
          @UserID
        )
      COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
          EXEC [dbo].[uspGetErrorIndfo]
          ROLLBACK TRANSACTION
    END CATCH

GO
