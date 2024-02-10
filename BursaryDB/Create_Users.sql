-- This file contains SQL statements that will be executed after the build script.
-- This file contains SQL statements that will be executed after the build script.
---Bulelani------
CREATE USER userBulelani FROM LOGIN bulelani WITH DEFAULT_SCHEMA=dbo;
GO

EXEC sp_addrolemember 'db_datareader', 'userBulelani';
EXEC sp_addrolemember 'db_datawriter', 'userBulelani';
GO

ALTER ROLE db_owner ADD MEMBER userBulelani;
GO

GRANT VIEW DEFINITION TO userBulelani;
GO


---Manqoba-----

CREATE USER userManqoba FROM LOGIN manqoba WITH DEFAULT_SCHEMA=dbo;
GO

EXEC sp_addrolemember 'db_datareader', 'userManqoba';
EXEC sp_addrolemember 'db_datawriter', 'userManqoba';
GO

USE BursaryDB;
ALTER ROLE db_owner ADD MEMBER userManqoba;
GO

GRANT VIEW DEFINITION TO userManqoba;
GO



------Ndzalama----------

CREATE USER userNdzalama FROM LOGIN ndzalama WITH DEFAULT_SCHEMA=dbo;
GO

EXEC sp_addrolemember 'db_datareader', 'userNdzalama';
EXEC sp_addrolemember 'db_datawriter', 'userNdzalama';
GO

ALTER ROLE db_owner ADD MEMBER userNdzalama;
GO

GRANT VIEW DEFINITION TO userNdzalama;


-----------------Ntobeko----------
CREATE USER userNtobeko FROM LOGIN ntobeko WITH DEFAULT_SCHEMA=dbo;
GO

EXEC sp_addrolemember 'db_datareader', 'userNtobeko';
EXEC sp_addrolemember 'db_datawriter', 'userNtobeko';
GO

ALTER ROLE db_owner ADD MEMBER userNtobeko;
GO

GRANT VIEW DEFINITION TO userNtobeko;
GO