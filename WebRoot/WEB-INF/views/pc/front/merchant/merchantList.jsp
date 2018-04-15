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
<script src="../views/common/template-web.js"></script>
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
							<div class="Shop_header_top"  style="cursor: pointer;" onclick="javascript:window.location.href='/front/merchantDetail.fjsp?shid={{$value.shid}}';">
								<img src="{{$value.shbjt}}" onerror="javascript:this.src='/views/front/images/shop_img_03.png';"width="1200px" height="275px"/>
								<div class="shop_Into">
									<div class="shop_logo">
										<img src="{{$value.shtx}}" onerror="javascript:this.src='/views/front/images/dp_logo.jpg';" width="85px" height="85px" />
									</div>
									<span class="name">{{$value.shmc}}</span>
									<div class="shop_fx_sc" style="padding-left: 120px;">
										<a href="#" class="Store_data"><em class="icon_user"></em>&nbsp;{{$value.shdjl}}</a>
										<a href="#" class="Store_data"><em class="icon_Collection"></em>收藏</a>
										<a href="#" class="Store_data"><em class="icon_shareit"></em>分享</a>
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
				<div class="shops_proc_list clearfix">
					<div class="pic_page_style clearfix">
						<ul class="page_example pagination" style="margin-left: 294px;">
							<li></li>
							<li class="first disabled" data-page="1"><a
								href="javascript:void(0);"> 〈 上一页 </a></li>
							<li class="page active" data-page="1"><a
								href="javascript:void(0);">1</a></li>
							<li class="page" data-page="2"><a href="javascript:void(0);">2</a></li>
							<li class="page" data-page="3"><a href="javascript:void(0);">3</a></li>
							<li class="page" data-page="4"><a href="javascript:void(0);">4</a></li>
							<li class="page" data-page="5"><a href="javascript:void(0);">5</a></li>
							<li class="page" data-page="6"><a href="javascript:void(0);">6</a></li>
							<li class="page" data-page="7"><a href="javascript:void(0);">7</a></li>
							<li class="page" data-page="8"><a href="javascript:void(0);">8</a></li>
							<li class="page" data-page="9"><a href="javascript:void(0);">9</a></li>
							<li class="page" data-page="10"><a
								href="javascript:void(0);">10</a></li>
							<li class="page" data-page=""><a href="javascript:void(0);">...</a></li>
							<li class="last" data-page="35"><a
								href="javascript:void(0);">下一页 〉</a></li>
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
		defaultIndex: 2
	});
	
	var addToShoppingCart = function(value){
		alert("kjdshgj")
	}
	
	var addToCollection = function(value){
		alert("kjdshgj")
	}
	
	var loadShListData = function() {
		$.ajax({
			url:'/front/getShListData.ajx', 
			type: 'post',
			data: {}, 
			dataType: 'json',
			success: function(res) {
				var html = template('merchantList-template', {merchants: res});
				$('#merchantList-content').html(html);
			}
		});
	}
	loadShListData();
	
</script>
</html>
