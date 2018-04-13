<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<title>会员登录</title>
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
<![endif]-->
</head>
<body>
	<div class="login_style">
		<div class="login_top">
			<a href="/front/homepage.fjsp"><img src="/views/front/images/logo.jpg" /></a><span class="title">用户登录</span>
		</div>
		<div class="login_add_style l_f">
			<div class="login_ad">
				<img src="/views/front/images/bg_login_03.png" />
			</div>
			<div class="add_login_cont ">
				<div class="login_content Reg_log_style ">
					<div class="login_name">
						<span>账号登录</span>
					</div>
					<ul>
						<li class="frame_style">
							<input name="" type="text" id="username" /><i>用户名</i>
						</li>
						<li class="frame_style">
							<input name="" type="password" id="userpwd" /><i>密码</i>
						</li>
					</ul>
					<div class="login_checkbox">
						<label><input name="" type="checkbox" value="" class="checkbox" />记住密码</label>
					</div>
					<div class="login_btn">
						<input name="" type="submit" class="submitbtn" value="登录" onclick="login()" />
					</div>
					<div class="login_prompt">
						<a href="#">忘记密码？</a><a href="/front/register.fjsp">注册</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix" style="padding-bottom: 60px;"></div>
	<div class="footer" style="margin-top:0; background:#f5f5f5; border-top:1px solid #e6e6e6;">
		<div class="footer_spacing clearfix">
			<span class="copyright">copyright © 厚德 D1-743 有限公司 版权所有 粤ICP备16043743号-1</span>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("input[type='text'],input[type='password']").blur(function() {
			var $el = $(this);
			var $parent = $el.parent();
			$parent.attr('class', 'frame_style').removeClass(' form_error');
			if ($el.val() == '') {
				$parent.attr('class', 'frame_style').addClass(' form_error');
			}
		});
		$("input[type='text'],input[type='password']").focus(function() {
			var $el = $(this);
			var $parent = $el.parent();
			$parent.attr('class', 'frame_style').removeClass(' form_errors');
			if ($el.val() == '') {
				$parent.attr('class', 'frame_style').addClass(' form_errors');
			} else {
				$parent.attr('class', 'frame_style').removeClass(' form_errors');
			}
		});
	})
	
	var login = function(){
		var username = $("input[type='text']").val();
		var password = $("input[type='password']").val();
		if(username == null || username == "" || username == undefined){
			layer.tips('用户名不能为空', '#username');
		}else if(password == null || password == "" || password == undefined){
			layer.tips('密码不能为空', '#userpwd');
		} else{
			$.ajax({
				url: '/front/login.ajx',
				type: 'post',
				dataType: 'json',
				data: {
					username: username,
					password: password
				},
				success: function(res) {
					if(res.success){
						 layer.msg(res.title);
						 window.location.href = '/front/homepage.fjsp';
					} else {
						layer.tips(res.title, '.submitbtn', {
							tips: 1
						});
					}
				}
			});
		}
	};
</script>
</html>