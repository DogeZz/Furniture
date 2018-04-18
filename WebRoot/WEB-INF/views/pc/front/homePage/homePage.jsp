<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="/views/front/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript"src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
	<link href="/views/front/css/common.css" type="text/css"rel="stylesheet" />
	<link href="/views/front/css/style.css?v=1" type="text/css" rel="stylesheet" />
	<link href="/views/front/css/z_css.css?v=55" type="text/css" rel="stylesheet" />
	<script src="/views/common/template-web.js"></script>
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


	<!--单品大库  s-->
	<div class="wrap_p" >
		<div class="p_title">单品大库</div>
		<div class="p_main"  style="border-left: none;">
		<div id="furnitureList-content">
			<script type="text/html" id="furnitureList-template">
			{{each furnitures}}
			<div class="p_box2">
				<a href="javascript:window.location.href='/front/detail.fjsp?jjid={{$value.jjid}}';" class="p_box2pic"><img src="{{$value.jjtp}}" /></a>
				<p><a href="#">{{$value.jjbt}}</a></p>
				<p class="p_pirce">￥{{$value.jjjg}}</p>
			</div>
			{{/each}}
			</script>
		</div>
		<div style="clear:both;"></div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<div onclick="loadMore();" class="loadMore" style="cursor:pointer;font-size:22px;width:1200px;margin:0 auto;height:60px;line-height:60px;text-align:center;border:1px solid #f1f1f1;clear:both;border-top: none;">查看更多</div>
	<!--单品大库  e-->

	<!--服务流程  s-->
	<div class="wrap_s">
		<div class="s_main">
			<div class="s_title">服务和流程</div>
			<div class="s_box1">
				<div class="s_box2_list">
					<p>
						<img src="/views/front/images/icon_s05.jpg" />
					</p>
					<p>浏览商品</p>
				</div>
				<div class="s_box2_jt">
					<img src="/views/front/images/s_jt.jpg" />
				</div>
				<div class="s_box2_list">
					<p>
						<img src="/views/front/images/icon_s06.jpg" />
					</p>
					<p>挑选家具</p>
				</div>
				<div class="s_box2_jt">
					<img src="/views/front/images/s_jt.jpg" />
				</div>
				<div class="s_box2_list">
					<p>
						<img src="/views/front/images/icon_s07.jpg" />
					</p>
					<p>选择规格</p>
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
	
	var isEnd = false;
	
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
	
	var page = 1, rows = 8;
	var loadJjListData = function() {
		$.ajax({
			url:'/front/getJjPageData.ajx', 
			type: 'post',
			data: {
				rows : rows,
				page : page
			},
			dataType: 'json',
			success: function(res) {
				var html = template('furnitureList-template', {furnitures: res.rows});
				$('#furnitureList-content').append(html);
				if(res.pageIndex == res.pageCount){
					inEnd = true;
					$(".loadMore").remove();
				}
			}
		});
	}
	loadJjListData();
	
	var loadMore = function(){
		if(!isEnd){
			page++;
			loadJjListData();
		}
	}
</script>
</html>
