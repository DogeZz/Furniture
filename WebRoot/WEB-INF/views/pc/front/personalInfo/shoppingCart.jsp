<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css?v=45" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<title>购物车</title>
</head>
<body style="min-height:700px;">
	<div class="shopping_cart" style="min-height:600px;">
		<div class="cart_top clearfix">
			<a href="/front/homePage.fjsp"><img
				src="/views/front/images/logo.jpg" /></a> <span class="title_name">购物车</span>
			<div class="Cart_user r_f" style="margin-top:25px;">
				<div class="header_operating l_f">
					<span class="header_touxiang"> <img
						src="/views/front/images/touxiang_03.png" />
					</span> <a href="/front/login.fjsp" style="margin:5px 5px;">登录</a> <a
						href="/front/register.fjsp" style="margin:5px 5px;">注册</a>
				</div>
			</div>
		</div>
		<!--购物车-->
		<div class="cart_style Shopping_list">
			<table class="table">
				<thead>
					<tr class="label_name">
						<th width="70">
						<label><input name="" class="checkbox" type="checkbox" value="" />全选</label></th>
						<th width="450">商品</th>
						<th width="120">单价（元）</th>
						<th width="120">数量</th>
						<th width="90">小计（元）</th>
						<th width="80">操作</th>
					</tr>
				</thead>
			</table>
			<table class="cart_pic table_list" id="shoppingCartList-content">
				<script type="text/html" id="shoppingCartList-template">
				{{each shoppingCarts}}
				<tr>
					<td width="70" valign="center">
						<input name="" class="checkbox" type="checkbox" value="" /></td>
					<td width="430" valign="center">
						<p class="img">
							<img src="{{$value.jjtp}}" width="80px" height="80px" />
						</p>
						<p class="name">
							<a href="#">{{$value.jjbt}}</a>
						</p>
					</td>
					<td width="100" valign="center" class="cart_price">￥2343.00</td>
					<td width="120" valign="center">
						<div class="Numbers">
							<a  href="javascript:jian('#qty_item_1')" class="jian">-</a> 
							<input type="text" name="qty_item_1" value="1" id="qty_item_1" class="number_text">
							<a href="javascript:void(0)" class="jia">+</a>
						</div>
					</td>
					<td width="100" valign="center" class="statistics">￥2345.0</td>
					<td width="80" valign="center" class="operating">
						<a href="#">编辑</a>
						<a href="#">删除</a>
					</td>
				</tr>
				{{/each}}
				</script>
			</table>
			<div class="Settlement clearfix">
				<div class="toolbar_right clearfix">
					<div class="Quantity l_f marginright">
						已选择<em>3</em>件商品
					</div>
					<div class="l_f">
						总价：<em class="Total_price">￥12334.00</em>
					</div>
				</div>
				<a href="javascipt:Submitbilling();" onclick="" class="Submit_billing">去结算</a>
			</div>
		</div>
		<div id="public_pagination"></div>
	</div>
	<%@include file="../public/footer.jsp"%>
</body>
<script src="/views/common/template-web.js"></script>
<script type="text/javascript" src="/views/front/public.js?v=1"></script>
<script>

	var page = 1, rows = 2, total = 0, pageCount;
	var loadGwcListData = function() {
		$.ajax({
			url:'/front/getGwcPageData.ajx', 
			type: 'post',
			data: {
				rows : rows,
				page : page,
				username : sessionStorage.getItem("username")
			}, 
			dataType: 'json',
			success: function(res) {
				var html = template('shoppingCartList-template', {shoppingCarts: res.rows});
				$('#shoppingCartList-content').html(html);
				pagination(res, 'public_pagination');
			}
		});
	}
	loadGwcListData();
	
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
		loadGwcListData();
		$("html, body").animate({scrollTop : 0}, 100);
	};
	
	var pagination_upPage = function(){
		if(page > 1){
			page--;
			loadGwcListData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};
	
	var pagination_downPage = function(){
		if(page < pageCount){
			page++;
			loadGwcListData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};
	
	var Submitbilling = function(){
		
	}
</script>
</html>