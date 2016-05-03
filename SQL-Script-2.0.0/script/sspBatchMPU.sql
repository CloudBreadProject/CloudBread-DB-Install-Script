--drop proc sspBatchMPU  -- Monthly Paying User
create proc sspBatchMPU
as
set nocount on
declare @Day30DT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
declare @nowdt datetime
declare @MPU bigint

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0 )))
set @Day30DT = (dateadd(day, -30, @CurrentDT))

set @MPU = (select count(*) from MemberItemPurchases where PurchaseDT between @Day30DT and @CurrentDT AND PurchaseCancelYN like 'N')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('MPU', @MPU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
GO

------------------------------------------------------------------
-- run test
--exec sspBatchMPU
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
select dateadd(day, -30, sysutcdatetime()) 
select CONVERT(nvarchar(20), getutcdate(), 112)

declare @nowdt datetime
set @nowdt = (select getutcdate())
SELECT DATEPART(year, @nowdt) + '-' + DATEPART(month,@nowdt) + '-' +  DATEPART(day, @nowdt);
SELECT convert(datetime, getutcdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm 
*/