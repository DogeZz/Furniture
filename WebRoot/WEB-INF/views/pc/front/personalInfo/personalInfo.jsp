<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author" content="order by dede58.com"/>
<link  href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<script type="text/javascript" src="/views/front/js/common.js"></script>
<title>个人信息</title>
</head>
<body>
<div class="Background_color">
<div class="user_top">
 <div class="top_style">
 <span class="l_f">客服热线：025-45874156</span>
 <div class="user_top_name r_f">
  <span class="shop_daun list_name">
  <span class="shop_name"><i class="icon_shop"></i><a  href="javascript:void()" class="direction_xia">手机端</a></span>
  <div class="shop_erwm">
  <div class="erweima"> <img src="images/img_28.jpg"  width="80px" hidden="hidden"/></div>
  </div>  
  </span> 
 <span class="user_shopping">12345678909 &nbsp;&nbsp;<a href="#">退出</a></span>
 </div> 
 </div>
</div>
<div class="user_lanmu">
 <div class="user_style nav">
  <a href="#" class="user_logo"><img src="images/user_logo_03.png" /></a>
  <div class="navitems">
   <ul class="">
    <li><a href="#">首页</a></li>
    <li><a href="#">账户设置</a></li>
    <li><a href="#">消息</a></li>
   </ul>
  </div>
  <div class="cart_shop">
   <em class="icon_cart"><span class="digital">1</span></em>我的购物车
   
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
    <dd><a href="#">我的订单</a></dd>
   </dl>
   <dl>
    <dt>我的收藏</dt>
    <dd><a href="#">单品</a></dd>
    <dd><a href="#">话题</a></dd>
   </dl>
    <dl>
    <dt>我的足迹</dt>
    <dd><a href="#">浏览记录</a></dd>
    <dd><a href="#">评论记录</a></dd>
    <dd><a href="#">点赞记录</a></dd>
   </dl>
   <dl>
    <dt>设置</dt>
    <dd><a href="#" class="hover">个人资料</a></dd>
    <dd><a href="#" >地址管理</a></dd>
    <dd><a href="#">修改密码</a></dd>
   </dl>
  </div>
 </div>
 <!--个人资料-->
 <div class="right_content clearfix">
  <div class="Personal_info" id="user_info">
   <div class="hd">
    <ul><li>基本信息</li><li>头像照片</li></ul>
   </div>
  <div class="bd">
  <!--个人信息-->
    <ul class="Edit_Info">
      <li><label class="label_name">昵称：</label><span class="Add_info"><input name="" type="text"  class="text_add" style=" width:150px"/></span></li>
      <li><label class="label_name">性别：</label>
      <span class="Add_info">
      <label><input name="sex_radio" type="radio" value="" checked="checked" />男</label>&nbsp;&nbsp;&nbsp;
      <label><input name="sex_radio" type="radio" value="" />女</label></span></li>
      <li><label class="label_name"><i>*</i>手机号：</label><span class="Add_info"><input name="" type="text"  class="text_add" style=" width:150px"/></span></li>
      <li><label class="label_name">收货地址：</label><span class="Add_info"><input name="" type="text"  class="text_add" style=" width:300px"/></span></li>
      <li><label class="label_name">小区：</label><span class="Add_info"><input name="" type="text"  class="text_add" style=" width:250px"/></span></li>
      <li><label class="label_name">户型：</label><span class="Add_info"><input name="" type="text"  class="text_add" style=" width:150px"/></span></li>
      <li><label class="label_name">面具：</label><span class="Add_info"><input name="" type="text"  class="text_add" style=" width:150px"/></span></li>
      <li ><input name="" type="submit"  value="提交" class="submit_modify"/></li>
    </ul>
    <!--头像设置-->
    <ul class="Avatar_settings">
     <div class="Avatar">
            <!--头像插件-->
     </div>
     <dl class="recommend clearfix">
      <dt class="title_name">推荐头像</dt>
      <dd><a href="javascript:ovid()" class="checked_Avatar"><img src="images/touxiang.jpg" /></a></dd>
      <dd><a href="javascript:ovid()"><img src="images/touxiang.jpg" /></a></dd>
      <dd><a href="javascript:ovid()"><img src="images/touxiang.jpg" /></a></dd>
      <dd><a href="javascript:ovid()"><img src="images/touxiang.jpg" /></a></dd>
     </dl>
     <div class=""><a href="#" class="save_btn">保存</a></div>
    </ul>
  </div>
  </div>
  <script> jQuery("#user_info").slide({trigger:"click"});</script>
 </div>
 </div>
 </div>
  <div class="footer clearfix">
<div class="footer_spacing clearfix">
  <span class="left_link l_f"><a href="#">首页</a>|<a href="#">设计精粹</a>|<a href="#">场景方案</a>|<a href="#">单品大库</a>|<a href="#">奇货可享</a>|<a href="#">找找感觉</a></span>
  <span class="copyright r_f">copyright©厚德D1-743有限公司 版权所有   苏ICP备16043372号-1</span>
  </div>
</div>
</div>
</body>
</html>