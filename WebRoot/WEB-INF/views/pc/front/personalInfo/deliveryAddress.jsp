<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<script src="../views/common/template-web.js"></script>
<title>收货地址</title>
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
  <div class="erweima"> <img src="images/img_28.jpg"  width="80p" hidden="80"/></div>
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
<!--地址管理-->
<div class="user_style  clearfix">
 <div class="margin_sx">
 <div class="left_mun">
  <div id="menu">
  <dl>
    <dt>我的交易</dt>
    <dd><a href="用户中心-我的订单.html">我的订单</a></dd>
    <dd><a href="用户中心-积分.html">我的积分</a></dd>
   </dl>
   <dl>
    <dt>VIP专区</dt>
    <dd><a href="活动专区.html" >VIP活动专区</a></dd>
   </dl>
   <dl>
    <dt>我的收藏</dt>
    <dd><a href="用户中心-收藏.html">设计师案例</a></dd>
    <dd><a href="#">场景方案</a></dd>
    <dd><a href="#">单品</a></dd>
    <dd><a href="#">话题</a></dd>
   </dl>
    <dl>
    <dt>我的足迹</dt>
    <dd><a href="用户中心-秀秀记录.html">秀秀记录</a></dd>
    <dd><a href="#">浏览记录</a></dd>
    <dd><a href="#">评论记录</a></dd>
    <dd><a href="#">点赞记录</a></dd>
   </dl>
   <dl>
    <dt>我的邀请</dt>
    <dd><a href="用户中心-邀请用户.html">已邀请用户</a></dd>
   </dl>
   <dl>
    <dt>设置</dt>
    <dd><a href="用户中心-个人信息.html">个人资料</a></dd>
    <dd><a href="用户中心-地址管理.html" class="hover">地址管理</a></dd>
    <dd><a href="用户中心-修改密码.html">修改密码</a></dd>
   </dl>
  </div>
 </div>
 <!--右侧内容样式-->
 <div class="right_content clearfix">
  <div class="Address_management backgroundcolor padding">
   <div class="adderss_add_name clearfix"><a href="javascript:" onclick="AddAddress()" class="add_adderss">新增收货地址</a><span class="prompt">你以创建<b>2</b>个收货地址，最多能创建10个。</span></div>
   <div class="Address_list">
    <div class="adderss_name">
      <div class="a_user_name">张天师&nbsp;&nbsp;江苏 <a href="#" class="icon_edit"></a></div>
      <div class="adderss_info padding">
      <p><label class="label_name">收货人：</label><span class="content">张天师</span></p>
      <p><label class="label_name">地&nbsp;&nbsp;址：</label><span class="content">南京雨花台区郁金香路郁金香软件大厦6楼</span></p>
      <p><label class="label_name">手机号：</label><span class="content">18967890909</span></p>
      </div>
      <a href="javascript:ovid(0)" class="adderss_delete" onclick="adderssdelete()"></a>
      <div class="adderss_operating">
       <a href="#">设为默认</a>&nbsp;&nbsp;&nbsp;<a href="#">编辑</a>
      </div>
    </div>
   </div>
    <div class="Address_list">
    <div class="adderss_name">
      <div class="a_user_name">张天师&nbsp;&nbsp;江苏 <a href="#" class="icon_edit"></a></div>
      <div class="adderss_info padding">
      <p><label class="label_name">收货人：</label><span class="content">张天师</span></p>
      <p><label class="label_name">地&nbsp;&nbsp;址：</label><span class="content">南京雨花台区郁金香路郁金香软件大厦6楼</span></p>
      <p><label class="label_name">手机号：</label><span class="content">18967890909</span></p>
      </div>
      <a href="javascript:ovid(0)" class="adderss_delete" onclick="adderssdelete()"></a>
      <div class="adderss_operating">
       <a href="#">设为默认</a>&nbsp;&nbsp;&nbsp;<a href="#">编辑</a>
      </div>
    </div>
   </div>
  </div>
  <!--添加地址-->
  <div class="AddAddress_style">
   <div class="title_name">添加地址</div>
   <table class="table">
    <tr>
     <td class="label_name">收货人</td>
     <td class="add_conent"><input name="" type="text"  data-name="收货人" class="add_text"/></td>
     <td class="label_name">移动电话</td>
     <td class="add_conent"><input name="" type="text" data-name="联系电话" class="add_text"/></td>
      <td class="label_name code">邮政编码</td>
     <td class="add_conent"><input name="" type="text"  data-name="邮政编码" class="add_text"/></td>
     </tr>
     <tr>
     <td class="label_name">所属地区</td>
     <td colspan="5" class="add_area">
     <select name="" data-name="省份">
     <option value="" >选择省份</option>
     <option value="1" >江苏</option>
     </select>
     <select name="" data-name="市/区"><option value="">市/区</option><option value="1" >南京</option></select>
     <select name="" data-name="县/市"><option value="">县/市</option><option value="1" >雨花台</option></select>
     </td>
    </tr>
    <tr>
     <td class="label_name">详细地址</td>
     <td  colspan="5" class="add_conent"><input name="" type="text" data-name="详细地址" class="add_text" style=" width:450px"/></td>
    </tr>
   </table>
   <div class="Submit_style align_right">
   <label><input name="" type="checkbox" value=""  class="checkbox"/>默认地址</label> 
   <input class="btn submit" name="" type="submit"  onclick="Save_Address()" value="保存"/> 
   <input name="" class="btn submit_adding" type="submit"  value="继续添加"/></div>
  </div>
 </div>
 </div>
</div>
<div class="footer clearfix">
<div class="footer_spacing clearfix">
  <span class="left_link l_f"><a href="#">首页</a>|<a href="#">设计精粹</a>|<a href="#">场景方案</a>|<a href="#">单品大库</a>|<a href="#">奇货可享</a>|<a href="#">找找感觉</a></span>
  <span class="copyright r_f">copyright©南京一家一世界网络科技有限公司 版权所有   苏ICP备16043372号-1</span>
  </div>
</div>
</div>
</body>
</html>