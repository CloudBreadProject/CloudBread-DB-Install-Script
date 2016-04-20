--drop proc sspBatchFPU  -- First-time Paying User
create proc sspBatchFPU
as
set nocount on
declare @LastRunDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)

declare @nowdt datetime

declare @FPU bigint

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0 )))
set @LastRunDT = (dateadd(day, -1, @CurrentDT))

set @FPU = (select count(*) from MemberItemPurchases where MemberID in (select MemberID from MemberItemPurchases where PurchaseDT between @LastRunDT and @CurrentDT group by MemberID having count(*) = 1))

insert into StatsData(CategoryName, CountNum, Fields, Groups) values('FPU', @FPU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '')
GO