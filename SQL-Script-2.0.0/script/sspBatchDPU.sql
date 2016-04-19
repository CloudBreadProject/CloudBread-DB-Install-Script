--drop proc sspBatchDPU  -- Daily Paying User
create proc sspBatchDPU
as
set nocount on
declare @TodayDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
declare @nowdt datetime
declare @DPU bigint

set @nowdt = (select getutcdate())
set @TodayDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), 0, 0, 0, 0 )))
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0 )))

set @DPU = (select count(*) from MemberItemPurchases where PurchaseDT between @TodayDT and @CurrentDT)
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DPU', @DPU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
GO

------------------------------------------------------------------
-- run test
--exec sspBatchDPU
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
select dateadd(day, -1, sysutcdatetime()) 
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
set @testdt = (dateadd(hour, -14, @CurrentDT))

update MemberItemPurchases set PurchaseDT = @testdt where memberid like 'ccc'
exec sspBatchDPU
select * from StatsData where CategoryName like 'DPU' order by createdat desc
select * from MemberItemPurchases
*/