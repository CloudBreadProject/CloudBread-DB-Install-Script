
-----------------------------------------------------------------------
-- uspUdtMoveGift 프로시저 생성
--MERGE를 이용하는 방식이나 현재 사용하지 않음

--이미 item은 선물로부터 조회된 상태. 내 인벤에 있으면 @InsertORUpdate 파라미터를 통해 update, 없으면 insert로 간다
--NULL일 경우 SET에서 업데이트 하지 않음.
--DROP PROC uspUdtMoveGift
CREATE PROC uspUdtMoveGift
 @InsertORUpdate nvarchar(MAX) 		-- 문자열은 INSERT  또는 UPDATE
, @GiftDepositoryID nvarchar(MAX)	 	--gift 테이블 삭제 플래그 처리를 위해
,	@MemberItemID nvarchar(MAX) = NULL
,	@MemberID nvarchar(MAX) = NULL
,	@ItemListID nvarchar(MAX) = NULL
,	@ItemCount nvarchar(MAX) = NULL
,	@ItemStatus nvarchar(MAX) = NULL
,	@sCol1 nvarchar(MAX) = NULL
,	@sCol2 nvarchar(MAX) = NULL
,	@sCol3 nvarchar(MAX) = NULL
,	@sCol4 nvarchar(MAX) = NULL
,	@sCol5 nvarchar(MAX) = NULL
,	@sCol6 nvarchar(MAX) = NULL
,	@sCol7 nvarchar(MAX) = NULL
,	@sCol8 nvarchar(MAX) = NULL
,	@sCol9 nvarchar(MAX) = NULL
,	@sCol10 nvarchar(MAX) = NULL
AS 
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0

if upper(@InsertORUpdate) = 'INSERT' 
	begin
		begin tran
			--MemberItems에 삽입하고 gift에서 gift deleteYN flag 바꾸기
			insert into MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10) 
			values(@MemberItemID,@MemberID,@ItemListID,@ItemCount,@ItemStatus,@sCol1,@sCol2,@sCol3,@sCol4,@sCol5,@sCol6,@sCol7,@sCol8,@sCol9,@sCol10)
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			--삭제 플래그 루틴
			--delete from GiftDepositories where GiftDepositoryID like @GiftDepositoryID
			update GiftDepositories set SentMemberYN = 'Y', DeleteYN = 'Y', UpdatedAt = sysutcdatetime() 
			where GiftDepositoryID like @GiftDepositoryID and ToMemberID like @MemberID
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@InsertORUpdate) = 'UPDATE'
	begin
		begin tran
		--MemberItems에 update하고 gift에서 gift 실제 삭제
		update MemberItems set 
			MemberID = CASE WHEN @MemberID is not null THEN @MemberID ELSE  MemberID END
			, ItemListID = CASE WHEN @ItemListID is not null THEN @ItemListID ELSE  ItemListID END
			, ItemCount = CASE WHEN @ItemCount is not null THEN @ItemCount ELSE  ItemCount END
			, ItemStatus = CASE WHEN @ItemStatus is not null THEN @ItemStatus ELSE  ItemStatus END
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
			, UpdatedAt = sysutcdatetime()
			where MemberItemID like @MemberItemID
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		--삭제 플래그 루틴
		--delete from GiftDepositories where GiftDepositoryID like @GiftDepositoryID
		update GiftDepositories set SentMemberYN = 'Y', DeleteYN = 'Y', UpdatedAt = sysutcdatetime() where GiftDepositoryID like @GiftDepositoryID
		set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end

select @rowcount as Result
GO

/*
-----------------------------------------------------------------------
EXEC uspUdtMoveGift 'INSERT', '03470671-9A4D-4178-AEAA-8B5F463AF84B', null ,'aaa','ItemListID','ItemCount','ItemStatus','sCol1','sCol2','sCol3','sCol4','sCol5','sCol6','sCol7','sCol8','sCol9','sCol10'
EXEC uspUdtMoveGift 'UPDATE', 'E3D99DAC-02A2-4CF8-A9A9-A6C8DBDF90E3','B7C1FE81-35A5-489D-AAC6-4E6267181F17','aaa','ItemListID','ItemCount','ItemStatus','sCol1','sCol2','sCol3','sCol4','sCol5','sCol6','sCol7','sCol8','sCol9','sCol10'
-----------------------------------------------------------------------

select * from GiftDepositories
select * from MemberItems

--select * from GiftDepositories
*/
