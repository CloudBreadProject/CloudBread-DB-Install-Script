--DROP PROC uspSelSendEmailToMember
CREATE PROC uspSelSendEmailToMember
@MemberID NVARCHAR(MAX)
AS 
--set, lock option check
select EmailAddress from Members with(nolock) where MemberID like @MemberID
and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspSelSendEmailToMember 'aaa'
EXEC uspSelSendEmailToMember 'asfasdf'
-----------------------------------------------------------------------
*/
