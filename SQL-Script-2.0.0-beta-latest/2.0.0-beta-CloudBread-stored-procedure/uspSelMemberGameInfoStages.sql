--drop proc uspSelMemberGameInfoStages
CREATE PROC uspSelMemberGameInfoStages
@MemberID NVARCHAR(MAX)
AS 
--set, lock 옵션 등 체크
select MemberGameInfoStageID, MemberID, StageName, StageStatus, Category1, Category2, Category3, Mission1, Mission2, Mission3, Mission4, Mission5, Points, StageStat1, StageStat2, StageStat3, StageStat4, StageStat5, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from MemberGameInfoStages with(nolock)
where MemberID like @MemberID and HideYN like 'N' and DeleteYN like 'N'
order by CreatedAt asc

GO

/*
------------------------------------------------------------------------------------
exec uspSelMemberGameInfoStages 'aaa'
------------------------------------------------------------------------------------
select * from MemberGameInfoStages
*/