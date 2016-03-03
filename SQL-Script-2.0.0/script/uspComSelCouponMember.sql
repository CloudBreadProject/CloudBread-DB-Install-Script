--DROP PROC uspComSelCouponMember
CREATE PROC uspComSelCouponMember
@CouponMemberID NVARCHAR(MAX)
AS 
select CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from CouponMember with(nolock)
where CouponMemberID like @CouponMemberID and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelCouponMember  'FD64C445-339D-4CB6-B68E-50F0DF94E775'
EXEC uspComSelCouponMember  'asfasdf'
-----------------------------------------------------------------------
select * from CouponMember
*/