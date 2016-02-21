
/*
"itemid와 memberid, memberpurchaseid로
memberpurchase 테이블에 구맴 항목 철회 업데이트 - 
memberItems 해당아이템 숫자를 update해 줄이거나 row 삭제
이어서, MemberGameInfo 테이블도 update "
--uspUdtReturnItem

*/

-----------------------------------------------------------------------
-- uspUdtReturnItem 프로시저 생성
-- delete UPDATE 하는 이유는 memberitems에 upsert - MERGE 하는 이슈임.
-- memberitems item의 수량 정보 등이 암호화 되어 있어서, upsert 불가하고 클라이언트에서 분기해 올라와야 함.
--DROP PROC uspUdtReturnItem
CREATE PROC uspUdtReturnItem
 @DeleteORUpdate nvarchar(MAX)	= NULL		-- 문자열은 DELETE(보유아이템의 한 항목)  또는 UPDATE
--MemberItems 테이블
 , @MemberItemID_MemberItems nvarchar(MAX)	= NULL
, @MemberID_MemberItems nvarchar(MAX)		= NULL	--MemberID  편의상 중복
, @ItemListID_MemberItems nvarchar(MAX)	= NULL
, @ItemCount_MemberItems nvarchar(MAX)	= NULL
, @ItemStatus_MemberItems nvarchar(MAX)	= NULL
--, @HideYN_MemberItems nvarchar(MAX)	= NULL
--, @DeleteYN_MemberItems nvarchar(MAX)	= NULL
, @sCol1_MemberItems nvarchar(MAX)	= NULL
, @sCol2_MemberItems nvarchar(MAX)	= NULL
, @sCol3_MemberItems nvarchar(MAX)	= NULL
, @sCol4_MemberItems nvarchar(MAX)	= NULL
, @sCol5_MemberItems nvarchar(MAX)	= NULL
, @sCol6_MemberItems nvarchar(MAX)	= NULL
, @sCol7_MemberItems nvarchar(MAX)	= NULL
, @sCol8_MemberItems nvarchar(MAX)	= NULL
, @sCol9_MemberItems nvarchar(MAX)	= NULL
, @sCol10_MemberItems nvarchar(MAX)	= NULL
--MemberItemPurchases 테이블 /
, @MemberItemPurchaseID_MemberItemPurchases nvarchar(MAX)		= NULL		--변경된 부분
, @MemberID_MemberItemPurchases nvarchar(MAX)	= NULL	--MemberID  편의상 중복
, @ItemListID_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseQuantity_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchasePrice_MemberItemPurchases nvarchar(MAX)	= NULL
, @PGinfo1_MemberItemPurchases nvarchar(MAX)	= NULL
, @PGinfo2_MemberItemPurchases nvarchar(MAX)	= NULL
, @PGinfo3_MemberItemPurchases nvarchar(MAX)	= NULL
, @PGinfo4_MemberItemPurchases nvarchar(MAX)	= NULL
, @PGinfo5_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseDeviceID_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseDeviceIPAddress_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseDeviceMACAddress_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseDT_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelYN_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelDT_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelingStatus_MemberItemPurchases nvarchar(MAX)	= NULL
--, @PurchaseCancelConfirmAdminMemberID_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelReturnedAmount_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelDeviceID_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelDeviceIPAddress_MemberItemPurchases nvarchar(MAX)	= NULL
, @PurchaseCancelDeviceMACAddress_MemberItemPurchases nvarchar(MAX)	= NULL
--, @HideYN_MemberItemPurchases nvarchar(MAX)	= NULL
--, @DeleteYN_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol1_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol2_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol3_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol4_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol5_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol6_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol7_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol8_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol9_MemberItemPurchases nvarchar(MAX)	= NULL
, @sCol10_MemberItemPurchases nvarchar(MAX)	= NULL
--MemberGameInfoes 테이블 파라미터
, @MemberID_MemberGameInfoes nvarchar(MAX)	= NULL		--편의상 중복
, @Level_MemberGameInfoes nvarchar(MAX)	= NULL
, @Exps_MemberGameInfoes nvarchar(MAX)	= NULL
, @Points_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT1_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT2_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT3_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT4_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT5_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT6_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT7_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT8_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT9_MemberGameInfoes nvarchar(MAX)	= NULL
, @UserSTAT10_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol1_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol2_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol3_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol4_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol5_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol6_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol7_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol8_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol9_MemberGameInfoes nvarchar(MAX)	= NULL
, @sCol10_MemberGameInfoes nvarchar(MAX)	= NULL
AS 
set nocount on
set xact_abort on
declare @rowcount int
set @rowcount = 0

