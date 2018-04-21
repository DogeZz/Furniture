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
		<div class="header">
			<div class="header_top">
				<div class="top_info clearfix">
					<div class="logo_style l_f">
						<a href="/front/homePage.fjsp"><img src="/views/front/images/logo.jpg" /></a>
					</div>
					<div class="Search_style l_f">
						<div class="select">
		<!-- 					<select id="homePage_search"> -->
								<h3 style="height:35px; line-height:35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品&nbsp;&nbsp;&nbsp;</h3>
		<!-- 					</select> -->
						</div>
						<input type="text" class="add_Search" /> 
						<input type="button" class="submit_Search" onclick="header_Search()"/>
					</div>
					<div class="Cart_user r_f">
						<div class="Cart_Quantity">
							<span class="number">0</span>
						</div>
						<div class="header_operating l_f">
							<span class="header_touxiang">
								<img src="/views/front/images/touxiang_03.png" />
							</span> 
							<a href="/front/login.fjsp">登录</a>
							<a href="/front/register.fjsp">注册</a>
						</div>
					</div>
				</div>
				<div class="header_menu">
					<!--菜单导航栏-->
					<ul class="menu" id="nav">
						<li class="nLi"><a href="/front/homePage.fjsp">网站首页</a></li>
						<li class="nLi"><a href="/front/type.fjsp">分类搜索</a></li>
		<!-- 				<li class="nLi"><a href="/front/merchantList.fjsp">商店列表</a></li> -->
					</ul>
				</div>
			</div>
		</div>
		<!--产品列表-->
		<div class="content_style clearfix">
			<div class="page_Style">
				<!--条件筛选-->
				<div class="filter_style clearfix">
					<ul>
						<li><label class="filter_name">风格分类</label>
							<div class="filter_link jjlx1">
								<a href="javascript:changeLx1('', 0);" class="Select">全部</a>
								<a href="javascript:changeLx1('中式家具', 1);">中式家具</a>
								<a href="javascript:changeLx1('美式家具', 2);">美式家具</a>
								<a href="javascript:changeLx1('欧式家具', 3);">欧式家具</a>
								<a href="javascript:changeLx1('现代家具', 4);">现代家具</a>
							</div>
						</li>
						<li><label class="filter_name">材料分类</label>
							<div class="filter_link jjlx2">
								<a href="javascript:changeLx2('', 0);" class="Select">全部</a>
								<a href="javascript:changeLx2('实木家具', 1);">实木家具</a>
								<a href="javascript:changeLx2('板式家具', 2);">板式家具</a>
								<a href="javascript:changeLx2('软体家具', 3);">软体家具</a>
								<a href="javascript:changeLx2('其他', 4);">其他</a>
							</div>
						</li>
						<li><label class="filter_name">种类分类</label>
							<div class="filter_link jjlx3">
								<a href="javascript:changeLx3('', 0);" class="Select">全部</a>
								<a href="javascript:changeLx3('床', 1);">床</a>
								<a href="javascript:changeLx3('桌椅', 2);">桌椅</a>
								<a href="javascript:changeLx3('衣柜', 3);">衣柜</a>
								<a href="javascript:changeLx3('灯具', 4);">灯具</a>
							</div>
						</li>
						<li><label class="filter_name">档次分类</label>
							<div class="filter_link jjlx4">
								<a href="javascript:changeLx4('', 0);" class="Select">全部</a>
								<a href="javascript:changeLx4('高档', 1);">高档</a>
								<a href="javascript:changeLx4('中高档', 2);">中高档</a>
								<a href="javascript:changeLx4('中档', 3);">中档</a>
								<a href="javascript:changeLx4('中低档', 4);">中低档</a>
								<a href="javascript:changeLx4('低档', 5);">低档</a>
							</div>
						</li>
					</ul>
				</div>
				<!--产品列表-->
				<div class="prodcuts_list clearfix">
					<ul class="prodcuts_style clearfix" id="typeJj-content">
						<script type="text/html" id="typeJj-template">
						{{each typeJjs}}
						<li class="product">
							<div class="pic_img textalign">
								<a href="/front/detail.fjsp?jjid={{$value.jjid}}"><img src="{{$value.jjtp}}" /></a>
								<div class="operating">
									<a href="javascript:addToShoppingCart('{{$value.jjid}}');" class="pic_cart">加入购物车</a>
									<a href="javascript:addToCollection('{{$value.jjid}}');" class="Collection">收藏</a>
								</div>
							</div>
							<p class="pic_nme">
								<a href="#">{{$value.jjbt}}</a>
							</p>
							<p class="pic_price">￥{{$value.jjjg}}</p>
						</li>
						{{/each}}
						</script>
					</ul>
					<div id="public_pagination"></div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js?v=1"></script>
<script src="/views/common/template-web.js"></script>
<script type="text/javascript">
	goToTop("goToTop");
	showTopSearch("showTopSearch");
	$(document).ready(function() {
		var searchValue = getAttribute("searchValue");
		if(isNotNull(searchValue)){
			$(".add_Search").val(searchValue);
		}
		var searchType = getAttribute("searchType");
		if(isNotNull(searchType)){
			$("#homePage_search option").eq(searchType-1).attr("selected", "selected");
		}
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
		if(isNull(sessionStorage.getItem("username"))){
			layer.msg("请先登录！");
			return false;
		}
		$.ajax({
			url:'/front/saveBasket.ajx', 
			type: 'post',
			data: {
				username: sessionStorage.getItem("username"),
				jjid: value,
				sl: 1
			}, 
			dataType: 'json',
			success: function(res) {
				layer.msg(res.title);
				window.location.href = "/front/basket.fjsp?gwcid="+ res.msg;
			}
		});
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
	
	var urlSearchValue = getAttribute("searchValue");
	var lx1 = "";
	var lx2 = "";
	var lx3 = "";
	var lx4 = "";
	
	var page = 1, rows = 15, total = 0, pageCount;
	var loadTypeJjPageData = function(){
		$.ajax({
			url:'/front/getTypeJjPageData.ajx', 
			type: 'post',
			data: {
				page: page,
				rows: rows,
				keyword: urlSearchValue,
				lx1: lx1,
				lx2: lx2,
				lx3: lx3,
				lx4: lx4
			}, 
			dataType: 'json',
			success: function(res) {
				var html = template('typeJj-template', {typeJjs: res.rows});
				$('#typeJj-content').html(html);
				pagination(res, 'public_pagination');
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
			}
		});
	}
	loadTypeJjPageData();
	
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
	
	var changeLx1 = function(value, index){
		lx1 = value;
		page = 1;
		loadTypeJjPageData();
		$(".jjlx1 a").eq(index).addClass("Select").siblings().removeClass("Select");
	}
	
	var changeLx2 = function(value, index){
		lx2 = value;
		page = 1;
		loadTypeJjPageData();
		$(".jjlx2 a").eq(index).addClass("Select").siblings().removeClass("Select");
	}
	
	var changeLx3 = function(value, index){
		lx3 = value;
		page = 1;
		loadTypeJjPageData();
		$(".jjlx3 a").eq(index).addClass("Select").siblings().removeClass("Select");
	}
	
	var changeLx4 = function(value, index){
		lx4 = value;
		page = 1;
		loadTypeJjPageData();
		$(".jjlx4 a").eq(index).addClass("Select").siblings().removeClass("Select");
	}
	
	var header_Search = function(){
		page = 1;
		loadTypeJjPageData();
	}
</script>
</html>
