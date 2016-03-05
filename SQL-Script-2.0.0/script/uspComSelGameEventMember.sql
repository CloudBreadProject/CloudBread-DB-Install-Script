--DROP PROC uspComSelGameEventMember
CREATE PROC uspComSelGameEventMember
@GameEventMemberID NVARCHAR(MAX)
, @MemberID NVARCHAR(MAX)
AS 
select GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 from GameEventMember with(nolock)
where MemberID like @MemberID and GameEventMemberID like @GameEventMemberID and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelGameEventMember  'GameEventMemberID1', 'aaa'
EXEC uspComSelGameEventMember  'GameEventMemberID4', 'bbb'
-----------------------------------------------------------------------
select * from GameEventMember
*/
