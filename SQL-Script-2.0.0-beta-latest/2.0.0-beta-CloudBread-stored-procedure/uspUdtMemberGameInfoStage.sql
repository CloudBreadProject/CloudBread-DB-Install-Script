
--DROP PROC uspUdtMemberGameInfoStage
CREATE PROC uspUdtMemberGameInfoStage
@InsertORUpdate nvarchar(MAX) = NULL
, @MemberID_MemberGameInfoes nvarchar(MAX) = NULL
, @Level_MemberGameInfoes nvarchar(MAX) = NULL
, @Exps_MemberGameInfoes nvarchar(MAX) = NULL
, @Points_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT1_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT2_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT3_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT4_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT5_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT6_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT7_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT8_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT9_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT10_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol1_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol2_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol3_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol4_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol5_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol6_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol7_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol8_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol9_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol10_MemberGameInfoes nvarchar(MAX) = NULL
, @MemberGameInfoStageID_MemberGameInfoStages nvarchar(MAX) = NULL
, @MemberID_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageName_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStatus_MemberGameInfoStages nvarchar(MAX) = NULL
, @Category1_MemberGameInfoStages nvarchar(MAX) = NULL
, @Category2_MemberGameInfoStages nvarchar(MAX) = NULL
, @Category3_MemberGameInfoStages nvarchar(MAX) = NULL
, @Mission1_MemberGameInfoStages nvarchar(MAX) = NULL
, @Mission2_MemberGameInfoStages nvarchar(MAX) = NULL
, @Mission3_MemberGameInfoStages nvarchar(MAX) = NULL
, @Mission4_MemberGameInfoStages nvarchar(MAX) = NULL
, @Mission5_MemberGameInfoStages nvarchar(MAX) = NULL
, @Points_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStat1_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStat2_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStat3_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStat4_MemberGameInfoStages nvarchar(MAX) = NULL
, @StageStat5_MemberGameInfoStages nvarchar(MAX) = NULL
--, @HideYN_MemberGameInfoStages nvarchar(MAX) = NULL
--, @DeleteYN_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol1_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol2_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol3_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol4_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol5_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol6_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol7_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol8_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol9_MemberGameInfoStages nvarchar(MAX) = NULL
, @sCol10_MemberGameInfoStages nvarchar(MAX) = NULL
AS 
--stage가 있을 경우 update 하고 없을 경우 insret 한다.
--set, lock 옵션 등 체크
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
	if upper(@InsertORUpdate) = 'INSERT' 
		begin
			begin tran
				--INSERT 일 경우 MemberGameInfoStages에 추가하고,  MemberGameInfo에 update
				insert into MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5,  sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
				values(@MemberGameInfoStageID_MemberGameInfoStages, @MemberID_MemberGameInfoStages, @StageName_MemberGameInfoStages, @StageStatus_MemberGameInfoStages, @Category1_MemberGameInfoStages, @Category2_MemberGameInfoStages, @Category3_MemberGameInfoStages, @Mission1_MemberGameInfoStages, @Mission2_MemberGameInfoStages, @Mission3_MemberGameInfoStages, @Mission4_MemberGameInfoStages, @Mission5_MemberGameInfoStages, @Points_MemberGameInfoStages, @StageStat1_MemberGameInfoStages, @StageStat2_MemberGameInfoStages, @StageStat3_MemberGameInfoStages, @StageStat4_MemberGameInfoStages, @StageStat5_MemberGameInfoStages,@sCol1_MemberGameInfoStages, @sCol2_MemberGameInfoStages, @sCol3_MemberGameInfoStages, @sCol4_MemberGameInfoStages, @sCol5_MemberGameInfoStages, @sCol6_MemberGameInfoStages, @sCol7_MemberGameInfoStages, @sCol8_MemberGameInfoStages, @sCol9_MemberGameInfoStages, @sCol10_MemberGameInfoStages)
				set @rowcount = @rowcount + (select @@ROWCOUNT)

				-- MemberGameInfo에 update 수행
				update MemberGameInfoes set
					MemberID = CASE WHEN @MemberID_MemberGameInfoes is not null THEN @MemberID_MemberGameInfoes ELSE MemberID END
					, Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes ELSE Level END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes ELSE Exps END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes ELSE Points END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes ELSE UserSTAT1 END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes ELSE UserSTAT2 END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes ELSE UserSTAT3 END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes ELSE UserSTAT4 END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes ELSE UserSTAT5 END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes ELSE UserSTAT6 END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes ELSE UserSTAT7 END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes ELSE UserSTAT8 END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes ELSE UserSTAT9 END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes ELSE UserSTAT10 END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes ELSE sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes ELSE sCol2 END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes ELSE sCol3 END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes ELSE sCol4 END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes ELSE sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes ELSE sCol6 END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes ELSE sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes ELSE sCol8 END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes ELSE sCol9 END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes ELSE sCol10 END
					,UpdatedAt = SYSUTCDATETIME()
				where MemberID like @MemberID_MemberGameInfoes

				set @rowcount = @rowcount + (select @@ROWCOUNT)
			commit tran
		end
	if upper(@InsertORUpdate) = 'UPDATE'
		begin
			begin tran
				----UPDATE 일 경우 MemberGameInfoStages에 update 하고,  MemberGameInfo에 update
				-- MemberGameInfoStages에 update 수행
				update MemberGameInfoStages set
					 MemberGameInfoStageID = CASE WHEN @MemberGameInfoStageID_MemberGameInfoStages is not null THEN @MemberGameInfoStageID_MemberGameInfoStages ELSE  MemberGameInfoStageID END
						, MemberID = CASE WHEN @MemberID_MemberGameInfoStages is not null THEN @MemberID_MemberGameInfoStages ELSE  MemberID END
						, StageName = CASE WHEN @StageName_MemberGameInfoStages is not null THEN @StageName_MemberGameInfoStages ELSE  StageName END
						, StageStatus = CASE WHEN @StageStatus_MemberGameInfoStages is not null THEN @StageStatus_MemberGameInfoStages ELSE  StageStatus END
						, Category1 = CASE WHEN @Category1_MemberGameInfoStages is not null THEN @Category1_MemberGameInfoStages ELSE  Category1 END
						, Category2 = CASE WHEN @Category2_MemberGameInfoStages is not null THEN @Category2_MemberGameInfoStages ELSE  Category2 END
						, Category3 = CASE WHEN @Category3_MemberGameInfoStages is not null THEN @Category3_MemberGameInfoStages ELSE  Category3 END
						, Mission1 = CASE WHEN @Mission1_MemberGameInfoStages is not null THEN @Mission1_MemberGameInfoStages ELSE  Mission1 END
						, Mission2 = CASE WHEN @Mission2_MemberGameInfoStages is not null THEN @Mission2_MemberGameInfoStages ELSE  Mission2 END
						, Mission3 = CASE WHEN @Mission3_MemberGameInfoStages is not null THEN @Mission3_MemberGameInfoStages ELSE  Mission3 END
						, Mission4 = CASE WHEN @Mission4_MemberGameInfoStages is not null THEN @Mission4_MemberGameInfoStages ELSE  Mission4 END
						, Mission5 = CASE WHEN @Mission5_MemberGameInfoStages is not null THEN @Mission5_MemberGameInfoStages ELSE  Mission5 END
						, Points = CASE WHEN @Points_MemberGameInfoStages is not null THEN @Points_MemberGameInfoStages ELSE  Points END
						, StageStat1 = CASE WHEN @StageStat1_MemberGameInfoStages is not null THEN @StageStat1_MemberGameInfoStages ELSE  StageStat1 END
						, StageStat2 = CASE WHEN @StageStat2_MemberGameInfoStages is not null THEN @StageStat2_MemberGameInfoStages ELSE  StageStat2 END
						, StageStat3 = CASE WHEN @StageStat3_MemberGameInfoStages is not null THEN @StageStat3_MemberGameInfoStages ELSE  StageStat3 END
						, StageStat4 = CASE WHEN @StageStat4_MemberGameInfoStages is not null THEN @StageStat4_MemberGameInfoStages ELSE  StageStat4 END
						, StageStat5 = CASE WHEN @StageStat5_MemberGameInfoStages is not null THEN @StageStat5_MemberGameInfoStages ELSE  StageStat5 END
						--, HideYN = CASE WHEN @HideYN_MemberGameInfoStages is not null THEN @HideYN_MemberGameInfoStages ELSE  HideYN END
						--, DeleteYN = CASE WHEN @DeleteYN_MemberGameInfoStages is not null THEN @DeleteYN_MemberGameInfoStages ELSE  DeleteYN END
						, sCol1 = CASE WHEN @sCol1_MemberGameInfoStages is not null THEN @sCol1_MemberGameInfoStages ELSE  sCol1 END
						, sCol2 = CASE WHEN @sCol2_MemberGameInfoStages is not null THEN @sCol2_MemberGameInfoStages ELSE  sCol2 END
						, sCol3 = CASE WHEN @sCol3_MemberGameInfoStages is not null THEN @sCol3_MemberGameInfoStages ELSE  sCol3 END
						, sCol4 = CASE WHEN @sCol4_MemberGameInfoStages is not null THEN @sCol4_MemberGameInfoStages ELSE  sCol4 END
						, sCol5 = CASE WHEN @sCol5_MemberGameInfoStages is not null THEN @sCol5_MemberGameInfoStages ELSE  sCol5 END
						, sCol6 = CASE WHEN @sCol6_MemberGameInfoStages is not null THEN @sCol6_MemberGameInfoStages ELSE  sCol6 END
						, sCol7 = CASE WHEN @sCol7_MemberGameInfoStages is not null THEN @sCol7_MemberGameInfoStages ELSE  sCol7 END
						, sCol8 = CASE WHEN @sCol8_MemberGameInfoStages is not null THEN @sCol8_MemberGameInfoStages ELSE  sCol8 END
						, sCol9 = CASE WHEN @sCol9_MemberGameInfoStages is not null THEN @sCol9_MemberGameInfoStages ELSE  sCol9 END
						, sCol10 = CASE WHEN @sCol10_MemberGameInfoStages is not null THEN @sCol10_MemberGameInfoStages ELSE  sCol10 END
						, UpdatedAt = SYSUTCDATETIME()
					where MemberGameInfoStageID like @MemberGameInfoStageID_MemberGameInfoStages

				-- MemberGameInfo에 update 수행
				update MemberGameInfoes set
					MemberID = CASE WHEN @MemberID_MemberGameInfoes is not null THEN @MemberID_MemberGameInfoes ELSE MemberID END
					, Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes ELSE Level END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes ELSE Exps END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes ELSE Points END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes ELSE UserSTAT1 END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes ELSE UserSTAT2 END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes ELSE UserSTAT3 END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes ELSE UserSTAT4 END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes ELSE UserSTAT5 END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes ELSE UserSTAT6 END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes ELSE UserSTAT7 END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes ELSE UserSTAT8 END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes ELSE UserSTAT9 END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes ELSE UserSTAT10 END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes ELSE sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes ELSE sCol2 END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes ELSE sCol3 END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes ELSE sCol4 END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes ELSE sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes ELSE sCol6 END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes ELSE sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes ELSE sCol8 END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes ELSE sCol9 END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes ELSE sCol10 END
					,UpdatedAt = SYSUTCDATETIME()
				where MemberID like @MemberID_MemberGameInfoes
				set @rowcount = @rowcount + (select @@ROWCOUNT)
			commit tran
		end

	select @rowcount as Result

