//初始值
typeNumber = 1;
imgLength = 1;
productInfoTest = `	超級無敵海景佛跳牆、超級無敵海鮮干貝羹 ，年節絕對不能錯的美味好菜，集結各種不可或缺的食材，精燉熬煮，<br>
					味道層次分，用料實在，香氣四溢，湯汁入口溫醇回甘，配料軟嫩適中，絕妙搭配，讓你吃過就念念不忘!<br><br>
					
					詳細規格<br>
					商品名稱:超級無敵海景佛跳牆<br><br>

					超級無敵海景佛跳牆<br>
					重量：1050g±10%(固形物：490g)<br><br>

					成份：水、大白菜、芋頭、豬腳丁、脆筍片(台灣麻竹筍，鹽，偏亞硫酸氫鈉)、排骨〔大豆油，地瓜粉，水，鹽，小蘇打(碳酸氫鈉)<br>
					，木瓜酵素(碳酸氫鈉、木瓜酵素AFR【麥芽糊精、木瓜酵素、偏亞硫酸氫鈉(抗氧化劑)】、食鹽)<br>
					，白胡椒粉(白胡椒、麥芽糊精)，特級五香粉(小茴、肉桂、陳皮、八角、胡妥子、甘草、丁香、當歸、香芹子、川芎、山奈)<br>
					，香蒜粉(蒜粉、麥芽糊精)〕、鳥蛋、栗子、紅蔥油(棕櫚油，大豆油，紅蔥頭)、杏鮑菇、香菇絲、明膠(豬)<br>
					，海藻膠、蒜仁、蝦米、醬油、調味料【麥芽糊精、食鹽、L-麩酸鈉、雞肉精粉〔雞肉抽<br><br>

					包裝內容物：1份/包<br><br>

					保存期限:冷凍-18℃以下 一年<br><br>

					包裝方式:外-一般塑膠包裝<br><br>

					物流方式:冷凍<br><br>

					產地：台灣<br><br>

					調理方式：<br>
					1、 隔水加熱法：待產品完全解凍後，將內包裝袋(不可撕開)直接投入沸水鍋中，水面必須完全覆蓋產品，並以中火隔水加熱烹煮10-15分鐘後即可。<br>
					2、 微波加熱法：待產品完全解凍後，撕開內包裝袋，將本產品倒入碗內並蓋上碗蓋，再放入微波爐中(功率800~1000W)微波8-10分鐘後即可。<br><br>

					注意事項：加熱方式因設備狀況差異，可依實際需要調整加熱時間。<br><br>

					※本商品含有強制性標示過敏原成分<br>
					※本島全配，僅外島不配送<br><br>`

//設定ckeditor的套件資訊
CKEDITOR.replace('test1', {
							width: "100%",
							height: 500
});

//按下新增商品
function waitSubmit(){
	openWait();
	$("#formProduct").submit();
}

function openWait(){
	$("#dialog_div_wait").html("<img src='images/ajaxload.gif'><br><span>上傳圖片中</span>");
    $("#dialog_div_wait").dialog("open");
}

//一鍵輸入
function speetIn(){
	$("#productName").val("超級無敵海景佛跳牆");
	$("#category").val("食品");
	$("#typeTitle0").val("海鮮雞肉口味");
	$("#unitPrice0").val("1200");
	$("#unitStock0").val("100");
	$("#typeTitle1").val("食神聯名款(副銷魂飯)");
	$("#unitPrice1").val("1300");
	$("#unitStock1").val("10");
	CKEDITOR.instances["test1"].setData(productInfoTest);
}


