--drop proc sspBatchWPU  -- Weekly Paying User
create proc sspBatchWPU
as
set nocount on
declare @Day7DT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
declare @nowdt datetime
declare @WPU bigint

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0 )))
set @Day7DT = (dateadd(day, -7, @CurrentDT))

set @WPU = (select count(*) from MemberItemPurchases where PurchaseDT between @Day7DT and @CurrentDT AND PurchaseCancelYN like 'N')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('WPU', @WPU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
GO


------------------------------------------------------------------
-- run test
--exec sspBatchWPU
------------------------------------------------------------------

/*
select * from StatsData order by createdat desc
select * from Members
select * from MemberItemPurchases
select count(*) from MemberItemPurchases where PurchaseDT between '2016-05-15 15:00:03.1749825 +00:00' and sysutcdatetime()

-- test data value
update Members set LastLoginDT = sysutcdatetime() where memberid like 'bbb'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'ccc'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'ddd'

select sysutcdatetime()
select dateadd(day, -7, sysutcdatetime()) 
select CONVERT(nvarchar(20), getutcdate(), 112)

declare @nowdt datetime
set @nowdt = (select getutcdate())
SELECT DATEPART(year, @nowdt) + '-' + DATEPART(month,@nowdt) + '-' +  DATEPART(day, @nowdt);
SELECT convert(datetime, getutcdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm 

------------------------------------------------------------------
-- run test
--exec sspBatchWPU
------------------------------------------------------------------

/*
select * from StatsData order by createdat desc
select * from Members
select * from MemberItemPurchases
select count(*) from MemberItemPurchases where PurchaseDT between '2016-05-15 15:00:03.1749825 +00:00' and sysutcdatetime()

-- test data value
update Members set LastLoginDT = sysutcdatetime() where memberid like 'bbb'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'ccc'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'ddd'

select sysutcdatetime()
select dateadd(day, -7, sysutcdatetime()) 
select CONVERT(nvarchar(20), getutcdate(), 112)

declare @nowdt datetime
set @nowdt = (select getutcdate())
SELECT DATEPART(year, @nowdt) + '-' + DATEPART(month,@nowdt) + '-' +  DATEPART(day, @nowdt);
SELECT convert(datetime, getutcdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm 

--test payNumber
declare @nowdt datetime
declare @CurrentDT datetimeoffset(7)
declare @testdt datetimeoffset(7)

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0,0 )))
set @testdt = (dateadd(day, -6, @CurrentDT))

update MemberItemPurchases set PurchaseDT = @testdt where memberid like 'ccc'
exec sspBatchWPU
select * from StatsData where CategoryName like 'WPU' order by createdat desc
select * from MemberItemPurchases
*/
