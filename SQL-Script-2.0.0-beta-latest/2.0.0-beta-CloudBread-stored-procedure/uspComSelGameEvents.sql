--DROP PROC uspComSelGameEvents
CREATE PROC uspComSelGameEvents
@GameEventID NVARCHAR(MAX)
AS 
select GameEventID, EventCategory1, EventCategory2, EventCategory3, ItemListID, ItemCount, Itemstatus, TargetGroup, TargetOS, TargetDevice, EventImageLink, Title, Content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from GameEvents with(nolock)
where GameEventID like @GameEventID and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelGameEvents  '7A411FA7-18BC-4383-99B3-AD57FEF3AF7E'
EXEC uspComSelGameEvents  'noexsits'
-----------------------------------------------------------------------
select * from GameEvents
*/
