-- This file contains SQL statements that will be executed after the build script.
USE BursaryDB;
GO

INSERT INTO dbo.Department (DepartmentName)
VALUES
('Computer Science'),
('Computer Engineering'),
('Computer Game Design'),
('Software Engineering'),
('Data Science'),
('Artificial Intelligence'),
('Cybersecurity'),
('Information Systems');
GO

INSERT INTO dbo.University (UniversityName)
VALUES ('University of Cape Town'), ('University of the Witwatersrand'), ('University of Pretoria'), ('University of Johannesburg'), ('University of KwaZulu-Natal'), ('University of the Western Cape');
GO

INSERT INTO dbo.ApplicationStatus (Status)
VALUES ('Accepted'), ('Review'), ('Rejected');
GO

INSERT INTO dbo.UniversityApplication (UniversityID, Motivation)
VALUES
(1, 'Our institution is committed to fostering academic excellence. We recognize the outstanding achievements of our students and aim to support their educational journey by offering bursaries.'),
(2, 'At our university, we celebrate the dedication and hard work of our students. To further encourage their success, we extend bursaries to help them pursue their educational aspirations.'),
(3, 'Academic excellence is at the heart of our university. We take pride in our high-achieving students and offer bursaries as a testament to their commitment and potential.'),
(4, 'We believe in nurturing talent and rewarding academic accomplishments. Our bursaries are designed to empower students who excel in their studies and contribute to our vibrant academic community.'),
(5, 'As a university that values excellence, we support our top-performing students by providing bursaries. Their achievements inspire us, and we are committed to helping them thrive.'),
(6, 'Our university celebrates academic brilliance. By offering bursaries, we aim to empower our dedicated students to continue their educational journey with confidence.');
GO
INSERT INTO dbo.BursaryDetails (Year, TotalAmount, CapAmountPerStudent)
VALUES (2024, 3000000, 125000);
GO
INSERT INTO dbo.YearlyUniversityAllocation (UniversityID, AllocatedAmount, DateAllocated)
VALUES
(1, 100000, '2024-01-01'),
(2, 200000, '2024-01-01'),
(3, 300000, '2024-01-01'),
(4, 400000, '2024-01-01'),
(5, 500000, '2024-01-01'),
(6, 600000, '2024-01-01');
GO

INSERT INTO dbo.Gender (Gender)
VALUES ('Male'), ('Female'), ('Other');
GO

INSERT INTO [dbo].[Race] (RaceName)
VALUES ('Black'), ('Indian'), ('Coloured');
GO



INSERT INTO dbo.Contact (ContactNumber, Email)
VALUES
('0711234567', 'john.doe@gmail.com'),
('0712345678', 'jane.smith@gmail.com'),
('0713456789', 'michael.johnson@gmail.com'),
('0714567890', 'emily.williams@gmail.com'),
('0715678901', 'david.brown@gmail.com'),
('0716789012', 'olivia.jones@gmail.com'),
('0717890123', 'james.davis@gmail.com'),
('0718901234', 'sophia.taylor@gmail.com'),
('0719012345', 'benjamin.clark@gmail.com'),
('0710123456', 'emma.walker@gmail.com'),
('0711234567', 'william.hall@gmail.com'),
('0712345678', 'ava.lewis@gmail.com'),
('0713456789', 'alexander.harris@gmail.com'),
('0714567890', 'mia.miller@gmail.com');
GO

INSERT INTO [dbo].[UserRole] ([Role]) 
VALUES 
('db_bbd_admin'),
('db_hod'),
('db_student');
GO

INSERT INTO dbo.[User] (FirstName, LastName, IDNumber, GenderID, ContactID, UserRoleID)
VALUES ('John', 'Doe', '9501015009087', 1, 1, 1), ('Jane', 'Smith', '9501015009088', 2, 2, 1),
    ('Michael', 'Johnson', '9501015009089', 1, 3, 2), ('Emily', 'Williams', '9501015009090', 2, 4, 2),
    ('David', 'Brown', '9501015009091', 1, 5, 2), ('Olivia', 'Jones', '9501015009092', 2, 6, 2),
    ('James', 'Davis', '9501015009093', 1, 7, 2), ('Sophia', 'Taylor', '9501015009094', 2, 8, 2),
    ('Benjamin', 'Clark', '9501015009095', 1, 9, 3), ('Emma', 'Walker', '9501015009096', 2, 10, 3),
    ('William', 'Hall', '9501015009097', 1, 11, 3), ('Ava', 'Lewis', '9501015009098', 2, 12, 3),
    ('Alexander', 'Harris', '9501015009099', 1, 13, 3), ('Mia', 'Miller', '9501015009100', 2, 14, 3);
GO

INSERT INTO dbo.BBDAdministrator (UserID)
VALUES
(1),
(2);
GO

INSERT INTO dbo.HeadOfDepartment (DepartmentID, UniversityID, UserID)
VALUES
(1, 1, 3),
(2, 2, 4),
(3, 3, 5),
(4, 4, 6),
(5, 5, 7),
(6, 6, 8);
GO

INSERT INTO dbo.Student (AverageMark, UserID, RaceID, UniversityID, DepartmentID)
VALUES
(80, 9, 1, 1, 1),
(70, 10, 2, 2, 2),
(60, 11, 3, 3, 3),
(50, 12, 1, 4, 4),
(40, 13, 2, 5, 5),
(30, 14, 3, 6, 6);
GO

INSERT INTO dbo.StudentBursaryApplication (ApplicationMotivation, BursaryAmount, StudentID)
VALUES ('I am a hardworking student who is in need of financial assistance', 5000, 1),
      ('I am a dedicated student who is in need of financial assistance', 10000, 2),
      ('I am a committed student who is in need of financial assistance', 15000, 3),
      ('I am a passionate student who is in need of financial assistance', 20000, 4),
      ('I am a driven student who is in need of financial assistance', 25000, 5),
      ('I am a focused student who is in need of financial assistance', 30000, 6);
GO