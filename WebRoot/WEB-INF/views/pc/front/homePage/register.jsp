<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css?v=55" type="text/css" rel="stylesheet" />
<link href="/views/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/views/common/animate.min.css" rel="stylesheet">
    
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="/views/common/bootstrap/js/bootstrap.min.js"></script>
<script src="/views/common/jquery.validate.min.js"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<title>个人注册</title>
<style type="text/css">
	.label_name i{color:red;}
	.content_style{margin-top: 0;}
</style>
</head>
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
<body>
	<div class="Reg_header">
		<div class="login_top">
			<div class="content_style">
				<a href="/front/homePage.fjsp"><img src="/views/front/images/logo.jpg" /></a>
			</div>
		</div>
	</div>
	<div class="clearfix content_style animated fadeInUp">
		<div class=" clearfix content_style">
			<form action="" method="post">
				<div class="Registration_details ">
					<div class="prompt_style">
						<span>注：</span>为保证审核及时通过，请尽量完善信息内容。请乎填写虚假信息，所填信息将进行审核。所有信息未必填项，填写完整方能提交审核。否则无法提交审核，请配合完善信息
					</div>
					<div class="details_content clearfix margin_sx">
						<div class="label_info">
							<span class="title_name">个人基本信息</span>
							<ul class="details_info">
								<li>
									<label class="label_name"><i>* </i>登 录 账 号</label>
									<span class="add_text"> <input name="username" type="text" placeholder="输入登录账号" onblur="checkUsername()" required class="text_add" style="width:400px;" /></span>
								</li>
								<li>
									<label class="label_name"><i>* </i>密 码</label>
									<span class="add_text"> <input name="password" type="password" placeholder="输入密码" onblur="checkPassword()" required class="text_add" style="width:400px;" /></span>
								</li>
								<li>
									<label class="label_name"><i>* </i>确 认 密 码</label>
									<span class="add_text"> <input name="ensurePwd" type="password" placeholder="确认密码" onblur="checkEnsurePwd()" class="text_add" style="width:400px;" /></span>
								</li>
								<li>
									<label class="label_name"><i>* </i>昵 称</label>
									<span class="add_text"> <input name="yhnc" type="text" placeholder="输入昵称" required class="text_add" style="width:400px;" /></span>
								</li>
								<li>
									<label class="label_name"><i>* </i>姓 名</label>
									<span class="add_text"> <input name="zsxm" type="text" placeholder="输入真实姓名" required class="text_add" style="width:400px;" /></span>
								</li>
								<li>
									<label class="label_name"><i>* </i>性 别</label>
									<span class="add_text"> <label><input name="xb" type="radio" value="0" checked/>男</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label><input name="xb" type="radio" value="1" />女</label></span>
								</li>
								<li>
									<label class="label_name"><i>* </i>身 份 证 号</label>
									<span class="add_text"> <input name="sfz" type="text" placeholder="输入身份证号码" required class="text_add" style="width:400px;"/></span>
								</li>
								<li>
									<label class="label_name"><i>* </i>QQ</label>
									<span class="add_text"> <input name="qq" type="text" placeholder="输入QQ号码" required class="text_add" style="width:400px;" /></span>
								</li>
								<li>
									<label class="label_name"><i>* </i>手 机 号 码</label>
									<span class="add_text"> <input name="sjhm" type="text" placeholder="输入手机号码" required class="text_add" style="width:400px;" /></span>
								</li>
								<li>
									<label class="label_name">用户简介</label> 
									<span class="add_text">
										<textarea name="yhjj" rows="5" placeholder="用户简介（300字内）" style="width:500px; border:1px solid #dddddd;"></textarea>
									</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="Submit_operation textalign" style="margin-bottom: 20px;">
					<input type="submit" class="btn submit_btn" value="提交注册" /> 
					<input type="button" class="btn" value="返回" onclick="register_back()" />
				</div>
			</form>
		</div>
	</div>
	<div class="footer" style="margin-top:0; background:#f5f5f5; border-top:1px solid #e6e6e6;">
		<div class="footer_spacing clearfix">
			<span class="copyright">copyright©厚德 D1-743 有限公司 版权所有 粤ICP备16043743号-1</span>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	var checkUsername = function(){
		$.ajax({
	    type:"POST",
	    async: false, 
	    url:"/front/checkUsernameExist.ajx",
	    dataType : 'json',
	    data: {
	    	username : $("input[name = username]").val()
	    },
	    success:function(data){
	    	if (!data.success){
	    		layer.msg("用户名已存在");
	    		$("input[name = username]").focus();
	    	}
	    }
       });
	};
	
	var checkPassword = function(){
		var dlmm = $("input[name = password]").val();
		var ensuredlmm = $("input[name = ensurePwd]").val();
		if(dlmm != "" && ensuredlmm != ""){
			if(dlmm != ensuredlmm){
				layer.msg("两次密码不一致");
				$("input[name = password]").focus();
			}
		}
	};
	
	var checkEnsurePwd = function(){
		var dlmm = $("input[name = password]").val();
		var ensuredlmm = $("input[name = ensurePwd]").val();
		if(dlmm != "" && ensuredlmm != ""){
			if(dlmm != ensuredlmm){
				layer.msg("两次密码不一致");
				$("input[name = ensurePwd]").focus();
			}
		}
	};
	
	$('form').submit(function(){
		$.ajax({
			url : '/front/saveRegister.ajx',
			type: 'post',
			data : $("form").serialize(),
			dataType : 'json',
			success: function(res) {
				if(res.success){
					layer.msg(res.title);
					setTimeout(function(){window.location.href = '/front/login.fjsp?aaa=1';},2000);
				}
			},
			error: function(data) {
				layer.msg(data);
				return false;
			}
		});
		return false;
	});
	
	var register_back = function(){
		window.history.back();
	}
</script>
</html>
