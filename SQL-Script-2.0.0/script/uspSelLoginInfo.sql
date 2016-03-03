--DROP PROC uspSelLoginInfo
CREATE PROC uspSelLoginInfo
	@MemberID NVARCHAR(MAX)
,	@MemberPWD NVARCHAR(MAX)
,	@LastDeviceID  NVARCHAR(MAX)	=	''
,	@LastIPaddress  NVARCHAR(MAX)	=	''
,	@LastMACAddress  NVARCHAR(MAX)		=	''
AS
set nocount on
update Members set
LastDeviceID =  @LastDeviceID
, LastIPaddress = @LastIPaddress
, LastLoginDT = sysutcdatetime()
, LastMACAddress = @LastMACAddress
, UpdatedAt = sysutcdatetime()
where MemberID like @MemberID and MemberPWD like @MemberPWD and HideYN like 'N' and DeleteYN like 'N'

select MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from Members with(nolock)
where MemberID like @MemberID and MemberPWD like @MemberPWD and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspSelLoginInfo 'aaa', 'MemberPWD'
EXEC uspSelLoginInfo 'aaa', 'MemberPWD', '최근DeviceID', '최근IPaddress', '최근MACAddress'
EXEC uspSelLoginInfo 'noexists', '암호', '마지막DeviceID', 'LastIPaddress', 'LastMACAddress'
-----------------------------------------------------------------------
select * from Members
*/
