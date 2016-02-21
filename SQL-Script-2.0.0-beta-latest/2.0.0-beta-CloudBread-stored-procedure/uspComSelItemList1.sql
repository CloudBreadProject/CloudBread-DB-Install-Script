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
EXEC uspComSelItemList1 'A2C03A61-41C8-496C-823B-F7B2255DE55D'
EXEC uspComSelItemList1 'nono'
-----------------------------------------------------------------------
Select * from ItemLists
*/
