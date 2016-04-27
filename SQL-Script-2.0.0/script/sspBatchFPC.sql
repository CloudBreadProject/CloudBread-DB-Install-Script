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

*/