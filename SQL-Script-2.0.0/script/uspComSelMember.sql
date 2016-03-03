--DROP PROC uspComSelMember
CREATE PROC uspComSelMember
@MemberID NVARCHAR(MAX)
AS 
select MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from Members with(nolock)
where MemberID like @MemberID
and HideYN like 'N'
and DeleteYN like 'N'

GO
/*
-----------------------------------------------------------------------
EXEC uspComSelMember 'aaa'
EXEC uspComSelMember 'asfasdf'
-----------------------------------------------------------------------
*/
