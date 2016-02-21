--DROP PROC uspComSelMemberItemPurchase
CREATE PROC uspComSelMemberItemPurchase
@MemberItemPurchaseID NVARCHAR(MAX)
AS 
select MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from MemberItemPurchases with(nolock)
where MemberItemPurchaseID like @MemberItemPurchaseID  and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelMemberItemPurchase 'D3C6F3BF-7CA9-4F5D-9731-CDD3BD283FCB'
EXEC uspComSelMemberItemPurchase 'asfasdf'
-----------------------------------------------------------------------
select * from MemberItemPurchases
*/
