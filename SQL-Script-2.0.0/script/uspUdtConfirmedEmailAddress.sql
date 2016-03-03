
--Email 주소를 통한 접속 여부 체크 (내 메일 주소로 온 링크 눌러야 회원가입 완료) 웹페이지 인터렉션 필요)	UdtConfirmedEmailAddress	"업뎃 테이블 member 
-- EmailConfirmedYN
--조건 id"	"UDT Member
--Set EmailConfirmedYN = Y
--Where ID 비교"

-----------------------------------------------------------------------
-- uspUdtConfirmedEmailAddress 프로시저 생성
--DROP PROC uspUdtConfirmedEmailAddress
CREATE PROC uspUdtConfirmedEmailAddress
@MemberID NVARCHAR(MAX)
,@MemberPWD NVARCHAR(MAX)
AS 
--set, lock option check
set nocount on
update Members Set EmailConfirmedYN = 'Y', UpdatedAt = sysutcdatetime()
where MemberID like @MemberID and MemberPWD like @MemberPWD and HideYN like 'N' and DeleteYN like 'N'
select @@rowcount as Result
GO

/*
-----------------------------------------------------------------------
EXEC uspUdtConfirmedEmailAddress 'ccc', 'MemberPWD'
EXEC uspUdtConfirmedEmailAddress 'adfsadsf', 'MemberPWD'
-----------------------------------------------------------------------
select * from Members

*/