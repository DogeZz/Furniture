<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<script src="../views/common/template-web.js"></script>
<title>个人信息</title>
</head>
<body>
	<div class="user_lanmu">
		<div class="user_style nav">
			<a href="#" class="user_logo">
				<img src="/views/front/images/user_logo_03.png" />
			</a>
			<div class="navitems">
				<ul class="">
					<li><a href="#">首页</a></li>
					<li><a href="#">账户设置</a></li>
					<li><a href="#">消息</a></li>
				</ul>
			</div>
			<div class="Cart_user r_f" style="margin-top:25px;">
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
	</div>
	<!--地址信息-->
	<div class="user_style  clearfix">
		<div class="margin_sx">
			<div class="left_mun" style="margin-top:60px;">
				<div id="menu">
					<dl>
						<dt>我的交易</dt>
						<dd>
							<a href="#">我的订单</a>
						</dd>
					</dl>
					<dl>
						<dt>设置</dt>
						<dd>
							<a href="javascript:change(1);">个人资料</a>
						</dd>
						<dd>
							<a href="javascript:change(2);">地址管理</a>
						</dd>
						<dd>
							<a href="#">修改密码</a>
						</dd>
					</dl>
				</div>
			</div>
			<div class="userInfo_change">
				<%@include file="../personalInfo/userInfo.jsp"%>
			</div>	
			<div class="deliveryAddress_change" style="display:none;">
				<%@include file="../personalInfo/deliveryAddress.jsp"%>
			</div>
		</div>
	</div>    
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js"></script>
<script type="text/javascript">
	var change = function(select){
		if(select==1) {
	    	$(".userInfo_change").show();
	    	$(".deliveryAddress_change").hide();
		}else if(select==2) {
			$(".deliveryAddress_change").show();
			$(".userInfo_change").hide();
		}	
	}
</script>
</html>