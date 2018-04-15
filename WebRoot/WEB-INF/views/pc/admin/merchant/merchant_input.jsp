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
	                    <label class="col-sm-1 control-label">商户头像</label>
	                    <div class="col-sm-11">
	                    	<img id="merchant-txImg" src="${data.shtx}" onerror="Javascript:this.src='/views/admin/imgs/User-005.png';" style="max-width:450px;max-height:250px;margin-right:15px;">
	                    	<button class="btn btn-primary" type="button" onclick="merchant_uploadImg(0)">上传图片</button>
	                        <input id="merchant-txImg-input" type="hidden" class="form-control" name="shtx" value="${data.shtx}" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">商户背景</label>
	                    <div class="col-sm-11">
	                    	<img id="merchant-bjImg" src="${data.shbjt}" onerror="Javascript:this.src='/views/front/images/shop_img_03.png';" style="max-width:450px;max-height:250px;margin-right:15px;">
	                    	<button class="btn btn-primary" type="button" onclick="merchant_uploadImg(1)" >上传图片</button>
	                        <input id="merchant-bjImg-input" type="hidden" class="form-control" name="shbjt" value="${data.shbjt}" required>
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
	            <form method="post" enctype="multipart/form-data" id="merchantData-edit-upload">
					<input type="file" name="upload" class="merchant-fmtimg" style="display:none;" onchange="merchantInput_imgurl(this.value)"/>
				</form>
	        </div>
	    </div>
    </div>
</body>
<script type="text/javascript">

	var shid = $("input[name = shid]").val();
	var txlx = 0;
	
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
	
	var merchant_uploadImg = function(value){
		txlx = value;
    	$(".merchant-fmtimg").click();
    };
    
    var merchantInput_imgurl = function(){
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
					data: new FormData($('#merchantData-edit-upload')[0]),
					processData: false,
		        	contentType: false,
					success : function(data){
						 parent.layer.close(uploadImgLoad);
						 var res = eval ("(" + data + ")");
						 var title = res.error == 0 ? "上传成功" : "上传失败";
						 var index = parent.layer.alert(title, function() {
							 if(txlx == 0){ //头像
								 $("#merchant-txImg").attr("src", res.url);
							  	$("#merchant-txImg-input").val(res.url);
							 } else { //背景图
								 $("#merchant-bjImg").attr("src", res.url);
							  	$("#merchant-bjImg-input").val(res.url);
							 }
						  	 parent.layer.close(index);
						 });
					}
				});				
			}
		});
	}
</script>
</html>
 
