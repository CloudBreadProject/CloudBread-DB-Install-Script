--DROP PROC uspInsRegMember
CREATE PROC uspInsRegMember
	@MemberID_Members nvarchar(MAX)
,	@MemberPWD_Members nvarchar(MAX)
,	@EmailAddress_Members nvarchar(MAX)
,	@EmailConfirmedYN_Members nvarchar(MAX)
,	@PhoneNumber1_Members nvarchar(MAX)
,	@PhoneNumber2_Members nvarchar(MAX)
,	@PINumber_Members nvarchar(MAX)
,	@Name1_Members nvarchar(MAX)
,	@Name2_Members nvarchar(MAX)
,	@Name3_Members nvarchar(MAX)
,	@DOB_Members nvarchar(MAX)
,	@RecommenderID_Members nvarchar(MAX)
,	@MemberGroup_Members nvarchar(MAX)
,	@LastDeviceID_Members nvarchar(MAX)
,	@LastIPaddress_Members nvarchar(MAX)
,	@LastLoginDT_Members nvarchar(MAX)
,	@LastLogoutDT_Members nvarchar(MAX)
,	@LastMACAddress_Members nvarchar(MAX)
,	@AccountBlockYN_Members nvarchar(MAX)
,	@AccountBlockEndDT_Members nvarchar(MAX)
,	@AnonymousYN_Members nvarchar(MAX)
,	@3rdAuthProvider_Members nvarchar(MAX)
,	@3rdAuthID_Members nvarchar(MAX)
,	@3rdAuthParam_Members nvarchar(MAX)
,	@PushNotificationID_Members nvarchar(MAX)
,	@PushNotificationProvider_Members nvarchar(MAX)
,	@PushNotificationGroup_Members nvarchar(MAX)
,	@sCol1_Members nvarchar(MAX)
,	@sCol2_Members nvarchar(MAX)
,	@sCol3_Members nvarchar(MAX)
,	@sCol4_Members nvarchar(MAX)
,	@sCol5_Members nvarchar(MAX)
,	@sCol6_Members nvarchar(MAX)
,	@sCol7_Members nvarchar(MAX)
,	@sCol8_Members nvarchar(MAX)
,	@sCol9_Members nvarchar(MAX)
,	@sCol10_Members nvarchar(MAX)
,	@TimeZoneID_Members nvarchar(MAX)		-- no-encryption

,	@Level_MemberGameInfoes nvarchar(MAX)
,	@Exps_MemberGameInfoes nvarchar(MAX)
,	@Points_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT1_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT2_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT3_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT4_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT5_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT6_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT7_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT8_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT9_MemberGameInfoes nvarchar(MAX)
,	@UserSTAT10_MemberGameInfoes nvarchar(MAX)
,	@sCol1_MemberGameInfoes nvarchar(MAX)
,	@sCol2_MemberGameInfoes nvarchar(MAX)
,	@sCol3_MemberGameInfoes nvarchar(MAX)
,	@sCol4_MemberGameInfoes nvarchar(MAX)
,	@sCol5_MemberGameInfoes nvarchar(MAX)
,	@sCol6_MemberGameInfoes nvarchar(MAX)
,	@sCol7_MemberGameInfoes nvarchar(MAX)
,	@sCol8_MemberGameInfoes nvarchar(MAX)
,	@sCol9_MemberGameInfoes nvarchar(MAX)
,	@sCol10_MemberGameInfoes nvarchar(MAX)
AS 
--set, lock 옵션 등 체크
SET NOCOUNT ON
SET XACT_ABORT ON
DECLARE @rowcount as int
SET @rowcount = 0
begin tran
insert into Members(MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID) 
values(@MemberID_Members,@MemberPWD_Members,@EmailAddress_Members,@EmailConfirmedYN_Members,@PhoneNumber1_Members,@PhoneNumber2_Members,@PINumber_Members,@Name1_Members,@Name2_Members,@Name3_Members,@DOB_Members,@RecommenderID_Members,@MemberGroup_Members,@LastDeviceID_Members,@LastIPaddress_Members,@LastLoginDT_Members,@LastLogoutDT_Members,@LastMACAddress_Members,@AccountBlockYN_Members,@AccountBlockEndDT_Members,@AnonymousYN_Members,@3rdAuthProvider_Members,@3rdAuthID_Members,@3rdAuthParam_Members,@PushNotificationID_Members,@PushNotificationProvider_Members,@PushNotificationGroup_Members,@sCol1_Members,@sCol2_Members,@sCol3_Members,@sCol4_Members,@sCol5_Members,@sCol6_Members,@sCol7_Members,@sCol8_Members,@sCol9_Members,@sCol10_Members,@TimeZoneID_Members)
SET @rowcount = @rowcount + @@ROWCOUNT
insert into MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10) 
values(@MemberID_Members, @Level_MemberGameInfoes,@Exps_MemberGameInfoes,@Points_MemberGameInfoes,@UserSTAT1_MemberGameInfoes,@UserSTAT2_MemberGameInfoes,@UserSTAT3_MemberGameInfoes,@UserSTAT4_MemberGameInfoes,@UserSTAT5_MemberGameInfoes,@UserSTAT6_MemberGameInfoes,@UserSTAT7_MemberGameInfoes,@UserSTAT8_MemberGameInfoes,@UserSTAT9_MemberGameInfoes,@UserSTAT10_MemberGameInfoes,@sCol1_MemberGameInfoes,@sCol2_MemberGameInfoes,@sCol3_MemberGameInfoes,@sCol4_MemberGameInfoes,@sCol5_MemberGameInfoes,@sCol6_MemberGameInfoes,@sCol7_MemberGameInfoes,@sCol8_MemberGameInfoes,@sCol9_MemberGameInfoes,@sCol10_MemberGameInfoes)
SET @rowcount = @rowcount + @@ROWCOUNT
commit tran
SELECT @rowcount as Result
GO

/*
-----------------------------------------------------------------------
EXEC uspInsRegMember 
'hhh', 'MemberPWD', 'hhh@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'Name1', 'Name2', 'Name3', 'DOB', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', 'LastLoginDT', 'LastLogoutDT', 'LastMACAddress', 'AccountBlockYN', 'AccountBlockEndDT', 'AnonymousYN', '3rdAuthProvider', '3rdAuthIDggg', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 
'60', '10', '10', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'

select * from Members
select * from MemberGameInfoes

-----------------------------------------------------------------------
*/
