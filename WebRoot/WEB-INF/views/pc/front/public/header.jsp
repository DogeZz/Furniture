<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="header">
	<div class="header_top">
		<div class="top_info clearfix">
			<div class="logo_style l_f">
				<a href="/front/homepage.fjsp"><img src="/views/front/images/logo.jpg" /></a>
			</div>
			<div class="Search_style l_f">
				<form action="#" method="post">
					<div class="select">
						<select name="homePage_search">
							<option value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品&nbsp;&nbsp;&nbsp;</option>
							<option value="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;店铺&nbsp;&nbsp;&nbsp;</option>
						</select>
					</div>
					<input name="" type="text" class="add_Search" /> 
					<input name=""type="submit" value="" class="submit_Search" />
				</form>
			</div>
			<div class="Cart_user r_f">
				<div class="Cart_Quantity">
					<span class="number">0</span>
				</div>
				<div class="header_operating l_f">
					<span class="header_touxiang">
						<img src="/views/front/images/touxiang_03.png" />
					</span> 
					<a href="/front/login.fjsp">登录</a>
					<a href="/front/register.fjsp">注册</a>
				</div>
			</div>
		</div>
		<div class="header_menu">
			<!--菜单导航栏-->
			<ul class="menu" id="nav">
				<li class="nLi"><a href="/front/homepage.fjsp">网站首页</a></li>
				<li class="nLi"><a href="#">设计精粹</a></li>
				<li class="nLi Down"><a href="#">场景方案</a><em class="icon_jiantou"></em>
					<ul class="sub">
						<li><a href="#">新闻首页</a></li>
						<li><a href="#">新闻人物</a></li>
						<li><a href="#">新闻电视</a></li>
						<li><a href="#">新闻图片</a></li>
						<li><a href="#">新闻视频</a></li>
						<li><a href="# ">新闻专题</a></li>
					</ul>
				</li>
			</ul>
			<script>
				$("#nav").slide({
					type : "menu",
					titCell : ".nLi",
					targetCell : ".sub",
					effect : "slideDown",
					delayTime : 300,
					triggerTime : 0,
					returnDefault : true,
					trigger : "click"
				});
			</script>
		</div>
	</div>
</div>