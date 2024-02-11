CREATE PROCEDURE [dbo].[upsInsertUserInfo]
    @FirstName VARCHAR(50)
    ,@LastName VARCHAR(50)
    ,@IDNumber CHAR(13)
    ,@GenderID INT
    ,@ContactID INT
    ,@UserRoleID INT
    ,@IsUserActive BIT
AS
  INSERT INTO [dbo].[User](
    [FirstName]
    ,[LastName]
    ,[IDNumber]
    ,[GenderID]
    ,[ContactID]
    ,[UserRoleID]
    ,[IsUserActive]
  )
  VALUES(@FirstName
    ,@LastName
    ,@IDNumber
    ,@GenderID
    ,@ContactID
    ,@UserRoleID
    ,@IsUserActive)

  RETURN SCOPE_IDENTITY()
GO