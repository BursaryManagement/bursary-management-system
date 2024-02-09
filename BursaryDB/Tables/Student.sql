CREATE TABLE [dbo].[Student]
(
  [StudentID] VARCHAR(13) NOT NULL,
  [FirstName] VARCHAR(50) NOT NULL,
  [LastName] VARCHAR(50) NOT NULL,
  [AverageMark] INT NOT NULL,
  [ContactNumber] CHAR(10) NOT NULL,
  [StudentEmail] VARCHAR(100) NOT NULL,
  [DateOfBirth] DATE NOT NULL,
  [RaceID] INT,
  CONSTRAINT [PK_Student]
    PRIMARY KEY CLUSTERED (StudentID),
  CONSTRAINT [FK_Race]
    FOREIGN KEY (RaceID)
    REFERENCES Race(RaceID)

)

--TODO: Add UniversityID, and DepartmentID