<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML >
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>商户编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/views/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/views/common/animate.min.css" rel="stylesheet">
    <link href="/views/common/style.css?v=4.1.0" rel="stylesheet">
    
    <script src="/views/admin/js/jquery-3.2.1.min.js"></script>
    <script src="/views/common/bootstrap/js/bootstrap.min.js"></script>
    <script src="/views/common/jquery.validate.min.js"></script>
    <script src="/views/common/layer/layer.js"></script>
    <script src="../views/common/template-web.js"></script>
    
</head>
<body class="gray-bg" style="padding-left: 20px;">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins  animated fadeInRight">
	        <div class="ibox-title">
	            <h5>编辑商户<small>此功能添加或编辑商户基本数据</small></h5>
	        </div>
	        <div class="ibox-content">
	            <form action="" method="post" class="form-horizontal">
	            	<input type="hidden" name="shid" value="${data.shid}">
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">商户名：</label>
	                    <div class="col-sm-6">
	                        <input type="text" class="form-control" name="shmc" value="${data.shmc}" placeholder="输入商户名" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">用户：</label>
	                    <div class="col-sm-3">
	                    	<select class="form-control" name="yhid" id="merchant-userList-content">
	                    		<script type="text/html" id="merchant-userList-template">
	                        		{{each users}}
										<option value="{{$value.yhid}}" {{if $value.shid != null}}selected{{/if}}>{{$value.yhmc}}</option>
									{{/each}}
								</script>
	                        </select>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">等级</label>
	                    <div class="col-sm-2">
	                        <input type="number" class="form-control" name="shdj" value="${data.shdj}" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">商户描述：</label>
	                    <div class="col-sm-6">
	                        <textarea class="form-control" name="shms" rows="5" placeholder="输入商户描述" >${data.shms}</textarea>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <div class="col-sm-4 col-sm-offset-2">
	                        <button class="btn btn-primary" type="submit">保存内容</button>
	                        <button class="btn btn-white" type="button" onclick="merchantInput_back()">返回</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
    </div>
</body>
<script type="text/javascript">

	var shid = $("input[name = shid]").val();
	
	$.validator.addMethod("checkMerchantnameExist", function(value, element, param){
        var res = true;
        $.ajax({
            type:"POST",
            async: false, 
            url:"/admin/merchant.do?checkMerchantnameExist",
            dataType : 'json',
            data: {
            	shid : shid,
            	merchantname : value
            },
            success:function(data){
           		res = !data.success;
            }
        });
        return res;
    },"<font color='#E47068'>商户名已存在</font>");

	var form = $('body').find('form');
	form.validate({
		rules : {
	        merchantname : {checkMerchantnameExist : true}
	    },
		submitHandler: function(f) {
			$.ajax({
				url : '/admin/merchant.do?save',
				type: 'post',
				data : $(f).serialize(),
				dataType : 'json',
				success: function(res) {
				    layer.msg(res.title);
				    if(res.success){
				    	setTimeout(function(){ merchantInput_back(); }, 1000);
				    }
				},
				error: function(data) {
					layer.msg(data);
				}
			});
		}
	});

	var merchantInput_back = function(){
		window.history.back();
	};
	
	var merchant_initDatas = function() {
		$.ajax({
			url:'/admin/user.do?users',
			type: 'post',
			data: { shid: shid},
			dataType: 'json',
			success: function(res) {
				var html = template('merchant-userList-template', {users: res});
				$('#merchant-userList-content').html(html);
			}
		});
	};
	merchant_initDatas();
</script>
</html>
 
