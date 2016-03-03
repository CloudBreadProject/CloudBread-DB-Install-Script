--DROP PROC uspSelNotices
CREATE PROC uspSelNotices
--NoticeDurationFrom를 비교 하려면 날자 부분은 암호화 되지 않은 평문이어야 함.
--NoticeDurationFrom / To 컬럼은 datetimeoffset 형태로 비교를 위해 저장 되어야 함.
AS 
select NoticeID, NoticeCategory1, NoticeCategory2, NoticeCategory3, TargetGroup, TargetOS, TargetDevice, NoticeImageLink, title, content, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from Notices with(nolock)
where
	--현재 날자 조건에 맞는 것 and HideYN, DeleteYN이 N 인것
	sysutcdatetime() between NoticeDurationFrom and NoticeDurationTo
and HideYN like 'N'
and DeleteYN like 'N'
order by OrderNumber asc, CreatedAt desc		-- 정렬은 정렬 컬럼 숫자 asc, 이후 생성일 최신 순
GO

/*
-----------------------------------------------------------------------
EXEC uspSelNotices 
-----------------------------------------------------------------------
SELECT * FROM Notices 
SELECT * FROM Notices where sysutcdatetime() between NoticeDurationFrom and NoticeDurationTo
*/
