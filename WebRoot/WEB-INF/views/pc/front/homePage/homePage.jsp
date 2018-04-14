<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="/views/front/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript"src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
	<link href="/views/front/css/common.css" type="text/css"rel="stylesheet" />
	<link href="/views/front/css/style.css?v=1" type="text/css" rel="stylesheet" />
	<link href="/views/front/css/z_css.css" type="text/css" rel="stylesheet" />
	<!--[if lt IE 9]>
	<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
	<script src="/views/front/js/respond.min.js"></script>
	<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
	<![endif]-->
	<title>首页</title>
	<style type="text/css">
		.bd ul{position: relative; width: 1583px; height: 460px;}
		.bd ul li{position: absolute; width: 1583px; left: 0px; top: 0px; display: none;}
		.fullSlide .prev{width:100px;height:450px;position:absolute;top:0px;left:0px;cursor: pointer;}
		.fullSlide .prev span{font-size:100px; line-height: 450px;padding-left:20px;color: #f0f0f0;}
		.fullSlide .next{width:100px;height:450px;position:absolute;top:0px;right:0px;cursor: pointer;text-align: right;}
		.fullSlide .next span{font-size:100px; line-height: 450px;padding-right:20px;color: #f0f0f0;}
		.fullSlide .prev span:HOVER, .fullSlide .next span:HOVER{color: #ccc;}
	</style>
</head>
<body>
	<%@include file="../public/header.jsp"%>
	<!--banner轮播  s-->
	<div class="fullSlide">
		<div class="bd">
			<ul>
				<li style=" background: url(/views/front/images/banner01.jpg) 50% 0px no-repeat;">
					<a target="_blank" href="/front/detail.fjsp"></a>
				</li>
				<li style="background: url(/views/front/images/banner02.jpg) 50% 0px no-repeat;">
					<a target="_blank" href="/front/detail.fjsp"></a>
				</li>
				<li style="background: url(/views/front/images/banner03.jpg) 50% 0px no-repeat;">
					<a target="_blank" href="/front/detail.fjsp"></a>
				</li>
				<li style="background: url(/views/front/images/banner01.jpg) 50% 0px no-repeat;">
					<a target="_blank" href="/front/detail.fjsp"></a>
				</li>
				<li style="background: url(/views/front/images/banner03.jpg) 50% 0px no-repeat;">
					<a target="_blank" href="/front/detail.fjsp"></a>
				</li>
			</ul>
		</div>
		<div class="prev"><span>&lt;</span></div>
		<div class="next"><span>&gt;</span></div>
		<div class="hd">
			<ul>
				<li class="">1</li>
				<li class="">2</li>
				<li class="">3</li>
				<li class="">4</li>
				<li class="">5</li>
			</ul>
		</div>
	</div>
	<!--banner轮播  e-->

	<!--场景方案  s-->
	<div class="wrap_c bgcolor_f9">
		<div class="i_title">场景方案</div>
		<div class="clear"></div>
		<div class="c_main">
			<div class="c_mianbox1 mar_14">
				<div class="c_tips">
					<a href="#">客厅</a>
					<a href="#">卫生间</a>
					<a href="#">书房</a>
					<a href="#">主卧</a>
					<a href="#">次卧</a>
					<a href="#">阳台/露台</a>
					<a href="#">儿童房</a>
					<a href="#">茶室</a>
					<a href="#">客厅</a>
					<a href="#">客厅</a>
				</div>
				<div class="c_pic">
					<a href="#"><img src="/views/front/images/c_img.jpg" /></a>
				</div>
			</div>
			<div class="c_mianbox1 mar_14">
				<div class="c_pic">
					<a href="#"><img src="/views/front/images/c_img.jpg" /></a>
				</div>
				<div class="c_pic">
					<a href="#"><img src="/views/front/images/c_img.jpg" /></a>
				</div>
			</div>
			<div class="c_mianbox2 mar_14">
				<a href="#"><img src="/views/front/images/c_img.jpg" /></a>
			</div>
			<div class="c_mianbox1 mar_14">
				<div class="c_pic">
					<a href="#"><img src="/views/front/images/c_img.jpg" /></a>
				</div>
				<div class="c_pic">
					<a href="#"><img src="/views/front/images/c_img.jpg" /></a>
				</div>
			</div>
			<div class="c_mianbox1">
				<div class="c_pic">
					<a href="#"><img src="/views/front/images/c_img.jpg" /></a>
				</div>
				<div class="c_pic">
					<a href="#"><img src="/views/front/images/c_img.jpg" /></a>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<!--场景方案  e-->

	<!--单品大库  s-->
	<div class="wrap_p">
		<div class="p_title">单品大库</div>
		<div class="p_main">
			<div class="p_box1">
				<a href="#" class="p_box1pic"><img
					src="/views/front/images/p_img01.jpg" /></a>
				<p>
					<a href="#">锥形木质脚布艺拉扣环抱式沙发 三人位</a>
				</p>
				<p class="p_pirce">￥2439</p>
			</div>
			<div class="p_box2">
				<a href="#" class="p_box2pic"><img
					src="/views/front/images/p_img01.jpg" /></a>
				<p>
					<a href="#">锥形木质脚布艺拉扣环抱式沙发 三人位</a>
				</p>
				<p class="p_pirce">￥2439</p>
			</div>
			<div class="p_box2">
				<a href="#" class="p_box2pic"><img
					src="/views/front/images/p_img01.jpg" /></a>
				<p>
					<a href="#">锥形木质脚布艺拉扣环抱式沙发 三人位</a>
				</p>
				<p class="p_pirce">￥2439</p>
			</div>
			<div class="p_box2">
				<a href="#" class="p_box2pic"><img
					src="/views/front/images/p_img01.jpg" /></a>
				<p>
					<a href="#">锥形木质脚布艺拉扣环抱式沙发 三人位</a>
				</p>
				<p class="p_pirce">￥2439</p>
			</div>
			<div class="p_box2">
				<a href="#" class="p_box2pic"><img
					src="/views/front/images/p_img01.jpg" /></a>
				<p>
					<a href="#">锥形木质脚布艺拉扣环抱式沙发 三人位</a>
				</p>
				<p class="p_pirce">￥2439</p>
			</div>
		</div>
	</div>
	<!--单品大库  e-->

	<!--服务流程  s-->
	<div class="wrap_s">
		<div class="s_main">
			<div class="s_title">服务和流程</div>
			<div class="s_box1">
				<ul>
					<li>
						<p>
							<img src="/views/front/images/icon_s01.jpg" />
						</p>
						<p class="s_tip">知识</p>
						<p class="s_tip_text">软装饰细节，无论是从视觉到触觉，从感官到心里都彻底温暖起来。</p>
					</li>
					<li>
						<p>
							<img src="/views/front/images/icon_s02.jpg" />
						</p>
						<p class="s_tip">实现</p>
						<p class="s_tip_text">软装饰细节，无论是从视觉到触觉，从感官到心里都彻底温暖起来。</p>
					</li>
					<li>
						<p>
							<img src="/views/front/images/icon_s03.jpg" />
						</p>
						<p class="s_tip">优势</p>
						<p class="s_tip_text">软装饰细节，无论是从视觉到触觉，从感官到心里都彻底温暖起来。</p>
					</li>
					<li>
						<p>
							<img src="/views/front/images/icon_s04.jpg" />
						</p>
						<p class="s_tip">服务</p>
						<p class="s_tip_text">软装饰细节，无论是从视觉到触觉，从感官到心里都彻底温暖起来。</p>
					</li>
				</ul>
			</div>
			<div class="s_box2">
				<div class="s_box2_list">
					<p>
						<img src="/views/front/images/icon_s05.jpg" />
					</p>
					<p>浏览场景</p>
				</div>
				<div class="s_box2_jt">
					<img src="/views/front/images/s_jt.jpg" />
				</div>
				<div class="s_box2_list">
					<p>
						<img src="/views/front/images/icon_s06.jpg" />
					</p>
					<p>挑选方案</p>
				</div>
				<div class="s_box2_jt">
					<img src="/views/front/images/s_jt.jpg" />
				</div>
				<div class="s_box2_list">
					<p>
						<img src="/views/front/images/icon_s07.jpg" />
					</p>
					<p>选择套餐</p>
				</div>
				<div class="s_box2_jt">
					<img src="/views/front/images/s_jt.jpg" />
				</div>
				<div class="s_box2_list">
					<p>
						<img src="/views/front/images/icon_s08.jpg" />
					</p>
					<p>下单购买</p>
				</div>
				<div class="s_box2_jt">
					<img src="/views/front/images/s_jt.jpg" />
				</div>
				<div class="s_box2_list">
					<p>
						<img src="/views/front/images/icon_s09.jpg" />
					</p>
					<p>物流配送</p>
				</div>
				<div class="s_box2_jt">
					<img src="/views/front/images/s_jt.jpg" />
				</div>
				<div class="s_box2_list">
					<p>
						<img src="/views/front/images/icon_s010.jpg" />
					</p>
					<p>售后服务</p>
				</div>
			</div>
		</div>
	</div>
	<!--服务流程  e-->
	<%@include file="../public/footer.jsp"%>
</body>
<script type="text/javascript" src="/views/front/public.js?v=1"></script>
<script type="text/javascript">
	$("#nav").slide({
		type : "menu",
		titCell : ".nLi",
		targetCell : ".sub",
		effect : "slideDown",
		delayTime : 300,
		triggerTime : 0,
		returnDefault : true,
		trigger : "click",
		defaultIndex: 0
	});
	
	$(".fullSlide").slide({
		titCell : ".hd ul",
		mainCell : ".bd ul",
		effect : "fold",
		interTime: 2000,
		pnLoop: true,
		autoPlay : true,
		autoPage : true,
		trigger : "click"
	});
	
	goToTop("toTop");
	showTopSearch("showTopSearch");
</script>
</html>
