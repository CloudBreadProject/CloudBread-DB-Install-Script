--DROP PROC uspSelItemListAll
CREATE PROC uspSelItemListAll
( 
  @Page             bigint 
, @PageSize  bigint 
) AS 
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
WITH TBL_PAGELIST AS 
( 
       SELECT ROW_NUMBER() OVER (ORDER BY CreatedAt) AS ROWNUM, 
       ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
       FROM ItemLists
	   where DeleteYN like 'N' and HideYN like 'N'
) 
SELECT ROWNUM, ItemListID, ItemName, ItemDescription, ItemPrice, ItemSellPrice, ItemCategory1, ItemCategory2, ItemCategory3, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from TBL_PAGELIST
WHERE ROWNUM BETWEEN ((@PAGE - 1) * @PAGESIZE) + 1 AND @PAGE * @PAGESIZE; 
GO

/*
-----------------------------------------------------------------------
EXEC uspSelItemListAll 1, 5
-----------------------------------------------------------------------
*/
