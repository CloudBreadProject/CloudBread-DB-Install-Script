-- uspUdtSendGift 프로시저 생성
--DROP PROC uspUdtSendGift
CREATE PROC uspUdtSendGift
@DeleteORUpdate nvarchar(MAX) = NULL		-- 인벤의 카운트 - 보내려는  숫자 = 0 이면 아이템을 삭제 또는 인벤카운드 - 팔려는 숫자 > 0 이면 수정을 결정 해서 파라미터로
,@MemberItemID_MemberItem nvarchar(MAX) = NULL
,@MemberID_MemberItem nvarchar(MAX) = NULL
,@ItemListID_MemberItem nvarchar(MAX) = NULL
,@ItemCount_MemberItem nvarchar(MAX) = NULL
,@ItemStatus_MemberItem nvarchar(MAX) = NULL
--,@HideYN_MemberItem nvarchar(MAX) = NULL
--,@DeleteYN_MemberItem nvarchar(MAX) = NULL
,@sCol1_MemberItem nvarchar(MAX) = NULL
,@sCol2_MemberItem nvarchar(MAX) = NULL
,@sCol3_MemberItem nvarchar(MAX) = NULL
,@sCol4_MemberItem nvarchar(MAX) = NULL
,@sCol5_MemberItem nvarchar(MAX) = NULL
,@sCol6_MemberItem nvarchar(MAX) = NULL
,@sCol7_MemberItem nvarchar(MAX) = NULL
,@sCol8_MemberItem nvarchar(MAX) = NULL
,@sCol9_MemberItem nvarchar(MAX) = NULL
,@sCol10_MemberItem nvarchar(MAX) = NULL

,@GiftDepositoryID_GiftDepository nvarchar(MAX) = NULL
--,@ItemName_GiftDepository nvarchar(MAX) = NULL
,@ItemListID_GiftDepository nvarchar(MAX) = NULL
,@ItemCount_GiftDepository nvarchar(MAX) = NULL
,@FromMemberID_GiftDepository nvarchar(MAX) = NULL
,@ToMemberID_GiftDepository nvarchar(MAX) = NULL
--,@SentMemberYN_GiftDepository nvarchar(MAX) = NULL
--,@HideYN_GiftDepository nvarchar(MAX) = NULL
--,@DeleteYN_GiftDepository nvarchar(MAX) = NULL
,@sCol1_GiftDepository nvarchar(MAX) = NULL
,@sCol2_GiftDepository nvarchar(MAX) = NULL
,@sCol3_GiftDepository nvarchar(MAX) = NULL
,@sCol4_GiftDepository nvarchar(MAX) = NULL
,@sCol5_GiftDepository nvarchar(MAX) = NULL
,@sCol6_GiftDepository nvarchar(MAX) = NULL
,@sCol7_GiftDepository nvarchar(MAX) = NULL
,@sCol8_GiftDepository nvarchar(MAX) = NULL
,@sCol9_GiftDepository nvarchar(MAX) = NULL
,@sCol10_GiftDepository nvarchar(MAX) = NULL

