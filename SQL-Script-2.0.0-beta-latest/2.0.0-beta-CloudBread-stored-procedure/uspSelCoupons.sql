/*
SELECT * FROM GiftDepositories
SELECT * FROM Members
SELECT * FROM ItemLists
SELECT * FROM MemberItems
SELECT * FROM MemberGameInfoes
SELECT * FROM MemberItemPurchases
SELECT * FROM Adminmembers
SELECT * FROM Coupon
SELECT * FROM CouponMember
SELECT * FROM GameEvents
SELECT * FROM GameEventMember
SELECT * FROM Notices
SELECT * FROM MemberGameInfoStages
SELECT * FROM MemberAccountBlockLog

SELECT CouponID, CouponCategory1, CouponCategory2, CouponCategory3, DupeYN, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, OrderNumber, CouponDurationFrom, CouponDurationTo, title, content, CreateAdminID, HideYN, DeleteYN, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 
FROM Coupon

"쿠폰테이블의 DupeYN에 따라 처리

 날짜가 지정한 날짜 안에 있고
  coupon 테이블의 DeleteYN = N & DupeYN = Y이면 
    CouponMember 에 Member 정보를 insert만 한다
  coupon 테이블의 DeleteYN = N & DupeYN = N이면 
    coupon 테이블의 DeleteYN을 Y로 바꾸고 CouponMember 에 Member 정보를 insert만 한다
  coupon 테이블의 DeleteYN = Y 면
    쿠폰 사용 불가 알림을 준다.
 끝
쿠폰에 지정된 아이템을 insert or update한다"


SELECT CouponID, CouponCategory1, CouponCategory2, CouponCategory3, DupeYN, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, OrderNumber, CouponDurationFrom, CouponDurationTo, title, content, CreateAdminID, HideYN, DeleteYN, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 
FROM Coupon
SELECT CouponMemberID, CouponID, MemberID, HideYN, DeleteYN, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
FROM CouponMember

update Coupon	-- 비교 조건을 위한 날자 컬럼 처리 datetime 형을 처리할 필요 있음
set CouponDurationFrom = '2015-01-01', CouponDurationTo = '2016-01-01', HideYN = 'N', DeleteYN = 'N', DupeYN = 'Y', ItemListID = '7BF74075-FC72-4FC1-A1B9-7A0DFAD2E0DE', ItemCount = '10', Itemstatus = '상태굿'

--NOT EXISTS 방식의 처리
SELECT CouponID, CouponCategory1, CouponCategory2, CouponCategory3, DupeYN, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, OrderNumber, CouponDurationFrom, CouponDurationTo, title, content, CreateAdminID, HideYN, DeleteYN, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 
FROM Coupon
WHERE NOT EXISTS 
(
  SELECT 1 
    FROM CouponMember
    WHERE CouponMember.CouponID = Coupon.CouponID
	and CouponMember.MemberID like 'aaa'
);

*/

-----------------------------------------------------------------------
-- uspSelCoupons 프로시저 생성
--DROP PROC uspSelCoupons
CREATE PROC uspSelCoupons
@MemberID varchar(MAX)
--CouponDurationFrom를 비교 하려면 날자 부분은 암호화 되지 않은 평문이어야 함.
--CouponDurationFrom 컬럼은 datetime 형태로 저장 되어야 함.
AS 
select CouponID, CouponCategory1, CouponCategory2, CouponCategory3, ItemListID, ItemCount, ItemStatus, TargetGroup, TargetOS, TargetDevice, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
FROM Coupon with(nolock)
WHERE NOT EXISTS 
(
  SELECT 1 
    FROM CouponMember  with(nolock)
    WHERE CouponMember.CouponID = Coupon.CouponID
	and CouponMember.MemberID like @MemberID
		--현재 날자 조건에 맞는 것 and HideYN, DeleteYN이 N 인것
)
and sysutcdatetime() between CouponDurationFrom and CouponDurationTo
and Coupon.HideYN like 'N'
and Coupon.DeleteYN like 'N'
order by OrderNumber asc, CreatedAt desc		-- 정렬은 정렬 컬럼 숫자 asc, 이후 생성일 최신 순
GO

/*
-----------------------------------------------------------------------
EXEC uspSelCoupons 'aaa'	--get valid coupon
EXEC uspSelCoupons 'bbb'	
-----------------------------------------------------------------------
SELECT * FROM Coupon
SELECT * FROM CouponMember
*/
