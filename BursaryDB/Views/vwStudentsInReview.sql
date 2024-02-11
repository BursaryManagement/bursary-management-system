CREATE VIEW [dbo].[vStudentsInReview]
AS
	SELECT [User].[FirstName], [User].[LastName], [ApplicationStatus].[Status]
	FROM [User]
	INNER JOIN [Student]
	ON [Student].[UserID] = [User].[UserID]
	INNER JOIN StudentBursaryApplication
	ON [Student].[StudentID] = [StudentBursaryApplication].[StudentID]
	INNER JOIN [ApplicationStatus]
	ON
	[StudentBursaryApplication].[StatusID] = [ApplicationStatus].[StatusID]
	WHERE [StudentBursaryApplication].[StatusID] = 2;
GO