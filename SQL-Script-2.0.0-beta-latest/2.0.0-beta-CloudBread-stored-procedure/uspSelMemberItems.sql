--DROP PROC uspSelMemberItems
CREATE PROC uspSelMemberItems
( 
  @Page             bigint 
, @PageSize  bigint 
, @MemberID varchar(max)
) AS 
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
WITH TBL_PAGELIST AS 
( 
	SELECT ROW_NUMBER() OVER (ORDER BY MemberItems.CreatedAt) AS ROWNUM, 
	ItemLists.ItemListID as	ItemListsItemListID
	, ItemLists.ItemName as ItemListsItemName 
	, ItemLists.ItemDescription as ItemListsItemDescription 
	, ItemLists.ItemPrice as ItemListsItemPrice 
	, ItemLists.ItemSellPrice as ItemListsItemSellPrice 
	, ItemLists.ItemCategory1 as ItemListsItemCategory1 
	, ItemLists.ItemCategory2 as ItemListsItemCategory2 
	, ItemLists.ItemCategory3 as ItemListsItemCategory3 
	, ItemLists.sCol1 as ItemListssCol1 
	, ItemLists.sCol2 as ItemListssCol2 
	, ItemLists.sCol3 as ItemListssCol3 
	, ItemLists.sCol4 as ItemListssCol4 
	, ItemLists.sCol5 as ItemListssCol5 
	, ItemLists.sCol6 as ItemListssCol6 
	, ItemLists.sCol7 as ItemListssCol7 
	, ItemLists.sCol8 as ItemListssCol8 
	, ItemLists.sCol9 as ItemListssCol9 
	, ItemLists.sCol10 as ItemListssCol10 
	, MemberItems.MemberItemID as MemberItemsMemberItemID 
	, MemberItems.MemberID as MemberItemsMemberID 
	, MemberItems.ItemListID as MemberItemsItemListID 
	, MemberItems.ItemCount as MemberItemsItemCount 
	, MemberItems.ItemStatus as MemberItemsItemStatus 
	, MemberItems.sCol1 as MemberItemssCol1 
	, MemberItems.sCol2 as MemberItemssCol2 
	, MemberItems.sCol3 as MemberItemssCol3 
	, MemberItems.sCol4 as MemberItemssCol4 
	, MemberItems.sCol5 as MemberItemssCol5 
	, MemberItems.sCol6 as MemberItemssCol6 
	, MemberItems.sCol7 as MemberItemssCol7 
	, MemberItems.sCol8 as MemberItemssCol8 
	, MemberItems.sCol9 as MemberItemssCol9 
	, MemberItems.sCol10 as MemberItemssCol10
	FROM MemberItems
	inner join ItemLists	on MemberItems.ItemListID = ItemLists.ItemListID
	WHERE MemberItems.MemberID like @MemberID and MemberItems.HideYN like 'N' and MemberItems.DeleteYN like 'N' and ItemLists.HideYN like 'N' and ItemLists.DeleteYN like 'N'
) 
SELECT ROWNUM
		,ItemListsItemName 
		,ItemListsItemDescription 
		,ItemListsItemPrice 
		,ItemListsItemSellPrice 
		,ItemListsItemCategory1 
		,ItemListsItemCategory2 
		,ItemListsItemCategory3 
		,ItemListssCol1 
		,ItemListssCol2 
		,ItemListssCol3 
		,ItemListssCol4 
		,ItemListssCol5 
		,ItemListssCol6 
		,ItemListssCol7 
		,ItemListssCol8 
		,ItemListssCol9 
		,ItemListssCol10 
		,MemberItemsMemberItemID 
		,MemberItemsMemberID 
		,MemberItemsItemListID 
		,MemberItemsItemCount 
		,MemberItemsItemStatus 
		,MemberItemssCol1 
		,MemberItemssCol2 
		,MemberItemssCol3 
		,MemberItemssCol4 
		,MemberItemssCol5 
		,MemberItemssCol6 
		,MemberItemssCol7 
		,MemberItemssCol8 
		,MemberItemssCol9 
		,MemberItemssCol10		
from TBL_PAGELIST
WHERE ROWNUM BETWEEN ((@PAGE - 1) * @PAGESIZE) + 1 AND @PAGE * @PAGESIZE; 
GO

/*
-----------------------------------------------------------------------
EXEC uspSelMemberItems 1, 2, 'aaa'
EXEC uspSelMemberItems 2, 2, 'aaa'
-----------------------------------------------------------------------

select * from MemberItems
*/
