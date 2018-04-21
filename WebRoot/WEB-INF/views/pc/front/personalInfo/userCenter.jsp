<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<title>用户中心-首页</title>
<style type="text/css">
	.header_operating a:HOVER{ color: #fff !important;}
</style>
</head>
<body>
	<div class="Background_color">
		<div class="user_lanmu">
			<div class="user_style nav">
				<a href="/front/homePage.fjsp" class="user_logo"><img src="/views/front/images/user_logo_03.png" /></a>
				<div class="navitems" style="width: 520px;">
					<ul class="">
						<li><a href="/front/userCenter.fjsp">首页</a></li>
						<li><a href="/front/personalInfo.fjsp">账户设置</a></li>
					</ul>
				</div>
				<div class="cart_shop" style="float:left;cursor: pointer;" onclick="window.location.href='/front/shoppingCart.fjsp'">
					<em class="icon_cart"><span class="digital">1</span></em>我的购物车
				</div>
				<div class="Cart_user r_f" style="margin-top:25px;width: auto;">
				<div class="header_operating l_f">
					<span class="header_touxiang">
						<img src="/views/front/images/touxiang_03.png" />
					</span> 
					<a href="/front/login.fjsp">登录</a>
					<a href="/front/register.fjsp">注册</a>
				</div>
			</div>
			</div>
		</div>
		<div class="user_style  clearfix" style="min-height:565px;">
			<div class="margin_sx">
				<!--左侧栏目列表-->
				<div class="left_mun">
					<div id="menu">
						<dl>
							<dt>我的交易</dt>
							<dd>
								<a href="/front/myOrder.fjsp">我的订单</a>
							</dd>
						</dl>
						<dl>
							<dt>我的收藏</dt>
							<dd>
								<a href="/front/myCollection.fjsp">商品</a>
							</dd>
						</dl>
						<dl>
							<dt>账号设置</dt>
							<dd>
								<a href="/front/personalInfo.fjsp">个人资料</a>
							</dd>
							<dd>
								<a href="/front/deliveryAddress.fjsp">地址管理</a>
							</dd>
							<dd>
								<a href="#">修改密码</a>
							</dd>
						</dl>
					</div>
				</div>
				<!--右侧内容-->
				<div class="right_content clearfix">
					<div class="user_info">
						<div class="clearfix">
							<div class="user_Avatar">
								<div class="Avatar_bg"></div>
								<img src="/views/front/images/touxiang.jpg" width="60" height="60">
							</div>
							<div class="info_name">
								<span class="user_name">亚历山大王 <em class="icon_level"></em>
									<em class="icon_level_putong"></em> <em class="icon_zhuanye"></em></span>
								<p>
									<img src="/views/front/images/icon_grade.png" />
								</p>
							</div>
						</div>
						<div class="Order_Status clearfix">
							<ul>
								<li><a href="#">全部订单</a><i class="split_line"></i></li>
								<li><a href="#">代发货<em>1</em></a><i class="split_line"></i></li>
								<li><a href="#">待评价<em>2</em></a><i class="split_line"></i></li>
								<li><a href="#">申请售后</a></li>
							</ul>
						</div>
					</div>
					<!--我的收藏-->
					<div class="Collection user_Section">
						<div class="title_name">我的收藏</div>
						<ul class="Section_list clearfix">
							<li>
								<a href="#">
									<img src="/views/front/images/icon_user_05.png" />
									<h3>商品</h3>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../public/footer.jsp"%>
	</div>
</body>
<script type="text/javascript" src="/views/front/public.js"></script>
</html>
