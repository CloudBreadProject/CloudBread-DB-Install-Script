--DROP PROC uspComUdtMemberItemPurchase
CREATE PROC uspComUdtMemberItemPurchase
@MemberItemPurchaseID nvarchar(MAX) = NULL
,@MemberID nvarchar(MAX) = NULL
,@ItemListID nvarchar(MAX) = NULL
,@PurchaseQuantity nvarchar(MAX) = NULL
,@PurchasePrice nvarchar(MAX) = NULL
,@PGinfo1 nvarchar(MAX) = NULL
,@PGinfo2 nvarchar(MAX) = NULL
,@PGinfo3 nvarchar(MAX) = NULL
,@PGinfo4 nvarchar(MAX) = NULL
,@PGinfo5 nvarchar(MAX) = NULL
,@PurchaseDeviceID nvarchar(MAX) = NULL
,@PurchaseDeviceIPAddress nvarchar(MAX) = NULL
,@PurchaseDeviceMACAddress nvarchar(MAX) = NULL
,@PurchaseDT nvarchar(MAX) = NULL
,@PurchaseCancelYN nvarchar(MAX) = NULL
,@PurchaseCancelDT nvarchar(MAX) = NULL
,@PurchaseCancelingStatus nvarchar(MAX) = NULL
,@PurchaseCancelReturnedAmount nvarchar(MAX) = NULL
,@PurchaseCancelDeviceID nvarchar(MAX) = NULL
,@PurchaseCancelDeviceIPAddress nvarchar(MAX) = NULL
,@PurchaseCancelDeviceMACAddress nvarchar(MAX) = NULL
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
set nocount on
update MemberItemPurchases
set
MemberID = CASE WHEN @MemberID is not null THEN @MemberID ELSE  MemberID END
, ItemListID = CASE WHEN @ItemListID is not null THEN @ItemListID ELSE  ItemListID END
, PurchaseQuantity = CASE WHEN @PurchaseQuantity is not null THEN @PurchaseQuantity ELSE  PurchaseQuantity END
, PurchasePrice = CASE WHEN @PurchasePrice is not null THEN @PurchasePrice ELSE  PurchasePrice END
, PGinfo1 = CASE WHEN @PGinfo1 is not null THEN @PGinfo1 ELSE  PGinfo1 END
, PGinfo2 = CASE WHEN @PGinfo2 is not null THEN @PGinfo2 ELSE  PGinfo2 END
, PGinfo3 = CASE WHEN @PGinfo3 is not null THEN @PGinfo3 ELSE  PGinfo3 END
, PGinfo4 = CASE WHEN @PGinfo4 is not null THEN @PGinfo4 ELSE  PGinfo4 END
, PGinfo5 = CASE WHEN @PGinfo5 is not null THEN @PGinfo5 ELSE  PGinfo5 END
, PurchaseDeviceID = CASE WHEN @PurchaseDeviceID is not null THEN @PurchaseDeviceID ELSE  PurchaseDeviceID END
, PurchaseDeviceIPAddress = CASE WHEN @PurchaseDeviceIPAddress is not null THEN @PurchaseDeviceIPAddress ELSE  PurchaseDeviceIPAddress END
, PurchaseDeviceMACAddress = CASE WHEN @PurchaseDeviceMACAddress is not null THEN @PurchaseDeviceMACAddress ELSE  PurchaseDeviceMACAddress END
, PurchaseDT = CASE WHEN @PurchaseDT is not null THEN @PurchaseDT ELSE  PurchaseDT END
, PurchaseCancelYN = CASE WHEN @PurchaseCancelYN is not null THEN @PurchaseCancelYN ELSE  PurchaseCancelYN END
, PurchaseCancelDT = CASE WHEN @PurchaseCancelDT is not null THEN @PurchaseCancelDT ELSE  PurchaseCancelDT END
, PurchaseCancelingStatus = CASE WHEN @PurchaseCancelingStatus is not null THEN @PurchaseCancelingStatus ELSE  PurchaseCancelingStatus END
, PurchaseCancelReturnedAmount = CASE WHEN @PurchaseCancelReturnedAmount is not null THEN @PurchaseCancelReturnedAmount ELSE  PurchaseCancelReturnedAmount END
, PurchaseCancelDeviceID = CASE WHEN @PurchaseCancelDeviceID is not null THEN @PurchaseCancelDeviceID ELSE  PurchaseCancelDeviceID END
, PurchaseCancelDeviceIPAddress = CASE WHEN @PurchaseCancelDeviceIPAddress is not null THEN @PurchaseCancelDeviceIPAddress ELSE  PurchaseCancelDeviceIPAddress END
, PurchaseCancelDeviceMACAddress = CASE WHEN @PurchaseCancelDeviceMACAddress is not null THEN @PurchaseCancelDeviceMACAddress ELSE  PurchaseCancelDeviceMACAddress END
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
where MemberItemPurchaseID like @MemberItemPurchaseID
select @@rowcount as Reslut

GO

/*
-----------------------------------------------------------------------
EXEC uspComUdtMemberItemPurchase 'MemberItemPurchasesID2', 'aaa', 'itemid2', '80', '8000', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', 'PurchaseDT', 'PurchaseCancelYN', 'PurchaseCancelDT', 'PurchaseCancelingStatus', 'PurchaseCancelReturnedAmount', 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
-----------------------------------------------------------------------
SELECT * FROM MemberItemPurchases
*/
