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
<script src="/views/common/template-web.js"></script>
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
<title>一家一世界-单品大全</title>
</head>
<body>
	<div class="Background_color">
		<%@include file="../public/header.jsp"%>
		<!--产品列表-->
		<div class="content_style clearfix">
			<div class="page_Style">
				<!--条件筛选-->
				<div class="filter_style clearfix">
					<ul id="type-content">
						<script type="text/html" id="type-template">
						<li><label class="filter_name">风格分类</label>
							<div class="filter_link jjlx1">
								<a href="javascript:changeLx1('', 'default1');" class="default1 Select">全部</a>
								{{each types}}
								{{if $value.dj >=80 && $value.dj <= 100}}
								<a href="javascript:changeLx1('{{$value.lxmc}}', '{{$value.lxid}}');" class="{{$value.lxid}}">{{$value.lxmc}}</a>
								{{/if}}
								{{/each}}
							</div>
						</li>
						<li><label class="filter_name">材料分类</label>
							<div class="filter_link jjlx2">
								<a href="javascript:changeLx2('', 'default2');" class="default2 Select">全部</a>
								{{each types}}
								{{if $value.dj >=60 && $value.dj < 80}}
								<a href="javascript:changeLx2('{{$value.lxmc}}', '{{$value.lxid}}');" class="{{$value.lxid}}">{{$value.lxmc}}</a>
								{{/if}}
								{{/each}}
							</div>
						</li>
						<li><label class="filter_name">种类分类</label>
							<div class="filter_link jjlx3">
								<a href="javascript:changeLx3('', 'default3');" class="default3 Select">全部</a>
								{{each types}}
								{{if $value.dj >=10 && $value.dj <= 59}}
								<a href="javascript:changeLx3('{{$value.lxmc}}', '{{$value.lxid}}');" class="{{$value.lxid}}">{{$value.lxmc}}</a>
								{{/if}}
								{{/each}}
							</div>
						</li>
						<li><label class="filter_name">档次分类</label>
							<div class="filter_link jjlx4">
								<a href="javascript:changeLx4('', 'default4');" class="default4 Select">全部</a>
								{{each types}}
								{{if $value.dj >=1 && $value.dj <= 9}}
								<a href="javascript:changeLx4('{{$value.lxmc}}', '{{$value.lxid}}');" class="{{$value.lxid}}">{{$value.lxmc}}</a>
								{{/if}}
								{{/each}}
							</div>
						</li>
						</script>
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
									{{if $value.zt == 1}}
									<a href="javascript:;" class="Collection">已收藏</a>
									{{else}}
									<a href="javascript:addToCollection('{{$value.jjid}}');" class="Collection">收藏</a>
									{{/if}}
								</div>
							</div>
							<p class="pic_nme">
								<a href="/front/detail.fjsp?jjid={{$value.jjid}}" style="overflow: hidden;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;word-break: break-all;">{{$value.jjbt}}</a>
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
<script type="text/javascript" src="/views/front/public.js"></script>
<script type="text/javascript">
	goToTop("goToTop");
	showTopSearch("showTopSearch");
	getGwcCount("digital");
	var searchValue = getAttribute("searchValue");
	if(isNotNull(searchValue)){
		$(".add_Search").val(searchValue);
	}
	
	var loadTypeListData = function(){
		$.ajax({
			url:'/front/getTypeListData.ajx', 
			type: 'post',
			data: { }, 
			dataType: 'json',
			success: function(res) {
				var html = template('type-template', {types: res});
				$('#type-content').html(html);
			}
		});
	}
	loadTypeListData();

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
	
	var lx1 = "";
	var lx2 = "";
	var lx3 = "";
	var lx4 = "";
	
	var page = 1, rows = 16, total = 0, pageCount;
	var loadTypeJjPageData = function(){
		$.ajax({
			url:'/front/getTypeJjPageData.ajx', 
			type: 'post',
			data: {
				page: page,
				rows: rows,
				keyword: $(".add_Search").val(),
				lx1: lx1,
				lx2: lx2,
				lx3: lx3,
				lx4: lx4,
				username: sessionStorage.getItem("username")
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
		loadTypeJjPageData();
		$("html, body").animate({scrollTop : 0}, 100);
	};

	var pagination_upPage = function(){
		if(page > 1){
			page--;
			loadTypeJjPageData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};

	var pagination_downPage = function(){
		if(page < pageCount){
			page++;
			loadTypeJjPageData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};
	
	var changeLx1 = function(value, index){
		lx1 = value;
		page = 1;
		loadTypeJjPageData();
		$("."+index).addClass("Select").siblings().removeClass("Select");
	}
	
	var changeLx2 = function(value, index){
		lx2 = value;
		page = 1;
		loadTypeJjPageData();
		$("."+index).addClass("Select").siblings().removeClass("Select");
	}
	
	var changeLx3 = function(value, index){
		lx3 = value;
		page = 1;
		loadTypeJjPageData();
		$("."+index).addClass("Select").siblings().removeClass("Select");
	}
	
	var changeLx4 = function(value, index){
		lx4 = value;
		page = 1;
		loadTypeJjPageData();
		$("."+index).addClass("Select").siblings().removeClass("Select");
	}
</script>
</html>
