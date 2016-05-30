--drop proc sspBatchBPI -- Best Purchased Item
create proc sspBatchBPI
as
set nocount on
declare @Last30DT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)
declare @nowdt datetime
declare @BPI1 nvarchar(12)
declare @BPI2 nvarchar(12)
declare @BPI3 nvarchar(12)

set @nowdt = (select getutcdate())
--select @nowdt as nowdt
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month, @nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0)))
--select @CurrentDT as CurrentDT
set @Last30DT = (dateadd(day, -30, @CurrentDT))
--select @Last30DT as Last30DT

set @BPI1 = (select ItemListID from (select ItemListID, row_number() over(order by t1.TotalCount desc) as rownum from (select TOP 3 ItemListID, count(*) AS TotalCount from MemberItemPurchases where PurchaseDT between @Last30DT and @CurrentDT group by ItemListID order by TotalCount desc) t1) t1 where t1.rownum like '1')
set @BPI2 = (select ItemListID from (select ItemListID, row_number() over(order by t1.TotalCount desc) as rownum from (select TOP 3 ItemListID, count(*) AS TotalCount from MemberItemPurchases where PurchaseDT between @Last30DT and @CurrentDT group by ItemListID order by TotalCount desc) t1) t1 where t1.rownum like '2')
set @BPI3 = (select ItemListID from (select ItemListID, row_number() over(order by t1.TotalCount desc) as rownum from (select TOP 3 ItemListID, count(*) AS TotalCount from MemberItemPurchases where PurchaseDT between @Last30DT and @CurrentDT group by ItemListID order by TotalCount desc) t1) t1 where t1.rownum like '3')

if @BPI1 is not null
	begin
		insert into StatsData(CategoryName, CountNum, Fields, Groups) values('BPItem1', 0, CONVERT(nvarchar(8), GETUTCDATE(), 112), @BPI1)
	end
if @BPI2 is not null
	begin
		insert into StatsData(CategoryName, CountNum, Fields, Groups) values('BPItem2', 0, CONVERT(nvarchar(8), GETUTCDATE(), 112), @BPI2)
	end
if @BPI3 is not null
	begin
		insert into StatsData(CategoryName, CountNum, Fields, Groups) values('BPItem3', 0, CONVERT(nvarchar(8), GETUTCDATE(), 112), @BPI3)
	end
GO

------------------------------------------------------------------
-- run test
--exec sspBatchBPI
------------------------------------------------------------------

/*
select * from StatsData order by createdat desc
select * from Members
select * from MemberItemPurchases

-- test data value
update MemberItemPurchases set PurchaseDT = sysutcdatetime() where memberid like 'aaa'
update MemberItemPurchases set PurchaseDT = sysutcdatetime() where memberid like 'ccc'

select sysutcdatetime()
select dateadd(day, -1, sysutcdatetime()) 
select CONVERT(nvarchar(20), getutcdate(), 112)

declare @nowdt datetime
set @nowdt = (select getutcdate())
SELECT DATEPART(year, @nowdt) + '-' + DATEPART(month,@nowdt) + '-' +  DATEPART(day, @nowdt);
SELECT convert(datetime, getutcdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm 

--test BPI1,2,3
declare @LastRunDT datetimeoffset(7)
declare @CurrentDT datetimeoffset(7)

declare @nowdt datetime
declare @testDT datetimeoffset(7)

set @nowdt = (select getutcdate())
set @CurrentDT = ((SELECT DATETIMEFROMPARTS (DATEPART(year, @nowdt), DATEPART(month,@nowdt), DATEPART(day, @nowdt), DATEPART(hour, @nowdt), 0, 0, 0 )))
set @LastRunDT = (dateadd(day, -1, @CurrentDT))
set @testDT = (dateadd(hour, -14, @CurrentDT))
update MemberItemPurchases set PurchaseDT = @testDT where MemberID like 'ccc'
update MemberItemPurchases set PurchaseDT = @testDT where ItemListID like 'itemid2'

--대안1
select ItemListID from (select ItemListID, row_number() over(order by t1.TotalCount desc) as rownum from (select TOP 3 ItemListID, count(*) AS TotalCount from MemberItemPurchases where PurchaseDT between @LastRunDT and @CurrentDT group by ItemListID order by TotalCount desc) t1) t1 where t1.rownum like '1'
select ItemListID from (select ItemListID, row_number() over(order by t1.TotalCount desc) as rownum from (select TOP 3 ItemListID, count(*) AS TotalCount from MemberItemPurchases where PurchaseDT between @LastRunDT and @CurrentDT group by ItemListID order by TotalCount desc) t1) t1 where t1.rownum like '2'
select ItemListID from (select ItemListID, row_number() over(order by t1.TotalCount desc) as rownum from (select TOP 3 ItemListID, count(*) AS TotalCount from MemberItemPurchases where PurchaseDT between @LastRunDT and @CurrentDT group by ItemListID order by TotalCount desc) t1) t1 where t1.rownum like '3'

--대안2
select top 1 ItemListID from (select ItemListID, count(*) AS TotalCount from MemberItemPurchases group by ItemListID) t1 where ItemListID not in (select top 1 ItemListID from (select ItemListID, count(*) AS TotalCount from MemberItemPurchases group by ItemListID) t2)

--1등
select TOP 1 ItemListID, count(*) AS TotalCount from MemberItemPurchases group by ItemListID order by TotalCount desc

select MemberID, ItemListID, PurchaseDT from MemberItemPurchases

*/