if upper(@DeleteORUpdate) = 'DELETE' 
	begin
		begin tran
			--MemberItems에서 삭제하고,  MemberItemPurchases에 수정하고 MemberGameInfoes 를 수정
			--MemberItems에 삭제
			--delete from MemberItems where MemberItemID like @MemberItemID_MemberItems
			update MemberItems set DeleteYN = 'Y', UpdatedAt = sysutcdatetime() where MemberItemID like @MemberItemID_MemberItems
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			--MemberItemPurchases에 수정
			update MemberItemPurchases set
				MemberID = CASE WHEN @MemberID_MemberItemPurchases is not null THEN @MemberID_MemberItemPurchases  ELSE  MemberID  END
				, ItemListID = CASE WHEN @ItemListID_MemberItemPurchases is not null THEN @ItemListID_MemberItemPurchases  ELSE  ItemListID  END
				, PurchaseQuantity = CASE WHEN @PurchaseQuantity_MemberItemPurchases is not null THEN @PurchaseQuantity_MemberItemPurchases  ELSE PurchaseQuantity   END
				, PurchasePrice = CASE WHEN @PurchasePrice_MemberItemPurchases is not null THEN @PurchasePrice_MemberItemPurchases  ELSE  PurchasePrice  END
				, PGinfo1 = CASE WHEN @PGinfo1_MemberItemPurchases is not null THEN @PGinfo1_MemberItemPurchases  ELSE  PGinfo1  END
				, PGinfo2 = CASE WHEN @PGinfo2_MemberItemPurchases is not null THEN @PGinfo2_MemberItemPurchases  ELSE  PGinfo2  END
				, PGinfo3 = CASE WHEN @PGinfo3_MemberItemPurchases is not null THEN @PGinfo3_MemberItemPurchases  ELSE  PGinfo3  END
				, PGinfo4 = CASE WHEN @PGinfo4_MemberItemPurchases is not null THEN @PGinfo4_MemberItemPurchases  ELSE PGinfo4   END
				, PGinfo5 = CASE WHEN @PGinfo5_MemberItemPurchases is not null THEN @PGinfo5_MemberItemPurchases  ELSE  PGinfo5  END
				, PurchaseDeviceID = CASE WHEN @PurchaseDeviceID_MemberItemPurchases is not null THEN @PurchaseDeviceID_MemberItemPurchases  ELSE  PurchaseDeviceID  END
				, PurchaseDeviceIPAddress = CASE WHEN @PurchaseDeviceIPAddress_MemberItemPurchases is not null THEN @PurchaseDeviceIPAddress_MemberItemPurchases  ELSE  PurchaseDeviceIPAddress  END
				, PurchaseDeviceMACAddress = CASE WHEN @PurchaseDeviceMACAddress_MemberItemPurchases is not null THEN @PurchaseDeviceMACAddress_MemberItemPurchases  ELSE  PurchaseDeviceMACAddress  END
				, PurchaseDT = CASE WHEN @PurchaseDT_MemberItemPurchases is not null THEN @PurchaseDT_MemberItemPurchases  ELSE PurchaseDT   END
				, PurchaseCancelYN = CASE WHEN @PurchaseCancelYN_MemberItemPurchases is not null THEN @PurchaseCancelYN_MemberItemPurchases  ELSE PurchaseCancelYN   END
				, PurchaseCancelDT = CASE WHEN @PurchaseCancelDT_MemberItemPurchases is not null THEN @PurchaseCancelDT_MemberItemPurchases  ELSE  PurchaseCancelDT  END
				, PurchaseCancelingStatus = CASE WHEN @PurchaseCancelingStatus_MemberItemPurchases is not null THEN @PurchaseCancelingStatus_MemberItemPurchases  ELSE PurchaseCancelingStatus   END
				, PurchaseCancelReturnedAmount = CASE WHEN @PurchaseCancelReturnedAmount_MemberItemPurchases is not null THEN @PurchaseCancelReturnedAmount_MemberItemPurchases  ELSE PurchaseCancelReturnedAmount   END
				, PurchaseCancelDeviceID = CASE WHEN @PurchaseCancelDeviceID_MemberItemPurchases is not null THEN @PurchaseCancelDeviceID_MemberItemPurchases  ELSE PurchaseCancelDeviceID   END
				, PurchaseCancelDeviceIPAddress = CASE WHEN @PurchaseCancelDeviceIPAddress_MemberItemPurchases is not null THEN @PurchaseCancelDeviceIPAddress_MemberItemPurchases  ELSE  PurchaseCancelDeviceIPAddress  END
				, PurchaseCancelDeviceMACAddress = CASE WHEN @PurchaseCancelDeviceMACAddress_MemberItemPurchases is not null THEN @PurchaseCancelDeviceMACAddress_MemberItemPurchases  ELSE  PurchaseCancelDeviceMACAddress  END
				, sCol1 = CASE WHEN @sCol1_MemberItemPurchases is not null THEN @sCol1_MemberItemPurchases  ELSE sCol1   END
				, sCol2 = CASE WHEN @sCol2_MemberItemPurchases is not null THEN @sCol2_MemberItemPurchases  ELSE   sCol2 END
				, sCol3 = CASE WHEN @sCol3_MemberItemPurchases is not null THEN @sCol3_MemberItemPurchases  ELSE sCol3   END
				, sCol4 = CASE WHEN @sCol4_MemberItemPurchases is not null THEN @sCol4_MemberItemPurchases  ELSE sCol4   END
				, sCol5 = CASE WHEN @sCol5_MemberItemPurchases is not null THEN @sCol5_MemberItemPurchases  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItemPurchases is not null THEN @sCol6_MemberItemPurchases  ELSE  sCol6  END
				, sCol7 = CASE WHEN @sCol7_MemberItemPurchases is not null THEN @sCol7_MemberItemPurchases  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItemPurchases is not null THEN @sCol8_MemberItemPurchases  ELSE sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItemPurchases is not null THEN @sCol9_MemberItemPurchases  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItemPurchases is not null THEN @sCol10_MemberItemPurchases  ELSE sCol10   END
				,UpdatedAt = sysutcdatetime()
			where MemberItemPurchaseID like @MemberItemPurchaseID_MemberItemPurchases
			set @rowcount = @rowcount + (select @@ROWCOUNT)

			-- MemberGameInfoes 수정
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE  Level  END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE Exps   END
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
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE   UserSTAT10 END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE   sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE sCol3   END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6  END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8  END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE sCol9   END
					, sCol10 = CASE WHEN @sCol10_MemberGameInfoes is not null THEN @sCol10_MemberGameInfoes  ELSE  sCol10  END
					,UpdatedAt = sysutcdatetime()
				where MemberID like @MemberID_MemberGameInfoes
			set @rowcount = @rowcount + (select @@ROWCOUNT)
		commit tran
	end
