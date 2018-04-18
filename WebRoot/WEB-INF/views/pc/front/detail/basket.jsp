<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>成功加入购物车</title>
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
</head>
<body>
	<%@include file="../public/header.jsp"%>
	<!--确认加入购物车-->
	<div class="content_style clearfix">
		<div class="Confirm_style clearfix">
			<div class="Confirmation_prompt">
				<i class="icon_Confirmation"></i>商品已经成功加入购物车
			</div>
			<div class="left_commodity clearfix">
				<p class="img">
					<img src="images/product/p-2.jpg" width="80px" height="80px" />
				</p>
				<p class="name">
					<a href="#">格杰仕真皮床双人床1.8米现代简约婚床皮艺床1.5米软包欧式床定制</a> <span
						class="specification">颜色：蓝色/尺寸：XL/数量：2</span>
				</p>
			</div>
			<div class="right_operating">
				<a href="#" class="View_lik">查看商品详情</a> <a href="购物车.html"
					class="cart_btn">去购物车结算<i class="icon_jiantou"></i></a>
			</div>
		</div>
	</div>
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js?v=1"></script>
<script type="text/javascript">

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

	var loadShJjPageData = function(){
		$.ajax({
			url:'/front/getShJjPageData.ajx', 
			type: 'post',
			data: {shid: getAttribute("shid")}, 
			dataType: 'json',
			success: function(res) {
// 				var html = template('merchantDetail-template', {merchant: res});
// 				$('#merchantDetail-content').html(html);
			}
		});
	}
	loadShJjPageData();

</script>
</html>
