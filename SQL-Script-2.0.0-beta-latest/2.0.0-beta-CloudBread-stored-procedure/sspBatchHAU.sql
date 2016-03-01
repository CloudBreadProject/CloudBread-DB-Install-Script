/**
* @file sspBatchHAU.sql
* @brief add StatsData HAU from webjob batch
* @author Dae Woo Kim
* @param N/A
* @return affected rows number
* @see webjob batch tasks
*/

--drop proc sspBatchHAU
create proc sspBatchHAU 
as
set nocount on
declare @LastRunDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
declare @nowdt datetime
declare @HDAU bigint
set @nowdt = (select getutcdate())
--select @nowdt as nowdt
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0,0 )))
--select @CurrentDT as CurrentDT
set @LastRunDT = (dateadd(hour, -1, @CurrentDT))		-- hour -1
--select @LastRunDT as LastRunDT

set @HDAU = (select count(*) from members where LastLoginDT between @LastRunDT and @CurrentDT)
insert into StatsData(CategoryName, CountNum, Fields) values('HDAU', @HDAU, CONVERT(nvarchar(8), GETUTCDATE(), 112) + CONVERT(nvarchar(2), DATEPART(hour, @nowdt))) 
select @@rowcount 
GO

/*
exec sspBatchHAU

select * from StatsData order by createdat desc
select * from Members
select count(*) from members where LastLoginDT between '2016-02-27 15:00:03.1749825 +00:00' and sysutcdatetime()
-- test data value
update StatsData set CreatedAt = sysutcdatetime() where statid like 'A25ED999-C83F-4532-95A0-E4106BFE013D'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'bbb'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'ccc'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'ddd'

select CONVERT(nvarchar(8), GETUTCDATE(), 112) 
*/

