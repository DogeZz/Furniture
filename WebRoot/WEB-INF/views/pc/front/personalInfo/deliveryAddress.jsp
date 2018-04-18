<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/views/front/css/common.css" type="text/css"
	rel="stylesheet" />
<link href="/views/front/css/style.css" type="text/css" rel="stylesheet" />
<script src="/views/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript"
	src="/views/front/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/views/front/js/layer/layer.js"></script>
<script src="../views/common/template-web.js"></script>

<script class="resources library" src="/views/front/area.js"
	type="text/javascript"></script>
<title>个人信息</title>
</head>
<style type="text/css">
	td {
		text-align: center !important;
	}
	
	.btn_save {
		background-color: #EFFFE1;
	    font-family: "新宋体";
	    border: 1px solid #88c523;
	    height: 32px;
	    color: #88c523;
	    font-size: 14px;
	    line-height: 30px;
	    width: 90px;
	    text-align: center;
	    border-radius: 3px;
	    font-weight: bold;
	    cursor: pointer;
	    margin: 0px 5px；
	}
	.btn_save:HOVER {
		background-color: #88c523;
	    font-family: "新宋体";
	    border: 1px solid #88c523;
	    height: 32px;
	    color: #ffffff;
	    font-size: 14px;
	    line-height: 30px;
	    width: 90px;
	    text-align: center;
	    border-radius: 3px;
	    font-weight: bold;
	    cursor: pointer;
	    margin: 0px 5px；
	}

</style>
<body>
	<!--右侧内容样式-->
	<div class="right_content clearfix">
		<div class="Personal_info" id="user_info">
			<div class="hd">
				<ul>
					<li style="color: #88c523;border-bottom: 2px solid #88c523">收货地址</li>
				</ul>
			</div>
			<div style="border: 1px solid #d0c5c5;">
				<!--添加地址-->
				<div class="AddAddress_style" style="display:table;">
					<div class="title_name">添加地址</div>
					<table class="table" style="text-align: center;">
						<tr>
							<td class="label_name">收货人</td>
							<td class="add_conent">
								<input name="" type="text" data-name="收货人" class="add_text" />
							</td>
							<td class="label_name">移动电话</td>
							<td class="add_conent">
								<input name="" type="text" data-name="联系电话" class="add_text" />
							</td>
							<td class="label_name code">邮政编码</td>
							<td class="add_conent">
								<input name="" type="text" data-name="邮政编码" class="add_text" />
							</td>
						</tr>
						<tr>
							<td class="label_name">所属地区</td>
							<td colspan="5" class="add_area">
								<select style="width:147px;" id="s_province" name="s_province"></select>  
								<select style="width:147px;" id="s_city" name="s_city"></select> 
								<select style="width:147px;" id="s_county" name="s_county"></select>
								<script type="text/javascript">_init_area();</script>
							</td>
						</tr>
						<tr>
							<td class="label_name">详细地址</td>
							<td colspan="5" class="add_conent">
								<input name="" type="text" data-name="详细地址" class="add_text" style=" width:450px" />
							</td>
						</tr>
					</table>
					<div class="Submit_style align_right">
						<label><input name="" type="checkbox" value="" class="checkbox" />默认地址</label>&nbsp;&nbsp;&nbsp;
						<input class="btn_save" name="" type="submit" onclick="Save_Address()" value="保存" />
					</div>
					<div class="Address_management backgroundcolor padding">
						<div class="adderss_add_name clearfix">
							<span class="prompt">你已创建<b>2</b>个收货地址，最多能创建10个。</span>
						</div>
						<div class="Address_list">
							<div class="adderss_name">
								<div class="a_user_name">
									张天师&nbsp;&nbsp;江苏 <a href="#" class="icon_edit"></a>
								</div>
								<div class="adderss_info padding">
									<p>
										<label class="label_name">收货人：</label><span class="content">张天师</span>
									</p>
									<p>
										<label class="label_name">地&nbsp;&nbsp;址：</label><span
											class="content">南京雨花台区郁金香路郁金香软件大厦6楼</span>
									</p>
									<p>
										<label class="label_name">手机号：</label><span class="content">18967890909</span>
									</p>
								</div>
								<a href="javascript:ovid(0)" class="adderss_delete"
									onclick="adderssdelete()"></a>
								<div class="adderss_operating">
									<a href="#">设为默认</a>&nbsp;&nbsp;<a href="#">编辑</a>
								</div>
							</div>
						</div>
						<div class="Address_list">
							<div class="adderss_name">
								<div class="a_user_name">
									张天师&nbsp;&nbsp;江苏 <a href="#" class="icon_edit"></a>
								</div>
								<div class="adderss_info padding">
									<p>
										<label class="label_name">收货人：</label><span class="content">张天师</span>
									</p>
									<p>
										<label class="label_name">地&nbsp;&nbsp;址：</label><span
											class="content">南京雨花台区郁金香路郁金香软件大厦6楼</span>
									</p>
									<p>
										<label class="label_name">手机号：</label><span class="content">18967890909</span>
									</p>
								</div>
								<a href="javascript:ovid(0)" class="adderss_delete"
									onclick="adderssdelete()"></a>
								<div class="adderss_operating">
									<a href="#">设为默认</a>&nbsp;&nbsp;&nbsp;<a href="#">编辑</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>