if upper(@DeleteORUpdate) = 'UPDATE'
	begin
		begin tran
			--MemberItems에서 수정하고,  MemberItemPurchases에 수정하고 MemberGameInfoes 를 수정
			--MemberItems에 수정
			update MemberItems set
				MemberID = CASE WHEN @MemberID_MemberItems is not null THEN @MemberID_MemberItems  ELSE  MemberID  END
				, ItemListID = CASE WHEN @ItemListID_MemberItems is not null THEN @ItemListID_MemberItems  ELSE   ItemListID END
				, ItemCount = CASE WHEN @ItemCount_MemberItems is not null THEN @ItemCount_MemberItems  ELSE  ItemCount  END
				, ItemStatus = CASE WHEN @ItemStatus_MemberItems is not null THEN @ItemStatus_MemberItems  ELSE  ItemStatus  END
				, sCol1 = CASE WHEN @sCol1_MemberItems is not null THEN @sCol1_MemberItems  ELSE  sCol1  END
				, sCol2 = CASE WHEN @sCol2_MemberItems is not null THEN @sCol2_MemberItems  ELSE sCol2   END
				, sCol3 = CASE WHEN @sCol3_MemberItems is not null THEN @sCol3_MemberItems  ELSE  sCol3  END
				, sCol4 = CASE WHEN @sCol4_MemberItems is not null THEN @sCol4_MemberItems  ELSE sCol4   END
				, sCol5 = CASE WHEN @sCol5_MemberItems is not null THEN @sCol5_MemberItems  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItems is not null THEN @sCol6_MemberItems  ELSE  sCol6  END
				, sCol7 = CASE WHEN @sCol7_MemberItems is not null THEN @sCol7_MemberItems  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItems is not null THEN @sCol8_MemberItems  ELSE  sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItems is not null THEN @sCol9_MemberItems  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItems is not null THEN @sCol10_MemberItems  ELSE  sCol10  END
				,UpdatedAt = sysutcdatetime()
			where MemberItemID like @MemberItemID_MemberItems
			set @rowcount = @rowcount + (select @@ROWCOUNT)
					
			--MemberItemPurchases에 수정
			update MemberItemPurchases set
				MemberID = CASE WHEN @MemberID_MemberItemPurchases is not null THEN @MemberID_MemberItemPurchases  ELSE  MemberID  END
				, ItemListID = CASE WHEN @ItemListID_MemberItemPurchases is not null THEN @ItemListID_MemberItemPurchases  ELSE  ItemListID  END
				, PurchaseQuantity = CASE WHEN @PurchaseQuantity_MemberItemPurchases is not null THEN @PurchaseQuantity_MemberItemPurchases  ELSE PurchaseQuantity   END
				, PurchasePrice = CASE WHEN @PurchasePrice_MemberItemPurchases is not null THEN @PurchasePrice_MemberItemPurchases  ELSE  PurchasePrice  END
				, PGinfo1 = CASE WHEN @PGinfo1_MemberItemPurchases is not null THEN @PGinfo1_MemberItemPurchases  ELSE  PGinfo1  END
				, PGinfo2 = CASE WHEN @PGinfo2_MemberItemPurchases is not null THEN @PGinfo2_MemberItemPurchases  ELSE  PGinfo2  END
				, PGinfo3 = CASE WHEN @PGinfo3_MemberItemPurchases is not null THEN @PGinfo3_MemberItemPurchases  ELSE  PGinfo3  END
				, PGinfo4 = CASE WHEN @PGinfo4_MemberItemPurchases is not null THEN @PGinfo4_MemberItemPurchases  ELSE PGinfo3   END
				, PGinfo5 = CASE WHEN @PGinfo5_MemberItemPurchases is not null THEN @PGinfo5_MemberItemPurchases  ELSE   PGinfo5 END
				, PurchaseDeviceID = CASE WHEN @PurchaseDeviceID_MemberItemPurchases is not null THEN @PurchaseDeviceID_MemberItemPurchases  ELSE  PurchaseDeviceID  END
				, PurchaseDeviceIPAddress = CASE WHEN @PurchaseDeviceIPAddress_MemberItemPurchases is not null THEN @PurchaseDeviceIPAddress_MemberItemPurchases  ELSE PurchaseDeviceIPAddress   END
				, PurchaseDeviceMACAddress = CASE WHEN @PurchaseDeviceMACAddress_MemberItemPurchases is not null THEN @PurchaseDeviceMACAddress_MemberItemPurchases  ELSE   PurchaseDeviceMACAddress END
				, PurchaseDT = CASE WHEN @PurchaseDT_MemberItemPurchases is not null THEN @PurchaseDT_MemberItemPurchases  ELSE   PurchaseDT END
				, PurchaseCancelYN = CASE WHEN @PurchaseCancelYN_MemberItemPurchases is not null THEN @PurchaseCancelYN_MemberItemPurchases  ELSE   PurchaseCancelYN END
				, PurchaseCancelDT = CASE WHEN @PurchaseCancelDT_MemberItemPurchases is not null THEN @PurchaseCancelDT_MemberItemPurchases  ELSE  PurchaseCancelDT  END
				, PurchaseCancelingStatus = CASE WHEN @PurchaseCancelingStatus_MemberItemPurchases is not null THEN @PurchaseCancelingStatus_MemberItemPurchases  ELSE  PurchaseCancelingStatus  END
				, PurchaseCancelReturnedAmount = CASE WHEN @PurchaseCancelReturnedAmount_MemberItemPurchases is not null THEN @PurchaseCancelReturnedAmount_MemberItemPurchases  ELSE PurchaseCancelReturnedAmount   END
				, PurchaseCancelDeviceID = CASE WHEN @PurchaseCancelDeviceID_MemberItemPurchases is not null THEN @PurchaseCancelDeviceID_MemberItemPurchases  ELSE  PurchaseCancelDeviceID  END
				, PurchaseCancelDeviceIPAddress = CASE WHEN @PurchaseCancelDeviceIPAddress_MemberItemPurchases is not null THEN @PurchaseCancelDeviceIPAddress_MemberItemPurchases  ELSE  PurchaseCancelDeviceIPAddress  END
				, PurchaseCancelDeviceMACAddress = CASE WHEN @PurchaseCancelDeviceMACAddress_MemberItemPurchases is not null THEN @PurchaseCancelDeviceMACAddress_MemberItemPurchases  ELSE PurchaseCancelDeviceMACAddress   END
				, sCol1 = CASE WHEN @sCol1_MemberItemPurchases is not null THEN @sCol1_MemberItemPurchases  ELSE  sCol1  END
				, sCol2 = CASE WHEN @sCol2_MemberItemPurchases is not null THEN @sCol2_MemberItemPurchases  ELSE  sCol2  END
				, sCol3 = CASE WHEN @sCol3_MemberItemPurchases is not null THEN @sCol3_MemberItemPurchases  ELSE  sCol3  END
				, sCol4 = CASE WHEN @sCol4_MemberItemPurchases is not null THEN @sCol4_MemberItemPurchases  ELSE  sCol4  END
				, sCol5 = CASE WHEN @sCol5_MemberItemPurchases is not null THEN @sCol5_MemberItemPurchases  ELSE  sCol5  END
				, sCol6 = CASE WHEN @sCol6_MemberItemPurchases is not null THEN @sCol6_MemberItemPurchases  ELSE sCol6   END
				, sCol7 = CASE WHEN @sCol7_MemberItemPurchases is not null THEN @sCol7_MemberItemPurchases  ELSE  sCol7  END
				, sCol8 = CASE WHEN @sCol8_MemberItemPurchases is not null THEN @sCol8_MemberItemPurchases  ELSE  sCol8  END
				, sCol9 = CASE WHEN @sCol9_MemberItemPurchases is not null THEN @sCol9_MemberItemPurchases  ELSE  sCol9  END
				, sCol10 = CASE WHEN @sCol10_MemberItemPurchases is not null THEN @sCol10_MemberItemPurchases  ELSE  sCol10  END
				, UpdatedAt = sysutcdatetime()
			where MemberItemPurchaseID like @MemberItemPurchaseID_MemberItemPurchases
			set @rowcount = @rowcount + (select @@ROWCOUNT)
			
			-- MemberGameInfoes 수정
			update MemberGameInfoes set 
					Level = CASE WHEN @Level_MemberGameInfoes is not null THEN @Level_MemberGameInfoes  ELSE  Level  END
					, Exps = CASE WHEN @Exps_MemberGameInfoes is not null THEN @Exps_MemberGameInfoes  ELSE Exps   END
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
					, UserSTAT10 = CASE WHEN @UserSTAT10_MemberGameInfoes is not null THEN @UserSTAT10_MemberGameInfoes  ELSE   UserSTAT10 END
					, sCol1 = CASE WHEN @sCol1_MemberGameInfoes is not null THEN @sCol1_MemberGameInfoes  ELSE   sCol1 END
					, sCol2 = CASE WHEN @sCol2_MemberGameInfoes is not null THEN @sCol2_MemberGameInfoes  ELSE  sCol2  END
					, sCol3 = CASE WHEN @sCol3_MemberGameInfoes is not null THEN @sCol3_MemberGameInfoes  ELSE sCol3   END
					, sCol4 = CASE WHEN @sCol4_MemberGameInfoes is not null THEN @sCol4_MemberGameInfoes  ELSE  sCol4  END
					, sCol5 = CASE WHEN @sCol5_MemberGameInfoes is not null THEN @sCol5_MemberGameInfoes  ELSE  sCol5 END
					, sCol6 = CASE WHEN @sCol6_MemberGameInfoes is not null THEN @sCol6_MemberGameInfoes  ELSE  sCol6  END
					, sCol7 = CASE WHEN @sCol7_MemberGameInfoes is not null THEN @sCol7_MemberGameInfoes  ELSE  sCol7 END
					, sCol8 = CASE WHEN @sCol8_MemberGameInfoes is not null THEN @sCol8_MemberGameInfoes  ELSE  sCol8  END
					, sCol9 = CASE WHEN @sCol9_MemberGameInfoes is not null THEN @sCol9_MemberGameInfoes  ELSE sCol9   END
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
EXEC uspUdtReturnItem  'DELETE', 'E43E2EC7-F162-43E4-90FE-61E7CD8A385D','aaa','A2C03A61-41C8-496C-823B-F7B2255DE55D','98','굿','sCol1_MemberItems','sCol2_MemberItems','sCol3_MemberItems','sCol4_MemberItems','sCol5_MemberItems','sCol6_MemberItems','sCol7_MemberItems','sCol8_MemberItems','sCol9_MemberItems','sCol10_MemberItems','593A895E-6DBD-459F-9A1D-666B89854A4C','aaa','5395E0E0-9C9F-4A5E-995E-668C7E5B1415','99','70','PGinfo1_MemberItemPurchases','PGinfo2_MemberItemPurchases','PGinfo3_MemberItemPurchases','PGinfo4_MemberItemPurchases','PGinfo5_MemberItemPurchases','PurchaseDeviceID_MemberItemPurchases','ip','mac address','today','N','DT','status','','','','','sCol1_MemberItemPurchases','sCol2_MemberItemPurchases','sCol3_MemberItemPurchases','sCol4_MemberItemPurchases','sCol5_MemberItemPurchases','sCol6_MemberItemPurchases','sCol7_MemberItemPurchases','sCol8_MemberItemPurchases','sCol9_MemberItemPurchases','sCol10_MemberItemPurchases','aaa','50','10','89','UserSTAT1_MemberGameInfoes','UserSTAT2_MemberGameInfoes','UserSTAT3_MemberGameInfoes','UserSTAT4_MemberGameInfoes','UserSTAT5_MemberGameInfoes','UserSTAT6_MemberGameInfoes','UserSTAT7_MemberGameInfoes','UserSTAT8_MemberGameInfoes','UserSTAT9_MemberGameInfoes','UserSTAT10_MemberGameInfoes','sCol1_MemberGameInfoes','sCol2_MemberGameInfoes','sCol3_MemberGameInfoes','sCol4_MemberGameInfoes','sCol5_MemberGameInfoes','sCol6_MemberGameInfoes','sCol7_MemberGameInfoes','sCol8_MemberGameInfoes','sCol9_MemberGameInfoes','sCol10_MemberGameInfoes'
EXEC uspUdtReturnItem  'UPDATE','E43E2EC7-F162-43E4-90FE-61E7CD8A385D','aaa','A2C03A61-41C8-496C-823B-F7B2255DE55D','98','굿','sCol1_MemberItems','sCol2_MemberItems','sCol3_MemberItems','sCol4_MemberItems','sCol5_MemberItems','sCol6_MemberItems','sCol7_MemberItems','sCol8_MemberItems','sCol9_MemberItems','sCol10_MemberItems','593A895E-6DBD-459F-9A1D-666B89854A4C','aaa','5395E0E0-9C9F-4A5E-995E-668C7E5B1415','99','70','PGinfo1_MemberItemPurchases','PGinfo2_MemberItemPurchases','PGinfo3_MemberItemPurchases','PGinfo4_MemberItemPurchases','PGinfo5_MemberItemPurchases','PurchaseDeviceID_MemberItemPurchases','ip','mac address','today','N','DT','status','','','','','sCol1_MemberItemPurchases','sCol2_MemberItemPurchases','sCol3_MemberItemPurchases','sCol4_MemberItemPurchases','sCol5_MemberItemPurchases','sCol6_MemberItemPurchases','sCol7_MemberItemPurchases','sCol8_MemberItemPurchases','sCol9_MemberItemPurchases','sCol10_MemberItemPurchases','aaa','50','10','89','UserSTAT1_MemberGameInfoes','UserSTAT2_MemberGameInfoes','UserSTAT3_MemberGameInfoes','UserSTAT4_MemberGameInfoes','UserSTAT5_MemberGameInfoes','UserSTAT6_MemberGameInfoes','UserSTAT7_MemberGameInfoes','UserSTAT8_MemberGameInfoes','UserSTAT9_MemberGameInfoes','UserSTAT10_MemberGameInfoes','sCol1_MemberGameInfoes','sCol2_MemberGameInfoes','sCol3_MemberGameInfoes','sCol4_MemberGameInfoes','sCol5_MemberGameInfoes','sCol6_MemberGameInfoes','sCol7_MemberGameInfoes','sCol8_MemberGameInfoes','sCol9_MemberGameInfoes','sCol10_MemberGameInfoes'
-----------------------------------------------------------------------
SELECT * FROM MemberItems
SELECT * FROM MemberItemPurchases
SELECT * FROM MemberGameInfoes
*/

