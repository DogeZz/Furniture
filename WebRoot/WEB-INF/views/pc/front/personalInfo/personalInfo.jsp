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
<script type="text/javascript" src="/views/common/until.js"></script>
<script src="/views/common/template-web.js"></script>
<title>用户中心-个人信息</title>
<style type="text/css">
	.header_operating a:HOVER{ color: #fff !important;}
	.personalInfo_hdLabel{ margin-left:35px; width:50px; vertical-align:top; }
	.personalInfo_img{display:inline-block !important;position:relative;border: 3px solid #e6e6e6;width:86px;height:86px;}
	.personalInfo_edithd{width:80px;height:21px;position:absolute;text-align:center;line-height:21px;color:#e1d7ca;opacity:.7;bottom:0;background:#000;display:none;}
	.changesjhm{color: blue;}
	.changesjhm:HOVER{color: green;}
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
		<!--地址信息-->
		<div class="user_style  clearfix">
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
				<!--个人资料-->
				<div class="right_content clearfix">
					<div class="Personal_info" id="user_info">
						<div class="hd">
							<ul>
								<li>基本信息</li>
							</ul>
						</div>
						<div style="border: 1px solid #d0c5c5;">
							<div class="bd" style="border:1px" >
								<form id="userInfo-edit-save" action="javascript:userInfoSave();" method="post">
									<ul class="Edit_Info" id="personalInfo-userInfo-content">
										<!--个人信息-->
								        <li style="height:100%;overflow:hidden;" class="headPersonalInfo">
								       		<label class="personalInfo_hdLabel" >当前头像：</label>
								       		<div class="personalInfo_img">     
								            	<a href=""><img class="userNowHead" src="" onerror="javascript:this.src='/views/front/images/touxiang_03.png';" style="width:100%; height:100%;"/></a>
								        		<span class="personalInfo_edithd" style="cursor: pointer;">编辑头像</span>
								        	</div>
								        </li>
									<script type="text/html" id="personalInfo-userInfo-template">
										<li>
											<label class="label_name">昵称：</label>
											<span class="Add_info">
												<input name="yhid" type="hidden" value="{{user.yhid}}"/>		
												<input name="yhnc" type="text" class="text_add" style=" width:150px" value="{{user.yhnc}}"/>
											</span>
										</li>
										<li>
											<label class="label_name">真实姓名：</label>
											<span class="Add_info">
												<input name="zsxm" type="text" class="text_add" disabled style="width:150px; border:none;" value="{{user.zsxm}}" />
												<span><i>*</i>真实姓名不可更改！</span>
											</span>
										</li>
										<li>
											<label class="label_name">性别：</label> 
											<span class="Add_info"> 
												<label><input name="xb" type="radio" {{if !user.xb}} checked="checked" {{/if}} value="false"/>男</label>&nbsp;&nbsp;&nbsp;
												<label><input name="xb" type="radio" {{if user.xb}} checked="checked" {{/if}} value="true"  />女</label>
											</span>
										</li>
										<li>
											<label class="label_name"><i>*</i>手机号码：</label>
											<span class="Add_info">
												<input name="sjhm" type="text" id="usersjhm_save" class="text_add" disabled style="width:150px; border:none;" value="{{user.sjhm}}" />
											</span>
											<span class="changesjhm" style="cursor: pointer;" onclick="usersjhm_editHdMoveenter()">&nbsp;&nbsp;修改手机号码</span>
										</li>
										<li>
											<label class="label_name">QQ：</label>
											<span class="Add_info">
												<input name="qq" type="text" class="text_add" style="width:150px;" value="{{user.qq}}"/>
											</span>
										</li>
										<li style="height:70px;">
											<label class="label_name">用户简介：</label>
											<span class="Add_info">
												<textarea style="width:350px; height:60px;" name="yhjj" class="text_add">{{user.yhjj}}</textarea>
											</span>
										</li>
										<hr style="height:1px;border:none;border-top:1px solid #d0c5c5;" />
										<li><input name="" type="submit" value="提交" class="submit_modify" /></li>
									</script>
								</ul>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form method="post" enctype="multipart/form-data" id="userData-edit-upload">
		<input type="file" name="upload" class="user-fmtimg" onchange="userInput_imgurl(this.value)" style="display: none;" />
	</form>
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js"></script>
<script type="text/javascript">
	$("#user_info").slide({trigger:"click"});
	
	if(isNull(sessionStorage.getItem("username"))){
		$(".headPersonalInfo").hide();
	}else{
		getGwcCount("digital");
	}
	
	var usersjhm = "";
	var index_initDatas = function() {
		$.ajax({
			url:'/front/getUser.ajx', 
			type: 'post',
			data: {username: sessionStorage.getItem("username")}, 
			dataType: 'json',
			success: function(res) {
				res.sjhm = res.sjhm.substring(0, 3) + "****" + res.sjhm.substring(7); 
				var html = template('personalInfo-userInfo-template', {user: res});
				$('#personalInfo-userInfo-content').append(html);
				userInfo_editHdMoveenter();
				$(".personalInfo_edithd").click(function(){
					$(".user-fmtimg").click();
				});
				$("#user-img").attr("src", res.yhtx);
				$(".userNowHead").attr("src", res.yhtx);
			}
		});
	};
	index_initDatas();
	
	var usersjhm_editHdMoveenter = function() {
		var obj = document.getElementById("usersjhm_save");
		obj.style.cssText = "width:150px; border:1px solid 1px solid #dddddd"
		$('#usersjhm_save').attr("disabled",false); 
		obj.value = usersjhm;
	}
	
	var userInfoSave = function(){
		$.ajax({
			url : '/front/saveInfo.ajx',
			type: 'post',
			data : $("#userInfo-edit-save").serialize(),
			dataType : 'json',
			success: function(res) {
				if(res.success){
					layer.msg(res.title);
				}
			},
			error: function(data) {
				layer.msg(data);
			}
		});
	};
	
	var userInfo_editHdMoveenter = function(){
		$(".personalInfo_img").on("mouseenter", function () {
		    $(".personalInfo_edithd").show();    
		}).on("mouseleave", function () {
		    $(".personalInfo_edithd").hide();
		});
	}
	
	var userInput_imgurl = function(){
    	var index = parent.layer.open({
			title: '提示',
			icon: 0,
			btn: ['确定', '取消'],
			content: '是否修改?',
			cancel: function() {},
			yes: function() {
				var uploadImgLoad =  parent.layer.load();
				$.ajax({
					url : '/admin/upload.do?file',
					type: 'POST',
		        	cache: false,
					data: new FormData($('#userData-edit-upload')[0]),
					processData: false,
		        	contentType: false,
					success : function(data){
						 parent.layer.close(uploadImgLoad);
						 var res = eval ("(" + data + ")");
						 var title = res.error == 0 ? "上传成功" : "上传失败";
						 var index = parent.layer.alert(title, function() {
						  	$(".userNowHead").attr("src", res.url);
						  	$.ajax({
								url : '/front/saveUserHead.ajx',
								type: 'post',
								data : {
									username: sessionStorage.getItem("username"),
									yhtx: res.url
								},
								dataType : 'json',
								success: function(res) {
									if(res.success){
										layer.msg(res.title);
									}
								},
								error: function(data) {
									layer.msg(data);
								}
							});
						  	parent.layer.close(index);
						 });
					} 
				});				
			}
		});
	}
</script>
</html>