GO

/*
-----------------------------------------------------------------------
EXEC uspUdtMemberGameInfoStage 'INSERT','aaa', '23', '22', '23', 'UserSTAT1_MemberGameInfoes', 'UserSTAT2_MemberGameInfoes', 'UserSTAT3_MemberGameInfoes', 'UserSTAT4_MemberGameInfoes', 'UserSTAT5_MemberGameInfoes', 'UserSTAT6_MemberGameInfoes', 'UserSTAT7_MemberGameInfoes', 'UserSTAT8_MemberGameInfoes', 'UserSTAT9_MemberGameInfoes', 'UserSTAT10_MemberGameInfoes', 'sCol1_MemberGameInfoes', 'sCol2_MemberGameInfoes', 'sCol3_MemberGameInfoes', 'sCol4_MemberGameInfoes', 'sCol5_MemberGameInfoes', 'sCol6_MemberGameInfoes', 'sCol7_MemberGameInfoes', 'sCol8_MemberGameInfoes', 'sCol9_MemberGameInfoes', 'sCol10_MemberGameInfoes', null, 'aaa', '화난다', '못깬다', 'Category1_MemberGameInfoStages', 'Category2_MemberGameInfoStages', 'Category3_MemberGameInfoStages', 'Mission1_MemberGameInfoStages', 'Mission2_MemberGameInfoStages', 'Mission3_MemberGameInfoStages', 'Mission4_MemberGameInfoStages', 'Mission5_MemberGameInfoStages', 'Points_MemberGameInfoStages', 'StageStat1_MemberGameInfoStages', 'StageStat2_MemberGameInfoStages', 'StageStat3_MemberGameInfoStages', 'StageStat4_MemberGameInfoStages', 'StageStat5_MemberGameInfoStages', 'sCol1_MemberGameInfoStages', 'sCol2_MemberGameInfoStages', 'sCol3_MemberGameInfoStages', 'sCol4_MemberGameInfoStages', 'sCol5_MemberGameInfoStages', 'sCol6_MemberGameInfoStages', 'sCol7_MemberGameInfoStages', 'sCol8_MemberGameInfoStages', 'sCol9_MemberGameInfoStages', 'sCol10_MemberGameInfoStages'
EXEC uspUdtMemberGameInfoStage 'UPDATE','aaa', '23', '22', '23', 'UserSTAT1_MemberGameInfoes', 'UserSTAT2_MemberGameInfoes', 'UserSTAT3_MemberGameInfoes', 'UserSTAT4_MemberGameInfoes', 'UserSTAT5_MemberGameInfoes', 'UserSTAT6_MemberGameInfoes', 'UserSTAT7_MemberGameInfoes', 'UserSTAT8_MemberGameInfoes', 'UserSTAT9_MemberGameInfoes', 'UserSTAT10_MemberGameInfoes', 'sCol1_MemberGameInfoes', 'sCol2_MemberGameInfoes', 'sCol3_MemberGameInfoes', 'sCol4_MemberGameInfoes', 'sCol5_MemberGameInfoes', 'sCol6_MemberGameInfoes', 'sCol7_MemberGameInfoes', 'sCol8_MemberGameInfoes', 'sCol9_MemberGameInfoes', 'sCol10_MemberGameInfoes', '4B03758A-BC73-4BC9-B65E-2EBFB940CDA0', 'aaa', '짱으로화난다', '못깬다', 'Category1_MemberGameInfoStages', 'Category2_MemberGameInfoStages', 'Category3_MemberGameInfoStages', 'Mission1_MemberGameInfoStages', 'Mission2_MemberGameInfoStages', 'Mission3_MemberGameInfoStages', 'Mission4_MemberGameInfoStages', 'Mission5_MemberGameInfoStages', 'Points_MemberGameInfoStages', 'StageStat1_MemberGameInfoStages', 'StageStat2_MemberGameInfoStages', 'StageStat3_MemberGameInfoStages', 'StageStat4_MemberGameInfoStages', 'StageStat5_MemberGameInfoStages', 'sCol1_MemberGameInfoStages', 'sCol2_MemberGameInfoStages', 'sCol3_MemberGameInfoStages', 'sCol4_MemberGameInfoStages', 'sCol5_MemberGameInfoStages', 'sCol6_MemberGameInfoStages', 'sCol7_MemberGameInfoStages', 'sCol8_MemberGameInfoStages', 'sCol9_MemberGameInfoStages', 'sCol10_MemberGameInfoStages'
-----------------------------------------------------------------------

SELECT * FROM MemberGameInfoes
SELECT * FROM MemberGameInfoStages
SELECT * FROM ItemLists
SELECT * FROM MemberItems
SELECT * FROM GameEvents
SELECT * FROM GameEventMember
*/