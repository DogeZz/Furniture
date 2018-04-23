<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告添加</title>
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
</html>