--DROP PROC uspComSelItemList1
CREATE PROC uspComSelItemList1
 @ItemListID nvarchar(max)
 AS 
	SELECT 
	ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
	FROM ItemLists
	WHERE ItemListID like @ItemListID and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelItemList1 'itemid999'
EXEC uspComSelItemList1 'itemid1'
-----------------------------------------------------------------------
Select * from ItemLists
*/
