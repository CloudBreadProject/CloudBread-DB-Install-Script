/**
* @file uspAddMemberItemPurchase.sql
* @brief Item purchase API include purchase info. Update MemberGameInfoes, MemberItems and MemberItemPurchases \n
* Regarding to MemberItems, select insert or update data \n
* @author Dae Woo Kim
* @param string InsertORUpdate  - if itemid exists in MemberItem inventory, then "UPDATE". if not, "INSERT".
* @param MemberItems table object
* @param MemberItemPurchases table object
* @param MemberGameInfoes table object
* @return string "3" - affected rows.
* @todo change SP to upsert auto method
*/

--DROP PROC uspAddMemberItemPurchase
CREATE PROC uspAddMemberItemPurchase
 @InsertORUpdate nvarchar(MAX) = NULL	-- Input string for INSERT or UPDATE
--MemberItems table
 , @MemberItemID_MemberItems nvarchar(MAX) 	= NULL
, @MemberID_MemberItems nvarchar(MAX)	 = NULL		--MemberID dupe
, @ItemListID_MemberItems nvarchar(MAX) = NULL
, @ItemCount_MemberItems nvarchar(MAX) = NULL
, @ItemStatus_MemberItems nvarchar(MAX) = NULL
--, @HideYN_MemberItems nvarchar(MAX) = NULL
--, @DeleteYN_MemberItems nvarchar(MAX) = NULL
, @sCol1_MemberItems nvarchar(MAX) = NULL
, @sCol2_MemberItems nvarchar(MAX) = NULL
, @sCol3_MemberItems nvarchar(MAX) = NULL
, @sCol4_MemberItems nvarchar(MAX) = NULL
, @sCol5_MemberItems nvarchar(MAX) = NULL
, @sCol6_MemberItems nvarchar(MAX) = NULL
, @sCol7_MemberItems nvarchar(MAX) = NULL
, @sCol8_MemberItems nvarchar(MAX) = NULL
, @sCol9_MemberItems nvarchar(MAX) = NULL
, @sCol10_MemberItems nvarchar(MAX) = NULL
--MemberItemPurchases table
, @MemberID_MemberItemPurchases nvarchar(MAX) = NULL	--MemberID dupe
, @ItemListID_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseQuantity_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchasePrice_MemberItemPurchases nvarchar(MAX) = NULL
, @PGinfo1_MemberItemPurchases nvarchar(MAX) = NULL
, @PGinfo2_MemberItemPurchases nvarchar(MAX) = NULL
, @PGinfo3_MemberItemPurchases nvarchar(MAX) = NULL
, @PGinfo4_MemberItemPurchases nvarchar(MAX) = NULL
, @PGinfo5_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseDeviceID_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseDeviceIPAddress_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseDeviceMACAddress_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseDT_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelYN_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelDT_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelingStatus_MemberItemPurchases nvarchar(MAX) = NULL
--, @PurchaseCancelConfirmAdminMemberID_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelReturnedAmount_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelDeviceID_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelDeviceIPAddress_MemberItemPurchases nvarchar(MAX) = NULL
, @PurchaseCancelDeviceMACAddress_MemberItemPurchases nvarchar(MAX) = NULL
--, @HideYN_MemberItemPurchases nvarchar(MAX) = NULL
--, @DeleteYN_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol1_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol2_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol3_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol4_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol5_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol6_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol7_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol8_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol9_MemberItemPurchases nvarchar(MAX) = NULL
, @sCol10_MemberItemPurchases nvarchar(MAX) = NULL
--MemberGameInfoes table
, @MemberID_MemberGameInfoes nvarchar(MAX) = NULL		--MemberID dupe
, @Level_MemberGameInfoes nvarchar(MAX) = NULL
, @Exps_MemberGameInfoes nvarchar(MAX) = NULL
, @Points_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT1_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT2_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT3_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT4_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT5_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT6_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT7_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT8_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT9_MemberGameInfoes nvarchar(MAX) = NULL
, @UserSTAT10_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol1_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol2_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol3_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol4_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol5_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol6_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol7_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol8_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol9_MemberGameInfoes nvarchar(MAX) = NULL
, @sCol10_MemberGameInfoes nvarchar(MAX) = NULL
AS 
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0
if upper(@InsertORUpdate) = 'INSERT' 
	begin
		begin tran
			--MemberItems insert,  MemberItemPurchases insert MemberGameInfoes update
			--MemberItems insert
			insert into MemberItems(MemberItemID, MemberID, ItemListID, ItemCount, ItemStatus, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10) 
			values(@MemberItemID_MemberItems, @MemberID_MemberItems, @ItemListID_MemberItems, @ItemCount_MemberItems, @ItemStatus_MemberItems
			, @sCol1_MemberItems, @sCol2_MemberItems, @sCol3_MemberItems, @sCol4_MemberItems, @sCol5_MemberItems, @sCol6_MemberItems, @sCol7_MemberItems, @sCol8_MemberItems, @sCol9_MemberItems, @sCol10_MemberItems)
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			--MemberItemPurchases insert
			insert into MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus,  PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
			values(newid(), @MemberID_MemberItemPurchases ,  @ItemListID_MemberItemPurchases ,  @PurchaseQuantity_MemberItemPurchases ,  @PurchasePrice_MemberItemPurchases ,  @PGinfo1_MemberItemPurchases ,  @PGinfo2_MemberItemPurchases ,  @PGinfo3_MemberItemPurchases ,  @PGinfo4_MemberItemPurchases ,  @PGinfo5_MemberItemPurchases ,  @PurchaseDeviceID_MemberItemPurchases ,  @PurchaseDeviceIPAddress_MemberItemPurchases ,  @PurchaseDeviceMACAddress_MemberItemPurchases ,  @PurchaseDT_MemberItemPurchases ,  @PurchaseCancelYN_MemberItemPurchases ,  @PurchaseCancelDT_MemberItemPurchases ,  @PurchaseCancelingStatus_MemberItemPurchases
			,  @PurchaseCancelReturnedAmount_MemberItemPurchases ,  @PurchaseCancelDeviceID_MemberItemPurchases ,  @PurchaseCancelDeviceIPAddress_MemberItemPurchases ,  @PurchaseCancelDeviceMACAddress_MemberItemPurchases ,  @sCol1_MemberItemPurchases ,  @sCol2_MemberItemPurchases ,  @sCol3_MemberItemPurchases ,  @sCol4_MemberItemPurchases ,  @sCol5_MemberItemPurchases ,  @sCol6_MemberItemPurchases ,  @sCol7_MemberItemPurchases ,  @sCol8_MemberItemPurchases ,  @sCol9_MemberItemPurchases ,  @sCol10_MemberItemPurchases)
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			-- MemberGameInfoes update
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE  Points  END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6   END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7   END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8   END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					, UpdatedAt = sysutcdatetime()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@InsertORUpdate) = 'UPDATE'
	begin
		begin tran
			--MemberItems update, MemberItemPurchases insert, MemberGameInfoes update
			--MemberItems update
			update MemberItems set
				MemberID = CASE WHEN @MemberID_MemberItems is not null THEN @MemberID_MemberItems  ELSE MemberID   END
				, ItemListID = CASE WHEN @ItemListID_MemberItems is not null THEN @ItemListID_MemberItems  ELSE  ItemListID  END
				, ItemCount = CASE WHEN @ItemCount_MemberItems is not null THEN @ItemCount_MemberItems  ELSE   ItemCount END
				, ItemStatus = CASE WHEN @ItemStatus_MemberItems is not null THEN @ItemStatus_MemberItems  ELSE  ItemStatus  END
				, sCol1 = CASE WHEN @sCol1_MemberItems is not null THEN @sCol1_MemberItems  ELSE  sCol1  END
				, sCol2 = CASE WHEN @sCol2_MemberItems is not null THEN @sCol2_MemberItems  ELSE  sCol2 END
				, sCol3 = CASE WHEN @sCol3_MemberItems is not null THEN @sCol3_MemberItems  ELSE  sCol3  END
				, sCol4 = CASE WHEN @sCol4_MemberItems is not null THEN @sCol4_MemberItems  ELSE  sCol4  END
				, sCol5 = CASE WHEN @sCol5_MemberItems is not null THEN @sCol5_MemberItems  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItems is not null THEN @sCol6_MemberItems  ELSE  sCol6  END
				, sCol7 = CASE WHEN @sCol7_MemberItems is not null THEN @sCol7_MemberItems  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItems is not null THEN @sCol8_MemberItems  ELSE  sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItems is not null THEN @sCol9_MemberItems  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItems is not null THEN @sCol10_MemberItems  ELSE  sCol10  END
				, UpdatedAt = sysutcdatetime()
			where MemberItemID like @MemberItemID_MemberItems and MemberID_MemberItems like @MemberID_MemberItems
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			--MemberItemPurchases insert
			insert into MemberItemPurchases(MemberItemPurchaseID, MemberID, ItemListID, PurchaseQuantity, PurchasePrice, PGinfo1, PGinfo2, PGinfo3, PGinfo4, PGinfo5, PurchaseDeviceID, PurchaseDeviceIPAddress, PurchaseDeviceMACAddress, PurchaseDT, PurchaseCancelYN, PurchaseCancelDT, PurchaseCancelingStatus, PurchaseCancelReturnedAmount, PurchaseCancelDeviceID, PurchaseCancelDeviceIPAddress, PurchaseCancelDeviceMACAddress, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10)
			values(newid(), @MemberID_MemberItemPurchases ,  @ItemListID_MemberItemPurchases ,  @PurchaseQuantity_MemberItemPurchases ,  @PurchasePrice_MemberItemPurchases ,  @PGinfo1_MemberItemPurchases ,  @PGinfo2_MemberItemPurchases ,  @PGinfo3_MemberItemPurchases ,  @PGinfo4_MemberItemPurchases ,  @PGinfo5_MemberItemPurchases ,  @PurchaseDeviceID_MemberItemPurchases ,  @PurchaseDeviceIPAddress_MemberItemPurchases ,  @PurchaseDeviceMACAddress_MemberItemPurchases ,  @PurchaseDT_MemberItemPurchases ,  @PurchaseCancelYN_MemberItemPurchases ,  @PurchaseCancelDT_MemberItemPurchases ,  @PurchaseCancelingStatus_MemberItemPurchases ,   @PurchaseCancelReturnedAmount_MemberItemPurchases ,  @PurchaseCancelDeviceID_MemberItemPurchases ,  @PurchaseCancelDeviceIPAddress_MemberItemPurchases ,  @PurchaseCancelDeviceMACAddress_MemberItemPurchases ,@sCol1_MemberItemPurchases ,  @sCol2_MemberItemPurchases ,  @sCol3_MemberItemPurchases ,  @sCol4_MemberItemPurchases ,  @sCol5_MemberItemPurchases ,  @sCol6_MemberItemPurchases ,  @sCol7_MemberItemPurchases ,  @sCol8_MemberItemPurchases ,  @sCol9_MemberItemPurchases ,  @sCol10_MemberItemPurchases)
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			-- MemberGameInfoes update
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE Level   END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE  Exps  END
					, Points = CASE WHEN @Points_MemberGameInfoes is not null THEN @Points_MemberGameInfoes  ELSE Points   END
					, UserSTAT1 = CASE WHEN @UserSTAT1_MemberGameInfoes is not null THEN @UserSTAT1_MemberGameInfoes  ELSE  UserSTAT1  END
					, UserSTAT2 = CASE WHEN @UserSTAT2_MemberGameInfoes is not null THEN @UserSTAT2_MemberGameInfoes  ELSE  UserSTAT2  END
					, UserSTAT3 = CASE WHEN @UserSTAT3_MemberGameInfoes is not null THEN @UserSTAT3_MemberGameInfoes  ELSE  UserSTAT3  END
					, UserSTAT4 = CASE WHEN @UserSTAT4_MemberGameInfoes is not null THEN @UserSTAT4_MemberGameInfoes  ELSE  UserSTAT4  END
					, UserSTAT5 = CASE WHEN @UserSTAT5_MemberGameInfoes is not null THEN @UserSTAT5_MemberGameInfoes  ELSE  UserSTAT5  END
					, UserSTAT6 = CASE WHEN @UserSTAT6_MemberGameInfoes is not null THEN @UserSTAT6_MemberGameInfoes  ELSE  UserSTAT6  END
					, UserSTAT7 = CASE WHEN @UserSTAT7_MemberGameInfoes is not null THEN @UserSTAT7_MemberGameInfoes  ELSE  UserSTAT7  END
					, UserSTAT8 = CASE WHEN @UserSTAT8_MemberGameInfoes is not null THEN @UserSTAT8_MemberGameInfoes  ELSE  UserSTAT8  END
					, UserSTAT9 = CASE WHEN @UserSTAT9_MemberGameInfoes is not null THEN @UserSTAT9_MemberGameInfoes  ELSE  UserSTAT9  END
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE  UserSTAT10  END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE  sCol1  END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE  sCol3  END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5  END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6  END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7  END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8  END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE  sCol9  END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					, UpdatedAt = sysutcdatetime()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end

