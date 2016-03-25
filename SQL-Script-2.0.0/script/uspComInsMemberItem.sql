
--DROP PROC uspComInsMemberItem
CREATE PROC uspComInsMemberItem
@MemberItemID nvarchar(MAX) = NULL
,@MemberID nvarchar(MAX) = NULL
,@ItemListID nvarchar(MAX) = NULL
,@ItemCount nvarchar(MAX) = NULL
,@ItemStatus nvarchar(MAX) = NULL
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
AS 
--set, lock option check
set nocount on
INSERT INTO MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
values(@MemberItemID, @MemberID, @ItemListID, @ItemCount, @ItemStatus, @sCol1, @sCol2, @sCol3, @sCol4, @sCol5, @sCol6, @sCol7, @sCol8, @sCol9, @sCol10)
select @@ROWCOUNT as Reslut
GO

/*
-----------------------------------------------------------------------
EXEC uspComInsMemberItem 'MemberItemsID19', 'aaa', 'itemid4', '9', 'ItemStatus', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
-----------------------------------------------------------------------
select * from MemberItems
select * from ItemLists
*/
