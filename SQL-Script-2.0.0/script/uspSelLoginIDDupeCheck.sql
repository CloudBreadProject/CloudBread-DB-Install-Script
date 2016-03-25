--DROP PROC uspSelLoginIDDupeCheck
CREATE PROC uspSelLoginIDDupeCheck
@FindID NVARCHAR(MAX)
,@Category NVARCHAR(MAX)
AS 
set nocount on
IF UPPER(@Category) = 'MEMBERID'
BEGIN
    IF EXISTS (
	SELECT MemberID FROM Members WITH(NOLOCK) 
	WHERE MemberID like @FindID
	)
		BEGIN
			--MemberID exists
			SELECT 1 AS Result
		END
	ELSE
		BEGIN
			SELECT 0 AS Result
		END
END
IF UPPER(@Category) = 'EMAIL'
BEGIN
    IF EXISTS (
	SELECT EmailAddress FROM Members WITH(NOLOCK) 
	WHERE EmailAddress like @FindID
	)
		BEGIN
			--MemberID exists
			SELECT 1 AS Result
		END
	ELSE
		BEGIN
			SELECT 0 AS Result
		END
END
IF UPPER(@Category) = 'NAME1'
BEGIN
    IF EXISTS (
	SELECT Name1 FROM Members WITH(NOLOCK) 
	WHERE Name1 like @FindID
	)
		BEGIN
			--MemberID exists
			SELECT 1 AS Result
		END
	ELSE
		BEGIN
			SELECT 0 AS Result
		END
END
GO

/*
-------------------------------------------------------------------------------------
EXEC uspSelLoginIDDupeCheck 'aaa', 'MemberID'
EXEC uspSelLoginIDDupeCheck 'noexist', 'MemberID'

EXEC uspSelLoginIDDupeCheck 'bbb@aa.com', 'email'
EXEC uspSelLoginIDDupeCheck 'noexist', 'email'

EXEC uspSelLoginIDDupeCheck 'Name1', 'Name1'
EXEC uspSelLoginIDDupeCheck 'noexist', 'Name1'


-------------------------------------------------------------------------------------
SELECT * FROM Members
*/
