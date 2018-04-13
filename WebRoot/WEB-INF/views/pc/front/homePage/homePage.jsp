<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="/views/front/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<link  href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/z_css.css" type="text/css" rel="stylesheet" />
<!--[if lt IE 9]>
<script src="/views/front/js/html5shiv.js" type="text/javascript"></script>
<script src="/views/front/js/respond.min.js"></script>
<script src="/views/front/js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>首页</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
 $(".q_code ").hover(function(){
			$(this).find(".q_code_layer").addClass("hover").css("display","block");
		},function(){
			$(this).find(".q_code_layer").removeClass("hover").css("display","none");  

		}
	); 
	 $(".diagram ").hover(function(){
			$(this).addClass("hover");
		},function(){
			$(this).removeClass("hover");  

		}
	); 
});
</script>
<body>
<div class="header">
 <div class="header_top">
   <div class="top_info clearfix">
   <div class="logo_style l_f"><a href="#"><img src="/views/front/images/logo.jpg" /></a></div>
   <div class="Search_style l_f">
   <form>
   <div class="select">
    <select name="" size="1">
      <option value="1">设计精粹</option>
      <option value="2">场景方案</option>
	  <option value="1">单品大库</option>
      <option value="2">找找感觉</option>
    </select>
    </div>
    <input name="" type="text"  class="add_Search"/>
    <input name="" type="submit"  value="" class="submit_Search"/>
    </form>
   </div>
   <div class="Cart_user r_f">
   <div class="Cart_Quantity "><span class="number">0</span></div>
   <div class="header_operating l_f">
    <span class="header_touxiang"><img src="/views/front/images/touxiang_03.png" /></span>
    <a href="#">登录</a><a href="@">注册</a>
   </div>
   </div>
 </div>
 <div class="header_menu">
 <!--菜单导航栏-->
 <ul class="menu" id="nav">
   <li class="nLi"><a href="#">网站首页</a></li>
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
   <li class="nLi Down"><a href="#">单品大库</a><em class="icon_jiantou"></em></li>      
   <li class="nLi Down"><a href="#">奇货可享</a><em class="icon_jiantou"></em></li>
   <li class="nLi Down"><a href="#">找找感觉</a><em class="icon_jiantou"></em></li>
 </ul>
 <script>jQuery("#nav").slide({ type:"menu", titCell:".nLi", targetCell:".sub",effect:"slideDown",delayTime:300,triggerTime:0,returnDefault:false,trigger:"click"});</script>
 <div class="q_code">
  <a href="" class="q_code_applnk" rel="nofollow"></a>
    <div class="q_code_layer" style="display: none;">
    <a href="" class="qcode_lnk" rel="nofollow">
      <span class="qcode_title">只分享装修干货</span>
    </a>  
    </div>
  </div>
 </div>
 </div>
</div>
<!--banner轮播  s-->
<div class="fullSlide">
	<div class="bd">
		<ul style="position: relative; width: 1583px; height: 460px;">
			<li style="position: absolute; width: 1583px; left: 0px; top: 0px; display: none; background: url(/views/front/images/banner01.jpg) 50% 0px no-repeat;"><a target="_blank" href="#"></a></li>
			<li style="position: absolute; width: 1583px; left: 0px; top: 0px; display: list-item; background: url(/views/front/images/banner02.jpg) 50% 0px no-repeat;"><a target="_blank" href="#"></a></li>
			<li style="position: absolute; width: 1583px; left: 0px; top: 0px; display: none; background: url(/views/front/images/banner03.jpg) 50% 0px no-repeat;"><a target="_blank" href="#"></a></li>
			<li style="position: absolute; width: 1583px; left: 0px; top: 0px; display: none; background: url(/views/front/images/banner01.jpg) 50% 0px no-repeat;"><a target="_blank" href="#"></a></li>
			<li style="position: absolute; width: 1583px; left: 0px; top: 0px; display: none; background: url(/views/front/images/banner03.jpg) 50% 0px no-repeat;"><a target="_blank" href="#"></a></li>
		</ul>
	</div>
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
    <div class="i_title">
    场景方案
    </div>
	<div class="clear"></div>
    <div class="c_main">
    	<div class="c_mianbox1 mar_14">
        	<div class="c_tips">
            	<a href="#">客厅</a><a href="#">卫生间</a><a href="#">书房</a><a href="#">主卧</a><a href="#">次卧</a><a href="#">阳台/露台</a><a href="#">儿童房</a><a href="#">茶室</a><a href="#">客厅</a><a href="#">客厅</a>
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
	<div class="p_title">
    	单品大库
    </div>
    <div class="p_main">
    	<div class="p_box1">
        	<a href="#" class="p_box1pic"><img src="/views/front/images/p_img01.jpg" /></a>
            <p><a href="#">锥形木质脚布艺拉扣环抱式沙发 三人位</a></p>
            <p class="p_pirce">￥2439</p>
        </div>
        <div class="p_box2">
        	<a href="#" class="p_box2pic"><img src="/views/front/images/p_img01.jpg" /></a>
            <p><a href="#">锥形木质脚布艺拉扣环抱式沙发 三人位</a></p>
            <p class="p_pirce">￥2439</p>
        </div>
        <div class="p_box2">
        	<a href="#" class="p_box2pic"><img src="/views/front/images/p_img01.jpg" /></a>
            <p><a href="#">锥形木质脚布艺拉扣环抱式沙发 三人位</a></p>
            <p class="p_pirce">￥2439</p>
        </div>
        <div class="p_box2">
        	<a href="#" class="p_box2pic"><img src="/views/front/images/p_img01.jpg" /></a>
            <p><a href="#">锥形木质脚布艺拉扣环抱式沙发 三人位</a></p>
            <p class="p_pirce">￥2439</p>
        </div>
        <div class="p_box2">
        	<a href="#" class="p_box2pic"><img src="/views/front/images/p_img01.jpg" /></a>
            <p><a href="#">锥形木质脚布艺拉扣环抱式沙发 三人位</a></p>
            <p class="p_pirce">￥2439</p>
        </div>
    </div>
