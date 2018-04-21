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
<script type="text/javascript" src="/views/common/layer/layer.js"></script>
<title>购物车</title>
</head>
<body style="min-height:700px;">
	<div class="shopping_cart" style="min-height:600px;">
		<div class="cart_top clearfix">
			<a href="/front/homePage.fjsp"><img
				src="/views/front/images/logo.jpg" /></a> <span class="title_name">购物车</span>
			<div class="Cart_user r_f" style="margin-top:25px;">
				<div class="header_operating l_f">
					<span class="header_touxiang"> <img src="/views/front/images/touxiang_03.png" /></span> 
					<a href="/front/login.fjsp" style="margin:5px 5px;">登录</a> 
					<a href="/front/register.fjsp" style="margin:5px 5px;">注册</a>
				</div>
			</div>
		</div>
		<!--收货人信息-->
		<div class="Settlement_style">
		<div class="s_detailed_style">
		<div class="Address_info" id="addr-content">
			<div class="title_name clearfix marginbottom">
				<span>收货人信息</span><a href="javascript:addAddr();">新增收货地址</a>
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
		</div></div></div>
		<!--购物车-->
		<div class="cart_style Shopping_list">
			<table class="table">
				<thead>
					<tr class="label_name">
						<th width="70">
						<label><input class="allSelect" type="checkbox" onchange="allSelect()" />全选</label></th>
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
				<tr id="{{$value.gwcid}}">
					<td width="70" valign="center">
						<input name="" class="select" type="checkbox" value="{{$value.gwcid}}"/></td>
					<td width="430" valign="center">
						<p class="img">
							<img src="{{$value.jjtp}}" width="80px" height="80px" />
						</p>
						<p class="name">
							<a href="#">{{$value.jjbt}}</a>
						</p>
					</td>
					<td width="100" valign="center" class="cart_price" value="{{$value.jjjg}}">￥{{$value.jjjg}}</td>
					<td width="120" valign="center">
						<div class="Numbers">
							<a  href="javascript:jian('{{$value.gwcid}}')" class="jian">-</a> 
							<input type="text" name="qty_item_1" value="{{$value.sl}}" class="number_text" readonly>
							<a href="javascript:jia('{{$value.gwcid}}')" class="jia">+</a>
						</div>
					</td>
					<td width="100" valign="center" class="statistics" value="{{$value.jjjg * $value.sl}}">￥{{$value.jjjg * $value.sl}}</td>
					<td width="80" valign="center" class="operating">
						<a href="javascript:toDelete('{{$value.gwcid}}');" class="payment_btn">删除</a>
					</td>
				</tr>
				{{/each}}
				</script>
			</table>
			<div class="Settlement clearfix">
				<div class="select-all clearfix">
				 	<div class="operation"><a href="javascript:deleteAll();" id="send">删除选中的商品</a></div> 
			    </div>
				<div class="toolbar_right clearfix">
					<div class="Quantity l_f marginright">
						已选择<em class="shopNum">0</em>件商品
					</div>
					<div class="l_f">
						总价：￥<em class="Total_price">0</em>
					</div>
				</div>
				<a href="javascript:submitBilling();" class="Submit_billing">去结算</a>
			</div>
		</div>
		<div id="public_pagination"></div>
	</div>
	<%@include file="../public/footer.jsp"%>
</body>
<script src="/views/common/template-web.js"></script>
<script type="text/javascript" src="/views/front/public.js?v=1"></script>
<script>
	var num = 0;
	var selectNum = 0;
	var page = 1, rows = 15, total = 0, pageCount;
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
				$(".select").change(function(){
					if(this.checked){
						num += parseFloat($("#"+this.value).find(".statistics")[0].attributes[3].value);
						selectNum++;
						$(".shopNum").html(selectNum);
					}else{
						selectNum--;
						$(".shopNum").html(selectNum);
						num -= parseFloat($("#"+this.value).find(".statistics")[0].attributes[3].value);
					}	
					$(".Total_price").html(num);
					var _select = $(".select");
					var flag = true;
					for(var i = 0; i < _select.length; i++){
						if(!_select[i].checked){
							flag = false;
							$(".allSelect")[0].checked = false;
						}
					}
					if(flag){
						$(".allSelect")[0].checked = true;
					}
				});
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
	
	var allSelect = function(){
		if($(".allSelect")[0].checked){ 
			var _select = $(".select");
			for(var i = 0; i < _select.length; i++){
				_select[i].checked = true;
			}
			var _statistics = $(".statistics");
			num = 0;
			for(var i = 0; i < _statistics.length; i++){
				num += parseFloat(_statistics[i].attributes[3].value) 
			}
			$(".Total_price").html(num);
			selectNum = _statistics.length;
			$(".shopNum").html(selectNum);
		} else {
			var _select = $(".select");
			for(var i = 0; i < _select.length; i++){
				_select[i].checked = false;
			}
			num = 0;
			$(".Total_price").html(num);
			selectNum = 0;
			$(".shopNum").html(selectNum);
		}
	}
	
	var submitBilling = function(){
		var _select = $(".select");
		var gwcids = "";
		for(var i = 0; i < _select.length; i++){
			if(_select[i].checked){
				gwcids += _select[i].value + "、"
			}
		}
		if(gwcids.length == 0){
			layer.msg('请选择商品');
			return false;
		}
		layer.prompt({title: '输入支付密码并确认', formType: 1}, function(pass, index){
		  	layer.close(index);
		  	if(pass == "123456"){
		  		$.ajax({
					url:'/front/toSubmitBilling.ajx', 
					type: 'post',
					data: {
						gwcids: gwcids,
						username: sessionStorage.getItem("username"),
						dzid: $(".data_mrdz").val() 
					},
					dataType: 'json',
					success: function(res) {
						layer.msg(res.title);
						window.location.href = "/front/myOrder.fjsp"
					}
				});
		  	}else{
			    layer.msg('支付密码错误');
		  	}
		});
	}
	
	var jia = function(value){
		$.ajax({
			url:'/front/toJia.ajx', 
			type: 'post',
			data: {
				gwcid: value
			},
			dataType: 'json',
			success: function(res) {
				page = 1;
				loadGwcListData();
				num = 0;
				$(".Total_price").html(num);
				selectNum = 0;
				$(".shopNum").html(selectNum);
			}
		});
	}
	
	var jian = function(value){
		if($("#"+value).find(".number_text")[0].value == 1){
			return false;
		}
		$.ajax({
			url:'/front/toJian.ajx', 
			type: 'post',
			data: {
				gwcid: value
			},
			dataType: 'json',
			success: function(res) {
				page = 1;
				loadGwcListData();
				num = 0;
				$(".Total_price").html(num);
				selectNum = 0;
				$(".shopNum").html(selectNum);
			}
		});
	}
	
	var toDelete = function(value){
		$.ajax({
			url:'/front/toDeleteGwc.ajx', 
			type: 'post',
			data: {
				gwcid: value
			},
			dataType: 'json',
			success: function(res) {
				layer.msg(res.title);
				page = 1;
				loadGwcListData();
				num = 0;
				$(".Total_price").html(num);
				selectNum = 0;
				$(".shopNum").html(selectNum);
			}
		});
	}
	
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
	
	var deleteAll = function(){
		var _select = $(".select");
		var gwcids = "";
		for(var i = 0; i < _select.length; i++){
			if(_select[i].checked){
				toDelete(_select[i].value);
				gwcids += _select[i].value + "、"
			}
		}
		if(gwcids.length == 0){
			layer.msg('请选择商品');
			return false;
		}
	}
</script>
</html>