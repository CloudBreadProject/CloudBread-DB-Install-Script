--drop proc uspComUdtItemList1
create proc uspComUdtItemList1
@ItemListID nvarchar(MAX) = NULL
,@ItemName nvarchar(MAX) = NULL
,@ItemDescription nvarchar(MAX) = NULL
,@ItemPrice nvarchar(MAX) = NULL
,@ItemSellPrice nvarchar(MAX) = NULL
,@ItemCategory1 nvarchar(MAX) = NULL
,@ItemCategory2 nvarchar(MAX) = NULL
,@ItemCategory3 nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL
as
set nocount on
update ItemLists set
 ItemName = CASE WHEN @ItemName is not null THEN @ItemName ELSE  ItemName END
, ItemDescription = CASE WHEN @ItemDescription is not null THEN @ItemDescription ELSE  ItemDescription END
, ItemPrice = CASE WHEN @ItemPrice is not null THEN @ItemPrice ELSE  ItemPrice END
, ItemSellPrice = CASE WHEN @ItemSellPrice is not null THEN @ItemSellPrice ELSE  ItemSellPrice END
, ItemCategory1 = CASE WHEN @ItemCategory1 is not null THEN @ItemCategory1 ELSE  ItemCategory1 END
, ItemCategory2 = CASE WHEN @ItemCategory2 is not null THEN @ItemCategory2 ELSE  ItemCategory2 END
, ItemCategory3 = CASE WHEN @ItemCategory3 is not null THEN @ItemCategory3 ELSE  ItemCategory3 END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
,UpdatedAt = sysutcdatetime()
where ItemListID like @ItemListID
select @@rowcount as Reslut
GO

/*
-----------------------------------------------
exec uspComUdtItemList1 'itemid1', 'ItemNameNew', 'ItemDescription', '80', '80', 'ItemCategory1', 'ItemCategory2', 'ItemCategory3', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
select * from ItemLists
*/
