--drop proc sspBatchWAU
create proc sspBatchWAU 
as
set nocount on
declare @LastRunDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
declare @nowdt datetime
declare @WAU bigint
set @nowdt = (select getutcdate())
--select @nowdt as nowdt
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), 0, 0, 0, 0)))
--select @CurrentDT as CurrentDT
set @LastRunDT = (dateadd(day, -7, @CurrentDT))
--select @LastRunDT as LastRunDT

set @WAU = (select count(*) from members where LastLoginDT between @LastRunDT and @CurrentDT)
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('WAU', @WAU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
GO

------------------------------------------------------------------
-- run test
--exec sspBatchWAU
------------------------------------------------------------------

/*
select * from StatsData order by createdat desc
select * from Members
select count(*) from members where LastLoginDT between '2016-05-09 15:00:03.1749825 +00:00' and sysutcdatetime()

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

--test week
declare @nowdt datetime
declare @CurrentDT datetimeoffset(7)
declare @testdt datetimeoffset(7)
declare @testdt2 datetimeoffset(7)

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0,0 )))
set @testdt = (dateadd(day, -6, @CurrentDT))
set @testdt2 = (dateadd(day, -8, @CurrentDT))

update Members set LastLoginDT = @testdt where memberid like 'aaa3'
update Members set LastLoginDT = @testdt2 where memberid like 'aaa4'
exec sspBatchWAU
select * from StatsData where CategoryName like 'WAU' order by createdat desc
*/