//預覽圖片功能
function readURL(input) {
	index = $(input).attr("index");
	viewImg = "#viewImg" + index;
	
	console.log(viewImg);
	
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$(viewImg).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

$("body").on("change",".images",function(){
	console.log("change done")
	readURL(this);
	//載入圖片完成後, 判斷是否需要給新增按鈕(為最後一個按鈕? and 不超過5個)
	console.log("if:"+ (($(this).attr("index") === imgLength.toString()) && (imgLength < 5)) )
	if( ($(this).attr("index") === imgLength.toString()) && (imgLength < 5) ){
		let divId = "#imgDiv"+ imgLength;
		
		imgLength = imgLength + 1;
		console.log("divId:" + divId);
		let context =	"<div class='imgDiv' id='imgDiv"+ imgLength +"'><label for='img"+ imgLength +"'>"
					+	"<input type='file' name='image1' index='"+ imgLength +"' id='img"+ imgLength +"' class='images'>"
					+	"<img class='viewImgClass' id='viewImg" + imgLength + "' src='images/addPicture.png'></label></div>";
		console.log("context:" + context);
		$(divId).after(context);
	}
});


//刪除type按鈕
function deleteType(index){
	let typeGroup = "#typeGroup" + index;
	$(typeGroup).remove();	
}

//新增type按鈕
function addType(){
	let contant1 = `<div id='typeGroup`+ typeNumber +`'>
	<table>
	<tr>
		<td style='width: 500px; padding-right: 50px;'>
			<div class='form-group'>
				<label>商品規格</label>
				<input type='text' class='form-control' id='typeTitle`+ typeNumber +`'  name="typeTitle">
			</div>
		</td>
		<td style='width: 200px; padding-right: 50px;'>
			<div class='form-group'>
				<label>售價</label>
				<input type='text' class='form-control' id='unitPrice`+ typeNumber +`' name="unitPrice">
			</div>
		</td>
		<td style='width: 200px;  padding-right: 50px;' >
			<div class='form-group'>
				<label>庫存</label>
				<input type='text' class='form-control' id='unitStock`+ typeNumber +`' name='unitStock'>
			</div>
		</td>
		<td style='width: 100px;' align='center' valign="middle">
			<div class='form-group'>
				<input type='button' class="btn btn-secondary" onclick='deleteType(`+ typeNumber +`)' value='移除類型'>
			</div>
		</td>
	</tr>
</table>
</div>`;
	
//	let contant1 =	"<div id='typeGroup" + typeNumber + "'><hr><table>"
//		+	"<tr><td>類型名稱:<td><input type='text' name='typeTitle'></input>"
//		+	"<td><input type='button' value='移除' onclick='deleteType("+ typeNumber +")'>"
//		+	"<tr><td>售價:<td><input type='text' id='unitPrice" + typeNumber + "' index='"
//			+ typeNumber + "' name='unitPrice' class='unitPrice'>"
//			+ "</input><span id='calculator" + typeNumber + "'></span>"
//		+	"<tr><td>折扣:<td><input type='text' id='discount" + typeNumber + "' index ='"
//			+ typeNumber + "' name='discount' class='discount'></input>"
//		+	"<tr><td>庫存:<td><input type='text' name='unitStock'></input>"
//		+	"<tr><td>已訂貨:<td><input type='text' name='unitOrder'></input>"
//		+	"<tr><td>&nbsp</tr></table></div>";
	
	$("#addButton").before(contant1);
	typeNumber = typeNumber + 1;
}


//================== dialog初始化區  ==================

//wait
$(function() {
    $("#dialog_div_wait").dialog({
    	//固定視窗
    	maxHeight:	250,
    	maxWidth:	250,
    	minHeight:	250,
    	minWidth:	250,
    	
    	//拖移設定
    	draggable: false,
    	
    	//dialog建立自動開啟設定
        autoOpen: false,
        
        //視窗外無法操作設定
        modal : true,
        
        //不能Esc關閉
        closeOnEscape: true,
        
        //open事件發生時, 將dialog樣式右上的x隱藏
        open:function(event,ui){$(".ui-dialog-titlebar-close").hide();}
        
    });
    
    $("#wait_butt").click(function(productId) {
		$("#dialog_div_wait").html("<img src='images/ajaxload.gif'><br><span>載入中...</span>");
        $("#dialog_div_wait").dialog("open");
    });
});


//error
$(function() {
    $("#dialog_div_error").dialog({
    	//固定視窗
    	maxHeight:	250,
    	maxWidth:	250,
    	minHeight:	250,
    	minWidth:	250,
    	
    	//拖移設定
    	draggable: false,
    	
    	//dialog建立自動開啟設定
        autoOpen: false,
        
        //視窗外無法操作設定
        modal : true,
        
        //不能Esc關閉
        closeOnEscape: true,

        //open事件發生時, 將dialog樣式右上的x顯示
        open:function(event,ui){$(".ui-dialog-titlebar-close").show();}
  
    });
    
    $("#error_butt").click(function(productId) {
		$("#dialog_div_error").html("<span class='errorFont'>更新失敗!</span>");
        $("#dialog_div_error").dialog("open");
    });
});