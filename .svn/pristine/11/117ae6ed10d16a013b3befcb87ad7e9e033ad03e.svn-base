<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html style="height: 100%;">
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../views/common/bootstrap/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="../views/admin/homePage/css/style.css?v=1" rel='stylesheet' type='text/css' />
<link href="../views/admin/homePage/css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="../views/admin/homePage/css/icon-font.min.css" type='text/css' />
<script src="../views/admin/js/jquery-3.2.1.min.js"></script>
<script src="/views/common/layer/layer.js"></script>
<style type="text/css">
	body, .left-content, .inner-content, .outter-wp{
		height: 100%;
	}
	.outter-wp{
		padding: 0;
		height: 88%;
	}
	#menu ul li a, .tooltips{
		cursor: pointer;
	}
</style>
</head> 
<body onload="index_initDatas();"> 
   <div class="page-container">
	<div class="left-content" >
	   <div class="inner-content">
			<div class="header-section">
			   <ol class="breadcrumb " style="padding: 10px 88px 0;">
					<li class="active">Home</li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<div class="outter-wp">
				<!--首页内容DIV-->
				<iframe id="myIframe" width="100%" height="100%" src="/admin/user.do?list" frameborder="0"></iframe>
			</div>
			<footer>
			   <p>Copyright &copy; 2018.Company name All rights reserved.More Templates <a href="#" target="_blank" title="家具网站后台管理系统">家具网站后台管理系统</a> - Collect from <a href="#" title="家具网站后台管理系统" target="_blank">家具网站后台管理系统</a></p>
			</footer>
		</div>
	</div>
	<div class="sidebar-menu">
		<header class="logo">
			<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> 
			<a href="index.html"> <span id="logo"> <h1>家具网</h1></span></a> 
			<!--<img id="logo" src="" alt="Logo"/>--> 
		</header>
		<div style="border-top:1px solid rgba(69, 74, 84, 0.7)"></div>
		<div class="down" id="homePage-userinfo-content" style="padding: 10px 0 5px 0;">
			<script type="text/html" id="homePage-userinfo-template">
		  	<a href="#"><img src="../views/admin/imgs/head.jpg" style="max-width: 80px;"></a>
		  	<a href="#"><span class=" name-caret">{{user.username}}</span></a>
			<ul>
				<li><a class="tooltips"><span>个人信息</span><i class="lnr lnr-user"></i></a></li>
				<li><a class="tooltips"><span>设置</span><i class="lnr lnr-cog"></i></a></li>
				<li><a class="tooltips" onclick="index_logout()"><span>登出</span><i class="lnr lnr-power-switch"></i></a></li>
			</ul>
			</script>
		</div>
		<div class="menu">
			<ul id="menu" >
				<script type="text/html" id="homePage-menu-template">
				{{each menu}}
			    <li><a href="#"><i class="fa fa-table"></i> <span>{{$value.cdmc}}</span> <span class="fa fa-angle-right" style="float: right"></span></a>
			   	   <ul>
					    {{each $value.zcd}}
					    <li><a onclick='changeMenu("{{$value.cdlj}}","{{$value.cdmc}}")'> {{$value.cdmc}}</a></li>
						{{/each}}
			  	   </ul>
			    </li>
				{{/each}}
				</script>
		  </ul>
		</div>
	</div>
	<div class="clearfix"></div>		
</div>
<script>
	var toggle = true;
				
	$(".sidebar-icon").click(function() {                
	  	if (toggle){
			$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
			$("#menu span").css({"position":"absolute"});
	  	} else{
			$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
			setTimeout(function() {
		 		$("#menu span").css({"position":"relative"});
			}, 400);
	  	}
		toggle = !toggle;
	});
</script>
<script src="../views/common/bootstrap/js/bootstrap.min.js"></script>
<script src="../views/common/template-web.js"></script>
<script type="text/javascript">
	var userInfo = null;
	var index_initDatas = function() {
		$.ajax({
			url:'/admin/home.do?user', 
			type: 'post',
			data: {}, 
			dataType: 'json',
			success: function(res) {
				userInfo = res;
				var html = template('homePage-userinfo-template', {user: userInfo});
				$('#homePage-userinfo-content').html(html);
			}
		});
		
		$.ajax({
			url:'/admin/home.do?menus', 
			type: 'post',
			data: {}, 
			dataType: 'json',
			success: function(res) {
				console.log(res);
				var html = template('homePage-menu-template', {menu: res});
				$('#menu').append(html);
			}
		});
	};
	
	var changeMenu = function(cdlj, cdmc){
		$("#myIframe").attr("src",cdlj);
		var innerHtml = "<li><a href='/homePage/homePage.jsp'>Home</a></li>"+
					"<li class='active'>"+ cdmc +"</li>";
		$(".breadcrumb").html(innerHtml);
	};
	
	var index_logout = function() {
		layer.open({
			title: '提示',
			icon: 0,
			btn: ['确定', '取消'],
			content: '您确定要退出本系统吗？',
			yes: function() {
				location.href="/logout";
			},
			cancel: function() {}
		});
	};
</script>
</body>
</html>