select @rowcount as Result

GO

/*

-----------------------------------------------------------------------
--INSERT : MemberItems insert,  MemberItemPurchases insert MemberGameInfoes update
EXEC uspAddMemberItemPurchase  'INSERT', 'MemberItemsID101', 'aaa', 'itemid4', '10', 'ItemStatus_MemberItems', 'sCol1_MemberItems', 'sCol2_MemberItems', 'sCol3_MemberItems', 'sCol4_MemberItems', 'sCol5_MemberItems', 'sCol6_MemberItems', 'sCol7_MemberItems', 'sCol8_MemberItems', 'sCol9_MemberItems', 'sCol10_MemberItems'
, 'aaa', 'itemid4', '10', '1000000', 'PGinfo1_MemberItemPurchases', 'PGinfo2_MemberItemPurchases', 'PGinfo3_MemberItemPurchases', 'PGinfo4_MemberItemPurchases', 'PGinfo5_MemberItemPurchases', 'PurchaseDeviceID_MemberItemPurchases', 'ipaddress', 'macaddress', '2016-01-01 00:00:00.0000000 +00:00', 'N', '', '', '', 'PurchaseCancelDeviceID_MemberItemPurchases', 'ipaddress', 'PurchaseCancelDeviceMACAddress_MemberItemPurchases', 'sCol1_MemberItemPurchases', 'sCol2_MemberItemPurchases', 'sCol3_MemberItemPurchases', 'sCol4_MemberItemPurchases', 'sCol5_MemberItemPurchases', 'sCol6_MemberItemPurchases', 'sCol7_MemberItemPurchases', 'sCol8_MemberItemPurchases', 'sCol9_MemberItemPurchases', 'sCol10_MemberItemPurchases'
, 'aaa', '11', '111', '1111', 'UserSTAT1_MemberGameInfoes', 'UserSTAT2_MemberGameInfoes', 'UserSTAT3_MemberGameInfoes', 'UserSTAT4_MemberGameInfoes', 'UserSTAT5_MemberGameInfoes', 'UserSTAT6_MemberGameInfoes', 'UserSTAT7_MemberGameInfoes', 'UserSTAT8_MemberGameInfoes', 'UserSTAT9_MemberGameInfoes', 'UserSTAT10_MemberGameInfoes', 'sCol1_MemberGameInfoes', 'sCol2_MemberGameInfoes', 'sCol3_MemberGameInfoes', 'sCol4_MemberGameInfoes', 'sCol5_MemberGameInfoes', 'sCol6_MemberGameInfoes', 'sCol7_MemberGameInfoes', 'sCol8_MemberGameInfoes', 'sCol9_MemberGameInfoes', 'sCol10_MemberGameInfoes'

--UPDATE MemberItems update, MemberItemPurchases insert, MemberGameInfoes update
EXEC uspAddMemberItemPurchase  'UPDATE', 'MemberItemsID2', 'aaa', 'itemid2', '20', 'ItemStatus_MemberItems', 'sCol1_MemberItems', 'sCol2_MemberItems', 'sCol3_MemberItems', 'sCol4_MemberItems', 'sCol5_MemberItems', 'sCol6_MemberItems', 'sCol7_MemberItems', 'sCol8_MemberItems', 'sCol9_MemberItems', 'sCol10_MemberItems'
, 'aaa', 'itemid2', '20', '2000000', 'PGinfo1_MemberItemPurchases', 'PGinfo2_MemberItemPurchases', 'PGinfo3_MemberItemPurchases', 'PGinfo4_MemberItemPurchases', 'PGinfo5_MemberItemPurchases', 'PurchaseDeviceID_MemberItemPurchases', 'ipaddress', 'macaddress', '2016-01-01 00:00:00.0000000 +00:00', 'N', '', '', '', 'PurchaseCancelDeviceID_MemberItemPurchases', 'ipaddress', 'PurchaseCancelDeviceMACAddress_MemberItemPurchases', 'sCol1_MemberItemPurchases', 'sCol2_MemberItemPurchases', 'sCol3_MemberItemPurchases', 'sCol4_MemberItemPurchases', 'sCol5_MemberItemPurchases', 'sCol6_MemberItemPurchases', 'sCol7_MemberItemPurchases', 'sCol8_MemberItemPurchases', 'sCol9_MemberItemPurchases', 'sCol10_MemberItemPurchases'
, 'aaa', '22', '222', '2222', 'UserSTAT1_MemberGameInfoes', 'UserSTAT2_MemberGameInfoes', 'UserSTAT3_MemberGameInfoes', 'UserSTAT4_MemberGameInfoes', 'UserSTAT5_MemberGameInfoes', 'UserSTAT6_MemberGameInfoes', 'UserSTAT7_MemberGameInfoes', 'UserSTAT8_MemberGameInfoes', 'UserSTAT9_MemberGameInfoes', 'UserSTAT10_MemberGameInfoes', 'sCol1_MemberGameInfoes', 'sCol2_MemberGameInfoes', 'sCol3_MemberGameInfoes', 'sCol4_MemberGameInfoes', 'sCol5_MemberGameInfoes', 'sCol6_MemberGameInfoes', 'sCol7_MemberGameInfoes', 'sCol8_MemberGameInfoes', 'sCol9_MemberGameInfoes', 'sCol10_MemberGameInfoes'
-----------------------------------------------------------------------
SELECT * FROM itemlists
SELECT * FROM MemberItems
SELECT * FROM MemberItemPurchases
SELECT * FROM MemberGameInfoes

*/
