
CREATE LOGIN NewUser WITH PASSWORD = 'YourPassword';

USE YourDatabase;
CREATE USER NewUser FOR LOGIN NewUser;


ALTER ROLE db_owner ADD MEMBER NewUser;
