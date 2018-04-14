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
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
<title>产品详细</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$(".q_code ").hover(function() {
			$(this).find(".q_code_layer").addClass("hover").css("display", "block");
		}, function() {
			$(this).find(".q_code_layer").removeClass("hover").css("display", "none");
		});
		$(".diagram").hover(function() {
			$(this).addClass("hover");
		}, function() {
			$(this).removeClass("hover");
		});
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
							<ul class="tb-thumb" id="thumblist">
								<li class="tb-selected">
									<div class="tb-pic tb-s40">
										<a href="#"><img src="/views/front/images/product/01_small.jpg" mid="/views/front/images/product/01_mid.jpg" big="/views/front/images/product/01.jpg"></a>
									</div>
								</li>
								<li>
									<div class="tb-pic tb-s40">
										<a href="#"><img src="/views/front/images/product/02_small.jpg" mid="/views/front/images/product/02_mid.jpg" big="/views/front/images/product/02.jpg"></a>
									</div>
								</li>
								<li>
									<div class="tb-pic tb-s40">
										<a href="#"><img src="/views/front/images/product/03_small.jpg" mid="/views/front/images/product/03_mid.jpg" big="/views/front/images/product/03.jpg"></a>
									</div>
								</li>
								<li>
									<div class="tb-pic tb-s40">
										<a href="#"><img src="/views/front/images/product/03_small.jpg" mid="/views/front/images/product/03_mid.jpg" big="/views/front/images/product/03.jpg"></a>
									</div>
								</li>
								<li style="margin-right:0px;">
									<div class="tb-pic tb-s40">
										<a href="#"><img src="/views/front/images/product/04_small.jpg" mid="/views/front/images/product/04_mid.jpg" big="/views/front/images/product/04.jpg"></a>
									</div>
								</li>
							</ul>
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
						<h2>优丽美家 台灯遥控卧室床头水晶客厅床头灯护眼温馨创意 金色</h2>
						<h5>唯美水晶台灯新上架，买一送一（赠送6吋玫瑰相框），惊喜多多</h5>
					</div>
					<!-- <div class="pic_price clearfix">
     					<p class="clearfix" style="padding:5px 10px; color:#333">团购规则：满500元团购商品，最低2件起购</p>
     					<p class="clearfix"> <label class="label_name">原价</label><span class="content Original_price"><em>￥</em>99.00</span></p>
     					<p class="clearfix Tuangou"><label class="label_name">团购价</label><span class="price content"><em>￥</em>59.00</span></p>    
     				</div> -->
					<dl class="pic_price putong clearfix">
						<dt class="label_name">价格</dt>
						<dd class="price content">
							<em>￥</em>59.00
						</dd>
					</dl>
					<dl class="Deadline clearfix">
						<dt class="label_name">供货期</dt>
						<dd class="Description content">下单后一天内发货</dd>
					</dl>
					<dl class="tb-prop clearfix">
						<dt class="label_name">颜色分类</dt>
						<dd class="content">
							<ul>
								<li class="tb-selected">
									<a href="#" role="button" tabindex="0" data-spm-anchor-id="">
									<span>纯色</span></a><i>已选中</i>
								</li>
								<li class="">
									<a href="#" role="button" tabindex="0" data-spm-anchor-id="">
									<span>花色</span></a>
								</li>
								<li class=""><a href="#" role="button" tabindex="0"
									data-spm-anchor-id=""><span>玫瑰红</span></a></li>
								<li class=""><a href="#" role="button" tabindex="0"
									data-spm-anchor-id=""><span>天蓝色</span></a></li>
								<li class=""><a href="#" role="button" tabindex="0"
									data-spm-anchor-id=""><span>金色</span></a></li>
								<li class=""><a href="#" role="button" tabindex="0"
									data-spm-anchor-id=""><span>灰白色</span></a></li>
								<li class=""><a href="#" role="button" tabindex="0"
									data-spm-anchor-id=""><span>灰白色</span></a></li>
								<li class=""><a href="#" role="button" tabindex="0"
									data-spm-anchor-id=""><span>灰白色</span></a></li>
							</ul>
						</dd>
					</dl>
					<dl class="tb-prop clearfix">
						<dt class="label_name">规格</dt>
						<dd class="content">
							<ul>
								<li class="tb-selected"><a href="#" role="button"
									tabindex="0" data-spm-anchor-id=""><span>三杯三碟</span></a><i>已选中</i></li>
								<li class=""><a href="#" role="button" tabindex="0"
									data-spm-anchor-id=""><span>三杯三碟</span></a></li>
								<li class=""><a href="#" role="button" tabindex="0"
									data-spm-anchor-id=""><span>三杯三碟</span></a></li>
								<li class=""><a href="#" role="button" tabindex="0"
									data-spm-anchor-id=""><span>三杯三碟</span></a></li>
							</ul>
						</dd>
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
							</span> <em id="J_EmStock" class="tb-hidden" style="display: inline;">库存260件</em>
							<span id="J_StockTips"></span>
						</dd>
					</dl>
					<div class="purchasing_btn clearfix">
						<div class="tb-btn-buy tb-btn-sku">
							<a id="J_LinkBuy" href="#" rel="nofollow" data-addfastbuy="true" title="点击此按钮，到下一步确认购买信息。" role="button" data-spm-anchor-id="">立即购买</a>
						</div>
						<div class="tb-btn-basket tb-btn-sku ">
							<a href="#" rel="nofollow" id="J_LinkBasket" role="button"><i class="icon_shop"></i>加入购物车</a>
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
						<dd>
							<i class="icon_weixin"></i>微信之烦恼
						</dd>
						<dd>
							<i class="icon_yinlian"></i>银联支付
						</dd>
					</dl>
				</div>
				<!--猜你喜欢-->
				<div class="pic_like">
					<div class="title_name">
						<span>猜你喜欢</span>
					</div>
					<div class="like_list picScroll-top">
						<div class="hd">
							<a href="javascript:ovid()" class="next"></a> <a
								href="javascript:ovid()" class="prev"></a>
						</div>
						<div class="bd">
							<ul class="picList">
								<li><a href="#"><img src="/views/front/images/product/p-7.jpg"
										width="145" height="145" /></a></li>
								<li><a href="#"><img src="/views/front/images/product/p-8.jpg"
										width="145" height="145" /></a></li>
								<li><a href="#"><img src="/views/front/images/product/p-4.jpg"
										width="145" height="145" /></a></li>
								<li><a href="#"><img src="/views/front/images/product/p-2.jpg"
										width="145" height="145" /></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--信息-->
			<div class=" clearfix">
				<div class="left_Package">
					<!--入住店铺-->
					<div class="Shop_info">
						<img src="/views/front/images/dp_logo.jpg" width="150" height="100" />
						<h3>简约家居旗舰店</h3>
						<div class="link_btn">
							<a href="#" class="reservation">预约</a> 
							<a href="#" class="shops_link">进店</a>
						</div>
					</div>

					<div class="Package_list">
						<div class="title_name">
							<span>套系参考</span>
						</div>
						<ul class="list">
							<li><a href="#"><img src="/views/front/images/product/01_small.jpg"
									width="150px" height="150px" /><span class="Package_price">￥45.60</span></a></li>
							<li><a href="#"><img src="/views/front/images/product/01_small.jpg"
									width="150px" height="150px" /><span class="Package_price">￥45.60</span></a></li>
							<li><a href="#"><img src="/views/front/images/product/01_small.jpg"
									width="150px" height="150px" /><span class="Package_price">￥45.60</span></a></li>
							<li><a href="#"><img src="/views/front/images/product/01_small.jpg"
									width="150px" height="150px" /><span class="Package_price">￥45.60</span></a></li>
							<li><a href="#"><img src="/views/front/images/product/01_small.jpg"
									width="150px" height="150px" /><span class="Package_price">￥45.60</span></a></li>
							<li><a href="#"><img src="/views/front/images/product/01_small.jpg"
									width="150px" height="150px" /><span class="Package_price">￥45.60</span></a></li>
							<li><a href="#"><img src="/views/front/images/product/01_small.jpg"
									width="150px" height="150px" /><span class="Package_price">￥45.60</span></a></li>
						</ul>
					</div>
				</div>
				<DIV class="right_detailed r_f">
					<div class="slideTxtBox">
						<div class="hd">
							<ul>
								<li><em class="jt"></em>商品详细</li>
								<li><em class="jt"></em>陈设点评</li>
								<li><em class="jt"></em>用户评论<span class="Quantity">345</span></li>
							</ul>
						</div>
						<div class="bd">
							<ul class="Introduction">
							</ul>
							<ul class="Evaluation">
							</ul>
							<ul class="comment_style">
								<li class="comment_list clearfix">
									<div class="comment_Avatar">
										<div class="user_Avatar">
											<div class="Avatar_bg"></div>
											<img src="/views/front/images/touxiang.jpg" width="60" height="60">
										</div>
										<h3>张天师</h3>
									</div>
									<div class="comment_info">
										<p class="comments">非常不错的手机，做工质感极好，颜值爆表，而且在一众去掉logo基本分不出区别的手机中绝对鹤立鸡群。另外个人觉得后背的moto蝙蝠标识有些不容易看到，如果弄成类似macbook那样发光logo的话，个人愿意多出一千大洋～系统方面确实更加偏向原生android,在易用性方面跟国内一众rom有差距，不过至少对我是绝对够用了。相机启动拍照保存都很快。电池不出众不过快冲非常好用。</p>
										<p class="Basic_Information">
											<span>件数：2件</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>商品名称：摩托罗拉
												Moto Z(XT1650-05) 模块化手机 流金黑 移动联通电信4G手机 双卡双待</span>
										</p>
									</div>
									<div class="comment_time">2016-10-24</div>
								</li>
							</ul>
						</div>
					</div>
				</DIV>
			</div>
		</div>
	</div>
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js"></script>
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
