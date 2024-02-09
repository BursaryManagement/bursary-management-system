IF object_id('Student') IS NULL 
  CREATE TABLE [dbo].[Student]
  (
    [StudentID] VARCHAR(13) NOT NULL,
    [FirstName] VARCHAR(50) NOT NULL,
    [LastName] VARCHAR(50) NOT NULL,
    [AverageMark] INT NOT NULL,
    [ContactNumber] CHAR(10) NOT NULL,
    [StudentEmail] VARCHAR(100) NOT NULL,
    [DateOfBirth] DATE NOT NULL,
    [RaceID] INT NOT NULL, 
    [UniversityID] INT NOT NULL,
    [DepartmentID] INT NOT NULL,
    CONSTRAINT [PK_Student]
      PRIMARY KEY CLUSTERED (StudentID)
  )

ALTER TABLE Student
ADD CONSTRAINT [FK_StudentRace]
FOREIGN KEY (RaceID)
REFERENCES Race(RaceID)

ALTER TABLE Student
ADD CONSTRAINT [FK_StudentUniversity]
FOREIGN KEY (UniversityID)
REFERENCES University(UniversityID);

ALTER TABLE Student
ADD CONSTRAINT [FK_StudentDepartment]
FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID);