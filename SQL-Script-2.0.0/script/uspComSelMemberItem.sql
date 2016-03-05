--DROP PROC uspComSelMemberItem
CREATE PROC uspComSelMemberItem
 @MemberItemID varchar(max)
 , @MemberID varchar(max)
AS 
	SELECT 
	MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
	FROM MemberItems with(nolock)
	WHERE MemberID like @MemberID and MemberItemID like @MemberItemID and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelMemberItem 'MemberItemsID1', 'aaa'
EXEC uspComSelMemberItem 'MemberItemsID1', 'xxx'
-----------------------------------------------------------------------
Select MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 from MemberItems
Select * from MemberItems
Select * from MemberItems
*/
