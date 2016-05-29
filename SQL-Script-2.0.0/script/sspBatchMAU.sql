--drop proc sspBatchMAU
create proc sspBatchMAU 
as
set nocount on
declare @LastRunDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
declare @nowdt datetime
declare @MAU bigint
set @nowdt = (select getutcdate())
--select @nowdt as nowdt
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), 0, 0, 0, 0)))
--select @CurrentDT as CurrentDT
set @LastRunDT = (dateadd(day, -30, @CurrentDT))
--select @LastRunDT as LastRunDT

set @MAU = (select count(*) from members where LastLoginDT between @LastRunDT and @CurrentDT)
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('MAU', @MAU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
select @@rowcount 
GO

------------------------------------------------------------------
-- run test
--exec sspBatchMAU
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
select dateadd(day, -30, sysutcdatetime()) 
select CONVERT(nvarchar(20), getutcdate(), 112)

declare @nowdt datetime
set @nowdt = (select getutcdate())
SELECT DATEPART(year, @nowdt) + '-' + DATEPART(month,@nowdt) + '-' +  DATEPART(day, @nowdt);
SELECT convert(datetime, getutcdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm 

--test month
declare @nowdt datetime
declare @CurrentDT datetimeoffset(7)
declare @testdt datetimeoffset(7)
declare @testdt2 datetimeoffset(7)

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0,0 )))
set @testdt = (dateadd(day, -30, @CurrentDT))
set @testdt2 = (dateadd(day, -31, @CurrentDT))

update Members set LastLoginDT = @testdt where memberid like 'aaa3'
update Members set LastLoginDT = @testdt2 where memberid like 'aaa4'
exec sspBatchMAU
select * from StatsData where CategoryName like 'MAU' order by createdat desc
*/