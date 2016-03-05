--DROP PROC uspAddUseMemberItem
CREATE PROC uspAddUseMemberItem
@InsertORUpdateORDelete nvarchar(MAX) = NULL
--  MemberItems 테이블 처리
-- 수집일 경우 인벤에 없으면 insert, 있으면 update  - 클라이언트에서 분기 
-- 사용일 경우 인벤에 있고,  수량-사용하려는 수량 > 0 이면 update.  수량-사용하려는 수량 = 0 이면 삭제
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
,@MemberID_MemberGameInfoes nvarchar(MAX) = NULL
,@Level_MemberGameInfoes nvarchar(MAX) = NULL
,@Exps_MemberGameInfoes nvarchar(MAX) = NULL
,@Points_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT1_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT2_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT3_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT4_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT5_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT6_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT7_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT8_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT9_MemberGameInfoes nvarchar(MAX) = NULL
,@UserSTAT10_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol1_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol2_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol3_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol4_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol5_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol6_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol7_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol8_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol9_MemberGameInfoes nvarchar(MAX) = NULL
,@sCol10_MemberGameInfoes nvarchar(MAX) = NULL

AS 
--set, lock 옵션 등 체크
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
if upper(@InsertORUpdateORDelete) = 'INSERT' 
	begin
		begin tran
			--MemberItems에 추가하고,  MemberGamesInfoes에 수정
			--MemberItems에 추가
			insert into MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
			values(
				@MemberItemID_MemberItem 
				,@MemberID_MemberItem 
				,@ItemListID_MemberItem 
				,@ItemCount_MemberItem 
				,@ItemStatus_MemberItem 
				--,@HideYN_MemberItem 
				--,@DeleteYN_MemberItem 
				,@sCol1_MemberItem 
				,@sCol2_MemberItem 
				,@sCol3_MemberItem 
				,@sCol4_MemberItem 
				,@sCol5_MemberItem 
				,@sCol6_MemberItem 
				,@sCol7_MemberItem 
				,@sCol8_MemberItem 
				,@sCol9_MemberItem 
				,@sCol10_MemberItem 
				)
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- MemberGamesInfoes update 수행
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6   END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7   END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8   END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					, UpdatedAt = SYSUTCDATETIME()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@InsertORUpdateORDelete) = 'UPDATE'
	begin
		begin tran
			--MemberItems에 수정하고,  MemberGameInfoes에 update 
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
				,UpdatedAt = SYSUTCDATETIME()
			where MemberItemID like @MemberItemID_MemberItem
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- MemberGameInfoes 를 update 수행
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6   END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7   END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8   END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					,UpdatedAt = SYSUTCDATETIME()
				where MemberID like @MemberID_MemberGameInfoes

			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end

if upper(@InsertORUpdateORDelete) = 'DELETE'
	begin
		begin tran
			--MemberItems에 삭제하고,  MemberGameInfoes에 update 
			--MemberItems에 삭제
			--delete from MemberItems where MemberItemID like @MemberItemID_MemberItem
			update MemberItems set DeleteYN = 'Y', UpdatedAt = SYSUTCDATETIME() where MemberItemID like @MemberItemID_MemberItem
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- MemberGameInfoes 를 update 수행
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6   END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7   END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8   END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
				where MemberID like @MemberID_MemberGameInfoes

			set @rowcount = @rowcount + (select @@ROWCOUNT)

		commit tran
	end
select @rowcount as Result
GO

/*
-----------------------------------------------------------------------
EXEC uspAddUseMemberItem 'INSERT','MemberItemsID55','bbb','itemid4','47','cool','sCol1_MemberItem','sCol2_MemberItem','sCol3_MemberItem','sCol4_MemberItem','sCol5_MemberItem','sCol6_MemberItem','sCol7_MemberItem','sCol8_MemberItem','sCol9_MemberItem','sCol10_MemberItem','bbb','8','87','777765','UserSTAT1_MemberGameInfoes','UserSTAT2_MemberGameInfoes','UserSTAT3_MemberGameInfoes','UserSTAT4_MemberGameInfoes','UserSTAT5_MemberGameInfoes','UserSTAT6_MemberGameInfoes','UserSTAT7_MemberGameInfoes','UserSTAT8_MemberGameInfoes','UserSTAT9_MemberGameInfoes','UserSTAT10_MemberGameInfoes','sCol1_MemberGameInfoes','sCol2_MemberGameInfoes','sCol3_MemberGameInfoes','sCol4_MemberGameInfoes','sCol5_MemberGameInfoes','sCol6_MemberGameInfoes','sCol7_MemberGameInfoes','sCol8_MemberGameInfoes','sCol9_MemberGameInfoes','sCol10_MemberGameInfoes'
EXEC uspAddUseMemberItem 'UPDATE','MemberItemsID5','aaa','itemid4','4747','updating status','sCol1_MemberItem','sCol2_MemberItem','sCol3_MemberItem','sCol4_MemberItem','sCol5_MemberItem','sCol6_MemberItem','sCol7_MemberItem','sCol8_MemberItem','sCol9_MemberItem','sCol10_MemberItem','aaa','55','66','555666','UserSTAT1_MemberGameInfoes','UserSTAT2_MemberGameInfoes','UserSTAT3_MemberGameInfoes','UserSTAT4_MemberGameInfoes','UserSTAT5_MemberGameInfoes','UserSTAT6_MemberGameInfoes','UserSTAT7_MemberGameInfoes','UserSTAT8_MemberGameInfoes','UserSTAT9_MemberGameInfoes','UserSTAT10_MemberGameInfoes','sCol1_MemberGameInfoes','sCol2_MemberGameInfoes','sCol3_MemberGameInfoes','sCol4_MemberGameInfoes','sCol5_MemberGameInfoes','sCol6_MemberGameInfoes','sCol7_MemberGameInfoes','sCol8_MemberGameInfoes','sCol9_MemberGameInfoes','sCol10_MemberGameInfoes'
EXEC uspAddUseMemberItem 'DELETE','MemberItemsID5','aaa','itemid4','6767','bad','sCol1_MemberItem','sCol2_MemberItem','sCol3_MemberItem','sCol4_MemberItem','sCol5_MemberItem','sCol6_MemberItem','sCol7_MemberItem','sCol8_MemberItem','sCol9_MemberItem','sCol10_MemberItem','aaa','8','87','777765','UserSTAT1_MemberGameInfoes','UserSTAT2_MemberGameInfoes','UserSTAT3_MemberGameInfoes','UserSTAT4_MemberGameInfoes','UserSTAT5_MemberGameInfoes','UserSTAT6_MemberGameInfoes','UserSTAT7_MemberGameInfoes','UserSTAT8_MemberGameInfoes','UserSTAT9_MemberGameInfoes','UserSTAT10_MemberGameInfoes','sCol1_MemberGameInfoes','sCol2_MemberGameInfoes','sCol3_MemberGameInfoes','sCol4_MemberGameInfoes','sCol5_MemberGameInfoes','sCol6_MemberGameInfoes','sCol7_MemberGameInfoes','sCol8_MemberGameInfoes','sCol9_MemberGameInfoes','sCol10_MemberGameInfoes'
-----------------------------------------------------------------------
SELECT * FROM MemberItems
SELECT * FROM MemberGameInfoes
SELECT * FROM ItemLists
*/
