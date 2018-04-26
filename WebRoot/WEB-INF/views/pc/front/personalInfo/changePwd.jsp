<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<script src="/views/common/jquery.validate.min.js"></script>
<script type="text/javascript" src="/views/common/until.js"></script>
<title>用户中心-修改密码</title>
<style type="text/css">
	.header_operating a:HOVER{ color: #fff !important;}
	#menu a:HOVER{color: #8ec82d !important;}
	.navitems ul li:HOVER {margin-top: 2px;}
</style>
</head>
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
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
					<em class="icon_cart"><span class="digital">0</span></em>我的购物车
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
		<!--我的订单列表-->
		<div class="user_style  clearfix" style="margin-bottom: 60px">
			<div class="margin_sx">
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
								<a href="/front/changePwd.fjsp">修改密码</a>
							</dd>
						</dl>
					</div>
				</div>
				<!--右侧修改密码-->
				<form action="" method="post">
					<div class="right_content clearfix">
						<div class="modify_pas_style clearfix">
							<div class="change_Password">
								<ul>
									<li class="usernameLi">
										<label class="label_name">用户名：</label>
										<span class="text_style">
										<input name="www" type="text" class="text_add" placeholder="输入用户名"/></span>
									</li>
									<li>
										<label class="label_name">旧密码：</label>
										<span class="text_style">
										<input name="www" type="text" class="text_add" placeholder="输入旧密码"/></span>
									</li>
									<li>
										<label class="label_name">新密码：</label>
										<span class="text_style">
										<input name="xmm" id="dlmm" type="password" class="text_add" placeholder="输入新密码"/></span>
									</li>
									<li>
										<label class="label_name">确认密码：</label>
										<span class="text_style" style="float:none;">
										<input name="ensurePassword" type="password" class="text_add" placeholder="再次输入新密码" /></span>
									</li>
								</ul>
								<input type="submit" value="修改" class="submit_modify" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<%@include file="../public/footer.jsp"%>
	</div>
</body>
<script type="text/javascript" src="/views/front/public.js"></script>
<script type="text/javascript">
	
	if(isNotNull(sessionStorage.getItem("username"))){
		$(".usernameLi").hide();
		getGwcCount("digital");
	}

	var form = $('body').find('form');
	form.validate({
		rules : {
	     	ensurePassword : {equalTo: "#dlmm"}
	    }, messages : {
			ensurePassword : {
	        	equalTo : "两次密码不一致！"
	        }
	    },
		submitHandler: function(f) {
			$.ajax({
				url:'/front/toChangePwd.ajx', 
				type: 'post',
				data: {
					username: sessionStorage.getItem("username"),
					jmm: $("input")[1].value,
					xmm: $("input")[2].value
				}, 
				dataType: 'json',
				success: function(res) {
					layer.msg(res.title);
					if(res.success){
						setTimeout(function() {
							Logout();
						}, 1000);
					}
				}
			});
		}
	});
</script>
</html>