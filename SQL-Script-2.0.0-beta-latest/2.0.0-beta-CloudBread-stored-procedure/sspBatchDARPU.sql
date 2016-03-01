/**
* @file sspBatchDARPU.sql
* @brief add StatsData DARPU from webjob batch
* @author Dae Woo Kim
* @param N/A
* @return affected rows number
* @see webjob batch tasks
*/

--drop proc sspBatchDARPU
create proc sspBatchDARPU 
as
set nocount on
declare @LastRunDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)

declare @nowdt datetime

declare @TotalRev money
declare @MemberCount bigint
declare @DARPU money
set @nowdt = (select getutcdate())
--select @nowdt as nowdt

set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0,0 )))
--select @CurrentDT as CurrentDT
set @LastRunDT = (dateadd(day, -1, @CurrentDT))
--select @LastRunDT as LastRunDT
set @TotalRev = (select isnull(sum(convert(money, PurchasePrice)), 0) from MemberItemPurchases where PurchaseDT between @LastRunDT and @CurrentDT)
--select @TotalRev as TotalRev

set @MemberCount = (select count(*) from members)
if @MemberCount = 0 
	begin
		set @MemberCount = 1	--div by 0 error
	end

--select @MemberCount as MemberCount
set @DARPU = (select (convert(nvarchar(50), @TotalRev / @MemberCount)))
--select @DARPU as DARPU
--Rruncation of decimal point on money type to convert bugint for char number
insert into StatsData(CategoryName, CountNum, Fields, groups) values('DARPU', @DARPU, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 
select @@rowcount 
GO

------------------------------------------------------------------
-- run test
--exec sspBatchDARPU
------------------------------------------------------------------

/*
select * from StatsData order by createdat desc
select * from Members
select * from MemberItemPurchases 
select sum(convert(money, PurchasePrice)) from MemberItemPurchases
update MemberItemPurchases set purchasedt = dateadd(day, -1, sysutcdatetime()) 

insert into StatsData(CategoryName, CountNum, Fields, groups) values('DARPU', 10.1234, CONVERT(nvarchar(8), GETUTCDATE(), 112), '') 

select count(*) from members where LastLoginDT between '2016-02-27 15:00:03.1749825 +00:00' and sysutcdatetime()
-- test data value
update StatsData set CreatedAt = sysutcdatetime() where statid like 'A25ED999-C83F-4532-95A0-E4106BFE013D'
update m set LastLoginDT = sysutcdatetime() where memberid like 'bbb'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'ccc'
update Members set LastLoginDT = sysutcdatetime() where memberid like 'ddd'

select sysutcdatetime()
select dateadd(day, -1, sysutcdatetime()) 
select CONVERT(nvarchar(20), getutcdate(), 112)

declare @nowdt datetime
set @nowdt = (select getutcdate())
SELECT DATEPART(year, @nowdt) + '-' + DATEPART(month,@nowdt) + '-' +  DATEPART(day, @nowdt);
SELECT convert(datetime, getutcdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm 

declare @LastRunDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
*/

