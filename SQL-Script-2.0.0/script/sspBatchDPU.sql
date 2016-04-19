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