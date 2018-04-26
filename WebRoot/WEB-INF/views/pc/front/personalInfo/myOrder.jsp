<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/common/layer/layer.js"></script>
<script type="text/javascript" src="/views/common/until.js"></script>
<script src="/views/common/template-web.js"></script>
<title>用户中心-我的订单</title>
<style type="text/css">
	.header_operating a:HOVER{ color: #fff !important;}
	#menu a:HOVER{color: #8ec82d !important;}
	.navitems ul li:HOVER {margin-top: 2px;}
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
				<!--订单列表-->
				<div class="right_content clearfix" style="min-height: 510px;">
					<div class="Order_Management common_Management">
						<div class="title_name">我的订单</div>
						<div class="Order_style">
							<ul class="Order_sort clearfix">
								<li><a href="javascript:changeOrderType(100, 0)" class="Order_Select">全部订单</a></li>
								<li><a href="javascript:changeOrderType(0, 1)">待付款</a></li>
								<li><a href="javascript:changeOrderType(1, 2)">待发货</a></li>
							    <li><a href="javascript:changeOrderType(2, 3)">待收货</a></li>
							    <li><a href="javascript:changeOrderType(3, 4)">交易完成</a></li>
							</ul>
							<div class="Order_list">
								<ul class="Order_name clearfix">
									<li style="width:450px">订单详情</li>
									<li style="width:110px">金额</li>
									<li style="width:100px">状态</li>
									<li style="width:150px">操作</li>
								</ul>
								<table class="table" id="orderList-content">
									<script type="text/html" id="orderList-template">
									{{each orders}}
									<tbody>
										<tr class="order_number">
											<td colspan="4">
												<span class="time">{{$value.cjsj.time | dateFormat 'yyyy-MM-dd hh:mm:ss'}}</span>
												<span class=""><em>订单号</em>{{$value.ddid}}</span>
											</td>
										</tr>
										<tr class="order_product">
											<td width="450px">
												<div class="Order_pro_name">
													<div class="p_img" style="margin-left:20px;">
														<img src="{{$value.jjtp}}" width="60" height="60" />
													</div>
													<div class="p_name" style="overflow: hidden;display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;word-break: break-all;">
														<a href="/front/detail.fjsp?jjid={{$value.jjid}}">{{$value.jjbt}}</a>
													</div>
													<div class="Quantity" style="font-size:16px;">x{{$value.sl}}</div>
												</div>
											</td>
											<td width="110" class="Order_price">￥{{$value.ze}}</td>
											<td width="100" class="order_status textalign">
												<a class="payment">{{if $value.ddzt == 0}}待付款{{else if $value.ddzt == 1}}等待发货{{else if $value.ddzt == 2}}待收货{{else}}已签收{{/if}}</a> 
												<a class="track"></a></td>
											<td class="textalign" width="150">
												{{if $value.ddzt == 0}}
												<a href="javascript:toPay('{{$value.ddid}}');" class="payment_btn pay">付款</a>
												{{else if $value.ddzt == 2}}
												<a href="javascript:toSign('{{$value.ddid}}');" class="payment_btn sign">签收</a>
												{{/if}}
												{{if $value.ddzt == 0}}
												<a href="javascript:toDelete('{{$value.ddid}}', 1);" class="payment_btn">取消订单</a>
												{{else if $value.ddzt == 3}}
												<a href="javascript:toDelete('{{$value.ddid}}');" class="payment_btn sign">删除订单</a>
												{{/if}}
												<a href="javascript:showDetail('{{$value.ddid}}');" class="payment_btn sign">详情</a>
											</td>
										</tr>
									</tbody>
									{{/each}}
									</script>
								</table>
								<!--分页-->
								<div id="public_pagination"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../public/footer.jsp"%>
	</div>
	<div id="show-content">
		<script type="text/html" id="show-template">
		{{each shows}}
		<div id="{{$value.ddid}}" class="Order_pro_name" style="margin:20px;display: none">
			<div class="p_img" style="float: left;">
				<img src="{{$value.jjtp}}" width="150" height="150">
			</div>
			<div class="p_name" style="padding:30px 0 0 20px;float: left;height: 150px; font-size: 20px; width: 65%;overflow: hidden;display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;word-break: break-all;">
				<span>{{$value.jjbt}}</span>
			</div>
			<div class="Quantity" style="clear: both;font-size: 15px;padding:2px 0;">购买数量：{{$value.sl}}  件</div>
			<div style="font-size: 15px; padding:2px 0;float:left;">金  额：{{$value.ze}}  元</div>
			<div style="font-size: 15px; padding:2px 0;float:right;">日期：{{$value.cjsj.time | dateFormat 'yyyy-MM-dd hh:mm:ss'}}</div>
			<div style="clear:both;width:100%;border:1px dashed #ccc;margin:2px 0;"></div>
			<div style="font-size: 15px;padding:2px 0;">收货信息：{{$value.shr}} {{$value.shdz}} {{$value.shsjhm}}</div>
		</div>
		{{/each}}
		</script>
	</div>
</body>
<script type="text/javascript" src="/views/front/public.js"></script>
<script>
	
	getGwcCount("digital");
	
	var dateFormat = function (date, format) {
		date = new Date(date);
	    return date.Format(format);
	};
	
	var page = 1, rows = 5, total = 0, pageCount, zt = 100;
	var loadDdListData = function() {
		$.ajax({
			url:'/front/getDdPageData.ajx', 
			type: 'post',
			data: {
				rows : rows,
				page : page,
				username: sessionStorage.getItem("username"),
				zt: zt
			}, 
			dataType: 'json',
			success: function(res) {
				var html = template('orderList-template', {orders: res[0].rows});
				$('#orderList-content').html(html);
				var h = template('show-template', {shows: res[0].rows});
				$('#show-content').html(h);
				pagination(res[0], 'public_pagination');
			}
		});
	}
	loadDdListData(100);
	
	var pagination = function(data, divID){
		pageCount = data.pageCount;
		page = data.pageIndex;
		total = data.total - ((pageCount-1) * rows);
		var paginationHtml = '<div class="shops_proc_list clearfix">' +
								'<div class="pic_page_style clearfix">' +
									'<ul class="page_example pagination" style="margin-left: 294px;">';
		if ( page > 2 ) paginationHtml += '<li class="page" data-page="1"><a href="javascript:pagination_selectPage(1);">首页</a></li>';
		if(page == 1) paginationHtml += '<li class="page disabled"><a href="javascript:pagination_upPage();">上一页</a></li>';
		else paginationHtml += '<li class="page"><a href="javascript:pagination_upPage();">上一页</a></li>';
		if ( page > 3 && page > data.pageCount - 2 ){
			paginationHtml += '<li class="page"><a>...</a></li>';
		}
		for (var i = 1; i <= data.pageCount; i++){
			if ((i >= page - 2 && i <= page + 2 )){
				if (i == page){
					paginationHtml += '<li class="page active"><a href="javascript:pagination_selectPage('+ i +');">'+ i +'</a></li>';
				} else {
					paginationHtml += '<li class="page"><a href="javascript:pagination_selectPage('+ i +');">'+ i +'</a></li>';
				}
			}
		}
		if (page < data.pageCount && page != data.pageCount - 1 ) paginationHtml += '<li><a>...</a></li>';
		if(page == pageCount) paginationHtml += '<li class="page disabled"><a href="javascript:pagination_downPage();">下一页</a></li>';
		else paginationHtml += '<li class="page"><a href="javascript:pagination_downPage();">下一页</a></li>';
		paginationHtml += '</ul></div></div>';
		document.getElementById(divID).innerHTML = paginationHtml;
		
	};

	var pagination_selectPage = function(pageIndex){
		page = pageIndex;
		loadDdListData();
		$("html, body").animate({scrollTop : 0}, 100);
	};

	var pagination_upPage = function(){
		if(page > 1){
			page--;
			loadDdListData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};

	var pagination_downPage = function(){
		if(page < pageCount){
			page++;
			loadDdListData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};
	
	var toPay = function(value){
		layer.prompt({title: '输入支付密码并确认', formType: 1}, function(pass, index){
		  	layer.close(index);
		  	if(pass == "123456"){
		  		$.ajax({
					url:'/front/toPay.ajx', 
					type: 'post',
					data: {
						ddid: value
					},
					dataType: 'json',
					success: function(res) {
						layer.msg(res.title);
						page = 1;
						loadDdListData();
					}
				});
		  	}else{
			    layer.msg('支付密码错误');
		  	}
		});
	}
	
	var toSign = function(value){
  		$.ajax({
			url:'/front/toSign.ajx', 
			type: 'post',
			data: {
				ddid: value
			},
			dataType: 'json',
			success: function(res) {
				layer.msg(res.title);
				page = 1;
				loadDdListData();
			}
		});
	}
	
	var toDelete = function(value, type){
  		$.ajax({
			url:'/front/toDelete.ajx', 
			type: 'post',
			data: {
				ddid: value
			},
			dataType: 'json',
			success: function(res) {
				if(type == 1){
					layer.msg("取消成功");
				}else{
					layer.msg(res.title);
				}
				page = 1;
				loadDdListData();
			}
		});
	}
	
	var showDetail = function(value){
		layer.open({
		  type: 1,
		  title: "订单详情",
		  area: ['600px'],
		  closeBtn: 1, //不显示关闭按钮
		  anim: 2,
		  shadeClose: true, //开启遮罩关闭
		  content: $("#"+value)
		});
	}
	
	var changeOrderType = function(value, index){
		zt = value;
		loadDdListData();
		$(".Order_sort li a").eq(index).addClass("Order_Select").parent().siblings().find("a").removeClass("Order_Select");
	}
</script>
</html>
