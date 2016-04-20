--drop proc sspBatchPPU  -- Percentage of Daily Paying User
create proc sspBatchPPU
as
set nocount on
declare @LastRunDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)

declare @nowdt datetime

declare @PayNumber bigint
declare @MemberCount bigint
declare @PPU bigint

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0 )))
set @LastRunDT = (dateadd(day, -1, @CurrentDT))

set @PayNumber = (select count(*) from MemberItemPurchases where PurchaseDT between @TodayDT and @CurrentDT AND PurchaseCancelYN like 'N')
set @MemberCount = (select count(*) from members)
if @MemberCount = 0
	begin
		set @MemberCount = 1	--div by 0 error
	end

set @PPU = @PayNumber / @MemberCount

insert into StatsData(CategoryName, CountNum, Fields, Groups) values('PPU', @PPU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
GO