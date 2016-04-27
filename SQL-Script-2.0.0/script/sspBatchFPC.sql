--drop proc sspBatchFPC -- First Purchase Conversion
create proc sspBatchFPC
as
set nocount on
declare @Day2DT datetimeoffset(7)
declare @Day7DT datetimeoffset(7)
declare @Day15DT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)

declare @nowdt datetime

declare @AllPayUser bigint
declare @FPC2 bigint -- user who purchased for the first time within 2 days
declare @FPC7 bigint -- 7 days
declare @FPC15 bigint -- 15 days

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0 )))
set @Day2DT = (dateadd(day, -2, @CurrentDT))
set @Day7DT = (dateadd(day, -7, @CurrentDT))
set @Day15DT = (dateadd(day, -15, @CurrentDT))

set @AllPayUser = (select count(DISTINCT MemberID) from MemberItemPurchases)
set @FPC2 = @AllPayUser - (select count(DISTINCT MemberID) from MemberItemPurchases where MemberID in (select MemberID from MemberItemPurchases where PurchaseDT < @day2DT group by MemberID))
set @FPC7 = @AllPayUser - (select count(DISTINCT MemberID) from MemberItemPurchases where MemberID in (select MemberID from MemberItemPurchases where PurchaseDT < @day7DT group by MemberID)) - @FPC2
set @FPC15 = @AllPayUser - (select count(DISTINCT MemberID) from MemberItemPurchases where MemberID in (select MemberID from MemberItemPurchases where PurchaseDT < @day15DT group by MemberID)) - @FPC7 -@FPC2

insert into StatsData(CategoryName, CountNum, Fields, Groups) values('FPC2', @FPC2, CONVERT(nvarchar(8), GETUTCDATE(), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('FPC7', @FPC7, CONVERT(nvarchar(8), GETUTCDATE(), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('FPC15', @FPC15, CONVERT(nvarchar(8), GETUTCDATE(), 112), '')
GO

------------------------------------------------------------------
-- run test
--exec sspBatchFPC
------------------------------------------------------------------

/*
select * from StatsData order by createdat desc
select * from Members
select * from MemberItemPurchases

-- test data value
update MemberItemPurchases set PurchaseDT = sysutcdatetime() where memberid like 'aaa'
update MemberItemPurchases set PurchaseDT = sysutcdatetime() where memberid like 'ccc'

select sysutcdatetime()
select dateadd(day, -1, sysutcdatetime()) 
select CONVERT(nvarchar(20), getutcdate(), 112)

declare @nowdt datetime
set @nowdt = (select getutcdate())
SELECT DATEPART(year, @nowdt) + '-' + DATEPART(month,@nowdt) + '-' +  DATEPART(day, @nowdt);
SELECT convert(datetime, getutcdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm 
------------------------------------------------------------------
-- run test
--exec sspBatchFPC
------------------------------------------------------------------

/*
select * from StatsData order by createdat desc
select * from Members
select * from MemberItemPurchases

-- test data value
update MemberItemPurchases set PurchaseDT = sysutcdatetime() where memberid like 'aaa'
update MemberItemPurchases set PurchaseDT = sysutcdatetime() where memberid like 'ccc'

select sysutcdatetime()
select dateadd(day, -1, sysutcdatetime()) 
select CONVERT(nvarchar(20), getutcdate(), 112)

declare @nowdt datetime
set @nowdt = (select getutcdate())
SELECT DATEPART(year, @nowdt) + '-' + DATEPART(month,@nowdt) + '-' +  DATEPART(day, @nowdt);
SELECT convert(datetime, getutcdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm 

--test FPC 2, 7, 15
declare @CurrentDT datetimeoffset(7)

declare @nowdt datetime
declare @test2DT datetimeoffset(7)
declare @test7DT datetimeoffset(7)
declare @test15DT datetimeoffset(7)

declare @day2DT datetimeoffset(7)
declare @day7DT datetimeoffset(7)
declare @day15DT datetimeoffset(7)

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0 )))

set @day2DT = (dateadd(day, -2, @CurrentDT))
set @day7DT = (dateadd(day, -7, @CurrentDT))
set @day15DT = (dateadd(day, -15, @CurrentDT))

set @test2DT = (dateadd(day, -1, @CurrentDT))
set @test7DT = (dateadd(day, -6, @CurrentDT))
set @test15DT = (dateadd(day, -13, @CurrentDT))

INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('MemberItemPurchasesID5', 'bbb', 'itemid1', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', '100', 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')
INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('MemberItemPurchasesID6', 'bbb', 'itemid2', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', '100', 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')
INSERT INTO MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10, HideYN, DeleteYN, PurchaseCancelConfirmAdminMemberID, CreatedAt, UpdatedAt, DataFromRegion, DataFromRegionDT)
VALUES ('MemberItemPurchasesID7', 'bbb', 'itemid3', '10', '10', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', SYSUTCDATETIME(), 'N', '1900-01-01', 'ok', '100', 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10', 'N', 'N', 'admin1', SYSUTCDATETIME(), SYSUTCDATETIME(), '', '1900-01-01')

update MemberItemPurchases set PurchaseDT = @test2DT where MemberID like 'ccc'
update MemberItemPurchases set PurchaseDT = @test15DT where MemberID like 'aaa'
update MemberItemPurchases set PurchaseDT = @test15DT where MemberID like 'bbb'
update MemberItemPurchases set PurchaseDT = @test7DT where ItemListID like 'itemid3'

--All of purchased member
select count(DISTINCT MemberID) from MemberItemPurchases

--Test the purchased member within date
(select count(DISTINCT MemberID) from MemberItemPurchases where MemberID in (select MemberID from MemberItemPurchases where PurchaseDT < @day15DT group by MemberID))
(select count(DISTINCT MemberID) from MemberItemPurchases where MemberID in (select MemberID from MemberItemPurchases where PurchaseDT < @day7DT group by MemberID))
(select count(DISTINCT MemberID) from MemberItemPurchases where MemberID in (select MemberID from MemberItemPurchases where PurchaseDT < @day2DT group by MemberID))

select * from MemberItemPurchases
select * from Members
*/