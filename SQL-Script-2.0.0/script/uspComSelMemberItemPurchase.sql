--DROP PROC uspComSelMemberItemPurchase
CREATE PROC uspComSelMemberItemPurchase
@MemberItemPurchaseID NVARCHAR(MAX)
, @MemberID NVARCHAR(MAX)
AS 
select MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from MemberItemPurchases with(nolock)
where MemberID like @MemberID and MemberItemPurchaseID like @MemberItemPurchaseID  and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelMemberItemPurchase 'MemberItemPurchasesID1', 'aaa'
EXEC uspComSelMemberItemPurchase 'MemberItemPurchasesIxxx', 'aaa'
EXEC uspComSelMemberItemPurchase 'MemberItemPurchasesID1', 'xxx'
-----------------------------------------------------------------------
select * from MemberItemPurchases
*/
