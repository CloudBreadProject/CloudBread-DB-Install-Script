--drop proc sspBatchFPU  -- First-time Paying User
create proc sspBatchFPU
as
set nocount on
declare @LastRunDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)

declare @nowdt datetime

declare @FPU bigint

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0 )))
set @LastRunDT = (dateadd(day, -1, @CurrentDT))

set @FPU = (select count(*) from MemberItemPurchases where MemberID in (select MemberID from MemberItemPurchases where PurchaseDT between @LastRunDT and @CurrentDT group by MemberID having count(*) = 1))

insert into StatsData(CategoryName, CountNum, Fields, Groups) values('FPU', @FPU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '')
GO

------------------------------------------------------------------
-- run test
--exec sspBatchFPU
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
