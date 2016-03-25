
--drop proc uspComInsMemberGameInfoStages
create proc uspComInsMemberGameInfoStages
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
INSERT INTO MemberGameInfoStages(MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
values(@MemberGameInfoStageID, @MemberID, @StageName, @StageStatus, @Category1, @Category2, @Category3, @Mission1, @Mission2, @Mission3, @Mission4, @Mission5, @Points, @StageStat1, @StageStat2, @StageStat3, @StageStat4, @StageStat5, @sCol1, @sCol2, @sCol3, @sCol4, @sCol5, @sCol6, @sCol7, @sCol8, @sCol9, @sCol10)
select @@rowcount as Result
GO

/*
-----------------------------------------------------------------------
EXEC uspComInsMemberGameInfoStages 'MemberGameInfoStageID55', 'ccc', 'NewStageName', 'ChangeAllInfo', 'Category1', 'Category2', 'Category3', 'Mission1', 'Mission2', 'Mission3', 'Mission4', 'Mission5', '100', 'StageStat1', 'StageStat2', 'StageStat3', 'StageStat4', 'StageStat5', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
-----------------------------------------------------------------------
select * from MemberGameInfoStages
*/