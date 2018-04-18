<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css?v=1" type="text/css" rel="stylesheet" />
<link href="/views/common/animate.min.css" rel="stylesheet">
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<script src="/views/common/template-web.js"></script>
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
<title>商店列表</title>
</head>
<body>
	<div class="Background_color">
		<%@include file="../public/header.jsp"%>
		<!--产品列表-->
		<div class="content_style clearfix animated fadeInUp">
			<div class="page_Style shops_style">
				<div class="shop_list">
					<div id="merchantList-content">
						<script type="text/html" id="merchantList-template">
						{{each merchants}}
						<div class="Shop_header">
							<div></div>
							<div class="Shop_header_top"  style="cursor: pointer;" onclick="javascript:window.location.href='/front/merchantDetail.fjsp?shid={{$value.shid}}';">
								<img src="{{$value.shbjt}}" onerror="javascript:this.src='/views/front/images/shop_img_03.png';"width="1200px" height="275px"/>
								<div class="shop_Into">
									<div class="shop_logo">
										<img src="{{$value.shtx}}" onerror="javascript:this.src='/views/front/images/dp_logo.jpg';" width="85px" height="85px" />
									</div>
									<span class="name">{{$value.shmc}}</span>
									<div class="shop_fx_sc" style="padding-left: 300px;">
										<a href="#" class="Store_data"><em class="icon_user"></em>&nbsp;{{$value.shdjl}}</a>
									</div>
								</div>
							</div>
							<!--地址信息-->
							<div class="shop_info">
								<p>{{$value.shms}}</p>
							</div>
						</div>	
						{{/each}}
						</script>
					</div>
				</div>
				<div id="public_pagination"></div>
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
	
	var page = 1, rows = 2, total = 0, pageCount;
	var loadShListData = function() {
		$.ajax({
			url:'/front/getShPageData.ajx', 
			type: 'post',
			data: {
				rows : rows,
				page : page
			}, 
			dataType: 'json',
			success: function(res) {
				var html = template('merchantList-template', {merchants: res.rows});
				$('#merchantList-content').html(html);
				pagination(res, 'public_pagination');
			}
		});
	}
	loadShListData();
	
	var pagination = function(data, divID){
		pageCount = data.pageCount;
		page = data.pageIndex;
		total = data.total - ((pageCount-1) * rows);
		var paginationHtml = '<div class="shops_proc_list clearfix">' +
								'<div class="pic_page_style clearfix">' +
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
		paginationHtml += '</ul></div></div>';
		document.getElementById(divID).innerHTML = paginationHtml;
		
	};

	var pagination_selectPage = function(pageIndex){
		page = pageIndex;
		loadShListData();
		$("html, body").animate({scrollTop : 0}, 100);
	};

	var pagination_upPage = function(){
		if(page > 1){
			page--;
			loadShListData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};

	var pagination_downPage = function(){
		if(page < pageCount){
			page++;
			loadShListData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};
	
</script>
</html>
