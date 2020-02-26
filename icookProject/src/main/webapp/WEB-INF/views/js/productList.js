$(document).ready(function() {

	var pageContext = $("#pageContext").val();
//		======================輪播圖設定==========================	
	//邊邊不露白
	$('.coverflow').css('max-width',$('.coverflow img').width());
//		======================p分頁p==========================
	
	var pageSet = 6;//tip:每個分頁顯示的商品數量
	console.log( typeof(pageSet));//tip:typeof(pageSet)查看型態
	var proCount = $("#proCount").val();//tip:商品數量
	
	//總頁數 , Math.ceil()=無條件進位
	var totalPage = Math.ceil(proCount/pageSet);
	
	var page = 1;//tip:設定第一頁頁碼
	
//	//調整顯示商品筆數(未完)
//	$(".selectCountPage").change(function(){
//		pageSet = $("#selectCountPage").val();
//		console.log("pageSet:"+pageSet);
//		totalPage = Math.ceil(proCount/pageSet);
//		entryPage();
//		buildPage();
//		//因為按鈕在調整筆數後重寫,所以要再讀一次
////			$("input[class*='products']").load("productList");
//		$(".btLi").load("");
//		showPagePros();
//	})
	
	
	buildPage();//建立頁碼
	showPagePros();//tip:剛載入就顯示此頁商品數量

	var finalPage; //tip:儲存末頁的頁碼
	//建立頁碼function
	function buildPage(){
		totalPage = Math.ceil(proCount/pageSet);
		var pageList='<li class=\"listPaper\" id=\"listPaper\"><button class=\"btLi ui-button ui-widget ui-corner-all\" id=\"pageFirst\">頁首</button></li><li class=\"listPaper\" id=\"listPaper\"><button class=\"pagePre ui-button ui-widget ui-corner-all\" id=\"pagePre\">上一頁</button></li>';
		for(var thePage=1;thePage<=totalPage;thePage++){
			pageList+='<li class=\"listPaper\" id=\"listPaper\"><button class=\"btLi\" id=\"btLi'+thePage+'\">'+thePage+'</button></li>';
			finalPage=Number(thePage); //tip:儲存末頁的頁碼
		}
		pageList+='<li class=\"listPaper\" id=\"listPaper\"><button class=\"pageNext ui-button ui-widget ui-corner-all\" id=\"pageNext\">下一頁</button></li><li class=\"listPaper\" id=\"listPaper\"><button class=\"btLi ui-button ui-widget ui-corner-all \" id=\"pageLast\">頁尾</button></li>';
		$(".pager").html(pageList);
	}
	console.log("finalPage:"+finalPage);
	//產生到第X頁輸入頁碼
//	function entryPage(){
//		var pageNo='';
//		for(var pageNoSet=1;pageNoSet<=totalPage;pageNoSet++){
//			pageNo+='<option>'+pageNoSet+'</option>';
//		}
//		$(".selectPage").html(pageNo);		
//	}
//	entryPage();
	
	
	
	//select變更頁碼時
//	$(".selectPage").change(function(){
//		page = $("#selectPage").val();
//		var pageBtn = $("#btLi"+page);
//		showPagePros(page);
//		removeLightBtn()
//		lightBtn(pageBtn)
//	});		

	
//		高亮顯示第一頁的按鈕	
	if(totalPage>0){
		lightBtn($($(".btLi").get(1)));
}		
//		hidePreNext(page);//載入時顯示or隱藏的按鈕
	
//	function selectedSet(){
//	//  先取得要移除項目的 index
//		var selectIndex = $("#selectPage").find(":selected").index();
//
//		//  移除選擇的項目
//		$("#selectPage").find(":selected").remove();
//
//		//  判斷移除項目後，原先的index是否還有option，有的話就直接將此option設定為選取狀態
//		//  捲軸就不會往上跑了
//		if ($('#selectPage option').get(selectIndex) != null) {
//		    $('#selectPage option').get(selectIndex).selected = true;
//		}
//		else {
//		    //  沒有項目的話，判斷select理是否還有option
//		    //  有的話，表示移除的項目為最後一個，就設定上一個option為選取狀態
//		    if ($('#selectPage option').length > 0) {
//		        $('#selectPage option').get(selectIndex - 1).selected = true;
//		    }
//		}
//	}
	
	
//		頁碼按鈕
//		testBtnEach();
	$(".btLi").click(function(){
		var id = $(this).attr("id");
		var Index = Number(id.replace("btLi",""))
		var thisBtn = $(this);
		if(id=="pageFirst"){
			page = 1;
			thisBtn = $($(".btLi").get(1));
		}
		else if (id=="pageLast"){
			page = finalPage;
			thisBtn = $($(".btLi").get(finalPage));
		}
		else {page = Index;}
//		$('#selectPage option').get(page-1).selected = true;
		showPagePros();
		removeLightBtn()
		lightBtn(thisBtn);
	})
	
//		上一頁按鈕
	$("#pagePre").click(function(){
		if(page>1){page--;}
//		$('#selectPage option').get(page-1).selected = true;
		showPagePros();
		removeLightBtn()
		lightBtn($($(".btLi").get(page)));
//			hidePreNext();
	})	
	
//		下一頁按鈕
	$("#pageNext").click(function(){
		if(page<totalPage){page++;}
//		$('#selectPage option').get(page-1).selected = true;
		showPagePros();
		removeLightBtn()
		lightBtn($($(".btLi").get(page)));
//			hidePreNext();
	})		
	
//		指定按鈕加css
	function lightBtn(targetBtn){
		targetBtn.addClass("pointBtnPage");
	}
	
//		移除所有標記按鈕的css
	function removeLightBtn(){
		$(".pointBtnPage").each(
			function(){
				$(this).removeClass("pointBtnPage");	
			})
	}		

//		隱藏前進後退按鈕,設定2秒(2000毫秒)
	function hidePreNext(){
		if(page==totalPage){
			$("#pageNext").hide(2000);	
			$("#pageLast").hide(2000);
			$("#pagePre").show(2000);
			$("#pageFirst").show(2000);			
		}else if(page==1){
			$("#pagePre").hide(2000);
			$("#pageFirst").hide(2000);	
			$("#pageNext").show(2000);	
			$("#pageLast").show(2000);	
		}else{
			$("#pageNext").show(2000);
			$("#pagePre").show(2000);	
			$("#pageFirst").show(2000);	
			$("#pageLast").show(2000);	
		}
}	
	
//		顯示某分頁商品
	function showPagePros(currentPage){
		$.each($(".products"),function(contentindex){
			if(contentindex>=(page-1)*pageSet && contentindex < page*pageSet){
				$(this).show();	
			}else{$(this).hide();}
		});	
//			hidePreNext(page);
	}	
//		======================設定select選單的商品數量==========================		
	getAllUnitStock();
	//取得全產品庫存量的陣列
	function getAllUnitStock(){
		$("#setMap2").append($("input[id*=uStock]").map(function(){
			return $(this).val();
			}).get().join(",")
		);
		return $("#setMap2").text().split(",");
	}	
	
	function setProdsOptionListArray(){
		var unitStockArray = getAllUnitStock();//取得全產品庫存量的陣列
		var unitStock=0;
		var optionList='';
		var optionListArray=[];
		
		for(var a=0;a<unitStockArray.length;a++){
			unitStock = unitStockArray[a];
			if(unitStock>0 && unitStock<10){
				for(var optionSet1=1;optionSet1<=unitStock;optionSet1++){
					optionList+='<option>'+optionSet1+'</option>';
				}
//				$(".selectQty").html(optionList);
				optionListArray[a]=optionList;
				optionList='';
			}else if(unitStock>=10){
				for(var optionSet2=1;optionSet2<=10;optionSet2++){
					optionList+='<option>'+optionSet2+'</option>';
				}
//				$(".selectQty").html(optionList);
				optionListArray[a]=optionList;
				optionList='';
			}else if(unitStock<=0){
				optionList+='<option>0</option>';
//				$(".selectQty").html(optionList);
				optionListArray[a]=optionList;
				optionList='';
			}
			optionList='';
		}
		return optionListArray;
	}	
	
//	proCount是商品數量,上面設定的;	
//	全部商品的modalContentID	
	setAllmodalContentSelect();
	function setAllmodalContentSelect(){
		var modalContentID='';
		var modalContentIDArray=[];
		var getOptionListArray = setProdsOptionListArray();
		var n = 0;
		for(var i1=0;i1<proCount;i1++){
			modalContentID = "#modalContent"+(i1+1);
			modalContentIDArray[i1]=modalContentID;
		}
		for(var i2=0;i2<modalContentIDArray.length;i2++){
			$(modalContentIDArray[i2]+" div[id*=item]").each(function(itemIndex,item){
				$(item).find("select").each(function(selectIndex,selectElement){
					$(selectElement).html(getOptionListArray[n]);
					n++;
				})
			})
		}
		console.log("n:"+n);
		n=0;
	}
// 筆記:find()和parents()是相對的
// 	  find():找所有兒女~子孫元素,不限階層
// 	  parents():找所有父母~祖先元素,不限階層
// ========================Modal content商品內容=========================	
		
		
//	初始關閉所有modal內容
	$(".modalContent").css("display","none");

	
//	動態寫入type的數量、內容(完成,但想試著用ajax寫看看)
	setSelectType();
	function setSelectType(){
		var typeList='';
		var typeContent='';
		var prods = $("#proCount").val();//商品數量
		var typeCount = [];//每個商品的種類數量
		var typeTitle = getAllTypeTitle();//全產品type的陣列
		
		for(var prodSet=1;prodSet<=prods;prodSet++){
			typeCount[prodSet]=$("#typeCount"+prodSet).val();
		}
		
		var typeTitleIndex=0;//產品type的索引
		for(var prod=1;prod<=prods;prod++){
			for(var typeNo=1;typeNo<=typeCount[prod];typeNo++){
				typeList+='<option class=\"proType\">'+typeTitle[typeTitleIndex++]+'</option>';
			}
			$("#proSelect"+prod).html(typeList);
//			$(".proSelect"+prod).html(typeList);
			typeList="";
		}
		
	}
	//取得全產品type的陣列
	function getAllTypeTitle(){
		$("#setMap").append($("input[id*=tTitle]").map(function(){
			return $(this).val();
		}).get().join(",")
		);
		return $("#setMap").text().split(",");
	}	
	
//	console.log($("select").text());
	var nowIndex = 0 ;
//	設定modal內容的type切換
	$("select[id*=proSelect]").change(function(){
		var targetIndex = $(this).get(0).selectedIndex;//取得被選中項目的索引
//		console.log("nowIndex:"+nowIndex);
		console.log("targetIndex:"+targetIndex);
		var selectID = $(this).attr("id");//取得自己元素id
		console.log("selectID:"+selectID);
		
		var selectVal = $(this).val();
		console.log("selectVal:"+selectVal);
		
		var modalContentID = $(this).parents("div[id*=modalContent]").attr("id")//取得祖宗元素modalContent的id
		console.log("modalContentID:"+modalContentID);
//		var index = modalContentID.replace("modalContent","");
//		var itemID = "div[id*=item"+targetIndex+"]";
//		console.log("itemID:"+itemID);
//		$("#"+modalContentID+" div[id*=item]").css("display","none");
//		$("#"+modalContentID+" div[id*=item"+targetIndex+"]").css("display","inline-block");
		$("#"+modalContentID+" div[id*=item]").each(function(index,item){
			console.log("item:"+item);
			if(index==targetIndex){
				$(item).css("display","inline-block");
			}else{
				$(item).css("display","none");
			}
		})
		
//		$("#"+modalContentID+" div[id*=item]").css("display","none");
//		$("#"+modalContentID+" #"+itemID).css("display","inline-block");
//		$(this).toggle();
		
		nowIndex = targetIndex;
//		console.log("nowIndex2:"+nowIndex);
		
//		if(nowIndex<targetIndex){
//		}
//		else if(nowIndex>targetIndex){
//			
//		}
	})
	
//	設定modal內容的圖片點選時在目標位置放大顯示
	var targetImg = $(".targetImg");//目標圖片的櫃子
	var smallImgBox = $(".smallImgBox");//圖片的櫃子
	
	$(".smallImg").click(function(){
		modalContentID = "#"+$(this).parents(".modalContent").attr("id");
		console.log("modalContentID:"+modalContentID);
		index = modalContentID.replace("#modalContent","");
		imgSrc = $(this).attr("src");
//		var targetIndex = nowIndex;	//取得被選中項目的索引
		var targetIndex = nowIndex ;
		console.log("targetIndex:"+targetIndex);
		console.log("imgSrc:"+imgSrc);
		
		$(modalContentID+ " .targetImg").each(function(tImgIndex,tImgItem){
			if(tImgIndex==targetIndex){
				$(tImgItem).html('<img class="targetOriImg img-rounded block_effect" src="' +imgSrc+ '" >' + '</img> <br><br>');
			}
		})
		targetImgSet();
	})
	
	
	targetImgSet();
	function targetImgSet(){
		//	呈上,呈現放大顯示後的大小
		$("img[class*=targetOriImg]").css({
			"width":"450px",
			"heigh":"400px",
		});
		//	呈上,調整放大顯示後的大小的位置
		$("div[class*=proPicture]").css({
			"position":"absolute",
			"top":"50px",
			"left":"90px",
		});
	}
	
	
//	elementPosition();
	//練習抓同class元素、索引	
	function elementPosition(){
		
//		這時會抓到同class=hoverProdImg的第8個(索引7)元素
		var taretElm = $(".hoverProdImg").get(7);
		
//		但抓到只是靜態元素,和能使用的DOM元素不同,
//		要在放入jquery的方法  →  DOM元素 = $(靜態元素) 才會變成DOM元素
		var setElm = $(taretElm);
		
		var testA= $(".hoverProdImg");
//		元素(靜態元素)的方法網站(重要)
//		https://developer.mozilla.org/zh-CN/docs/Web/API/Element
		console.log(testA.get(0));
		console.log(testA.length);
		console.log(testA.get(0).id);
		console.log(testA.get(0).attributes);
		console.log(testA.get(-1).innerHTML);
//		testA.each(function(index,data){
//			console.log(index,data);
//		});
	}		
// ========================Modal商品設定=========================		
	//m判斷是否使用modal
		var useModal = false;
		
    //m判斷是否開啟modal視窗,有開啟就將useModal設為true
   $('.myModal').on('shown.bs.modal', function (e) {
      console.log("openModal");
      useModal = true;
   })
	
 //m判斷是否關閉 modal視窗,關閉就將useModal設為false
	$('.myModal').on('hidden.bs.modal', function () {
		console.log("hiddenModal");
		useModal = false;
		
		//將modal內容恢復為初始狀態;
		nowIndex=0;
		$(".modalContent").css("display","none");
		
//		$("select .proType").first().css("background-color","green");
	})
	
//	按下詳細資料按鈕時,決定要開啟哪個商品modal
	$(".myModal").click(function(){
		myModalTarget = $(this).attr("data-target");
		console.log("myModalTarget:"+myModalTarget);
		if(myModalTarget!=null){
			var index = myModalTarget.replace("#myModal","");
		}
		console.log("index:"+index);
		var modalContentID = "#modalContent"+index;
		console.log("modalContentID:"+modalContentID);
//		開啟選擇的myModal內的所有第一個modalContent
//		$(myModalTarget+" .modalContent").first().css("display","inline-block");
//		開啟選擇的myModal內modalContent內和所有第一個item
		$(modalContentID).css("display","inline-block");
		$(modalContentID +" div[id*=item]").each(function(index,modalItem){
			if(index==0){
				$(modalItem).css("display","inline-block");
			}else{
				$(modalItem).css("display","none");
			}
		})
	})
	
	
// 設定商品內容的文字排版
   $("div[class*=divProSelect]").find("*").css({
	   "margin":"0 auto 12px",
//		  "color":"#f04646",
	   "font-size":"20px",
	   "font-weight":"600",
   });
   
   $("section[class*=sectionContent]").find("h2,h3,select,button,span")
   	.css({
	   "margin":"0 auto 12px",
//		  "color":"#f04646",
	   "font-size":"20px",
	   "font-weight":"600",
	 });
   
   $("span[class*=oriOriPrice]").css({
	   "font-size":"15px",
	   "color":"#AAAAAA",
   });
   
//	呈上,調整加入購物車的按鈕大小
	$("button[class*=addToCar]").css({
		"width":"147px",
		"height":"52px",
	}).children("span").css("font-size","15px");
	
//	呈上,調整右邊的副標題、select欄位位置、大小
	$("div[class*=divProSelect]").css({
		"top":"40px",
	});
	
//	呈上,調整右邊的價格、數量欄位位置、大小
	$("div[class*=proContent]").css({
		"position":"relative",
		"top":"50px",
		"left":"0",
		"margin":"0 0 100px 0",
	});
//======================文字編輯器==========================	
//	CKEDITOR.replace('productInfo'); //productInfo為textarea的id
//   CKEDITOR.replace('editorDemo'); //productInfo為textarea的id
//		console.log(CKEDITOR.instances.productInfo.getData()); // editorDemo是textarea的name
		
//================調整productInfo的大小====================	
$(".pppInfo p img").css("width","80%");
$(".proContent > p > img").css("width","80%");
 
 //在商品介紹取得第一行隱藏span商品簡介
var short_description = [];
$(".pppInfo span").each(function(ssIndex,ssItem){
	short_description[ssIndex] = $(ssItem).text();
})

 //商品介紹第一行隱藏span商品簡介放入class=text_decribe
$(".text_decribe").each(function(tdeIndex,tdeItem){
	$(tdeItem).text(short_description[tdeIndex]);
}) 
 //商品介紹第一行隱藏span商品簡介放入class=text_decribe_content
$(".text_decribe_content").each(function(tdecIndex,tdecItem){
	$(tdecItem).text(short_description[tdecIndex])
	.css({
		  "margin":"0 auto 12px",
		  "color":"#f04646",
		  "font-size":"27px",
		  "font-weight":"600",
	});
}) 
 

// =======================加入購物車=========================
//	現在有不同商品,的id是不同的,而同商品不同type的id是一樣的,所以要用get(),List的方式取拿資料
//  如果要讓同id商品形成陣列,class要同名,id必須不同才可以,不然被同class蓋過去
	$("#sendMsg").click(function(){
		alert("已加入貨到通知,將會再貨後立即通知您!");
	});
	
	$(".addToCar").click(function(){
		console.log("getNowSelectIndex:"+nowIndex);
		var getNowSelectIndex = nowIndex;
		var id = $(this).attr("id");
		var thisF = $(this).parents(".myModal ").attr("id");
		console.log("thisF:"+thisF);
// 		若id =press10,取數字部分10當index
		var	index = id.replace("press","");
//			console.log("buttonIndex:"+index);
		var productIdList = $(".productId"+index);
		var productNameList = $(".productName"+index);
		var productInfoList = $(".productInfo"+index);
		var typeIdList = $(".typeId"+index);
		var typeTitleList = $(".typeTitle"+index);
		var image1List = $("#"+thisF ).find("img[id*=smallImg]");
		var unitPriceList = $(".unitPrice"+index);
		var unitStockList = $(".unitStock"+index);
		var describeList = $(".describe"+index);
		var discountList = $(".discount"+index);
		var quantityList = $(".quantity"+index);

		
		var productId ="";
		productIdList.each(function(pIdIndex,pIdItem){
			if(pIdIndex==getNowSelectIndex){
				productId=$(pIdItem).val();
			}
		});
		var productName ="";
		productNameList.each(function(pNameIndex,pNameItem){
			if(pNameIndex==getNowSelectIndex){
				productName=$(pNameItem).val();
			}
		});
		var productInfo ="";
		productInfoList.each(function(pInfoIndex,pInfoItem){
			if(pInfoIndex==getNowSelectIndex){
				productInfo=$(pInfoItem).val();
			}
		});
		var typeId ="";
		typeIdList.each(function(tTypeIdIndex,tTypeIdItem){
			if(tTypeIdIndex==getNowSelectIndex){
				typeId=$(tTypeIdItem).val();
			}
		});
		var typeTitle ="";
		typeTitleList.each(function(tTitleIndex,tTitleItem){
			if(tTitleIndex==getNowSelectIndex){
				typeTitle=$(tTitleItem).val();
			}
		});
		var image1	 ="";
		image1List.each(function(tImage1Index,tImage1Item){
			if(tImage1Index==getNowSelectIndex){
				image1=$(tImage1Item).val();
			}
			console.log("tImage1Index:"+tImage1Index+":"+$(tImage1Item).val());
		});
		var unitPrice =0;
		unitPriceList.each(function(uPriceIndex,uPriceItem){
			if(uPriceIndex==getNowSelectIndex){
				unitPrice=$(uPriceItem).val();
			}
		});
		var unitStock =0;
		unitStockList.each(function(uStockIndex,uStockItem){
			if(uStockIndex==getNowSelectIndex){
				unitStock=$(uStockItem).val();
			}
		});
		var describe ="";
		describeList.each(function(theDescribeIndex,theDescribeItem){
			if(theDescribeIndex==getNowSelectIndex){
				describe=$(theDescribeItem).val();
			}
		});
		var discount =0;
		discountList.each(function(theDiscountIndex,theDiscountItem){
			if(theDiscountIndex==getNowSelectIndex){
				discount=$(theDiscountItem).val();
			}
		});
		var qty = 0;
		quantityList.each(function(qtyIndex,qtyItem){
			if(qtyIndex==getNowSelectIndex){
				qty=$(qtyItem).val();
			}
		});
		var product = 
		{ 
			productId  : productId,
			productName: productName,
		 	productInfo: productInfo,
			typeId     : typeId,
			typeTitle  : typeTitle, 
			image1     : image1,
			unitPrice  : unitPrice, 
			unitStock  : unitStock, 
			describe   : describe,
			discount   : discount,
			qty        : qty,
		};                
		//語法:JSON.stringdiscount" vify(物件) = 將物件轉換成JSON格式的字串(就是字串)
		var dataJSONString = JSON.stringify(product);
		console.log(dataJSONString);
		//語法:JSON.parse(JSON格式字串or陣列) = 將JSON格式字串or陣列轉換成JSON物件
		var dataJSONObject = JSON.parse(dataJSONString);
		var url = pageContext+"/shoppingCart/addToCar";
		console.log(dataJSONObject);
		doAjax(url,dataJSONObject);
// 		特別注意!!在控制器@GetMapping的productList_get一定要建立ShoppingCart的session(第46行)
// 		否則就算有註解,${ShoppingCart}雖然不會有事,但${ShoppingCart.itemNumber}一定會死給你看,千萬要小心
// 		alert("加入購物車成功");
		console.log("加入購物車成功");
//		$(".ui-dialog").css({
//			"z-index":"10000",
//		});
//		$( function() {
//			$( "#AddToCarMessage" ).dialog({
////				modal:true,
//				buttons: {
//			        		Ok: function() {
//			        			$( this ).dialog( "close" );
//			        			}
//						},
//				show:"blind",
//				hide:"blind"
//			});
//		});
//		$("#cartNo").load("");
		})
		function doAjax(targetUrl,inputData,outputData){
			$.ajax({
				url:targetUrl,//後端controller的URL
				type:"POST",//用POST的方式
				cache: false,   //是否暫存
// 				contentType: 'application/json; charset=UTF-8',//傳送json格式資料給server時
// 				dataType: "json",
				dataType: "text",
				data: inputData,
				async:false,  //非同步設定(預設true)
// 				data: { key: value }, 傳送給後端的資料,格式為Key/Value  
				success:function(data){   //成功後回傳的資料data,目前沒用到不理他
// 					showNames(data);
					outputData;
					$("#cartNo").text(data);
				},
				error:function(err){ //發生伺服器404、500、304等錯誤時會用此function處理,err封裝錯誤訊息
					console.log(err);
				}
			});
		}
})