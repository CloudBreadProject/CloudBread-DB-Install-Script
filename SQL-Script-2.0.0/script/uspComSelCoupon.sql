--DROP PROC uspComSelCoupon
CREATE PROC uspComSelCoupon
@CouponID NVARCHAR(MAX)
AS 
select CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from Coupon with(nolock)
where CouponID like @CouponID and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelCoupon  'ABC00D7A-4047-4A87-A61A-C4E96F62F8E9'
EXEC uspComSelCoupon  'asfasdf'
-----------------------------------------------------------------------
select * from Coupon
*/