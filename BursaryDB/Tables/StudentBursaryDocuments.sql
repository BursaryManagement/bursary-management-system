CREATE TABLE [dbo].[StudentBursaryDocuments]
(
  [StudentDocumentID] INT IDENTITY NOT NULL PRIMARY KEY,
  [IdCopy] VARBINARY(MAX) NOT NULL,
  [Transcript] VARBINARY(MAX) NOT NULL,
  [CurriculumVitae] VARBINARY(MAX) NOT NULL,
  [ApplicationID] INT NOT NULL
)
