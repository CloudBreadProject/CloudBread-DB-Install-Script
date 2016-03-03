--DROP PROC dbo.uspSelItem1
create proc uspSelItem1
@ItemListID varchar(MAX)
as
select ItemListID,ItemName,ItemDescription,ItemPrice,ItemSellPrice,ItemCategory1,ItemCategory2,ItemCategory3,sCol1,sCol2,sCol3,sCol4,sCol5,sCol6,sCol7,sCol8,sCol9,sCol10 
from ItemLists with(nolock) where ItemListID like @ItemListID and DeleteYN like 'N' and HideYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspSelItem1 'itemid2'
EXEC uspSelItem1 'noexists'
-----------------------------------------------------------------------
select * from ItemLists
*/

