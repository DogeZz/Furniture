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
			<div class="left_commodity clearfix" id="basket-content">
				<script type="text/html" id="basket-template">
				<p class="img">
					<img src="{{basket.jjtp}}" width="80px" height="80px" />
				</p>
				<p class="name">
					<a href="#">{{basket.jjbt}}</a> 
					<span class="specification">数量：{{basket.sl}}</span>
				</p>
				</script>
			</div>
			<div class="right_operating">
				<a href="javascript:window.history.go(-1);" class="View_lik">查看商品详情</a> 
				<a href="/front/shoppingCart.fjsp" class="cart_btn">去购物车结算<i class="icon_jiantou"></i></a>
			</div>
		</div>
	</div>
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js?v=1"></script>
<script type="text/javascript" src="/views/common/until.js"></script>
<script src="/views/common/template-web.js"></script>
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

	var urlGwcid = getAttribute("gwcid");
	
	var loadGwcData = function(){
		$.ajax({
			url:'/front/getGwcData.ajx', 
			type: 'post',
			data: {
				gwcid: urlGwcid
			}, 
			dataType: 'json',
			success: function(res) {
				var html = template('basket-template', {basket: res});
				$('#basket-content').html(html);
			}
		});
	}
	loadGwcData();

</script>
</html>
