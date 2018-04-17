<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/views/front/css/common.css" type="text/css" rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<script src="../views/common/template-web.js"></script>
<title>个人信息</title>
</head>
<body>
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
  <div class="AddAddress_style" style="display:table;">
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
</body>
</html>