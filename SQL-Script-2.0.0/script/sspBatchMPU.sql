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