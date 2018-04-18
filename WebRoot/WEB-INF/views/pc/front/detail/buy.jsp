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
<title>结算</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#fold_btn").click(function() {
			var active = $(this).attr("active");
			$(".addresses_content").slideToggle("slow");
			if ($(this).hasClass('active')) {
				$(this).removeClass('active').find("i").attr("class", "icon_Expand");
			} else {
				$(this).addClass('active').find("i").attr("class", "icon_hide")

			}
		});
	})
	//字数限制
	function checkLength(which) {
		var maxChars = 45; //
		if (which.value.length > maxChars) {
			layer.open({
				icon : 2,
				title : '提示框',
				content : '您输入的字数超过限制!',
			});
			// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
			which.value = which.value.substring(0, maxChars);
			return false;
		} else {
			var curr = maxChars - which.value.length; // 减去 当前输入的
			document.getElementById("sy").innerHTML = curr.toString();
			return true;
		}
	};
	function checkinvoice(which) {
		var maxChars = 100; //
		if (which.value.length > maxChars) {
			layer.open({
				icon : 2,
				title : '提示框',
				content : '您输入的字数超过限制!',
			});
			// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
			which.value = which.value.substring(0, maxChars);
			return false;
		} else {
			var curr = maxChars - which.value.length; // 减去 当前输入的
			document.getElementById("sys").innerHTML = curr.toString();
			return true;
		}
	};
</script>
<body>
	<div class="shopping_cart">
		<div class="cart_top clearfix">
			<a href="/front/homePage.fjsp"><img src="/views/front/images/logo.jpg" /></a>
			<span class="title_name">结算页</span>
		</div>
		<!--结算页样式-->
		<div class="Settlement_style">
			<div class="Settlement_title">填写并核对订单信息</div>
			<div class="s_detailed_style">
				<!--收货人信息-->
				<div class="Address_info" id="addr-content">
					<div class="title_name clearfix marginbottom">
						<span>收货人信息</span><a href="javascript:addAddr();">新增收货地址</a>
					</div>
					<script type="text/html" id="addr-template">
					{{each addrs}}
					{{if $value.sfmr}}
					<div class="address clearfix">
						<a href="" class="Select_address determine" id="" aria-checked="true">张天师 <i class="icon_Select"></i></a> 
						<span class="info">江苏南京雨花台区郁金香路2号郁金香软件大厦6楼;&nbsp;18903456789</span>
					</div>
					{{else}}
					<div class="More_addresses">
						<a href="javascript:ovid()" id="fold_btn" class="title_name">更多地址
						<i class="icon_Expand"></i></a>
						<div class="addresses_content">
							<div class="address clearfix">
								<a href="javascript:ovid()" class="Select_address" id="" aria-checked="true">张天师 江苏 
								<i class="icon_Select"></i></a> 
								<span class="info">江苏南京雨花台区郁金香路2号郁金香软件大厦6楼&nbsp;;&nbsp;18903456789</span>
							</div>
						</div>
					</div>
					{{/if}}
					{{/each}}
					</script>
				</div>
				<!--支付方式-->
				<div class="Pay_by clearfix">
					<div class="title_name clearfix marginbottom">
						<span>支付方式</span>
					</div>
					<div class="Pay_list clearfix">
						<a href="javascript:ovid()" class="Select_address determine" id="" aria-checked="true">支付宝<i class="icon_Select"></i></a>
					</div>
				</div>
				<!--送货清单-->
				<div class="shopping_list">
					<div class="title_name clearfix marginbottom">
						<span>送货清单</span><a href="#">返回并修改购物车</a>
					</div>
					<div class="product_list">
						<table>
							<tbody>
								<tr>
									<td width="690px">
										<p class="img"> <img src="/views/front/images/product/p-7.jpg" width="90px" height="90" /></p>
										<p class="pic_name"><a href="#">黑白调 电脑椅子办公椅家用电竞椅可躺人体工学椅 白色</a></p>
									</td>
									<td width="150px" class="price">￥234</td>
									<td width="150px">X1</td>
								</tr>
							</tbody>
						</table>
						<div class="Remarks">
							<div class="title_name">添加订单备注</div>
							<input name="" type="text" class="add_Remarks" dragonfly="true"
								onkeyup="checkLength(this);" placeholder="45字以内" /><span
								class="wordage">剩余字数：<span id="sy" style="color:Red;">45</span>字
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="Settlement_price">
				<div class="clearfix">
					<div class="Orders_submit">
						<div class="total">
							<span>总金额</span><span class="total_Amount">￥2345.00</span>
						</div>
						<div class="Order_address">张天师&nbsp;江苏南京雨花台区郁金香路2号郁金香软件大厦6楼&nbsp;18903456789</div>
						<div>
							<input name="" type="submit" value="提交订单" class="submit_Order" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js"></script>
<script type="text/javascript" src="/views/common/until.js"></script>
<script type="text/javascript">
	
	var urlJjid = getAttribute("jjid");
	
	var loadDzData = function() {
		$.ajax({
			url:'/front/getDzData.ajx', 
			type: 'post',
			data: { yhid : sessionStorage.getItem("username") }, 
			dataType: 'json',
			success: function(res) {
				console.log(res)
			}
		});
	}
	loadDzData();
	
	var loadJjData = function() {
		$.ajax({
			url:'/front/getJjData.ajx', 
			type: 'post',
			data: { jjid : urlJjid }, 
			dataType: 'json',
			success: function(res) {
				console.log(res)
			}
		});
	}
	loadJjData();
	
	var buy = function(){
		if(isNull(sessionStorage.getItem("username"))){
			layer.msg("请先登录！");
			return false;
		}
		window.location.href = "";
	}
</script>
</html>
