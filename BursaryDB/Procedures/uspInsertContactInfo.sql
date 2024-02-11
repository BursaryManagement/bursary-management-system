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

  RETURN SCOPE_IDENTITY()
  
GO
