CREATE TABLE [dbo].[StudentBursaryDocuments]
(
  [StudentDocumentID] INT IDENTITY NOT NULL PRIMARY KEY,
  [IdCopy] VARBINARY(MAX) NOT NULL,
  [Transcript] VARBINARY(MAX) NOT NULL,
  [CurriculumVitae] VARBINARY(MAX) NOT NULL,
  [ApplicationID] INT NOT NULL
)

ALTER TABLE [dbo].[StudentBursaryDocuments]
  ADD CONSTRAINT [FK_StudentBursaryDocuments_StudentBursaryApplication_ApplicationID]
  FOREIGN KEY (ApplicationID)
  REFERENCES StudentBursaryApplication([ApplicationID])
