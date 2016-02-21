--DROP PROC uspComUdtGiftDepository
CREATE PROC uspComUdtGiftDepository
@GiftDepositoryID nvarchar(MAX) = NULL
,@ItemListID nvarchar(MAX) = NULL
,@ItemCount nvarchar(MAX) = NULL
,@FromMemberID nvarchar(MAX) = NULL
,@ToMemberID nvarchar(MAX) = NULL
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
update GiftDepositories
set  
ItemListID = CASE WHEN @ItemListID is not null THEN @ItemListID ELSE  ItemListID END
, ItemCount = CASE WHEN @ItemCount is not null THEN @ItemCount ELSE  ItemCount END
, FromMemberID = CASE WHEN @FromMemberID is not null THEN @FromMemberID ELSE  FromMemberID END
, ToMemberID = CASE WHEN @ToMemberID is not null THEN @ToMemberID ELSE  ToMemberID END
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
where GiftDepositoryID like @GiftDepositoryID
select @@ROWCOUNT as Reslut

GO
/*
-----------------------------------------------------------------------
EXEC uspComUdtGiftDepository 'CAB961F7-E05A-4034-9117-19BDB2D93010', 'A2C03A61-41C8-496C-823B-F7B2255DE55D', '1', 'FromMemberID', 'ToMemberID', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
EXEC uspComUdtGiftDepository 'CAB961F7-E05A-4034-9117-19BDB2D93010', null, '99', 'FromMemberID', 'ToMemberID', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
select * from GiftDepositories
*/



