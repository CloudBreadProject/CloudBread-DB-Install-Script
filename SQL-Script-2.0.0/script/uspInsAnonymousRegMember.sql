--DROP PROC uspInsAnonymousRegMember
CREATE PROC uspInsAnonymousRegMember
 @MembersMemberID nvarchar(MAX) = NULL
,@MembersMemberPWD nvarchar(MAX) = NULL		--deplicated in v2.0.0-beta
,@MembersEmailAddress nvarchar(MAX) = NULL
,@MembersEmailConfirmedYN nvarchar(MAX) = NULL
,@MembersPhoneNumber1 nvarchar(MAX) = NULL
,@MembersPhoneNumber2 nvarchar(MAX) = NULL
,@MembersPINumber nvarchar(MAX) = NULL
,@MembersName1 nvarchar(MAX) = NULL
,@MembersName2 nvarchar(MAX) = NULL
,@MembersName3 nvarchar(MAX) = NULL
,@MembersDOB nvarchar(MAX) = NULL
,@MembersRecommenderID nvarchar(MAX) = NULL
,@MembersMemberGroup nvarchar(MAX) = NULL
,@MembersLastDeviceID nvarchar(MAX) = NULL
,@MembersLastIPaddress nvarchar(MAX) = NULL
,@MembersLastLoginDT nvarchar(MAX) = NULL
,@MembersLastLogoutDT nvarchar(MAX) = NULL
,@MembersLastMACAddress nvarchar(MAX) = NULL
,@MembersAccountBlockYN nvarchar(MAX) = NULL
,@MembersAccountBlockEndDT nvarchar(MAX) = NULL
,@MembersAnonymousYN nvarchar(MAX) = NULL		--Set Y to configuration
,@Members3rdAuthProvider nvarchar(MAX) = NULL
,@Members3rdAuthID nvarchar(MAX) = NULL
,@Members3rdAuthParam nvarchar(MAX) = NULL
,@MembersPushNotificationID nvarchar(MAX) = NULL
,@MembersPushNotificationProvider nvarchar(MAX) = NULL
,@MembersPushNotificationGroup nvarchar(MAX) = NULL
,@MemberssCol1 nvarchar(MAX) = NULL
,@MemberssCol2 nvarchar(MAX) = NULL
,@MemberssCol3 nvarchar(MAX) = NULL
,@MemberssCol4 nvarchar(MAX) = NULL
,@MemberssCol5 nvarchar(MAX) = NULL
,@MemberssCol6 nvarchar(MAX) = NULL
,@MemberssCol7 nvarchar(MAX) = NULL
,@MemberssCol8 nvarchar(MAX) = NULL
,@MemberssCol9 nvarchar(MAX) = NULL
,@MemberssCol10 nvarchar(MAX) = NULL
,@MembersTimeZoneID nvarchar(MAX) = NULL
,@MemberGameInfoesLevel nvarchar(MAX) = NULL
,@MemberGameInfoesExps nvarchar(MAX) = NULL
,@MemberGameInfoesPoints nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT1 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT2 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT3 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT4 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT5 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT6 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT7 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT8 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT9 nvarchar(MAX) = NULL
,@MemberGameInfoesUserSTAT10 nvarchar(MAX) = NULL
,@MemberGameInfoessCol1 nvarchar(MAX) = NULL
,@MemberGameInfoessCol2 nvarchar(MAX) = NULL
,@MemberGameInfoessCol3 nvarchar(MAX) = NULL
,@MemberGameInfoessCol4 nvarchar(MAX) = NULL
,@MemberGameInfoessCol5 nvarchar(MAX) = NULL
,@MemberGameInfoessCol6 nvarchar(MAX) = NULL
,@MemberGameInfoessCol7 nvarchar(MAX) = NULL
,@MemberGameInfoessCol8 nvarchar(MAX) = NULL
,@MemberGameInfoessCol9 nvarchar(MAX) = NULL
,@MemberGameInfoessCol10 nvarchar(MAX) = NULL
AS 
--set, lock option check
SET NOCOUNT ON
SET XACT_ABORT ON
DECLARE @rowcount as int
SET @rowcount = 0
begin tran
insert into Members(MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID) 
values(@MembersMemberID, @MembersMemberPWD, @MembersEmailAddress, @MembersEmailConfirmedYN, @MembersPhoneNumber1, @MembersPhoneNumber2, @MembersPINumber, @MembersName1, @MembersName2, @MembersName3, @MembersDOB, @MembersRecommenderID, @MembersMemberGroup, @MembersLastDeviceID, @MembersLastIPaddress, @MembersLastLoginDT, @MembersLastLogoutDT, @MembersLastMACAddress, @MembersAccountBlockYN, @MembersAccountBlockEndDT, @MembersAnonymousYN, @Members3rdAuthProvider, @Members3rdAuthID, @Members3rdAuthParam, @MembersPushNotificationID, @MembersPushNotificationProvider, @MembersPushNotificationGroup, @MemberssCol1, @MemberssCol2, @MemberssCol3, @MemberssCol4, @MemberssCol5, @MemberssCol6, @MemberssCol7, @MemberssCol8, @MemberssCol9, @MemberssCol10, @MembersTimeZoneID)
SET @rowcount = @rowcount + @@ROWCOUNT
insert into MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10) 
values(@MembersMemberID, @MemberGameInfoesLevel, @MemberGameInfoesExps, @MemberGameInfoesPoints, @MemberGameInfoesUserSTAT1, @MemberGameInfoesUserSTAT2, @MemberGameInfoesUserSTAT3, @MemberGameInfoesUserSTAT4, @MemberGameInfoesUserSTAT5, @MemberGameInfoesUserSTAT6, @MemberGameInfoesUserSTAT7, @MemberGameInfoesUserSTAT8, @MemberGameInfoesUserSTAT9, @MemberGameInfoesUserSTAT10, @MemberGameInfoessCol1, @MemberGameInfoessCol2, @MemberGameInfoessCol3, @MemberGameInfoessCol4, @MemberGameInfoessCol5, @MemberGameInfoessCol6, @MemberGameInfoessCol7, @MemberGameInfoessCol8, @MemberGameInfoessCol9, @MemberGameInfoessCol10)
SET @rowcount = @rowcount + @@ROWCOUNT
commit tran
SELECT @rowcount as Result
GO

/*

-----------------------------------------------------------------------
EXEC uspInsAnonymousRegMember 'AnonMemberID1', 'AnonMemberPWD', 'anon@anon.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'Name1', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', '2016-01-01 00:00:00.0000000 +00:00', '2016-01-01 00:00:00.0000000 +00:00', 'LastMACAddress', 'N', '1900-01-01', 'Y', '3rdAuthProvider', '3rdAuthIDaaa', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', '10', '10', '10', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
-----------------------------------------------------------------------
select * from Members
select * from MemberGameInfoes

*/
