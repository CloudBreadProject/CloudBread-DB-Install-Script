--drop proc sspBatchDPA  -- Daily Purchased Amount
create proc sspBatchDPA
as
set nocount on
declare @LastDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
declare @nowdt datetime
declare @DPA bigint

set @nowdt = (select getutcdate())
--select @nowdt as nowdt
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month, @nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0)))
--select @CurrentDT as CurrentDT
set @LastDT = (dateadd(day, -1, @CurrentDT))
--select @LastDT as LastDT

set @DPA = (select sum(CONVERT(bigint, PurchasePrice)) from MemberItemPurchases where PurchaseDT between @LastDT and @CurrentDT AND PurchaseCancelYN like 'N')

insert into StatsData(CategoryName, CountNum, Fields, Groups) values('DPA', @DPA, CONVERT(nvarchar(8), GETUTCDATE(), 112), '')
GO