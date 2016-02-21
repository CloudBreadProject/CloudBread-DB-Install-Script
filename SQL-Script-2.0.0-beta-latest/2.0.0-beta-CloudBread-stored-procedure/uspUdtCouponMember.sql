--쿠폰테이블의 DupeYN에 따라 처리


-- 날짜가 지정한 날짜 안에 있고
--  coupon 테이블의 DeleteYN = N & DupeYN = Y이면 
--    CouponMember 에 Member 정보를 insert만 한다
--  coupon 테이블의 DeleteYN = N & DupeYN = N이면 
--    coupon 테이블의 DeleteYN을 Y로 바꾸고 CouponMember 에 Member 정보를 insert만 한다
--  coupon 테이블의 DeleteYN = Y 면
--    쿠폰 사용 불가 알림을 준다.
-- 끝
--쿠폰에 지정된 아이템을 insert or update한다

--SELECT * FROM Coupon
--SELECT * FROM CouponMember
--SELECT * FROM MemberItems


-----------------------------------------------------------------------
-- uspUdtCouponMember 프로시저 생성
--DROP PROC uspUdtCouponMember
CREATE PROC uspUdtCouponMember
@InsertORUpdate nvarchar(MAX) = NULL
--, @DupeYN_Coupon nvarchar(MAX) = NULL		--쿠폰의 DupeYN 값으로 Coupon을 없앨지 말지를 결정한다. - 업데이트 : 값 여부를 프로시저 내부에서 알아온다.
, @CouponID_Coupon nvarchar(MAX) = NULL		--쿠폰 ID -DupeYN 값에 의해 DeleteYN flag가 결정된다.
,	@MemberItemID_MemberItems nvarchar(MAX) = NULL	--update에서만 사용
,	@MemberID_MemberItems nvarchar(MAX) = NULL
,	@ItemListID_MemberItems nvarchar(MAX) = NULL
,	@ItemCount_MemberItems nvarchar(MAX) = NULL
,	@ItemStatus_MemberItems nvarchar(MAX) = NULL
,	@sCol1_MemberItems nvarchar(MAX) = NULL
,	@sCol2_MemberItems nvarchar(MAX) = NULL
,	@sCol3_MemberItems nvarchar(MAX) = NULL
,	@sCol4_MemberItems nvarchar(MAX) = NULL
,	@sCol5_MemberItems nvarchar(MAX) = NULL
,	@sCol6_MemberItems nvarchar(MAX) = NULL
,	@sCol7_MemberItems nvarchar(MAX) = NULL
,	@sCol8_MemberItems nvarchar(MAX) = NULL
,	@sCol9_MemberItems nvarchar(MAX) = NULL
,	@sCol10_MemberItems nvarchar(MAX) = NULL

--@CouponMemberID_CouponMember nvarchar(MAX)-- 항상 insert 과정이라 없음
,	@CouponID_CouponMember nvarchar(MAX) = NULL
,	@MemberID_CouponMember nvarchar(MAX) = NULL
,	@sCol1_CouponMember nvarchar(MAX) = NULL
,	@sCol2_CouponMember nvarchar(MAX) = NULL
,	@sCol3_CouponMember nvarchar(MAX) = NULL
,	@sCol4_CouponMember nvarchar(MAX) = NULL
,	@sCol5_CouponMember nvarchar(MAX) = NULL
,	@sCol6_CouponMember nvarchar(MAX) = NULL
,	@sCol7_CouponMember nvarchar(MAX) = NULL
,	@sCol8_CouponMember nvarchar(MAX) = NULL
,	@sCol9_CouponMember nvarchar(MAX) = NULL
,	@sCol10_CouponMember nvarchar(MAX) = NULL
AS 
--조회된 Coupon의 itemid와 수량을 이용해 MemberItem에 insert or update 하고 이어서 CouponMember에 insert해서 이벤트 선물 받음을 확인	
--이어서 Coupon의 DupeYN이 N이면 쿠폰의 DeleteYN 을 Y로 업데이트 해서 쿠폰이 사용 불가하도록 한다.

