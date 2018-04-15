<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css?v=1" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<script src="/views/common/until.js"></script>
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
<title>单品大全</title>
</head>
<body>
	<div class="Background_color">
		<%@include file="../public/header.jsp"%>
		<!--产品列表-->
		<div class="content_style clearfix">
			<div class="page_Style">
				<!--条件筛选-->
				<div class="filter_style clearfix">
					<ul>
						<li><label class="filter_name">风格分类</label>
							<div class="filter_link">
								<a href="#" class="Select">中式家具</a>
								<a href="#">美式家具</a>
								<a href="#">欧式家具</a>
								<a href="#">现代家具</a>
								<a href="#">新古典系列家具</a>
							</div>
						</li>
						<li><label class="filter_name">区域分类</label>
							<div class="filter_link">
								<a href="#">主卧</a>
								<a href="#">客厅</a>
								<a href="#">厨房</a>
								<a href="#">卫生间</a> 
								<a href="#">阳台</a>
								<a href="#">次卧</a>
								<a href="#">衣帽间</a>
								<a href="#">书房</a>
								<a href="#">卫生间</a>
								<a href="#">其他</a>
							</div>
						</li>
						<li><label class="filter_name">材料分类</label>
							<div class="filter_link">
								<a href="#">实木家具</a>
								<a href="#">板式家具</a>
								<a href="#">软体家具</a>
								<a href="#">藤编家具</a>
								<a href="#">竹编家具</a>
								<a href="#">钢木家具</a>
								<a href="#">玻璃家具</a>
								<a href="#">大理石家具</a>
								<a href="#">其他</a>
							</div>
						</li>
						<li><label class="filter_name">种类分类</label>
							<div class="filter_link">
								<a href="#" class="Select">床</a>
								<a href="#">桌椅</a>
								<a href="#">衣柜</a>
								<a href="#">灯具</a>
								<a href="#" class="Select">美式</a>
								<a href="#">欧式</a>
								<a href="#">中式</a>
								<a href="#">日式</a>
							</div>
						</li>
						<li><label class="filter_name">档次分类</label>
							<div class="filter_link">
								<a href="#" class="Select">高档</a>
								<a href="#">中高档</a>
								<a href="#">中档</a>
								<a href="#">中低档</a>
								<a href="#">低档</a>
							</div>
						</li>
					</ul>
				</div>
				<!--产品列表-->
				<div class="prodcuts_list clearfix">
					<ul class="prodcuts_style clearfix">
						<li class="product">
							<div class="pic_img textalign">
								<a href="#"><img src="/views/front/images/product/p-1.jpg" /></a>
								<div class="operating">
									<a href="javascript:addToShoppingCart();" class="pic_cart">加入购物车</a>
									<a href="javascript:addToCollection();" class="Collection">收藏</a>
								</div>
							</div>
							<p class="pic_nme">
								<a href="#">A家家具 床 实木床 1.5米1.8米双人床简约软包皮床卧室家具 床 框架床</a>
							</p>
							<p class="pic_price">￥2310.00</p>
						</li>
					</ul>
					<div class="pic_page_style clearfix">
						<ul class="page_example pagination">
							<li class="first disabled" data-page="1"><a href="javascript:void(0);"> 〈 上一页 </a></li>
							<li class="page active" data-page="1"><a href="javascript:void(0);">1</a></li>
							<li class="page" data-page="2"><a href="javascript:void(0);">2</a></li>
							<li class="page" data-page="3"><a href="javascript:void(0);">3</a></li>
							<li class="page" data-page="4"><a href="javascript:void(0);">4</a></li>
							<li class="page" data-page="5"><a href="javascript:void(0);">5</a></li>
							<li class="page" data-page="6"><a href="javascript:void(0);">6</a></li>
							<li class="page" data-page="7"><a href="javascript:void(0);">7</a></li>
							<li class="page" data-page="8"><a href="javascript:void(0);">8</a></li>
							<li class="page" data-page="9"><a href="javascript:void(0);">9</a></li>
							<li class="page" data-page="10"><a href="javascript:void(0);">10</a></li>
							<li class="page" data-page=""><a href="javascript:void(0);">...</a></li>
							<li class="last" data-page="35"><a href="javascript:void(0);">下一页 〉</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js?v=1"></script>
<script type="text/javascript">
	goToTop("goToTop");
	showTopSearch("showTopSearch");
	$(document).ready(function() {
		$(".product").hover(function() {
			$(this).addClass("hover");
			$(this).find(".operating").animate({bottom : "5"}, "fast");
		}, function() {
			$(this).removeClass("hover");
			$(this).find(".operating").animate({bottom : "-30"}, "fast");
		});
	
		$('.pagination').css({"margin-left" : ($(".page_Style").width() - $('.pagination').outerWidth()) / 2});
		$(window).resize(function() {
			$('.pagination').css({"margin-left" : ($(".page_Style").width() - $('.pagination').outerWidth()) / 2});
		});
	});

	$("#nav").slide({
		type : "menu",
		titCell : ".nLi",
		targetCell : ".sub",
		effect : "slideDown",
		delayTime : 300,
		triggerTime : 0,
		returnDefault : true,
		trigger : "click",
		defaultIndex: 1
	});
	
	var addToShoppingCart = function(value){
		alert("kjdshgj")
	}
	
	var addToCollection = function(value){
		alert("kjdshgj")
	}
	
	var loadMerchantListData = function(){
		var searchValue = getAttribute("searchValue");
		if(isNotNull(searchValue)){
			$(".add_Search").val(searchValue);
		}
		var searchType = getAttribute("searchType");
		if(isNotNull(searchType)){
			$("#homePage_search option").eq(searchType-1).attr("selected", "selected");
		}
	}
	loadMerchantListData();
</script>
</html>
