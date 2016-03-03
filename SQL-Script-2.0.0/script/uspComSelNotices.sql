--DROP PROC uspComSelNotices
CREATE PROC uspComSelNotices
@NoticeID NVARCHAR(MAX)
AS 
select NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from Notices with(nolock)
where NoticeID like @NoticeID and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelNotices  'FB2DAB32-009A-4ED2-AAE6-1BE82C98EA9F'
EXEC uspComSelNotices  'noexists'
-----------------------------------------------------------------------
select * from Notices
*/