--itemID가 인벤에 있을 경우 MemberItem에 update
--itemID가 인벤에 없을 경우 MemberItem에 insert
--set, lock 옵션 등 체크
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
declare @DupeYN_Coupon nvarchar(1)
set @DupeYN_Coupon = (select DupeYN from Coupon where CouponID like @CouponID_Coupon)	--쿠폰의 DupeYN 값을 알아온다.

--쿠폰id로 조회해 해당 쿠폰이 사용 조건과 맞지 않으면 종료
if exists(select CouponID from Coupon where CouponID like @CouponID_Coupon and sysutcdatetime() between CouponDurationFrom and CouponDurationTo and Coupon.HideYN like 'N' and Coupon.DeleteYN like 'N')
begin
	if upper(@InsertORUpdate) = 'INSERT' 
		begin
			begin tran
				--INSERT 일 경우 MemberItems에 추가하고,  EventMember에 삽입
				--MemberItems에 추가
				--MemberItemID는 기본값으로 GUID 처리
				insert into MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(
					newid()
					,	@MemberID_MemberItems
					,	@ItemListID_MemberItems
					,	@ItemCount_MemberItems
					,	@ItemStatus_MemberItems
					,	@sCol1_MemberItems
					,	@sCol2_MemberItems
					,	@sCol3_MemberItems
					,	@sCol4_MemberItems
					,	@sCol5_MemberItems
					,	@sCol6_MemberItems
					,	@sCol7_MemberItems
					,	@sCol8_MemberItems
					,	@sCol9_MemberItems
					,	@sCol10_MemberItems
					)
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				-- CouponMember에 추가 수행해 이벤트 CouponMemberID는 GUID로 자동 삽입됨
				insert into CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(
					newid(), 
					@CouponID_CouponMember
				,	@MemberID_CouponMember
				,	@sCol1_CouponMember
				,	@sCol2_CouponMember
				,	@sCol3_CouponMember
				,	@sCol4_CouponMember
				,	@sCol5_CouponMember
				,	@sCol6_CouponMember
				,	@sCol7_CouponMember
				,	@sCol8_CouponMember
				,	@sCol9_CouponMember
				,	@sCol10_CouponMember
				)
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				if upper(@DupeYN_Coupon) = 'N'		-- 중복 사용 가능 쿠폰이면 아무것도 안함. N 일 경우에는 쿠폰 테이블 업데이트
					begin
						update Coupon set DeleteYN = 'Y' WHERE CouponID like @CouponID_Coupon
					end
				set @rowcount = @rowcount + (select @@ROWCOUNT)
			commit tran
		end
	if upper(@InsertORUpdate) = 'UPDATE'
		begin
			begin tran
				--MemberItems에 수정하고,  EventMember에 추가
				--MemberItems에 수정
				update MemberItems set
					MemberID = CASE WHEN @MemberID_MemberItems is not null THEN @MemberID_MemberItems ELSE  MemberID END
					, ItemListID = CASE WHEN @ItemListID_MemberItems is not null THEN @ItemListID_MemberItems ELSE  ItemListID END
					, ItemCount = CASE WHEN @ItemCount_MemberItems is not null THEN @ItemCount_MemberItems ELSE  ItemCount END
					, ItemStatus = CASE WHEN @ItemStatus_MemberItems is not null THEN @ItemStatus_MemberItems ELSE  ItemStatus END
					, sCol1 = CASE WHEN @sCol1_MemberItems is not null THEN @sCol1_MemberItems ELSE  sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberItems is not null THEN @sCol2_MemberItems ELSE  sCol2 END
					, sCol3 = CASE WHEN @sCol3_MemberItems is not null THEN @sCol3_MemberItems ELSE  sCol3 END
					, sCol4 = CASE WHEN @sCol4_MemberItems is not null THEN @sCol4_MemberItems ELSE  sCol4 END
					, sCol5 = CASE WHEN @sCol5_MemberItems is not null THEN @sCol5_MemberItems ELSE  sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberItems is not null THEN @sCol6_MemberItems ELSE  sCol6 END
					, sCol7 = CASE WHEN @sCol7_MemberItems is not null THEN @sCol7_MemberItems ELSE  sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberItems is not null THEN @sCol8_MemberItems ELSE  sCol8 END
					, sCol9 = CASE WHEN @sCol9_MemberItems is not null THEN @sCol9_MemberItems ELSE  sCol9 END
					, sCol10 = CASE WHEN @sCol10_MemberItems is not null THEN @sCol10_MemberItems ELSE  sCol10 END
					,UpdatedAt = sysutcdatetime()
				where MemberItemID like @MemberItemID_MemberItems
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				--  CouponMember에 추가	CouponMemberID는 insert라 생성해 넣음
				insert into CouponMember(CouponMemberID, CouponID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(
					newid(), 
					@CouponID_CouponMember
				,	@MemberID_CouponMember
				,	@sCol1_CouponMember
				,	@sCol2_CouponMember
				,	@sCol3_CouponMember
				,	@sCol4_CouponMember
				,	@sCol5_CouponMember
				,	@sCol6_CouponMember
				,	@sCol7_CouponMember
				,	@sCol8_CouponMember
				,	@sCol9_CouponMember
				,	@sCol10_CouponMember
				)
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				if upper(@DupeYN_Coupon) = 'N'		-- 중복 사용 가능 쿠폰(Y)이면 아무것도 안함. N 일 경우에는 쿠폰 테이블 업데이트해서 쿠폰 삭제
					begin
						update Coupon set DeleteYN = 'Y', UpdatedAt=SYSUTCDATETIME() WHERE CouponID like @CouponID_Coupon
					end
				set @rowcount = @rowcount + (select @@ROWCOUNT)
			commit tran
		end
	select @rowcount as Result
end
else
	select 0 as Result
GO

/*
-----------------------------------------------------------------------
--@InsertORUpdate,@DupeYN_Coupon,@CouponID_Coupon,@MemberItemID_MemberItems,@MemberID_MemberItem,@ItemListID_MemberItem,@ItemCount_MemberItem,@ItemStatus_MemberItem,@HideYN_MemberItem,@DeleteYN_MemberItem,@sCol1_MemberItem,@sCol2_MemberItem,@sCol3_MemberItem,@sCol4_MemberItem,@sCol5_MemberItem,@sCol6_MemberItem,@sCol7_MemberItem,@sCol8_MemberItem,@sCol9_MemberItem,@sCol10_MemberItem,@CouponID_CouponMember,@MemberID_CouponMember,@HideYN_CouponMember,@DeleteYN_CouponMember,@sCol1_CouponMember,@sCol2_CouponMember,@sCol3_CouponMember,@sCol4_CouponMember,@sCol5_CouponMember,@sCol6_CouponMember,@sCol7_CouponMember,@sCol8_CouponMember,@sCol9_CouponMember,@sCol10_CouponMember
--현재 MemberID가 참여하지 않은 이벤트 리스트
EXEC uspUdtCouponMember 'INSERT','ABC00D7A-4047-4A87-A61A-C4E96F62F8E9','540B7F7A-472C-461E-BE5C-9FBEE82393F0','aaa','ItemListID_MemberItems','ItemCount_MemberItems','ItemStatus_MemberItems','sCol1_MemberItems','sCol2_MemberItems','sCol3_MemberItems','sCol4_MemberItems','sCol5_MemberItems','sCol6_MemberItems','sCol7_MemberItems','sCol8_MemberItems','sCol9_MemberItems','sCol10_MemberItems','ABC00D7A-4047-4A87-A61A-C4E96F62F8E9','aaa','sCol1_CouponMember','sCol2_CouponMember','sCol3_CouponMember','sCol4_CouponMember','sCol5_CouponMember','sCol6_CouponMember','sCol7_CouponMember','sCol8_CouponMember','sCol9_CouponMember','sCol10_CouponMember'
-----------------------------------------------------------------------

SELECT * FROM ItemLists
SELECT * FROM Coupon
SELECT * FROM CouponMember
SELECT * FROM MemberItems
*/
