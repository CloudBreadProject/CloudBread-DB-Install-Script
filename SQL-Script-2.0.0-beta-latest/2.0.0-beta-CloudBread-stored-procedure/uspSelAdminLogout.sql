--drop proc uspSelAdminLogout
CREATE PROC uspSelAdminLogout
@AdminMemberID NVARCHAR(MAX)
AS 
set nocount on
update AdminMembers set LastLoginDT = SYSUTCDATETIME(), UpdatedAt = SYSUTCDATETIME()
where AdminMemberID like @AdminMemberID
select @@ROWCOUNT as result

GO
/*
EXEC uspSelAdminLogout 'adminid'
--select * from adminmembers
*/