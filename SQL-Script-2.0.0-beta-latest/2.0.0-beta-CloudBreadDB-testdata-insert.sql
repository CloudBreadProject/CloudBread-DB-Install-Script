/**
/* Copyright https://github.com/CloudBreadProject */

* @file CloudBreadDB_testdata_insert.sql
* @brief CloudBreadDB test data insert script \n
* CloudBreadDB에 테스트 데이터를 입력하는 스크립트
* @author Dae Woo Kim
*/

--USE master
--go
--sp_who
--kill 51
--drop database CloudBreadDB2;
--create database CloudBreadDB2;
--use CloudBreadDB2
--go

/*
-- encryption CLR
-- only support on SQL Server
EXEC dbo.sp_configure 'clr enabled',1 
RECONFIGURE WITH OVERRIDE
GO

create assembly SQLServerEncryption from 'c:\SQLDLL\SQLCLRCrypt.dll' WITH PERMISSION_SET = SAFE
CREATE FUNCTION [dbo].[ENCRYPT](@plaintext [nvarchar](1000))
RETURNS [nvarchar](2000) WITH EXECUTE AS CALLER
AS
EXTERNAL NAME SQLServerEncryption.[SQLCLRCrypt.SQLCrypt].Enc
GO

select dbo.ENCRYPT('1')
m4R0rUAW4REnW0XPhHfDCw==
*/

/*
--generate column data for queuy syntax
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'


--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'


--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'


--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'

--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'


--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'


--generate column data
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
SELECT ',	@' + COLUMN_NAME + ' ' + data_type +'(' + convert(varchar(10), isnull(CHARACTER_MAXIMUM_LENGTH, ''))  + ')'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
SELECT ',	@' + COLUMN_NAME + '_' + TABLE_NAME + ' ' + data_type +'(MAX)'  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + ' is not null THEN @' + COLUMN_NAME + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
SELECT  ', ' + COLUMN_NAME + ' = CASE WHEN @' + COLUMN_NAME + '_' + TABLE_NAME + ' is not null THEN @' + COLUMN_NAME+ '_' + TABLE_NAME  + ' ELSE  ' + COLUMN_NAME + ' END' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
*/



