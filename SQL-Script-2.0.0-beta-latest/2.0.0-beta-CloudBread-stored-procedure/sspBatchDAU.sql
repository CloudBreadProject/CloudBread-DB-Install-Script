/**
* @file sspBatchDAU.sql
* @brief add StatsData DAU from webjob batch
* @author Dae Woo Kim
* @param N/A
* @return affected rows number
* @see webjob batch tasks
*/

--drop proc sspBatchDAU
create proc sspBatchDAU 
as
set nocount on
declare @LastRunDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
declare @nowdt datetime
declare @DAU bigint
set @nowdt = (select getutcdate())
--select @nowdt as nowdt
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0,0 )))
--select @CurrentDT as CurrentDT
set @LastRunDT = (dateadd(day, -1, @CurrentDT))
--select @LastRunDT as LastRunDT

set @DAU = (select count(*) from members where LastLoginDT between @LastRunDT and @CurrentDT)
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DAU', @DAU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
select @@rowcount 
GO

------------------------------------------------------------------
-- run test
--exec sspBatchDAU
------------------------------------------------------------------

/*
select * from StatsData order by createdat desc
select * from Members
select count(*) from members where LastLoginDT between '2016-02-27 15:00:03.1749825 +00:00' and sysutcdatetime()
-- test data value
update StatsData set CreatedAt = sysutcdatetime() where statid like 'A25ED999-C83F-4532-95A0-E4106BFE013D'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'bbb'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'ccc'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'ddd'

select sysutcdatetime()
select dateadd(day, 1, sysutcdatetime()) 
select CONVERT(nvarchar(20), getutcdate(), 112)

declare @nowdt datetime
set @nowdt = (select getutcdate())
SELECT DATEPART(year, @nowdt) + '-' + DATEPART(month,@nowdt) + '-' +  DATEPART(day, @nowdt);
SELECT convert(datetime, getutcdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm 

*/

