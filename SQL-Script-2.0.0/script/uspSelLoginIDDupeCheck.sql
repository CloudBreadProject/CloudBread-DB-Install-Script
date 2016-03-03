--DROP PROC uspSelLoginIDDupeCheck
CREATE PROC uspSelLoginIDDupeCheck
@MemberID NVARCHAR(MAX)
AS 
set nocount on
IF EXISTS (
	SELECT MemberID FROM Members WITH(NOLOCK) 
	WHERE MemberID like @MemberID
	)
BEGIN
	--MemberID exists
	SELECT 1 AS Result
END
ELSE
BEGIN
	SELECT 0 AS Result
END
GO

/*
-------------------------------------------------------------------------------------
EXEC uspSelLoginIDDupeCheck 'aaa'
EXEC uspSelLoginIDDupeCheck 'noexists'
-------------------------------------------------------------------------------------
SELECT * FROM Members
*/
