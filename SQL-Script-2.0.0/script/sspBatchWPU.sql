--drop proc sspBatchWPU  -- Weekly Paying User
create proc sspBatchWPU
as
set nocount on
declare @Day7DT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
declare @nowdt datetime
declare @WPU bigint

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0 )))
set @Day7DT = (dateadd(day, -7, @CurrentDT))

set @WPU = (select count(*) from MemberItemPurchases where PurchaseDT between @Day7DT and @CurrentDT AND PurchaseCancelYN like 'N')
insert into StatsData(CategoryName, CountNum, Fields, Groups) values('WPU', @WPU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
GO