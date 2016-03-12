--DROP PROC uspComInsMemberItemPurchase
CREATE PROC uspComInsMemberItemPurchase
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
insert into MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
values (@MemberItemPurchaseID, @MemberID, @ItemListID, @PurchaseQuantity, @PurchasePrice, @PGinfo1, @PGinfo2, @PGinfo3, @PGinfo4, @PGinfo5, @PurchaseDeviceID, @PurchaseDeviceIPAddress, @PurchaseDeviceMACAddress, @PurchaseDT, @PurchaseCancelYN, @PurchaseCancelDT, @PurchaseCancelingStatus, @PurchaseCancelReturnedAmount, @PurchaseCancelDeviceID, @PurchaseCancelDeviceIPAddress, @PurchaseCancelDeviceMACAddress, @sCol1, @sCol2, @sCol3, @sCol4, @sCol5, @sCol6, @sCol7, @sCol8, @sCol9, @sCol10)
select @@rowcount as Reslut
GO

GO

/*
-----------------------------------------------------------------------
EXEC uspComInsMemberItemPurchase 'MemberItemPurchasesID45', 'aaa', 'itemid3', '45', '45', 'PGinfo1', 'PGinfo2', 'PGinfo3', 'PGinfo4', 'PGinfo5', 'PurchaseDeviceID', 'PurchaseDeviceIPAddress', 'PurchaseDeviceMACAddress', 'PurchaseDT', 'PurchaseCancelYN', 'PurchaseCancelDT', 'PurchaseCancelingStatus', 'PurchaseCancelReturnedAmount', 'PurchaseCancelDeviceID', 'PurchaseCancelDeviceIPAddress', 'PurchaseCancelDeviceMACAddress', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
-----------------------------------------------------------------------
SELECT * FROM MemberItemPurchases
*/
