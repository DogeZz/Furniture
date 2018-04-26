<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>家具网站后台管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/login.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/tooltips.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
	<div class="page-container">
		<div class="main_box">
			<div class="login_box">
				<div class="login_logo">
					<img src="images/logo.png" >
				</div>
				<div class="login_form">
					<form class="m-t" action="/j_spring_security_check" method="post">
						<div class="form-group">
							<label class="t">账　号：</label> 
							<input type="text" id="j_username" name="j_username" class="form-control">
						</div>
						<div class="form-group">
							<label class="t">密　码：</label> 
							<input name="j_password" id="j_password" type="password" class="form-control">
						</div>
						<div class="form-group" style="margin-bottom: 0;">
							<label class="t"></label>
							<label for="j_remember" class="m">
							<input id="j_remember" type="checkbox">&nbsp;记住密码!</label>
						</div>
						<div class="form-group space">
							<button type="submit" id="submit_btn" class="btn btn-primary btn-lg" onclick="login()">&nbsp;登&nbsp;录&nbsp;</button>
							<input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
						</div>
					</form>
				</div>
			</div>
			<div class="bottom">Copyright &copy; 2018 - 2019 <a href="#">系统登陆</a></div>
		</div>
	</div>
</body>
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="/views/common/until.js?v=1"></script>
<script type="text/javascript" >

	var login = function(){
		setCookie("j_username", $("#j_username").val(), "d30");
		if($("#j_remember")[0].checked){
			setCookie("j_password", $("#j_password").val(), "d30");
			setCookie("j_remember", true, "d30");
		}else{
			delCookie("j_password");
			delCookie("j_remember");
		}
	}

	window.onload = function() {
		 var userNameValue = getCookie("j_username");
		 $("#j_username").attr('value', userNameValue);
		 var userPassValue = getCookie("j_password");
		 $("#j_password").attr('value', userPassValue);
		 if(getCookie("j_remember")){
			 $("#j_remember").attr("checked","checked");
		 }else{
			 $("#j_remember").removeAttr("checked");
		 }
	};
</script>
</html>