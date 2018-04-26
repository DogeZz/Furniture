<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css?v=44" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="/views/common/layer/layer.js"></script>
<script type="text/javascript" src="/views/common/until.js"></script>
<script src="/views/common/template-web.js"></script>
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
<title>一家一世界-结算</title>
</head>
<script type="text/javascript">
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
						<span>收货人信息</span><a href="/front/deliveryAddress.fjsp">新增收货地址</a>
					</div>
					<script type="text/html" id="addr-template">
					{{each addrs}}
					{{if $value.sfmr}}
					<div class="address clearfix">
						<a href="" class="Select_address determine" id="" aria-checked="true">{{$value.zsxm}} <i class="icon_Select"></i></a> 
						<input class="data_mrdz" value="{{$value.dzid}}" type="hidden">
						<span class="info mrdz">{{$value.shdz}}&nbsp;{{$value.sjhm}}</span>
					</div>
					<div class="More_addresses">
						<a href="javascript:;" id="fold_btn" class="title_name">更多地址
						<i class="icon_Expand"></i></a>
					{{else}}
						<div class="addresses_content">
							<div class="address clearfix">
								<a href="javascript:;" value="{{$value.dzid}}" class="Select_address orderDz" id="" aria-checked="true">{{$value.zsxm}} 
								<i class="icon_Select"></i></a>
								<span class="info">{{$value.shdz}}&nbsp;{{$value.sjhm}}</span>
							</div>
						</div>
					{{/if}}
					</div>
					{{/each}}
					</script>
				</div>
				<!--支付方式-->
				<div class="Pay_by clearfix">
					<div class="title_name clearfix marginbottom">
						<span>支付方式</span>
					</div>
					<div class="Pay_list clearfix">
						<a href="javascript:;" class="Select_address determine" id="" aria-checked="true">支付宝<i class="icon_Select"></i></a>
					</div>
				</div>
				<!--送货清单-->
				<div class="shopping_list">
					<div class="product_list">
						<table>
							<tbody id="jj-content">
								<script type="text/html" id="jj-template">
								<tr>
									<td width="690px">
										<p class="img"> <img src="{{jj.jjtp}}" width="90px" height="90" /></p>
										<p class="pic_name"><a href="#">{{jj.jjbt}}</a></p>
									</td>
									<td width="150px" class="price">￥{{jj.jjjg}}</td>
									<td width="150px">X1</td>
								</tr>
								</script>
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
							<span>总金额</span><span class="total_Amount">￥</span>
						</div>
						<div class="Order_address"></div>
						<div>
							<input name="" type="submit" value="提交订单" onclick="submit()" class="submit_Order" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js"></script>
<script type="text/javascript">
	getGwcCount("digital");
	var urlJjid = getAttribute("jjid");
	var urlSl = getAttribute("sl");
	var ze = 1000;
	
	var loadDzData = function() {
		$.ajax({
			url:'/front/getDzData.ajx', 
			type: 'post',
			data: { yhid : sessionStorage.getItem("username") }, 
			dataType: 'json',
			success: function(res) {
				var html = template('addr-template', {addrs: res});
				$('#addr-content').append(html);
				$("#fold_btn").click(function() {
					var active = $(this).attr("active");
					$(".addresses_content").slideToggle("slow");
					if ($(this).hasClass('active')) {
						$(this).removeClass('active').find("i").attr("class", "icon_Expand");
					} else {
						$(this).addClass('active').find("i").attr("class", "icon_hide")

					}
				});
				$(".Order_address").html($(".mrdz").html());
				$(".orderDz").click(function(){
					var id = $(this).attr("value");
					var zsxm = $(this).html();
					var dz = $(this).siblings("span").eq(0).html();
					$(this).attr("value", $(".data_mrdz").val());
					$(this).html($(".data_mrdz").siblings("a").eq(0).html());
					$(this).siblings("span").eq(0).html($(".data_mrdz").siblings("span").eq(0).html());
					$(".data_mrdz").val(id);
					$(".data_mrdz").siblings("a").eq(0).html(zsxm);
					$(".data_mrdz").siblings("span").eq(0).html(dz);
				});
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
				var html = template('jj-template', {jj: res});
				$('#jj-content').append(html);
				$(".total_Amount").append(res.jjjg * urlSl);
				ze = res.jjjg * urlSl;
				
			}
		});
	}
	loadJjData();
	
	var submit = function(){
		if(isNull(sessionStorage.getItem("username"))){
			layer.msg("请先登录！");
			return false;
		}
		if(isNull($(".data_mrdz").val())){
  			layer.msg('请先选择收货地址');
  			return false;
  		}
  		$.ajax({
			url:'/front/buySubmit.ajx', 
			type: 'post',
			data: { 
				jjid : urlJjid,
				username : sessionStorage.getItem("username"),
				sl : urlSl,
				ze : ze,
				dzid : $(".data_mrdz").val()
			}, 
			dataType: 'json',
			success: function(res) {
				window.location.href = "/front/myOrder.fjsp";
			}
		}); 
	}
</script>
</html>
