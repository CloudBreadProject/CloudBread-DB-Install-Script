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
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0,0 )))
--select @CurrentDT as CurrentDT
set @LastRunDT = (dateadd(day, -30, @CurrentDT))
--select @LastRunDT as LastRunDT

set @MAU = (select count(*) from members where LastLoginDT between @LastRunDT and @CurrentDT)
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('MAU', @MAU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
select @@rowcount 
GO