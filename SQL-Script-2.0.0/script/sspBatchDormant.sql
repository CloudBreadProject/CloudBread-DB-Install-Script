--drop proc sspBatchDormant
create proc sspBatchDormant
as
set nocount on
declare @CurrentDT datetimeoffset(7)
declare @day15DT datetimeoffset(7)
declare @day30DT datetimeoffset(7)
declare @nowdt datetime

declare @Dormant15DT bigint
declare @Dormant30DT bigint

set @nowdt = (select getutcdate())

set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0,0 )))

set @day15DT = (dateadd(day, -15, @CurrentDT))
set @day30DT = (dateadd(day, -30, @CurrentDT))

set @Dormant30DT = (select count(*) from members where LastLogoutDT < @day30DT)
set @Dormant15DT = (select count(*) from members where LastLogoutDT < @day15DT)

insert into StatsData(CategoryName, CountNum, Fields, Groups) values('Dormant15', @Dormant15DT, CONVERT(nvarchar(8), GETUTCDATE(), 112), '')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('Dormant30', @Dormant30DT, CONVERT(nvarchar(8), GETUTCDATE(), 112), '')
GO

------------------------------------------------------------------
-- run test
--exec sspBatchDormant
------------------------------------------------------------------

/*
exec sspBatchDormant
select * from StatsData where CategoryName like 'Dormant30' order by createdat desc
select * from Members

-- test data value & Dormant30
update Members set LastLogoutDT = sysutcdatetime() where memberid like 'aaa1'
update Members set LastLogoutDT = sysutcdatetime() where memberid like 'aaa2'
update Members set LastLogoutDT = sysutcdatetime() where memberid like 'aaa4'

select sysutcdatetime()
select dateadd(day, 1, sysutcdatetime()) 
select CONVERT(nvarchar(20), getutcdate(), 112)

declare @nowdt datetime
set @nowdt = (select getutcdate())
SELECT DATEPART(year, @nowdt) + '-' + DATEPART(month,@nowdt) + '-' +  DATEPART(day, @nowdt);
SELECT convert(datetime, getutcdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm
*/