<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/common/layer/layer.js"></script>
<script src="/views/common/template-web.js"></script>
<script src="/views/common/until.js"></script>
<title>用户中心-收货地址</title>
</head>
<style type="text/css">
	td {text-align: center !important;}
	.btn_save {background-color: #EFFFE1;font-family: "新宋体";border: 1px solid #88c523;height: 32px;color: #88c523;font-size: 14px;line-height: 30px;width: 90px;text-align: center;border-radius: 3px;font-weight: bold;cursor: pointer;margin: 0px 5px;}
	.btn_save:HOVER {background-color: #88c523;color: #fff;}
	.header_operating a:HOVER{ color: #fff !important;}
	#menu a:HOVER{color: #8ec82d !important;}
	.navitems ul li:HOVER {margin-top: 2px;}
</style>
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
		<!--右侧内容样式-->
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
				<div class="right_content clearfix">
					<div class="Personal_info" id="user_info">
						<div class="hd">
							<ul>
								<li style="color: #88c523;border-bottom: 2px solid #88c523">收货地址</li>
							</ul>
						</div>
						<div style="border: 1px solid #d0c5c5;">
							<!--添加地址-->
							<div class="AddAddress_style" style="display:table;">
								<div class="title_name">添加地址</div>
								<div class="addAddrTable">
									<table class="table" style="text-align: center;">
										<tr>
											<td class="label_name">收货人</td>
											<td class="add_conent">
												<input name="dzid" type="hidden" value=""/> 
												<input name="zsxm" type="text" data-name="收货人" class="add_text" style=" width:225px"/>
											</td>
											<td class="label_name">移动电话</td>
											<td class="add_conent">
												<input name="sjhm" type="text" data-name="联系电话" class="add_text" style=" width:225px"/>
											</td>
										</tr>
										<tr>
											<td class="label_name">详细地址</td>
											<td colspan="5" class="add_conent">
												<input name="shdz" type="text" data-name="详细地址" class="add_text" style=" width:540px" />
											</td>
										</tr>
									</table>
									<div class="Submit_style align_right">
										<label style="display:none;"><input name="sfmr" type="checkbox" class="checkbox" />默认地址</label>&nbsp;&nbsp;&nbsp;
										<input class="btn_save" name="" type="button" onclick="save_address()" value="保存" />
									</div>
								</div>
								<div class="Address_management backgroundcolor padding" >
									<div class="adderss_add_name clearfix">
										<span class="prompt">你已创建 <b class="hasNum">0</b> 个收货地址，最多能创建 10 个。</span>
									</div>
									<div id="addrList-content">
									<script type="text/html" id="addrList-template">
									{{each addrs}}
									<div class="Address_list" id="{{$value.dzid}}">
										<div class="adderss_name">
											<div class="adderss_info" style="padding:5px;" >
												<p>
													<label class="label_name">收货人：</label>
													<input name="" type="hidden" value="{{$value.dzid}}"/> 
													<input value="{{$value.shr}}" type="text" style=" width:500px" disabled/>
												</p>
												<p>
													<label class="label_name">手机号：</label>
													<input type="text" value="{{$value.shsjhm}}" style=" width:340px" disabled/>
												</p>
												<p>
													<label class="label_name">地&nbsp;址：</label>
													<input type="text" value="{{$value.shdz}}" style=" width:540px" disabled/>
												</p>
											</div>
											<a href="javascript:adderssDelete('{{$value.dzid}}');" class="adderss_delete"></a>
											<div class="adderss_operating">
												{{if $value.sfmr}}
												<span>默认地址</span>&nbsp;&nbsp;&nbsp;
												{{else}}
												<a href="javascript: toSetDefault('{{$value.dzid}}');">设为默认</a>&nbsp;&nbsp;&nbsp;
												{{/if}}
												<a href="javascript:toEditAddr('{{$value.dzid}}', {{$value.sfmr}});">编辑</a>
											</div>
										</div>
									</div>
									{{/each}}
									</script>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../public/footer.jsp"%>
	</div>
</body>
<script type="text/javascript" src="/views/front/public.js"></script>
<script type="text/javascript">

	getGwcCount("digital");
	
	var addrCount = 0;
	var loadDdListData = function() {
		$.ajax({
			url:'/front/getDzListData.ajx', 
			type: 'post',
			data: {
				username: sessionStorage.getItem("username")
			}, 
			dataType: 'json',
			success: function(res) {
				var html = template('addrList-template', {addrs: res});
				$('#addrList-content').html(html);
				$(".hasNum").html(res.length);
				addrCount = res.length;
			}
		});
	}
	loadDdListData();
	
	var toSetDefault = function(value){
		$.ajax({
			url:'/front/toSetDzDefault.ajx', 
			type: 'post',
			data: {
				dzid: value
			}, 
			dataType: 'json',
			success: function(res) {
				layer.msg(res.title);
				loadDdListData();
			}
		});
	}
	
	var toEditAddr = function(value, mr){
		var _obj = $("#"+value).find("input");
		var _addObj = $(".addAddrTable").find("input");
		for(var i = 0; i < _addObj.length - 2; i++){
			_addObj[i].value = _obj[i].value;
		}
		if(mr){
			$(".checkbox").prop("checked", true);
		} else {
			$(".checkbox").prop("checked", false);
		}
		$("#"+value).hide().siblings(".Address_list").show();
	}
	
	var save_address = function(){
		if(isNull(sessionStorage.getItem("username"))){
			layer.msg("请先登录！");
			return false;
		}
		if(addrCount >= 10 && isNull($(".addAddrTable").find("input")[0].value)){
			layer.msg("地址个数已达上限");
			return false;
		}
		var _addObj = $(".addAddrTable").find("input");
		$.ajax({
			url:'/front/toSaveAddr.ajx', 
			type: 'post',
			data: {
				username: sessionStorage.getItem("username"),
				dzid: _addObj[0].value,
				zsxm: _addObj[1].value,
				sjhm: _addObj[2].value,
				shdz: _addObj[3].value,
				sfmr: _addObj[4].checked
			}, 
			dataType: 'json',
			success: function(res) {
				layer.msg(res.title);
				setTimeout(function() {
					location.reload();
				}, 1500);
			}
		});
	}
	
	var adderssDelete = function(value){
		$.ajax({
			url:'/front/toDeleteAddr.ajx', 
			type: 'post',
			data: {
				dzid: value
			}, 
			dataType: 'json',
			success: function(res) {
				layer.msg(res.title);
				setTimeout(function() {
					loadDdListData();
				}, 1500);
			}
		});
	}
</script>
</html>