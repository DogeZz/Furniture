<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML >
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>家具编辑</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/views/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/views/common/animate.min.css" rel="stylesheet">
    <link href="/views/common/style.css?v=4.1.0" rel="stylesheet">
    <link href="/views/common/summernote/summernote.css" rel="stylesheet">
    <link href="/views/common/summernote/summernote-bs3.css" rel="stylesheet">
    
    <script src="/views/admin/js/jquery-3.2.1.min.js"></script>
    <script src="/views/common/bootstrap/js/bootstrap.min.js"></script>
    <script src="/views/common/jquery.validate.min.js"></script>
    <script src="/views/common/layer/layer.js"></script>
    <script src="/views/common/summernote/summernote.min.js"></script>
	<script src="/views/common/summernote/lang/summernote-zh-CN.js"></script>
    <script src="/views/common/template-web.js"></script>
    <script src="/views/common/until.js"></script>
    
</head>
<body class="gray-bg" style="padding-left: 20px;">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins  animated fadeInRight">
	        <div class="ibox-title">
	            <h5>编辑家具<small>此功能添加或编辑家具基本数据</small></h5>
	        </div>
	        <div class="ibox-content">
	            <form action="" method="post" class="form-horizontal">
	            	<input type="hidden" name="jjid" value="${data.jjid}">
	            	<input type="hidden" name="shid" value="${data.shid}">
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">家具标题：</label>
	                    <div class="col-sm-6">
	                        <input type="text" class="form-control" name="jjbt" value="${data.jjbt}" placeholder="输入家具标题" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">数量：</label>
	                    <div class="col-sm-2">
	                        <input type="number" class="form-control" name="jjsl" value="${data.jjsl}" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">单价：</label>
	                    <div class="col-sm-2">
	                        <input type="number" class="form-control" name="jjjg" value="${data.jjjg}" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">家具类型：</label>
	                    <div class="col-sm-6">
	                        <input class="form-control" name="jjlx" placeholder="输入家具类型" value="${data.jjlx}">
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">家具图片：</label>
	                    <div class="col-sm-11">
	                    	<img id="furniture-txImg" src="${data.jjtp}" onerror="Javascript:this.src='/views/admin/imgs/User-005.png';" style="max-width:450px;max-height:250px;margin-right:15px;">
	                    	<button class="btn btn-primary" type="button" onclick="furniture_uploadImg(0)">上传图片</button>
	                        <input id="furniture-txImg-input" type="hidden" class="form-control" name="jjtp" value="${data.jjtp}" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">等级：</label>
	                    <div class="col-sm-2">
	                        <input type="number" class="form-control" name="jjdj" value="${data.jjdj}" required>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <label class="col-sm-1 control-label">家具详情</label>
	                    <div class="col-sm-10">
                         	<div id="jjxq" name="jjxq" class="summernote">${data.jjxq}</div>
	                    </div>
	                </div>
	                <div class="hr-line-dashed"></div>
	                <div class="form-group">
	                    <div class="col-sm-4 col-sm-offset-2">
	                        <button class="btn btn-primary" type="submit">保存内容</button>
	                        <button class="btn btn-white" type="button" onclick="furnitureInput_back()">返回</button>
	                    </div>
	                </div>
	            </form>
	            <form method="post" enctype="multipart/form-data" id="furnitureData-edit-upload">
					<input type="file" name="upload" class="furniture-fmtimg" style="display:none;" onchange="furnitureInput_imgurl(this.value)"/>
				</form>
	        </div>
	    </div>
    </div>
</body>
<script type="text/javascript">

	var form = $('body').find('form');
	form.validate({
		submitHandler: function(f) {
		   console.log($('#jjxq'))
		   var isZsnrInput = $('input[name="jjxq"]');
// 		   var editor = "<input type='hidden' name='" + $this.attr("name") + "' value='" + $this.code() + "' />";
// 		   form.append(editor);
			$.ajax({
				url : '/admin/furniture.do?save',
				type: 'post',
				data : $(f).serialize(),
				dataType : 'json',
				success: function(res) {
				    layer.msg(res.title);
				    if(res.success){
				    	setTimeout(function(){ furnitureInput_back(); }, 1000);
				    }
				},
				error: function(data) {
					layer.msg(data);
				}
			});
		}
	});

	var furnitureInput_back = function(){
		window.history.back();
	};
	
// 	var furniture_initDatas = function() {
// 		$.ajax({
// 			url:'/admin/user.do?users',
// 			type: 'post',
// 			data: { shid: shid},
// 			dataType: 'json',
// 			success: function(res) {
// 				var html = template('furniture-userList-template', {users: res});
// 				$('#furniture-userList-content').html(html);
// 			}
// 		});
// 	};
// 	furniture_initDatas();
	
	var furniture_uploadImg = function(value){
    	$(".furniture-fmtimg").click();
    };
    
    var furnitureInput_imgurl = function(){
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
					data: new FormData($('#furnitureData-edit-upload')[0]),
					processData: false,
		        	contentType: false,
					success : function(data){
						 parent.layer.close(uploadImgLoad);
						 var res = eval ("(" + data + ")");
						 var title = res.error == 0 ? "上传成功" : "上传失败";
						 var index = parent.layer.alert(title, function() {
							 $("#furniture-txImg").attr("src", res.url);
						  	 $("#furniture-txImg-input").val(res.url);
						  	 parent.layer.close(index);
						 });
					}
				});				
			}
		});
	}
    
    $('#jjxq').summernote({
		lang : 'zh-CN',
		height : 400,
		toolbar : [ [ "style", [ "style" ] ],
				[ "fontsize", [ "fontsize" ] ],
				[ "fontname", [ "fontname" ] ],
				[ "font", [ "bold", "italic", "underline", "clear" ] ],
				[ "color", [ "color" ] ],
				[ "para", [ "ul", "ol", "paragraph" ] ],
				[ "height", [ "height" ] ], [ "table", [ "table" ] ],
				[ "insert", [ "picture", "video" ] ],
				[ "view", [ "fullscreen", "codeview" ] ],
				[ "help", [ "help" ] ] ],
		onImageUpload : function(files, editor, $editable) {
			sysUtils.summernoteUploadImg(files[0], editor, $editable);
		}
	});
	
	$('#jjxq').keyup();
</script>
</html>
 
