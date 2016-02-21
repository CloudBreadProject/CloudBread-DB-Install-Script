
--drop proc uspComUdtMemberGameInfoStages
create proc uspComUdtMemberGameInfoStages
@MemberGameInfoStageID nvarchar(MAX) = NULL
,@MemberID nvarchar(MAX) = NULL
,@StageName nvarchar(MAX) = NULL
,@StageStatus nvarchar(MAX) = NULL
,@Category1 nvarchar(MAX) = NULL
,@Category2 nvarchar(MAX) = NULL
,@Category3 nvarchar(MAX) = NULL
,@Mission1 nvarchar(MAX) = NULL
,@Mission2 nvarchar(MAX) = NULL
,@Mission3 nvarchar(MAX) = NULL
,@Mission4 nvarchar(MAX) = NULL
,@Mission5 nvarchar(MAX) = NULL
,@Points nvarchar(MAX) = NULL
,@StageStat1 nvarchar(MAX) = NULL
,@StageStat2 nvarchar(MAX) = NULL
,@StageStat3 nvarchar(MAX) = NULL
,@StageStat4 nvarchar(MAX) = NULL
,@StageStat5 nvarchar(MAX) = NULL
,@sCol1 nvarchar(MAX) = NULL
,@sCol2 nvarchar(MAX) = NULL
,@sCol3 nvarchar(MAX) = NULL
,@sCol4 nvarchar(MAX) = NULL
,@sCol5 nvarchar(MAX) = NULL
,@sCol6 nvarchar(MAX) = NULL
,@sCol7 nvarchar(MAX) = NULL
,@sCol8 nvarchar(MAX) = NULL
,@sCol9 nvarchar(MAX) = NULL
,@sCol10 nvarchar(MAX) = NULL
as
set nocount on
update MemberGameInfoStages
set
MemberID = CASE WHEN @MemberID is not null THEN @MemberID ELSE  MemberID END
, StageName = CASE WHEN @StageName is not null THEN @StageName ELSE  StageName END
, StageStatus = CASE WHEN @StageStatus is not null THEN @StageStatus ELSE  StageStatus END
, Category1 = CASE WHEN @Category1 is not null THEN @Category1 ELSE  Category1 END
, Category2 = CASE WHEN @Category2 is not null THEN @Category2 ELSE  Category2 END
, Category3 = CASE WHEN @Category3 is not null THEN @Category3 ELSE  Category3 END
, Mission1 = CASE WHEN @Mission1 is not null THEN @Mission1 ELSE  Mission1 END
, Mission2 = CASE WHEN @Mission2 is not null THEN @Mission2 ELSE  Mission2 END
, Mission3 = CASE WHEN @Mission3 is not null THEN @Mission3 ELSE  Mission3 END
, Mission4 = CASE WHEN @Mission4 is not null THEN @Mission4 ELSE  Mission4 END
, Mission5 = CASE WHEN @Mission5 is not null THEN @Mission5 ELSE  Mission5 END
, Points = CASE WHEN @Points is not null THEN @Points ELSE  Points END
, StageStat1 = CASE WHEN @StageStat1 is not null THEN @StageStat1 ELSE  StageStat1 END
, StageStat2 = CASE WHEN @StageStat2 is not null THEN @StageStat2 ELSE  StageStat2 END
, StageStat3 = CASE WHEN @StageStat3 is not null THEN @StageStat3 ELSE  StageStat3 END
, StageStat4 = CASE WHEN @StageStat4 is not null THEN @StageStat4 ELSE  StageStat4 END
, StageStat5 = CASE WHEN @StageStat5 is not null THEN @StageStat5 ELSE  StageStat5 END
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
,UpdatedAt = sysutcdatetime()
where MemberGameInfoStageID like @MemberGameInfoStageID
select @@rowcount as Result
GO

/*
select * from MemberGameInfoStages
-----------------------------------------------------------------------
EXEC uspComUdtMemberGameInfoStages '1046608A-137C-40C0-B6A3-F417D3CCFA33', 'aaa','99', '10', '10', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
EXEC uspComUdtMemberGameInfoStages '1046608A-137C-40C0-B6A3-F417D3CCFA33', null, '150', '10', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
-----------------------------------------------------------------------
*/