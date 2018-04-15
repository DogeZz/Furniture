<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.personalInfo_hdLabel{
		margin-left:35px;
		width:50px;
		vertical-align:top;"
	}
	.personalInfo_img{
		display:inline-block;
		position:relative;
		border: 3px solid #e6e6e6;
		width:86px;
		height:86px;
	}
	.personalInfo_edithd{
		width:80px;
		height:21px;
		position:absolute;
		text-align:center;
		line-height:21px;
		color:#e1d7ca;
		opacity:.7;
		bottom:0;
		background:#000;
		display:none;
	}
</style>
   <!--个人资料-->
<div class="right_content clearfix">
	<div class="Personal_info" id="user_info">
		<div class="hd">
			<ul>
				<li>基本信息</li>
				<li>头像照片</li>
			</ul>
		</div>
		
		<div style="border: 1px solid">
		<div class="bd" style="border:1px" >
		<div id="personalInfo-userInfo-content">
		<script type="text/html" id="personalInfo-userInfo-template">
			<!--个人信息-->
			<ul class="Edit_Info">
		        <div class="Add_info">
		       		<label class="personalInfo_hdLabel" >当前头像：</label>
		       		<div class="personalInfo_img">     
		            	<a href=""><img src="{{user.yhtx}}" onerror="javascript:this.src='//wwc.alicdn.com/avatar/getAvatar.do?userId=2698210082&width=80&height=80&type=sns';" /></a>
		        		<a href="//i.taobao.com/user/headset.htm" class="personalInfo_edithd">编辑头像</a>
		        	</div>  
		        </div>
				<li>
					<label class="label_name">昵称：</label>
					<span class="Add_info">
						<input name="yhnc" type="text" class="text_add" style=" width:150px" value="{{user.yhnc}}"/>
					</span>
				</li>
				<li>
					<label class="label_name">真实姓名：</label>
					<span class="Add_info">
						<input name="zsxm" type="text" class="text_add" disabled style="width:150px; border:none;" value="{{user.zsxm}}" />
						<span><i>*</i>真实姓名不可更改！</span>
					</span>
				</li>
				<li>
					<label class="label_name">性别：</label> 
					<span class="Add_info"> 
						<label><input name="xb" type="radio" {{if !user.xb}} checked="checked" {{/if}}  />男</label>&nbsp;&nbsp;&nbsp;
						<label><input name="xb" type="radio" {{if user.xb}} checked="checked" {{/if}}  />女</label>
					</span>
				</li>
				<li>
					<label class="label_name"><i>*</i>手机号码：</label>
					<span class="Add_info">
						<input name="sjhm" type="text" class="text_add" disabled style="width:150px; border:none;" value="{{user.sjhm}}" />
					</span>
					<a href="#">&nbsp;&nbsp;<font color="blue">修改手机号码</font></a>
				</li>
				<li>
					<label class="label_name"><i>*</i>用户类型：</label>
					<span class="Add_info">
						<input name="yhlx" type="text" class="text_add" disabled style="width:150px; border:none;" value="{{user.yhlx}}"/>
						<span><i>*</i>用户类型不可更改！</span>
					</span>
				</li>
				<li>
					<label class="label_name">QQ：</label>
					<span class="Add_info">
						<input name="QQ" type="text" class="text_add" style="width:150px;" value="{{user.qq}}"/>
					</span>
				</li>
				<li style="height:70px;">
					<label class="label_name">用户简介：</label>
					<span class="Add_info">
						<textarea style="width:350px; height:60px;" name="yhjj" class="text_add" value="{{user.yhjj}}"></textarea>
					</span>
				</li>
				<hr style="height:1px;border:none;border-top:1px solid #d0c5c5;" />
				<li><input name="" type="submit" value="提交" class="submit_modify" /></li>
			</ul>
		</script>
		</div>
			<!--头像设置-->
			<ul class="Avatar_settings">
				<div class="Avatar">
				<!--头像插件-->
				</div>
				<dl class="recommend clearfix">
					<dt class="title_name">推荐头像</dt>
					<dd>
						<a href="javascript:ovid()" class="checked_Avatar"><img src="/views/front/images/touxiang.jpg" /></a>
					</dd>
					<dd>
						<a href="javascript:ovid()"><img src="/views/front/images/touxiang.jpg" /></a>
					</dd>
					<dd>
						<a href="javascript:ovid()"><img src="/views/front/images/touxiang.jpg" /></a>
					</dd>
					<dd>
						<a href="javascript:ovid()"><img src="/views/front/images/touxiang.jpg" /></a>
					</dd>
				</dl>
				<div class="">
					<a href="#" class="save_btn">保存</a>
				</div>
			</ul>
			
		</div>
	</div>
	</div>
	<script> $("#user_info").slide({trigger:"click"});</script>
</div>
<script type="text/javascript">
	var usersjhm;
	var index_initDatas = function() {
		$.ajax({
			url:'/front/getUser.ajx', 
			type: 'post',
			data: {username: sessionStorage.getItem("username")}, 
			dataType: 'json',
			success: function(res) {
 				usersjhm = ""+console.log(res.sjhm);
				res.sjhm = usersjhm.substring(0, 3) + "****" + usersjhm.substring(7); 
				var html = template('personalInfo-userInfo-template', {user: res});
				$('#personalInfo-userInfo-content').html(html);
				userInfo_editHdMoveenter();
			}
		});
	};
	index_initDatas()
	var userInfo_editHdMoveenter = function(){
		$(".personalInfo_img").on("mouseenter", function () {
		    $(".personalInfo_edithd").show();    
		}).on("mouseleave", function () {
		    $(".personalInfo_edithd").hide();
		});
	}
	                 
</script>