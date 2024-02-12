# BBD Bursary Management System
BBD bursary management system database design repository

<br />

## Database Planning and Design
The table below lists the functionalities that each role player can perform on the Databasa

| BBD Software | University |
| :----------- | :--------- |
| Sets bursary amount for each year|  Apply to be part of the scheme |
| Sets cap amount per student for each year |  Can see total allocated and remaining amount for each year |
| Approves or reject university application |  Has a representative apply or renew application on behalf of students|
| Sets bursary allocation to each university university |  Has a representative to check application status for each student |
| Approves or rejects Sudent's application |  Renew application on behalf of a students |
| ADetermine the departments funded |  Allow student to upload required documents |

### Entity Relationship Diagram
The ERD below demostrates the relationship that each role player has with other parts of the database and the relationship between data

![bursary_management_system](https://github.com/BursaryManagement/bursary-management-system/assets/40816245/5e8e7117-50ad-4823-9a9d-2a53768d9187)

<br />

## Current Database functionalities
Below are all the functionalities that can be performed on the database

### Views

| View Purpose | View Implementation |
| :----------------- | :--- |
| View All approved Students | `[dbo].[vApprovedStudents]` |
| View All HODs, their respective institutions and departments | `[dbo].[vHeadOfDepartments]` |

---

### Table Valued Functions

| Function Purpose | Function Implementation |
| :----------------- | :--- |
| Get Students' by their application status | `[dbo].[udfStudentApplicationStatus](@StatusID)` |

---

### Scalar Valued Functions

| Function Purpose | Function Implementation |
| :----------------- | :--- |
| Check if the students' funds have been allocated for the current year | `[dbo].[udfCheckStudentAllocation](@StudentID)` |
| Get application status name by ID | `[dbo].[udfGetStatusName](@StatusID)`|
| Get an amount that a student has applied for | `[dbo].[udfGetStudentBursaryAmount](@StudentID)` |
| Retrieve Student ID from application | `[dbo].[udfGetStudentIdFromApplication](@ApplicationID)` |
| Get University's remaining funds for the year | `[dbo].[udfGetUniversityRemainingAmount](@UniversityID, @YearToCheck)` |
| Check total allocation for all university for a certain year| `[dbo].[udfTotalYearlyUniversityAmountAllocated @FinancialDate`]

### Stored Procedures

| Procedure Purpose | Procedure Implementation |
| :----------------- | :--- |
| Insert user details to the database | `[dbo].[upsInsertUserInfo] @FirstName, @LastName, @IDNumber, @GenderID, @ContactID, @UserRoleID, @IsUserActive` |
| Insert Supporting Dicuments for a student's application | `[dbo].[uspCreateStudentBursaryDocuments] @ApplicationID,  @IdCopyLoc, @TranscriptLoc, @CurriculumVitaeLoc` |
| Add student's application | `[dbo].[uspCreateStudentWithApplication] @FirstName, @LastName, @IDNumber, @GenderID, @ContactNumber, @Email, @UserRoleID, @AverageMark, @RaceID, @UniversityID, @DepartmentID, @ApplicationMotivation, @BursaryAmount`|
| Add University Application | `[dbo].[uspCreateUniversityWithApplication] @UniversityName, @Motivation` |
| Get error information| `[dbo].[uspGetErrorInfo]`|
| Get University Application Status| `[dbo].[uspGetUniversityApplicationStatus]` |
| Allocate amount to student| `[dbo].[uspAddStudentYearlyAllocation] @StudentID, @AllocationAmount`|
| Add ddb admin to the database| `[dbo].[uspInsertBbbAdmin] @FirstName, @LastName, @IDNumber, @ContactNumber,@Email, @GenderID, @UserRoleID, @IsUserActive`|
| Add contact details to the database| `@[dbo].[uspInsertContactInfo] @ContactNumber, @Email`|
| Insert head of department details to the database | `[dbo].[uspInsertHeadOfDepartment] @FirstName, @LastName, @IDNumber, @ContactNumber,@Email, @GenderID, @UserRoleID, @IsUserActive, @DepartmentID, @UniversityID`|
| Insert students' yearly allocation to the database | `[dbo].[uspInsertHeadOfDepartment] @ApplicationID`|
| Updates student application status | `[dbo].[uspUpdateStudentApplicationStatus] @ApplicationID, @StatusID`|
| Updates University application status | `[dbo].[uspUpdateUniversityApplicationStatus]@ApplicationID, @StatusID`|
