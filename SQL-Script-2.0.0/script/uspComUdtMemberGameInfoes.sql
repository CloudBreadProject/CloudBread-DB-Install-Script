--DROP PROC uspComUdtMemberGameInfoes
CREATE PROC uspComUdtMemberGameInfoes
@MemberID nvarchar(MAX) = NULL
,@Level nvarchar(MAX) = NULL
,@Exps nvarchar(MAX) = NULL
,@Points nvarchar(MAX) = NULL
,@UserSTAT1 nvarchar(MAX) = NULL
,@UserSTAT2 nvarchar(MAX) = NULL
,@UserSTAT3 nvarchar(MAX) = NULL
,@UserSTAT4 nvarchar(MAX) = NULL
,@UserSTAT5 nvarchar(MAX) = NULL
,@UserSTAT6 nvarchar(MAX) = NULL
,@UserSTAT7 nvarchar(MAX) = NULL
,@UserSTAT8 nvarchar(MAX) = NULL
,@UserSTAT9 nvarchar(MAX) = NULL
,@UserSTAT10 nvarchar(MAX) = NULL
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

AS 
--set, lock 옵션 등 체크
set nocount on
update MemberGameInfoes
set  
Level = CASE WHEN @Level is not null THEN @Level ELSE  Level END
, Exps = CASE WHEN @Exps is not null THEN @Exps ELSE  Exps END
, Points = CASE WHEN @Points is not null THEN @Points ELSE  Points END
, UserSTAT1 = CASE WHEN @UserSTAT1 is not null THEN @UserSTAT1 ELSE  UserSTAT1 END
, UserSTAT2 = CASE WHEN @UserSTAT2 is not null THEN @UserSTAT2 ELSE  UserSTAT2 END
, UserSTAT3 = CASE WHEN @UserSTAT3 is not null THEN @UserSTAT3 ELSE  UserSTAT3 END
, UserSTAT4 = CASE WHEN @UserSTAT4 is not null THEN @UserSTAT4 ELSE  UserSTAT4 END
, UserSTAT5 = CASE WHEN @UserSTAT5 is not null THEN @UserSTAT5 ELSE  UserSTAT5 END
, UserSTAT6 = CASE WHEN @UserSTAT6 is not null THEN @UserSTAT6 ELSE  UserSTAT6 END
, UserSTAT7 = CASE WHEN @UserSTAT7 is not null THEN @UserSTAT7 ELSE  UserSTAT7 END
, UserSTAT8 = CASE WHEN @UserSTAT8 is not null THEN @UserSTAT8 ELSE  UserSTAT8 END
, UserSTAT9 = CASE WHEN @UserSTAT9 is not null THEN @UserSTAT9 ELSE  UserSTAT9 END
, UserSTAT10 = CASE WHEN @UserSTAT10 is not null THEN @UserSTAT10 ELSE  UserSTAT10 END
, sCol1 = CASE WHEN @sCol1 is not null THEN @sCol1 ELSE  sCol1 END
, sCol2 = CASE WHEN @sCol2 is not null THEN @sCol2 ELSE  sCol2 END
, sCol3 = CASE WHEN @sCol3 is not null THEN @sCol3 ELSE  sCol3 END
, sCol4 = CASE WHEN @sCol4 is not null THEN @sCol4 ELSE  sCol4 END
, sCol5 = CASE WHEN @sCol5 is not null THEN @sCol5 ELSE  sCol5 END
, sCol6 = CASE WHEN @sCol6 is not null THEN @sCol6 ELSE  sCol6 END
, sCol7 = CASE WHEN @sCol7 is not null THEN @sCol7 ELSE  sCol7 END
, sCol8 = CASE WHEN @sCol8 is not null THEN @sCol8 ELSE  sCol8 END
, sCol9 = CASE WHEN @sCol9 is not null THEN @sCol9 ELSE  sCol9 END
, sCol10 = CASE WHEN @sCol10 is not null THEN @sCol10 ELSE  sCol10 END
,UpdatedAt = sysutcdatetime()
where MemberID like @MemberID
select @@ROWCOUNT as Reslut

GO

/*
-----------------------------------------------------------------------
EXEC uspComUdtMemberGameInfoes 'aaa', '9', '99', '999', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
EXEC uspComUdtMemberGameInfoes 'ccc', '9', '99', '999', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'
EXEC uspComUdtMemberGameInfoes 'ddd', '8', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null
'990', '990', 'UserSTAT1', 'UserSTAT2', 'UserSTAT3', 'UserSTAT4', 'UserSTAT5', 'UserSTAT6', 'UserSTAT7', 'UserSTAT8', 'UserSTAT9', 'UserSTAT10', 'sCol1', 'sCol2', 'sCol3', 'sCol4', 'sCol5', 'sCol6', 'sCol7', 'sCol8', 'sCol9', 'sCol10'


-----------------------------------------------------------------------
select * from MemberGameInfoes where MemberID like 'aaa'
*/
