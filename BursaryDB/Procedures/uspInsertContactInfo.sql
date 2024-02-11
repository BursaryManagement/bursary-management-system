CREATE PROCEDURE [dbo].[uspInsertContactInfo]
  @ContactNumber CHAR(10)
  ,@Email VARCHAR(100)
AS
  INSERT INTO [dbo].[Contact](
    [ContactNumber]
    ,[Email]
  )
  VALUES(
    @ContactNumber,
    @Email
  )

  SELECT SCOPE_IDENTITY() AS [ContactID] FROM [dbo].[Contact]
  

