--DROP PROC uspSelAdminLogin
CREATE PROC uspSelAdminLogin
@AdminMemberID NVARCHAR(MAX)
, @AdminMemberPWD NVARCHAR(MAX)
, @LastIPaddress NVARCHAR(MAX) = ''
AS 
set nocount on
update AdminMembers set LastIPaddress = @LastIPaddress, LastLoginDT = SYSUTCDATETIME(), UpdatedAt = SYSUTCDATETIME()
where AdminMemberID like @AdminMemberID and AdminMemberPWD like @AdminMemberPWD
select AdminMemberID, AdminGroup, TimeZoneID
from AdminMembers with(nolock)
where AdminMemberID like @AdminMemberID and AdminMemberPWD like @AdminMemberPWD
and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspSelAdminLogin 'admin1', 'AdminMemberPWD'
EXEC uspSelAdminLogin 'admin2', 'AdminMemberPWD'
-----------------------------------------------------------------------

select * from AdminMembers
*/