AS 
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
if upper(@DeleteORUpdate) = 'DELETE' 
	begin
		begin tran
			--MemberItems에 삭제하고,  GiftDepositories에 insert 
			--MemberItems에 삭제
			--delete from MemberItems where MemberItemID like @MemberItemID_MemberItem
			update MemberItems set DeleteYN = 'Y', UpdatedAt = SYSUTCDATETIME() where MemberItemID like @MemberItemID_MemberItem
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- GiftDepositories 를 insert
			insert into GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 )
			values(
				NEWID() 
--				,@ItemName_GiftDepository 
				,@ItemListID_GiftDepository 
				,@ItemCount_GiftDepository 
				,@FromMemberID_GiftDepository 
				,@ToMemberID_GiftDepository 
				--,@SentMemberYN_GiftDepository 
				--,@HideYN_GiftDepository 
				--,@DeleteYN_GiftDepository 
				,@sCol1_GiftDepository 
				,@sCol2_GiftDepository 
				,@sCol3_GiftDepository 
				,@sCol4_GiftDepository 
				,@sCol5_GiftDepository 
				,@sCol6_GiftDepository 
				,@sCol7_GiftDepository 
				,@sCol8_GiftDepository 
				,@sCol9_GiftDepository 
				,@sCol10_GiftDepository
				)
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@DeleteORUpdate) = 'UPDATE'
	begin
		begin tran
			--MemberItems에 수정하고,  GiftDepositories에 insert 
			--MemberItems에 수정
			update MemberItems set
				MemberID = CASE WHEN @MemberID_MemberItem is not null THEN @MemberID_MemberItem  ELSE MemberID   END
				, ItemListID = CASE WHEN @ItemListID_MemberItem is not null THEN @ItemListID_MemberItem  ELSE  ItemListID  END
				, ItemCount = CASE WHEN @ItemCount_MemberItem is not null THEN @ItemCount_MemberItem  ELSE   ItemCount END
				, ItemStatus = CASE WHEN @ItemStatus_MemberItem is not null THEN @ItemStatus_MemberItem  ELSE  ItemStatus  END
				--, HideYN = CASE WHEN @HideYN_MemberItem is not null THEN @HideYN_MemberItem  ELSE  HideYN  END
				--, DeleteYN = CASE WHEN @DeleteYN_MemberItem is not null THEN @DeleteYN_MemberItem  ELSE  DeleteYN  END
				, sCol1 = CASE WHEN @sCol1_MemberItem is not null THEN @sCol1_MemberItem  ELSE  sCol1  END
				, sCol2 = CASE WHEN @sCol2_MemberItem is not null THEN @sCol2_MemberItem  ELSE  sCol2 END
				, sCol3 = CASE WHEN @sCol3_MemberItem is not null THEN @sCol3_MemberItem  ELSE  sCol3  END
				, sCol4 = CASE WHEN @sCol4_MemberItem is not null THEN @sCol4_MemberItem  ELSE  sCol4  END
				, sCol5 = CASE WHEN @sCol5_MemberItem is not null THEN @sCol5_MemberItem  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItem is not null THEN @sCol6_MemberItem  ELSE  sCol6  END
				, sCol7 = CASE WHEN @sCol7_MemberItem is not null THEN @sCol7_MemberItem  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItem is not null THEN @sCol8_MemberItem  ELSE  sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItem is not null THEN @sCol9_MemberItem  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItem is not null THEN @sCol10_MemberItem  ELSE  sCol10  END
				, UpdatedAt = SYSUTCDATETIME()
			where MemberItemID like @MemberItemID_MemberItem
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- GiftDepositories 를 insert
			insert into GiftDepositories(GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID,sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 )
			values(
				NEWID() 
--				,@ItemName_GiftDepository 
				,@ItemListID_GiftDepository 
				,@ItemCount_GiftDepository 
				,@FromMemberID_GiftDepository 
				,@ToMemberID_GiftDepository 
				--,@SentMemberYN_GiftDepository 
				--,@HideYN_GiftDepository 
				--,@DeleteYN_GiftDepository 
				,@sCol1_GiftDepository 
				,@sCol2_GiftDepository 
				,@sCol3_GiftDepository 
				,@sCol4_GiftDepository 
				,@sCol5_GiftDepository 
				,@sCol6_GiftDepository 
				,@sCol7_GiftDepository 
				,@sCol8_GiftDepository 
				,@sCol9_GiftDepository 
				,@sCol10_GiftDepository 
				)
			set @rowcount = @rowcount + (select @@ROWCOUNT)

		commit tran
	end

select @rowcount as Result

GO

/*
-----------------------------------------------------------------------
EXEC uspUdtSendGift 'DELETE','540B7F7A-472C-461E-BE5C-9FBEE82393F0','aaa','C21BA95D-B736-4123-8531-75B7C5E8C906','43','상태나빠','sCol1_MemberItem','sCol2_MemberItem','sCol3_MemberItem','sCol4_MemberItem','sCol5_MemberItem','sCol6_MemberItem','sCol7_MemberItem','sCol8_MemberItem','sCol9_MemberItem','sCol10_MemberItem',null,'5395E0E0-9C9F-4A5E-995E-668C7E5B1415','20','aaa','ccc','sCol1_GiftDepository','sCol2_GiftDepository','sCol3_GiftDepository','sCol4_GiftDepository','sCol5_GiftDepository','sCol6_GiftDepository','sCol7_GiftDepository','sCol8_GiftDepository','sCol9_GiftDepository','sCol10_GiftDepository'
EXEC uspUdtSendGift 'UPDATE','540B7F7A-472C-461E-BE5C-9FBEE82393F0','aaa','C21BA95D-B736-4123-8531-75B7C5E8C906','43','상태나빠','sCol1_MemberItem','sCol2_MemberItem','sCol3_MemberItem','sCol4_MemberItem','sCol5_MemberItem','sCol6_MemberItem','sCol7_MemberItem','sCol8_MemberItem','sCol9_MemberItem','sCol10_MemberItem',null,'5395E0E0-9C9F-4A5E-995E-668C7E5B1415','20','aaa','ccc','sCol1_GiftDepository','sCol2_GiftDepository','sCol3_GiftDepository','sCol4_GiftDepository','sCol5_GiftDepository','sCol6_GiftDepository','sCol7_GiftDepository','sCol8_GiftDepository','sCol9_GiftDepository','sCol10_GiftDepository'
EXEC uspUdtSendGift 'UPDATE', '5A33732D-549A-41AE-B170-D536E40D2FA2', NULL, '아이템1122', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '선물IDGUID', '아이템명', '아이템리스트아이디', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''

SELECT * FROM MemberItems
SELECT * FROM GiftDepositories
*/

