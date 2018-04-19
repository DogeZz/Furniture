<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css?v=99" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<script src="../views/common/template-web.js"></script>
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
<title>产品详细</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$(".product").hover(function() {
			$(this).addClass("hover");
			$(this).find(".operating").animate({
				bottom : "0",
			}, "fast");
		}, function() {
			$(this).removeClass("hover");
			$(this).find(".operating").animate({
				bottom : "-30",
			}, "fast");
		});

		$('.pagination').css({
			"margin-left" : ($(".page_Style").width() - $('.pagination').outerWidth()) / 2,
		});
		$(window).resize(function() {
			$('.pagination').css({
				"margin-left" : ($(".page_Style").width() - $('.pagination').outerWidth()) / 2,
			});
		});
	});
</script>
<body>
	<%@include file="../public/header.jsp"%>
	<!--产品详细介绍-->
	<div class="content_style clearfix">
		<div class="page_Style">
			<div class="ptc_detailed clearfix">
				<div class="left_pic_ad">
					<div class="pro_detail_img float-lt">
						<div class="gallery">
							<div class="tb-booth tb-pic tb-s310">
								<a href="/views/front/images/product/01.jpg">
								<img src="/views/front/images/product/01_mid.jpg" alt="展品细节展示放大镜特效" rel="/views/front/images/product/01.jpg" class="jqzoom" /></a>
							</div>
						</div>
					</div>
					<div class="Collection">
						<a id="h1" class="addcart" onclick="ShowDiv('MyDiv2','fade2')" >
						<i class="icon_Collection"></i>加入收藏</a>
					</div>
				</div>
				<!--购买信息-->
				<div class="pic_Purchase_operation">
					<div class="pic_title_name">
						<h2></h2><h5></h5>
					</div>
					<dl class="pic_price putong clearfix">
						<dt class="label_name">价格</dt>
						<dd class="price content">
							<em>￥</em>
						</dd>
					</dl>
					<dl class="Deadline clearfix">
						<dt class="label_name">供货期</dt>
						<dd class="Description content">下单后一天内发货</dd>
					</dl>
					<dl class="tb-amount tm-clear">
						<dt class="label_name">数量</dt>
						<dd id="J_Amount content">
							<span class="tb-amount-widget mui-amount-wrap "> 
							<input type="text" class="tb-text mui-amount-input" value="1" maxlength="8" title="请输入购买量"> 
							<span class="mui-amount-btn clearfix"> 
								<span class="mui-amount-increase">∧</span> 
								<span class="mui-amount-decrease">∨</span>
							</span> 
							<span class="mui-amount-unit">件</span>
							</span> <em id="J_EmStock" class="tb-hidden" style="display: inline;">库存<span class="jjsl"></span>件</em>
							<span id="J_StockTips"></span>
						</dd>
					</dl>
					<div class="purchasing_btn clearfix">
						<div class="tb-btn-buy tb-btn-sku">
							<a id="J_LinkBuy" href="javascript:buy();" rel="nofollow" data-addfastbuy="true" title="点击此按钮，到下一步确认购买信息。" role="button" data-spm-anchor-id="">立即购买</a>
						</div>
						<div class="tb-btn-basket tb-btn-sku ">
							<a href="javascript:basket();" rel="nofollow" id="J_LinkBasket" role="button"><i class="icon_shop"></i>加入购物车</a>
						</div>
					</div>
					<dl class="clearfix">
						<dt class="label_name ">承诺</dt>
						<dd class="content color">质量保证</dd>
					</dl>
					<dl class="Pay_by clearfix">
						<dt class="label_name">支付方式</dt>
						<dd>
							<i class="icon_zfb"></i>支付宝
						</dd>
					</dl>
				</div>
			</div>
			<!--信息-->
			<div class=" clearfix">
				<div class="left_Package">
					<div class="Shop_info">
						<img src="/views/front/images/dp_logo.jpg" width="150" height="100" />
						<h3>简约家居旗舰店</h3>
						<div class="link_btn">
							<a href="#" class="shops_link">进店</a>
						</div>
					</div>

				</div>
				<DIV class="right_detailed r_f">
					<div class="slideTxtBox">
						<div class="hd">
							<ul>
								<li><em class="jt"></em>商品详细</li>
							</ul>
						</div>
						<div class="bd">
							<ul class="Introduction"></ul>
						</div>
					</div>
				</DIV>
			</div>
		</div>
	</div>
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js"></script>
<script type="text/javascript" src="/views/common/until.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".jqzoom").imagezoom();
		$("#thumblist li a").click(function() {
			$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
			$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
			$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
		});

	});
	$(".picScroll-top").slide({
		titCell : ".hd ul",
		mainCell : ".bd ul",
		autoPage : true,
		effect : "top",
		autoPlay : true,
		vis : 3,
		trigger : "click"
	});
	$(".slideTxtBox").slide({
		trigger : "click"
	});
	
	var urlJjid = getAttribute("jjid");
	
	var loadJjData = function() {
		$.ajax({
			url:'/front/getJjData.ajx', 
			type: 'post',
			data: { jjid : urlJjid }, 
			dataType: 'json',
			success: function(res) {
				$(".tb-booth a").attr("href", res.jjtp);
				$(".tb-booth a img").attr("src", res.jjtp);
				$(".tb-booth a img").attr("rel", res.jjtp);
				$(".pic_title_name h2").html(res.jjbt);
				$(".pic_title_name h5").html(res.jjfbt);
				$(".price").append(res.jjjg);
				$(".jjsl").html(res.jjsl);
				$(".Introduction").html(res.jjxq);
			}
		});
	}
	loadJjData();
	
	var buy = function(){
		if(isNull(sessionStorage.getItem("username"))){
			layer.msg("请先登录！");
			return false;
		}
		window.location.href = "/front/buy.fjsp?jjid=" + urlJjid + "&sl=" + $(".mui-amount-input").val();
	} 
	
	var basket = function(){
		if(isNull(sessionStorage.getItem("username"))){
			layer.msg("请先登录！");
			return false;
		}
		$.ajax({
			url:'/front/saveBasket.ajx', 
			type: 'post',
			data: { 
				jjid : urlJjid,
				username : sessionStorage.getItem("username"),
				sl : $(".mui-amount-input").val()
			}, 
			dataType: 'json',
			success: function(res) {
				window.location.href = "/front/basket.fjsp?gwcid="+ res.msg;
			}
		});
	}
	
	var ShowDiv = function(name, id) {
		layer.confirm('你确定收藏该商品吗？', {
			btn : [ '确认', '取消' ] //按钮
		}, function() {
			layer.msg('收藏成功！', {
				icon : 1
			});
			$("#h1").html("<i class='icon_Collection icon'></i>已收藏");
		});
	}
</script>
</html>
