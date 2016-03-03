--DROP PROC uspComSelGameEventMember
CREATE PROC uspComSelGameEventMember
@GameEventMemberID NVARCHAR(MAX)
AS 
select GameEventMemberID, eventID, MemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10 from GameEventMember with(nolock)
where GameEventMemberID like @GameEventMemberID and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelGameEventMember  '63633DE7-7CD3-4B62-8BED-5680CA3E789E'
EXEC uspComSelGameEventMember  'asfasdf'
-----------------------------------------------------------------------
select * from GameEventMember
*/
