<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<script src="../views/common/template-web.js"></script>
<script src="/views/common/until.js"></script>
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
<title>店铺首页</title>
<style type="text/css">
	.merchant_attention{padding: 3px 15px;background-image: url(../images/images_album.png);background-position: -128px -2px;background-repeat: no-repeat;}
</style>
</head>
<body>
	<div class="Background_color">
		<%@include file="../public/header.jsp"%>
		<!--店铺首页-->
		<div class="content_style clearfix">
			<div class="page_Style shops_style">
				<div id="merchantDetail-content">
					<script type="text/html" id="merchantDetail-template">
						<div class="Shop_header">
							<div class="Shop_header_top">
								<img src="{{merchant.shbjt}}" onerror="javascript:this.src='/views/front/images/shop_img_03.png';"width="1200px" height="275px"/>
								<div class="shop_Into">
									<div class="shop_logo">
										<img src="{{merchant.shtx}}" onerror="javascript:this.src='/views/front/images/dp_logo.jpg';" width="85px" height="85px" />
									</div>
									<span class="name">{{merchant.shmc}}</span>
									<div class="shop_fx_sc" style="padding-left: 120px;">
										<a href="#" class="Store_data"><em class="icon_user"></em>&nbsp;{{merchant.shdjl}}</a>
										<a href="javascript:addToAttention('{{merchant.shid}}');" class="Store_data"><em class="merchant_attention"></em>关注</a>
										<a href="#" class="Store_data"><em class="icon_shareit"></em>分享</a>
									</div>
								</div>
							</div>
							<!--地址信息-->
							<div class="shop_info">
								<p>{{merchant.shms}}</p>
							</div>
						</div>	
					</script>
				</div>
				<!--产品列表-->
				<div class="shops_proc_list clearfix">
					<ul class="prodcuts_style clearfix">
						<li class="product">
							<div class="pic_img textalign">
								<a href="#"><img src="/views/front/images/product/p-2.jpg"></a>
								<div class="operating" style="bottom: -30px;">
									<a href="#" class="pic_cart">加入购物车</a>
									<a href="javascript:addToCollection();" class="Collection">收藏</a>
								</div>
							</div>
							<p class="pic_nme">
								<a href="#">A家家具 床 实木床 1.5米1.8米双人床简约软包皮床卧室家具 床 框架床</a>
							</p>
							<p class="pic_price">￥2310.00</p>
						</li>
					</ul>
					<div id="public_pagination"></div>
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
		defaultIndex: 2
	});
	
	var addToShoppingCart = function(value){
		alert("kjdshgj")
	}
	
	var addToCollection = function(value){
		if(isNull(sessionStorage.getItem("username"))){
			layer.msg("请先登录！");
			return false;
		}
		$.ajax({
			url:'/front/addToCollection.ajx', 
			type: 'post',
			data: {
				yhid: sessionStorage.getItem("username"),
				jjid: value
			}, 
			dataType: 'json',
			success: function(res) {
				layer.msg(res.title);
			}
		});
	}
	
	var addToAttention = function(value){
		if(isNull(sessionStorage.getItem("username"))){
			layer.msg("请先登录！");
			return false;
		}
		$.ajax({
			url:'/front/addToAttention.ajx', 
			type: 'post',
			data: {
				yhid: sessionStorage.getItem("username"),
				shid: value
			}, 
			dataType: 'json',
			success: function(res) {
				layer.msg(res.title);
			}
		});
	}
	
	var loadShData = function() {
		$.ajax({
			url:'/front/getShData.ajx', 
			type: 'post',
			data: {
				shid: getAttribute("shid"),
				username: sessionStorage.getItem("username")
			}, 
			dataType: 'json',
			success: function(res) {
				var html = template('merchantDetail-template', {merchant: res});
				$('#merchantDetail-content').html(html);
			}
		});
	}
	loadShData();
	
	var loadShJjPageData = function() {
		$.ajax({
			url:'/front/getShJjPageData.ajx', 
			type: 'post',
			data: {shid: getAttribute("shid")}, 
			dataType: 'json',
			success: function(res) {
// 				var html = template('merchantDetail-template', {merchant: res});
// 				$('#merchantDetail-content').html(html);
				pagination(res, 'public_pagination');
			}
		});
	}
	loadShJjPageData();
	
	var pagination = function(data, divID){
		pageCount = data.pageCount;
		page = data.pageIndex;
		total = data.total - ((pageCount-1) * rows);
		var paginationHtml = '<div class="pic_page_style clearfix">' +
								'<ul class="page_example pagination" style="margin-left: 294px;">';
		if ( page > 2 ) paginationHtml += '<li class="page" data-page="1"><a href="javascript:pagination_selectPage(1);">首页</a></li>';
		if(page == 1) paginationHtml += '<li class="page disabled"><a href="javascript:pagination_upPage();">上一页</a></li>';
		else paginationHtml += '<li class="page"><a href="javascript:pagination_upPage();">上一页</a></li>';
		if ( page > 3 && page > data.pageCount - 2 ){
			paginationHtml += '<li class="page"><a>...</a></li>';
		}
		for (var i = 1; i <= data.pageCount; i++){
			if ((i >= page - 2 && i <= page + 2 )){
				if (i == page){
					paginationHtml += '<li class="page active"><a href="javascript:pagination_selectPage('+ i +');">'+ i +'</a></li>';
				} else {
					paginationHtml += '<li class="page"><a href="javascript:pagination_selectPage('+ i +');">'+ i +'</a></li>';
				}
			}
		}
		if (page < data.pageCount && page != data.pageCount - 1 ) paginationHtml += '<li><a>...</a></li>';
		if(page == pageCount) paginationHtml += '<li class="page disabled"><a href="javascript:pagination_downPage();">下一页</a></li>';
		else paginationHtml += '<li class="page"><a href="javascript:pagination_downPage();">下一页</a></li>';
		paginationHtml += '</ul></div>';
		document.getElementById(divID).innerHTML = paginationHtml;
		
	};

	var pagination_selectPage = function(pageIndex){
		page = pageIndex;
		loadShJjPageData();
		$("html, body").animate({scrollTop : 0}, 100);
	};

	var pagination_upPage = function(){
		if(page > 1){
			page--;
			loadShJjPageData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};

	var pagination_downPage = function(){
		if(page < pageCount){
			page++;
			loadShJjPageData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};
</script>
</html>
