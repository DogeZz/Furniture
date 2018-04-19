<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML >
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>家具类型编辑</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/views/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/views/common/animate.min.css" rel="stylesheet">
    <link href="/views/common/style.css?v=4.1.0" rel="stylesheet">
    
    <script src="/views/common/jquery.min.js"></script>
    <script src="/views/common/bootstrap/js/bootstrap.min.js"></script>
    <script src="/views/common/jquery.validate.min.js"></script>
    <script src="/views/common/layer/layer.js"></script>
    <script src="/views/common/until.js"></script>
    
</head>
<body class="gray-bg" style="padding-left: 20px;">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins  animated fadeInRight">
	        <div class="ibox-title">
	            <h5>编辑家具类型<small>此功能添加或编辑家具类型基本数据</small></h5>
	        </div>
	        <div class="ibox-content">
	            <form action="" method="post" class="form-horizontal">
	            	<input type="hidden" name="lxid" value="${data.lxid}">
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">类型名称：</label>
	                    <div class="col-sm-6">
	                        <input type="text" class="form-control" name="lxmc" value="${data.lxmc}" placeholder="输入类型名称" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">等级：</label>
	                    <div class="col-sm-2">
	                        <input type="number" class="form-control" name="dj" value="${data.dj}" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <div class="col-sm-4 col-sm-offset-2">
	                        <button class="btn btn-primary" type="submit">保存内容</button>
	                        <button class="btn btn-white" type="button" onclick="furnitureTypeInput_back()">返回</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
    </div>
</body>
<script type="text/javascript">

	var form = $('body').find('form');
	form.validate({
		submitHandler: function(f) {
			$.ajax({
				url : '/admin/furnitureType.do?save',
				type: 'post',
				data : $(f).serialize(),
				dataType : 'json',
				success: function(res) {
				    layer.msg(res.title);
				    if(res.success){
				    	setTimeout(function(){ furnitureTypeInput_back(); }, 1000);
				    }
				},
				error: function(data) {
					layer.msg(data);
				}
			});
		}
	});

	var furnitureTypeInput_back = function(){
		window.history.back();
	};

</script>
</html>
 
