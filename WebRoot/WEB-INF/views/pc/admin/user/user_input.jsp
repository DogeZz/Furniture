<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML >
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>用户编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/views/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/views/common/animate.min.css" rel="stylesheet">
    <link href="/views/common/style.css?v=4.1.0" rel="stylesheet">
    
    <script src="/views/admin/js/jquery-3.2.1.min.js"></script>
    <script src="/views/common/bootstrap/js/bootstrap.min.js"></script>
    <script src="/views/common/jquery.validate.min.js"></script>
    <script src="/views/common/layer/layer.js"></script>
    
</head>
<body class="gray-bg" style="padding-left: 20px;">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins  animated fadeInRight">
	        <div class="ibox-title">
	            <h5>编辑用户<small>此功能添加或编辑用户基本数据</small></h5>
	        </div>
	        <div class="ibox-content">
	            <form action="" method="post" class="form-horizontal">
	            	<input type="hidden" name="yhid" value="${data.yhid}">
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">用户名：</label>
	                    <div class="col-sm-6">
	                        <input type="text" class="form-control" name="username" value="${data.username}" placeholder="输入用户名" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">密码：</label>
	                    <div class="col-sm-6">
	                        <input type="password" class="form-control" name="password" id="dlmm" placeholder="输入密码" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">确认密码：</label>
	                    <div class="col-sm-6">
	                        <input type="password" class="form-control" name="ensurePassword" placeholder="再次输入密码" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">用户昵称：</label>
	                    <div class="col-sm-6">
	                        <input type="text" class="form-control" name="yhnc" value="${data.yhnc}" placeholder="输入用户昵称" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">真实姓名：</label>
	                    <div class="col-sm-6">
	                        <input type="text" class="form-control" name="zsxm" value="${data.zsxm}" placeholder="输入真实姓名" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">性别：</label>
	                    <div class="col-sm-3">
	                    	<select class="form-control" name="xb">
	                        	<option value="0">男</option>
	                        	<option value="1">女</option>
	                        </select>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">身份证：</label>
	                    <div class="col-sm-6">
	                        <input type="text" class="form-control" name="sfz" value="${data.sfz}" placeholder="输入身份证" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">手机号码：</label>
	                    <div class="col-sm-6">
	                        <input type="text" class="form-control" name="sjhm" value="${data.sjhm}" placeholder="输入手机号码" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">QQ：</label>
	                    <div class="col-sm-6">
	                        <input type="text" class="form-control" name="qq" value="${data.qq}" placeholder="输入QQ" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">用户类型：</label>
	                    <div class="col-sm-3">
	                        <select class="form-control" name="yhlx">
	                        	<option value="2">普通用户</option>
	                        	<option value="1">商家</option>
	                        	<option value="0">超级管理员</option>
	                        </select>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">用户头像</label>
	                    <div class="col-sm-11">
	                    	<img id="user-img" src="${data.yhtx}" onerror="Javascript:this.src='/views/admin/imgs/User-005.png';" style="max-width:450px;max-height:250px;margin-right:15px;">
	                    	<button class="btn btn-primary" type="button" id="user-uploadImgBtn" >上传图片</button>
	                        <input id="user-img-input" type="hidden" class="form-control" name="yhtx" value="${data.yhtx}" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">用户简介：</label>
	                    <div class="col-sm-6">
	                        <textarea class="form-control" name="yhjj" rows="5" placeholder="输入用户简介" >${data.yhjj}</textarea>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <div class="col-sm-4 col-sm-offset-2">
	                        <button class="btn btn-primary" type="submit">保存内容</button>
	                        <button class="btn btn-white" type="button" onclick="userInput_back()">返回</button>
	                    </div>
	                </div>
	            </form>
	            <form method="post" enctype="multipart/form-data" id="userData-edit-upload">
					<input type="file" name="upload" class="user-fmtimg" style="display:none;" onchange="userInput_imgurl(this.value)"/>
				</form>
	        </div>
	    </div>
    </div>
</body>
<script type="text/javascript">

	var yhid = $("input[name = yhid]").val();
	
	$.validator.addMethod("checkUsernameExist", function(value, element, param){
        var res = true;
        $.ajax({
            type:"POST",
            async: false, 
            url:"/admin/user.do?checkUsernameExist",
            dataType : 'json',
            data: {
            	yhid : yhid,
            	username : value
            },
            success:function(data){
           		res = !data.success;
            }
        });
        return res;
    },"<font color='#E47068'>用户名已存在</font>");

	var form = $('body').find('form');
	form.validate({
		rules : {
	        username : {checkUsernameExist : true},
	     	ensurePassword : {equalTo: "#dlmm"}
	    }, messages : {
 			ensurePassword : {
            	equalTo : "两次密码不一致！"
            }
        },
		submitHandler: function(f) {
			$.ajax({
				url : '/admin/user.do?save',
				type: 'post',
				data : $(f).serialize(),
				dataType : 'json',
				success: function(res) {
				    layer.msg(res.title);
				    if(res.success){
				    	setTimeout(function(){ userInput_back(); }, 1000);
				    }
				},
				error: function(data) {
					layer.msg(data);
				}
			});
		}
	});

	var userInput_back = function(){
		window.history.back();
	};
	
	var xb = "${data.xb}";
	if(xb != null && xb != "" && xb != undefined){
		if(xb == 'true'){
			$("option").eq(1).attr("selected","selected");
		} else {
			$("option").eq(0).attr("selected","selected");
		}
		var yhlx = "${data.yhlx}";
		if (yhlx == 0) {
			$("option").eq(4).attr("selected","selected");
		} else if(yhlx == 1) {
			$("option").eq(3).attr("selected","selected");
		} else {
			$("option").eq(2).attr("selected","selected");
		}
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
</html>
 
