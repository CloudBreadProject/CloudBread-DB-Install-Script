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
SELECT * FROM Notices where sysutcdatetime() between NoticeDurationFrom and NoticeDurationTo

update Notices set DeleteYN = 'Y' ,HideYN = 'N'  where noticeID like '0F96BD6B-4237-42A5-A292-1AC12A51775A'
update Notices set DeleteYN = 'N', HideYN = 'Y' where noticeID like '6FAB7BFC-0D82-430C-A22A-175A1F05B75F'
update Notices set DeleteYN = 'N', HideYN = 'N' where noticeID like '764DABF6-9B22-4B2F-9BD2-0B785948004F'
update Notices set DeleteYN = 'Y' ,HideYN = 'Y' where noticeID like '9DC9D704-0344-4769-A818-68B761F02815'
*/