</div>
<!--单品大库  e-->

<!--服务流程  s-->
<div class="wrap_s">
	<div class="s_main">
    	<div class="s_title">
      	  服务和流程
        </div>
        <div class="s_box1">
        	<ul>
            	<li>
                	<p><img src="/views/front/images/icon_s01.jpg" /></p>
                    <p class="s_tip">知识</p>
                    <p class="s_tip_text">软装饰细节，无论是从视觉到触觉，从感官到心里都彻底温暖起来。</p>
                </li>
                <li>
                	<p><img src="/views/front/images/icon_s02.jpg" /></p>
                    <p class="s_tip">实现</p>
                    <p class="s_tip_text">软装饰细节，无论是从视觉到触觉，从感官到心里都彻底温暖起来。</p>
                </li>
                <li>
                	<p><img src="/views/front/images/icon_s03.jpg" /></p>
                    <p class="s_tip">优势</p>
                    <p class="s_tip_text">软装饰细节，无论是从视觉到触觉，从感官到心里都彻底温暖起来。</p>
                </li>
                <li>
                	<p><img src="/views/front/images/icon_s04.jpg" /></p>
                    <p class="s_tip">服务</p>
                    <p class="s_tip_text">软装饰细节，无论是从视觉到触觉，从感官到心里都彻底温暖起来。</p>
                </li>
            </ul>
        </div>
        <div class="s_box2">
        	<div class="s_box2_list">
            	<p><img src="/views/front/images/icon_s05.jpg" /></p>
                <p>浏览场景</p>
            </div>
            <div class="s_box2_jt">
            	<img src="/views/front/images/s_jt.jpg" />
            </div>
            <div class="s_box2_list">
            	<p><img src="/views/front/images/icon_s06.jpg" /></p>
                <p>挑选方案</p>
            </div>
            <div class="s_box2_jt">
            	<img src="/views/front/images/s_jt.jpg" />
            </div>
            <div class="s_box2_list">
            	<p><img src="/views/front/images/icon_s07.jpg" /></p>
                <p>选择套餐</p>
            </div>
            <div class="s_box2_jt">
            	<img src="/views/front/images/s_jt.jpg" />
            </div>
            <div class="s_box2_list">
            	<p><img src="/views/front/images/icon_s08.jpg" /></p>
                <p>下单购买</p>
            </div>
            <div class="s_box2_jt">
            	<img src="/views/front/images/s_jt.jpg" />
            </div>
            <div class="s_box2_list">
            	<p><img src="/views/front/images/icon_s09.jpg" /></p>
                <p>物流配送</p>
            </div>
            <div class="s_box2_jt">
            	<img src="/views/front/images/s_jt.jpg" />
            </div>
            <div class="s_box2_list">
            	<p><img src="/views/front/images/icon_s010.jpg" /></p>
                <p>售后服务</p>
            </div> 
        </div>
    </div>
</div>
<!--服务流程  e-->

<div class="footer" style="margin-top:0; background:#f5f5f5; border-top:1px solid #e6e6e6;">
<div class="footer_spacing clearfix">
  <span class="copyright">copyright©厚德 D1-743 有限公司 版权所有   粤ICP备16043743号-1</span>
  </div>
</div>
</body>
<script type="text/javascript">		
	jQuery(".fullSlide").slide({ 
		titCell:".hd ul", 
		mainCell:".bd ul", 
		effect:"fold",  
		autoPlay:true, 
		autoPage:true, 
		trigger:"click" 
	});	
</script>
</html>