----------------------------------------------------------------------------------------------------------------
-- insert script start 
----------------------------------------------------------------------------------------------------------------
--Insert Members 
--truncate table Members 
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Members'
INSERT INTO Members (MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('aaa', 'MemberPWD', 'aaa@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'Name1', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'LastMACAddress', 'N', '1900-01-01', 'N', '3rdAuthProvider', '3rdAuthIDaaa', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 'N', 'N', '', '', '', '')
INSERT INTO Members (MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('bbb', 'MemberPWD', 'bbb@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'Name1', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'LastMACAddress', 'N', '1900-01-01', 'N', '3rdAuthProvider', '3rdAuthIDbbb', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 'N', 'N', '', '', '', '')
INSERT INTO Members (MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('ccc', 'MemberPWD', 'ccc@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'Name1', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'LastMACAddress', 'N', '1900-01-01', 'N', '3rdAuthProvider', '3rdAuthIDccc', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 'N', 'N', '', '', '', '')
INSERT INTO Members (MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('ddd', 'MemberPWD', 'ddd@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'Name1', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'LastMACAddress', 'N', '1900-01-01', 'N', '3rdAuthProvider', '3rdAuthIDddd', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 'N', 'N', '', '', '', '')
INSERT INTO Members (MemberID, MemberPWD, EmailAddress, EmailConfirmedYN, PhoneNumber1, PhoneNumber2, PINumber, Name1, Name2, Name3, DOB, RecommenderID, MemberGroup, LastDeviceID, LastIPaddress, LastLoginDT, LastLogoutDT, LastMACAddress, AccountBlockYN, AccountBlockEndDT, AnonymousYN, [3rdAuthProvider], [3rdAuthID], [3rdAuthParam], PushNotificationID, PushNotificationProvider, PushNotificationGroup, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, TimeZoneID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('eee', 'MemberPWD', 'eee@aa.com', 'Y', 'PhoneNumber1', 'PhoneNumber2', 'PINumber', 'Name1', 'Name2', 'Name3', '19900101', 'RecommenderID', 'MemberGroup', 'LastDeviceID', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'LastMACAddress', 'N', '1900-01-01', 'N', '3rdAuthProvider', '3rdAuthIDeee', '3rdAuthParam', 'PushNotificationID', 'PushNotificationProvider', 'PushNotificationGroup', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Korea Standard Time', 'N', 'N', '', '', '', '')
--select * from Members

--Insert ItemLists 
--truncate table ItemLists 
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ItemLists'
INSERT INTO ItemLists (ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, IteamCreateAdminID, IteamUpdateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES('itemid1', 'ItemName1', 'ItemDescription', '10', '10', 'ItemCategory1', 'ItemCategory2', 'ItemCategory3', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'IteamCreateAdminID', 'IteamUpdateAdminID', 'N', 'N', '', '', '', '')
INSERT INTO ItemLists (ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, IteamCreateAdminID, IteamUpdateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES('itemid2', 'ItemName2', 'ItemDescription', '20', '10', 'ItemCategory1', 'ItemCategory2', 'ItemCategory3', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'IteamCreateAdminID', 'IteamUpdateAdminID', 'N', 'N', '', '', '', '')
INSERT INTO ItemLists (ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, IteamCreateAdminID, IteamUpdateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES('itemid3', 'ItemName3', 'ItemDescription', '30', '10', 'ItemCategory1', 'ItemCategory2', 'ItemCategory3', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'IteamCreateAdminID', 'IteamUpdateAdminID', 'N', 'N', '', '', '', '')
INSERT INTO ItemLists (ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, IteamCreateAdminID, IteamUpdateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES('itemid4', 'ItemName4', 'ItemDescription', '40', '10', 'ItemCategory1', 'ItemCategory2', 'ItemCategory3', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'IteamCreateAdminID', 'IteamUpdateAdminID', 'N', 'N', '', '', '', '')
--select * from ItemLists

--GiftDepositories table
--truncate table GiftDepositories
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GiftDepositories'
INSERT INTO GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, SentMemberYN, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES (newid(), 'A2C03A61-41C8-496C-823B-F7B2255DE55D', '1', 'bbb', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'N', '', '', '', '')
INSERT INTO GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, SentMemberYN, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES (newid(), 'A2C03A61-41C8-496C-823B-F7B2255DE55D', '2', 'ccc', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'N', '', '', '', '')
INSERT INTO GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, SentMemberYN, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES (newid(), 'C21BA95D-B736-4123-8531-75B7C5E8C906', '3', 'bbb', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'N', '', '', '', '')
INSERT INTO GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, SentMemberYN, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES (newid(), '5395E0E0-9C9F-4A5E-995E-668C7E5B1415', '4', 'ccc', 'bbb', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'N', '', '', '', '')
--select * from GiftDepositories

--MemberItems table
--truncate table MemberItems
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItems'
INSERT INTO MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'aaa', 'A2C03A61-41C8-496C-823B-F7B2255DE55D', '1', 'ItemStatus', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'aaa', 'C21BA95D-B736-4123-8531-75B7C5E8C906', '1', 'ItemStatus', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'aaa', 'C21BA95D-B736-4123-8531-75B7C5E8C906', '1', 'ItemStatus', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'bbb', 'A2C03A61-41C8-496C-823B-F7B2255DE55D', '1', 'ItemStatus', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
--select * from MemberItems

--MemberGameInfoes table
--truncate table MemberGameInfoes
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoes'
INSERT INTO MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('aaa', '10', '10', '10', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('bbb', '20', '20', '20', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('ccc', '30', '30', '30', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoes(MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('ddd', '40', '40', '40', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
--select * from MemberGameInfoes

-- MemberItemPurchases table
--truncate table MemberItemPurchases
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberItemPurchases'
INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES (newid(), 'aaa', 'A2C03A61-41C8-496C-823B-F7B2255DE55D', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', 100, 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')
INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES (newid(), 'aaa', 'C21BA95D-B736-4123-8531-75B7C5E8C906', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', 100, 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')
INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES (newid(), 'aaa', '5395E0E0-9C9F-4A5E-995E-668C7E5B1415', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', 100, 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')
INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES (newid(), 'ccc', 'A2C03A61-41C8-496C-823B-F7B2255DE55D', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', 100, 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')
--select * from MemberItems
--select * from MemberItemPurchases

--AdminMembers table
--truncate table AdminMembers
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'AdminMembers'
INSERT INTO AdminMembers
(AdminMemberID, AdminMemberPWD, AdminMemberEmail, IDCreateAdminMember, AdminGroup, TimeZoneID, PINumber, Name1, Name2, Name3, DOB, LastIPaddress, LastLoginDT, LastLogoutDT, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('admin1', 'AdminMemberPWD', 'admin1@abc.com', 'admin1', 'AdminGroup', 'Korea Standard Time', 'PINumber', 'Name1', 'Name2', 'Name3', '19991212', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO AdminMembers
(AdminMemberID, AdminMemberPWD, AdminMemberEmail, IDCreateAdminMember, AdminGroup, TimeZoneID, PINumber, Name1, Name2, Name3, DOB, LastIPaddress, LastLoginDT, LastLogoutDT, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('admin2', 'AdminMemberPWD', 'admin2@abc.com', 'admin1', 'AdminGroup', 'Korea Standard Time', 'PINumber', 'Name1', 'Name2', 'Name3', '19991212', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO AdminMembers
(AdminMemberID, AdminMemberPWD, AdminMemberEmail, IDCreateAdminMember, AdminGroup, TimeZoneID, PINumber, Name1, Name2, Name3, DOB, LastIPaddress, LastLoginDT, LastLogoutDT, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('admin3', 'AdminMemberPWD', 'admin3@abc.com', 'admin2', 'AdminGroup', 'Korea Standard Time', 'PINumber', 'Name1', 'Name2', 'Name3', '19991212', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO AdminMembers
(AdminMemberID, AdminMemberPWD, AdminMemberEmail, IDCreateAdminMember, AdminGroup, TimeZoneID, PINumber, Name1, Name2, Name3, DOB, LastIPaddress, LastLoginDT, LastLogoutDT, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('admin4', 'AdminMemberPWD', 'admin4@abc.com', 'admin2', 'AdminGroup', 'Korea Standard Time', 'PINumber', 'Name1', 'Name2', 'Name3', '19991212', 'LastIPaddress', SYSUTCDATETIME(), SYSUTCDATETIME(), 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
--select * from AdminMembers

--MemberGameInfoStages table
--truncate table MemberGameInfoStages
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberGameInfoStages'
INSERT INTO MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'aaa', 'StageName', 'StageStatus', 'Category1', 'Category2', 'Category3', 'Mission1', 'Mission2', 'Mission3', 'Mission4', 'Mission5', 100, 'StageStat1', 'StageStat2', 'StageStat3', 'StageStat4', 'StageStat5', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'aaa', 'StageName', 'StageStatus', 'Category1', 'Category2', 'Category3', 'Mission1', 'Mission2', 'Mission3', 'Mission4', 'Mission5', 100, 'StageStat1', 'StageStat2', 'StageStat3', 'StageStat4', 'StageStat5', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'aaa', 'StageName', 'StageStatus', 'Category1', 'Category2', 'Category3', 'Mission1', 'Mission2', 'Mission3', 'Mission4', 'Mission5', 100, 'StageStat1', 'StageStat2', 'StageStat3', 'StageStat4', 'StageStat5', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
INSERT INTO MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'bbb', 'StageName', 'StageStatus', 'Category1', 'Category2', 'Category3', 'Mission1', 'Mission2', 'Mission3', 'Mission4', 'Mission5', 100, 'StageStat1', 'StageStat2', 'StageStat3', 'StageStat4', 'StageStat5', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
--select * from MemberGameInfoStages

--Notices table
--truncate table Notices
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Notices'
insert into Notices(NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, NoticeDurationFrom, NoticeDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'NoticeCategory1', 'NoticeCategory2', 'NoticeCategory3', 'TargetGroup', 'TargetOS', 'TargetDevice', 'NoticeImageLink', 'title1', 'content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into Notices(NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, NoticeDurationFrom, NoticeDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'NoticeCategory1', 'NoticeCategory2', 'NoticeCategory3', 'TargetGroup', 'TargetOS', 'TargetDevice', 'NoticeImageLink', 'title2', 'content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into Notices(NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, NoticeDurationFrom, NoticeDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'NoticeCategory1', 'NoticeCategory2', 'NoticeCategory3', 'TargetGroup', 'TargetOS', 'TargetDevice', 'NoticeImageLink', 'title3', 'content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into Notices(NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, NoticeDurationFrom, NoticeDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'NoticeCategory1', 'NoticeCategory2', 'NoticeCategory3', 'TargetGroup', 'TargetOS', 'TargetDevice', 'NoticeImageLink', 'title4', 'content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
--select * from Notices

--GameEvents table
--truncate table GameEvents
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEvents'
insert into GameEvents(GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, EventDurationFrom, EventDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('evtid1', 'EventCategory1', 'EventCategory2', 'EventCategory3', 'itemid1', 1, 'Itemstatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'EventImageLink', 'Title1', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into GameEvents(GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, EventDurationFrom, EventDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('evtid2', 'EventCategory1', 'EventCategory2', 'EventCategory3', 'itemid2', 2, 'Itemstatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'EventImageLink', 'Title2', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into GameEvents(GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, EventDurationFrom, EventDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('evtid3', 'EventCategory1', 'EventCategory2', 'EventCategory3', 'itemid3', 3, 'Itemstatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'EventImageLink', 'Title3', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
insert into GameEvents(GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, EventDurationFrom, EventDurationTo, OrderNumber, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('evtid4', 'EventCategory1', 'EventCategory2', 'EventCategory3', 'itemid4', 4, 'Itemstatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'EventImageLink', 'Title4', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', '2015-03-01', '2025-04-01', 0, 'admin1', 'N', 'N', '', '', '', '')
--select * from GameEvents
--select * from itemlists

--GameEventMember  table
--truncate table GameEventMember
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'GameEventMember'
insert into GameEventMember(GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'evtid1', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '' )
insert into GameEventMember(GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'evtid2', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '' )
insert into GameEventMember(GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'evtid3', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '' )
insert into GameEventMember(GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'evtid2', 'bbb', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '' )
--SELECT * FROM GameEventMember

--Coupon  table
--truncate table Coupon
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'Coupon'
insert into Coupon(CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, DupeYN, OrderNumber, CouponDurationFrom, CouponDurationTo, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('cpid1', 'CouponCategory1', 'CouponCategory2', 'CouponCategory3', 'itemid1', '1', 'ItemStatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'Title1', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 0, '2015-03-01', '2015-04-01', 'admin1', 'N', 'N', '', '', '', '')
insert into Coupon(CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, DupeYN, OrderNumber, CouponDurationFrom, CouponDurationTo, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('cpid2', 'CouponCategory1', 'CouponCategory2', 'CouponCategory3', 'itemid2', '2', 'ItemStatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'Title2', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Y', 0, '2015-03-01', '2015-04-01', 'admin1', 'N', 'N', '', '', '', '')
insert into Coupon(CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, DupeYN, OrderNumber, CouponDurationFrom, CouponDurationTo, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('cpid3', 'CouponCategory1', 'CouponCategory2', 'CouponCategory3', 'itemid3', '3', 'ItemStatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'Title3', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 0, '2015-03-01', '2015-04-01', 'admin1', 'N', 'N', '', '', '', '')
insert into Coupon(CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, DupeYN, OrderNumber, CouponDurationFrom, CouponDurationTo, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values('cpid4', 'CouponCategory1', 'CouponCategory2', 'CouponCategory3', 'itemid4', '4', 'ItemStatus', 'TargetGroup', 'TargetOS', 'TargetDevice', 'Title4', 'Content', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'Y', 0, '2015-03-01', '2015-04-01', 'admin1', 'N', 'N', '', '', '', '')
--select * from Coupon
--select * from itemlists

--CouponMember  table
--truncate table Coupon
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'CouponMember'
insert into CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'cpid1', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
insert into CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'cpid2', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
insert into CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'cpid3', 'aaa', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
insert into CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'cpid4', 'bbb', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', '', '', '', '')
--select * from CouponMember
--select * from Coupon
--select * from Members

--MemberAccountBlockLog  table
--SELECT * FROM MemberAccountBlockLog
--truncate table MemberAccountBlockLog
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'MemberAccountBlockLog'
insert into MemberAccountBlockLog(MemberAccountBlockID, MemberID, MemberAccountBlockReasonCategory1, MemberAccountBlockReasonCategory2, MemberAccountBlockReasonCategory3, MemberAccountBlockReason, MemberAccountBlockProcess, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'ddd', 'cheater', 'MemberAccountBlockReasonCategory2', 'MemberAccountBlockReasonCategory3', 'MemberAccountBlockReason', 'blocks tart', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'admin1', 'N', 'N', '', '', '', '')
insert into MemberAccountBlockLog(MemberAccountBlockID, MemberID, MemberAccountBlockReasonCategory1, MemberAccountBlockReasonCategory2, MemberAccountBlockReasonCategory3, MemberAccountBlockReason, MemberAccountBlockProcess, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'ccc', 'cheater', 'MemberAccountBlockReasonCategory2', 'MemberAccountBlockReasonCategory3', 'MemberAccountBlockReason', 'block end', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'admin1', 'N', 'N', '', '', '', '')
insert into MemberAccountBlockLog(MemberAccountBlockID, MemberID, MemberAccountBlockReasonCategory1, MemberAccountBlockReasonCategory2, MemberAccountBlockReasonCategory3, MemberAccountBlockReason, MemberAccountBlockProcess, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'ddd', 'cheater', 'MemberAccountBlockReasonCategory2', 'MemberAccountBlockReasonCategory3', 'MemberAccountBlockReason', 'block canceled', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'admin1', 'N', 'N', '', '', '', '')
insert into MemberAccountBlockLog(MemberAccountBlockID, MemberID, MemberAccountBlockReasonCategory1, MemberAccountBlockReasonCategory2, MemberAccountBlockReasonCategory3, MemberAccountBlockReason, MemberAccountBlockProcess, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, CreateAdminID, HideYN, DeleteYN, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'ddd', 'cheater', 'MemberAccountBlockReasonCategory2', 'MemberAccountBlockReasonCategory3', 'MemberAccountBlockReason', 'account delete', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'admin1', 'N', 'N', '', '', '', '')
--select * from MemberAccountBlockLog

--ServerInfo  table
--SELECT * FROM ServerInfo
--truncate table ServerInfo
--SELECT COLUMN_NAME + ', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ServerInfo'
--SELECT '''' + COLUMN_NAME + ''', ' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'ServerInfo'
insert into ServerInfo(InfoID, FEServerLists, SocketServerLists, [Version], ResourceLink, EULAText, sCol1, sCol2, sCol3, sCol4, sCol5, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'FEServerLists', 'SocketServerLists', '1.0', 'ResourceLink', 'EULAText', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', '1900-01-01', '1900-01-01', '', '1900-01-01')
insert into ServerInfo(InfoID, FEServerLists, SocketServerLists, [Version], ResourceLink, EULAText, sCol1, sCol2, sCol3, sCol4, sCol5, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'frontend1,frontend2', 'socketserver1,socketserver2', '1.2', 'bloblink', 'EULA', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', '1900-01-01', '1900-01-01', '', '1900-01-01')
insert into ServerInfo(InfoID, FEServerLists, SocketServerLists, [Version], ResourceLink, EULAText, sCol1, sCol2, sCol3, sCol4, sCol5, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
values(newid(), 'webserver1, webserver2', 'tcpserver1, tcpserver2', '1.0', 'ResourceLink', 'EULAText', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', '1900-01-01', '1900-01-01', '', '1900-01-01')
--SELECT * FROM ServerInfo

----------------------------------------------------------------------------------------------------------------
-- insert script end 
----------------------------------------------------------------------------------------------------------------
