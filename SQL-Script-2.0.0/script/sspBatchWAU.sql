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
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0,0 )))
--select @CurrentDT as CurrentDT
set @LastRunDT = (dateadd(day, -7, @CurrentDT))
--select @LastRunDT as LastRunDT

set @WAU = (select count(*) from members where LastLoginDT between @LastRunDT and @CurrentDT)
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('WAU', @WAU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
GO