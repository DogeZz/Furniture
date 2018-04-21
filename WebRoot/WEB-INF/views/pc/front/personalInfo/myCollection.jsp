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
<title>收藏</title>
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
								<a href="#">修改密码</a>
							</dd>
						</dl>
					</div>
				</div>
				<!--右侧收藏-->
				<div class="right_content clearfix">
					<div class="Collection common_Management">
						<div class="title_name">单品收藏</div>
						<div class="Collection_list backgroundcolor">
							<table class="table">
								<tbody id="collectionList-content">
									<script type="text/html" id="collectionList-template">
									{{each collections}}
									{{if ($index+1)%4 == 1}}
									<tr>
										<td>
											<a href="/front/detail.fjsp?jjid={{$value.jjid}}" class="name"> 
											<img src="{{$value.jjtp}}" width="140px" height="140px;" />
											<h4>{{$value.jjbt}}</h4>
											</a>
											<h3 class="price"style="margin-left: 20px;">￥{{$value.jjjg}}</h3>
										</td>
									{{else if ($index+1)%4 == 3}}
										<td>
											<a href="/front/detail.fjsp?jjid={{$value.jjid}}" class="name"> 
											<img src="{{$value.jjtp}}" width="140px" height="140px;" />
											<h4>{{$value.jjbt}}</h4>
											</a>
											<h3 class="price" style="margin-left: 20px;">￥{{$value.jjjg}}</h3>
										</td>
									</tr>
									{{else}}
										<td>
											<a href="/front/detail.fjsp?jjid={{$value.jjid}}" class="name"> 
												<img src="{{$value.jjtp}}" width="140px" height="140px;" />
												<h4>{{$value.jjbt}}</h4>
											</a>
											<h3 class="price" style="margin-left: 20px;">￥{{$value.jjjg}}</h3>
										</td>
									{{/if}}
									{{/each}}
									</script>
								</tbody>
							</table>
							<!--分页-->
							<div id="public_pagination"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../public/footer.jsp"%>
	</div>
</body>
<script type="text/javascript" src="/views/front/public.js?v=11"></script>
<script src="/views/common/template-web.js"></script>
<script type="text/javascript">
	getGwcCount("digital");
	var page = 1, rows = 12, total = 0, pageCount;
	var loadScListData = function() {
		$.ajax({
			url:'/front/getScPageData.ajx', 
			type: 'post',
			data: {
				rows : rows,
				page : page,
				username: sessionStorage.getItem("username")
			}, 
			dataType: 'json',
			success: function(res) {
				var html = template('collectionList-template', {collections: res.rows});
				$('#collectionList-content').html(html);
				pagination(res, 'public_pagination');
			}
		});
	}
	loadScListData();
	
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
		loadScListData();
		$("html, body").animate({scrollTop : 0}, 100);
	};
	
	var pagination_upPage = function(){
		if(page > 1){
			page--;
			loadScListData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};
	
	var pagination_downPage = function(){
		if(page < pageCount){
			page++;
			loadScListData();
			$("html, body").animate({scrollTop : 0}, 100);
		}
	};
</script>
</html>
