<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<input id="j_remember" type="checkbox" value="true">&nbsp;记住密码!</label>
						</div>
						<div class="form-group space">
							<button type="submit" id="submit_btn" class="btn btn-primary btn-lg">&nbsp;登&nbsp;录&nbsp;</button>
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
<script type="text/javascript" >
	function addCookie(name, value, days, path) {
		//添加设置cookie
		var name = escape(name);
		var value = escape(value);
		var expires = new Date();
		expires.setTime(expires.getTime() + days * 3600000 * 24);
		//path=/，表示cookie能在整个网站下使用，path=/temp，表示cookie只能在temp目录下使用  
		path = path == "" ? "" : ";path=" + path;
		//GMT(Greenwich Mean Time)是格林尼治平时，现在的标准时间，协调世界时是UTC  
		//参数days只能是数字型  
		var _expires = (typeof days) == "string" ? "" : ";expires="+ expires.toUTCString();
		document.cookie = name + "=" + value + _expires + path;
	};
	
	//获取cookie的值，根据cookie的键获取值
	function getCookieValue(name) { //此处name是 userName,userPass
		//用处理字符串的方式查找到key对应value  
		var name = escape(name);
		//读cookie属性，这将返回文档的所有cookie  
		var allcookies = document.cookie;
		//查找名为name的cookie的开始位置  
		name += "=";
		var pos = allcookies.indexOf(name);
		//如果找到了具有该名字的cookie，那么提取并使用它的值  
		if (pos != -1) { //如果pos值为-1则说明搜索"version="失败  
			var start = pos + name.length; //cookie值开始的位置  
			var end = allcookies.indexOf(";", start); //从cookie值开始的位置起搜索第一个";"的位置,即cookie值结尾的位置  
			if (end == -1)
				end = allcookies.length; //如果end值为-1说明cookie列表里只有一个cookie  
			var value = allcookies.substring(start, end); //提取cookie的值  
			return (value); //对它解码        
		} else { //搜索失败，返回空字符串  
			return "";
		}
	};
	
	function deleteCookie(name, path) {
		//根据cookie的键，删除cookie，其实就是设置其失效
		var name = escape(name);
		var expires = 0;
// 		alert(expires);
		path = path == "" ? "" : ";path=" + path;
		document.cookie = name + "=" + ";expires="+ expires.toUTCString() + path;
	};
	
	function userLogin() {
		//用户登录，其中需要判断是否选择记住密码
		//简单验证一下  
		var userName = document.getElementById("j_username").value;
		if (userName == '') {
		 	alert("请输入用户名。");  
			return;
		}
		var userPass = document.getElementById("j_password").value;
		if (userPass == '') {
			 alert("请输入密码。");  
			return;
		}
		var objChk = document.getElementById("j_remember");
		if (objChk.checked) {
			//添加cookie  
			addCookie("j_username", userName, 30, "/");
			addCookie("j_password", userPass, 30, "/");
// 			alert("记住密码登录。");
			getCookieValue();
		} else {
			addCookie("j_username", userName, 0, "/");
			addCookie("j_password", userPass, 0, "/");
			deleteCookie();
		}
	};
	
	//实现功能，保存用户的登录信息到cookie中。当登录页面被打开时，就查询cookie
	window.onload = function() {
		 var userNameValue = getCookieValue("j_username");
		 $("#j_username").attr('value', userNameValue);
		 var userPassValue = getCookieValue("j_password");
		 $("#j_password").attr('value', userPassValue);
		 if(userPassValue!=""){
			 $("#j_remember").attr("checked","checked");
		 }else{
			 $("#j_remember").removeAttr("checked");
		 }
			 
	};
</script>
</html>