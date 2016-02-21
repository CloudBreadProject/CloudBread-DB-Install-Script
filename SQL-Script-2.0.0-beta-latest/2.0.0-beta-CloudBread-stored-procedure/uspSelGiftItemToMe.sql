--DROP PROC uspSelGiftItemToMe
CREATE PROC uspSelGiftItemToMe
@MemberID VARCHAR(MAX)
AS 
select top 1 GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from GiftDepositories
where ToMemberID like @MemberID and HideYN like 'N' and DeleteYN like 'N'
order by CreatedAt DESC  --order by here
GO

/*
-----------------------------------------------------------------------
EXEC uspSelGiftItemToMe 'aaa'
EXEC uspSelGiftItemToMe 'asfasdf'
--조인 해서 member 정보(이름)과 item 정보도 조인해 가져와야 하나? 아니면 따로? 따로 하자.
-----------------------------------------------------------------------
select * from GiftDepositories
*/
