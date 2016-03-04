--DROP PROC uspComSelCouponMember
CREATE PROC uspComSelCouponMember
@CouponMemberID NVARCHAR(MAX)
, @MemberID NVARCHAR(MAX)
AS 
select CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CouponMember with(nolock)
where MemberID like @MemberID and CouponMemberID like @CouponMemberID and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelCouponMember  'CouponMemberID2', 'aaa' 
EXEC uspComSelCouponMember  'CouponMemberID1', 'aaa'
-----------------------------------------------------------------------
select * from CouponMember
*/