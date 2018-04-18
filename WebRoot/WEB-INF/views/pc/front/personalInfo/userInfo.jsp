<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.personalInfo_hdLabel{
		margin-left:35px;
		width:50px;
		vertical-align:top;"
	}
	.personalInfo_img{
		display:inline-block !important;
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
	
	.changesjhm{
		color:blue;
		
	}
	.changesjhm:HOVER{
		color:green;	
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
		
		<div style="border: 1px solid #d0c5c5;">
		<div class="bd" style="border:1px" >
		<div id="personalInfo-userInfo-content">
		<script type="text/html" id="personalInfo-userInfo-template">
			<!--个人信息-->
			<ul class="Edit_Info">
		        <li style="height:100%;overflow:hidden;">
		       		<label class="personalInfo_hdLabel" >当前头像：</label>
		       		<div class="personalInfo_img">     
		            	<a href=""><img src="{{user.yhtx}}" onerror="javascript:this.src='//wwc.alicdn.com/avatar/getAvatar.do?userId=2698210082&width=80&height=80&type=sns';" style="width:100%; height:100px;"/></a>
		        		<a href="//i.taobao.com/user/headset.htm" class="personalInfo_edithd">编辑头像</a>
		        	</div>  
		        </li>
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
						<label><input name="xb" type="radio" {{if !user.xb}} checked="checked" {{/if}} />男</label>&nbsp;&nbsp;&nbsp;
						<label><input name="xb" type="radio" {{if user.xb}} checked="checked" {{/if}}  />女</label>
					</span>
				</li>
				<li>
					<label class="label_name"><i>*</i>手机号码：</label>
					<span class="Add_info">
						<input name="sjhm" type="text" class="text_add" disabled style="width:150px; border:none;" value="{{user.sjhm}}" />
					</span>
					<a href="#" class="changesjhm">&nbsp;&nbsp;修改手机号码</a>
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
			<div style="margin-bottom:50px;">
                <button class="btn_save" type="button" id="user-uploadImgBtn" >上传图片</button>
                <input id="user-img-input" type="hidden" class="form-control" name="yhtx" value="${data.yhtx}">
			</div>
			<div style="margin-bottom:50px;">
                <button class="btn_save" type="button" id="user-uploadImgBtn" >上传图片</button>
                <input id="user-img-input" type="hidden" class="form-control" name="yhtx" value="${data.yhtx}">
			</div>
			<span style="color:#b7a9a4;">选择一张本地图片上传为头像，仅支持JPG、PNG图片文件</span>
			<div style="width:260px; height:260px; line-height:220px; text-align:center; background:#e6e6e6; margin-top:10px;display:block;">
				<img id="user-img" src="{{user.yhtx}}" onerror="javascript:this.src='//wwc.alicdn.com/avatar/getAvatar.do?userId=2698210082&width=80&height=80&type=sns';" style="width:250px; height:250px; margin-right:15px;">		
			</div>
			<div style="margin-top:30px;">
                <input class="btn_save" type="submit" id="" value="提交" />
			</div>
			<form method="post" enctype="multipart/form-data" id="userData-edit-upload">
				<input type="file" name="upload" class="user-fmtimg" style="display:none;" onchange="userInput_imgurl(this.value)"/>
			</form>
		</div>
		</div>
	</div>
	<script> $("#user_info").slide({trigger:"click"});</script>
</div>
<script src="/views/common/layer/layer.js"></script>
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
	$("#user-uploadImgBtn").click(function(){
    	$(".user-fmtimg").click();
    });
	var userInput_imgurl = function(){
    	var index = parent.layer.open({
			title: '提示',
			icon: 0,
			btn: ['确定', '取消'],
			content: '是否上传?',
			cancel: function() {},
			yes: function() {
				var uploadImgLoad =  parent.layer.load();
				$.ajax({
					url : '/admin/upload.do?file',
					type: 'POST',
		        	cache: false,
					data: new FormData($('#userData-edit-upload')[0]),
					processData: false,
		        	contentType: false,
					success : function(data){
						 parent.layer.close(uploadImgLoad);
						 var res = eval ("(" + data + ")");
						 var title = res.error == 0 ? "上传成功" : "上传失败";
						 var index = parent.layer.alert(title, function() {
						  	$("#user-img").attr("src", res.url);
						  	$("#user-img-input").val(res.url);
						  	parent.layer.close(index);
						 });
					}
				});				
			}
		});
	}
</script>