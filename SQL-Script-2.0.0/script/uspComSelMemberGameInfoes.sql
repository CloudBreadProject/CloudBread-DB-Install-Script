--DROP PROC uspComSelMemberGameInfoes
CREATE PROC uspComSelMemberGameInfoes
@MemberID NVARCHAR(MAX)
AS 
select MemberID, Level, Exps, Points, UserSTAT1, UserSTAT2, UserSTAT3, UserSTAT4, UserSTAT5, UserSTAT6, UserSTAT7, UserSTAT8, UserSTAT9, UserSTAT10, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from MemberGameInfoes with(nolock)
where MemberID like @MemberID and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelMemberGameInfoes 'aaa'
EXEC uspComSelMemberGameInfoes 'asfasdf'
-----------------------------------------------------------------------
SELECT * FROM Members
SELECT * FROM MemberGameInfoes
*/
