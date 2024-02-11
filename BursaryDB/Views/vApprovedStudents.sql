CREATE VIEW [dbo].[vApprovedStudents]
AS
	SELECT [User].[FirstName], [User].[LastName], [StudentBursaryApplication].[BursaryAmount], [University].[UniversityName], [ApplicationStatus].[Status]
	FROM [User]
	INNER JOIN [Student]
	ON [Student].[UserID] = [User].[UserID]
	INNER JOIN StudentBursaryApplication
	ON [Student].[StudentID] = [StudentBursaryApplication].[StudentID]
	INNER JOIN [ApplicationStatus]
	ON
	[StudentBursaryApplication].[StatusID] = [ApplicationStatus].[StatusID]
 INNER JOIN [University]
 ON [Student].[UniversityID] = [University].[UniversityID]
	WHERE [StudentBursaryApplication].[StatusID] = 1;
GO
