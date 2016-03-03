

--로그인 후 필요한 경우 정보 업뎃 수행 (기본적으로 uspSelLoginInfo 에서 최근 로그인 업데이트 수행 / uspCom과 유사함)

-----------------------------------------------------------------------
-- uspSelLoginInfo 프로시저 생성
--DROP PROC uspUdtLoginInfo
CREATE PROC uspUdtLoginInfo
@MemberID nvarchar(MAX) = NULL
,@MemberPWD nvarchar(MAX) = NULL
,@EmailAddress nvarchar(MAX) = NULL
,@EmailConfirmedYN nvarchar(MAX) = NULL
,@PhoneNumber1 nvarchar(MAX) = NULL
,@PhoneNumber2 nvarchar(MAX) = NULL
,@PINumber nvarchar(MAX) = NULL
,@Name1 nvarchar(MAX) = NULL
,@Name2 nvarchar(MAX) = NULL
,@Name3 nvarchar(MAX) = NULL
,@DOB nvarchar(MAX) = NULL
,@RecommenderID nvarchar(MAX) = NULL
,@MemberGroup nvarchar(MAX) = NULL
,@LastDeviceID nvarchar(MAX) = NULL
,@LastIPaddress nvarchar(MAX) = NULL
,@LastLoginDT nvarchar(MAX) = NULL
,@LastLogoutDT nvarchar(MAX) = NULL
,@LastMACAddress nvarchar(MAX) = NULL
,@AccountBlockYN nvarchar(MAX) = NULL
,@AccountBlockEndDT nvarchar(MAX) = NULL
,@AnonymousYN nvarchar(MAX) = NULL
,@3rdAuthProvider nvarchar(MAX) = NULL
,@3rdAuthID nvarchar(MAX) = NULL
,@3rdAuthParam nvarchar(MAX) = NULL
,@PushNotificationID nvarchar(MAX) = NULL
,@PushNotificationProvider nvarchar(MAX) = NULL
,@PushNotificationGroup nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL
,@TimeZoneID nvarchar(MAX) = NULL		-- 암호화 안함
AS 
--set, lock 옵션 등 체크
set nocount on
update Members
set  
MemberID = CASE WHEN @MemberID is not null THEN @MemberID ELSE  MemberID END
, MemberPWD = CASE WHEN @MemberPWD is not null THEN @MemberPWD ELSE  MemberPWD END
, EmailAddress = CASE WHEN @EmailAddress is not null THEN @EmailAddress ELSE  EmailAddress END
, EmailConfirmedYN = CASE WHEN @EmailConfirmedYN is not null THEN @EmailConfirmedYN ELSE  EmailConfirmedYN END
, PhoneNumber1 = CASE WHEN @PhoneNumber1 is not null THEN @PhoneNumber1 ELSE  PhoneNumber1 END
, PhoneNumber2 = CASE WHEN @PhoneNumber2 is not null THEN @PhoneNumber2 ELSE  PhoneNumber2 END
, PINumber = CASE WHEN @PINumber is not null THEN @PINumber ELSE  PINumber END
, Name1 = CASE WHEN @Name1 is not null THEN @Name1 ELSE  Name1 END
, Name2 = CASE WHEN @Name2 is not null THEN @Name2 ELSE  Name2 END
, Name3 = CASE WHEN @Name3 is not null THEN @Name3 ELSE  Name3 END
, DOB = CASE WHEN @DOB is not null THEN @DOB ELSE  DOB END
, RecommenderID = CASE WHEN @RecommenderID is not null THEN @RecommenderID ELSE  RecommenderID END
, MemberGroup = CASE WHEN @MemberGroup is not null THEN @MemberGroup ELSE  MemberGroup END
, LastDeviceID = CASE WHEN @LastDeviceID is not null THEN @LastDeviceID ELSE  LastDeviceID END
, LastIPaddress = CASE WHEN @LastIPaddress is not null THEN @LastIPaddress ELSE  LastIPaddress END
, LastLoginDT = CASE WHEN @LastLoginDT is not null THEN @LastLoginDT ELSE  LastLoginDT END
, LastLogoutDT = CASE WHEN @LastLogoutDT is not null THEN @LastLogoutDT ELSE  LastLogoutDT END
, LastMACAddress = CASE WHEN @LastMACAddress is not null THEN @LastMACAddress ELSE  LastMACAddress END
, AccountBlockYN = CASE WHEN @AccountBlockYN is not null THEN @AccountBlockYN ELSE  AccountBlockYN END
, AccountBlockEndDT = CASE WHEN @AccountBlockEndDT is not null THEN @AccountBlockEndDT ELSE  AccountBlockEndDT END
, AnonymousYN = CASE WHEN @AnonymousYN is not null THEN @AnonymousYN ELSE  AnonymousYN END
, [3rdAuthProvider] = CASE WHEN @3rdAuthProvider is not null THEN @3rdAuthProvider ELSE  [3rdAuthProvider] END
, [3rdAuthID] = CASE WHEN @3rdAuthID is not null THEN @3rdAuthID ELSE  [3rdAuthID] END
, [3rdAuthParam] = CASE WHEN @3rdAuthParam is not null THEN @3rdAuthParam ELSE  [3rdAuthParam] END
, PushNotificationID = CASE WHEN @PushNotificationID is not null THEN @PushNotificationID ELSE  PushNotificationID END
, PushNotificationProvider = CASE WHEN @PushNotificationProvider is not null THEN @PushNotificationProvider ELSE  PushNotificationProvider END
, PushNotificationGroup = CASE WHEN @PushNotificationGroup is not null THEN @PushNotificationGroup ELSE  PushNotificationGroup END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
, TimeZoneID = CASE WHEN @TimeZoneID is not null THEN @TimeZoneID ELSE  TimeZoneID END
, UpdatedAt = sysutcdatetime()
where MemberID like @MemberID and MemberPWD like @MemberPWD and HideYN like 'N' and DeleteYN like 'N'
select @@ROWCOUNT as Result

GO

/*
-----------------------------------------------------------------------
EXEC uspUdtLoginInfo 'aaa', 'MemberPWD', 'qqq@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'Name1', 'Name2', 'Name3', 'DOB', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', 'LastLoginDT', 'LastLogoutDT', 'LastMACAddress', 'AccountBlockYN', 'AccountBlockEndDT', 'AnonymousYN', '3rdAuthProvider', '3rdAuthIDaaa', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time'
EXEC uspUdtLoginInfo 'noexists', null, 'xxx@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'Name1', 'Name2', 'Name3', 'DOB', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', 'LastLoginDT', 'LastLogoutDT', 'LastMACAddress', 'AccountBlockYN', 'AccountBlockEndDT', 'AnonymousYN', '3rdAuthProvider', '3rdAuthIDaaaxxx', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time'
-----------------------------------------------------------------------
select * from Members where MemberID like 'aaa'
*/
