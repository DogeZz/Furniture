<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>家具类型列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/views/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/views/common/bootstrap/css/bootstrap-table.min.css" rel="stylesheet">
    <link href="/views/common/animate.min.css" rel="stylesheet">
    
    <script src="/views/admin/js/jquery-3.2.1.min.js"></script>
    <script src="/views/common/bootstrap/js/bootstrap.min.js"></script>
    <script src="/views/common/bootstrap/js/bootstrap-table.min.js"></script>
    <script src="/views/common/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="/views/common/layer/layer.js"></script>
    <script src="/views/common/until.js"></script>
</head>
<body>
	<div class="ibox" style="padding: 0 15px 0 40px;">
        <div class="ibox-content animated fadeInRight">
             <div id="furnitureTypeList-gridToolbar" class="btn-group">
				<button onclick="furnitureTypeList_add()" class="btn btn-primary " type="button"><i class="fa fa-plus"></i>&nbsp;添加</button>
            </div>
			<table id="furnitureTypeList-grid"></table>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	$('#furnitureTypeList-grid').bootstrapTable({
		toolbar: '#furnitureTypeList-gridToolbar',
		url: '/admin/furnitureType.do?datas',
		search: true,
      	showRefresh: true,
      	showColumns: true,
		striped: true,
		cache: false,  
		pagination: true,
		queryParamsType: '',
		queryParams: function(params) {
			params['page'] = params.pageNumber;
			params['rows'] = params.pageSize;
			params['name'] = params.searchText;
			return params;
		},
		sidePagination: 'server',
		pageNumber: 1,
		pageSize: 25,
		pageList: [10, 25, 50, 100],
		idField: 'lxid',
		iconSize: 'outline',
	    columns: [
	   		{field: 'lxmc',title: '类型名称', width: 60},
	   		{field: 'dj',title: '等级', width: 60},
	        {field: 'xgsj', title: '时间', width: 60, formatter: function(value, row, index) {
	        	return new Date(value.time).Format('yyyy-MM-dd hh:mm:ss');
	        }},
	        {field: 'lxid', title: '主要操作', width: 80, formatter: function(value, row, index) {
	        	var btnhtml = '<div class="float-e-margins">' +
					'<button onclick="furnitureTypeList_edit(\'' +value + '\')" class="btn btn-xs btn-info " type="button"><i class="fa fa-paste"></i> 编辑</button> ' +
					'<button onclick="furnitureTypeList_delete(\'' +value + '\')" class="btn btn-xs btn-danger " type="button"><i class="fa fa-close"></i> 删除</button>' +
				'</div>';
	        	return btnhtml;
	        }}
	    ]
	});
	
	var furnitureTypeList_add = function() {
		$(this)[0].location.href = 'furnitureType.do?add';
	};
	
	var furnitureTypeList_edit = function(value) {
		$(this)[0].location.href = 'furnitureType.do?edit&lxid=' + value;
	};
	
	var furnitureTypeList_delete = function(value) {
		var index = layer.open({
			title: '提示',
			icon: 0,
			btn: ['确定', '取消'],
			content: '您确定要删除该家具类型数据吗？',
			cancel: function() {},
			yes: function() {
				$.ajax({
					url : '/admin/furnitureType.do?delete',
					type: 'post',
					data : {lxid: value},
					dataType : 'json',
					success : function(res) {
						if(res.success) {
							$('#furnitureTypeList-grid').bootstrapTable('refresh');
							layer.close(index);
							layer.msg(res.title);
						}
					}
				});				
			}
		});
	};
</script>
</html>