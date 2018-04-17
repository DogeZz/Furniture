<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>家具列表</title>
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
             <div id="furnitureList-gridToolbar" class="btn-group">
				<button onclick="furnitureList_add()" class="btn btn-primary " type="button"><i class="fa fa-plus"></i>&nbsp;添加</button>
            </div>
			<table id="furnitureList-grid"></table>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	$('#furnitureList-grid').bootstrapTable({
		toolbar: '#furnitureList-gridToolbar',
		url: '/admin/furniture.do?datas',
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
		idField: 'jjid',
		iconSize: 'outline',
	    columns: [
	   		{field: 'jjbt',title: '家具标题', width: 60},
	   		{field: 'jjlx',title: '家具类型', width: 60},
	   		{field: 'jjsl',title: '家具数量', width: 60},
	   		{field: 'jjjg',title: '家具单价', width: 60},
	   		{field: 'jjtp',title: '家具图片', align: 'center', width: 110, formatter: function(value, row, index) {
	   			if(value === '' || value === null || value === undefined){value = '/views/admin/imgs/User-005.png';}
	        	return '<img alt="家具头像" src="'+value+'" onclick="lookImg(\''+ value +'\')" onerror="javascript:this.src=\'/views/admin/imgs/User-005.png\');" style="max-width:100px;max-height:100px;cursor: pointer;">';
	        }},
	        {field: 'xgsj', title: '最后修改时间', width: 60, formatter: function(value, row, index) {
	        	return new Date(value.time).Format('yyyy-MM-dd hh:mm:ss');
	        }},
	        {field: 'jjid', title: '主要操作', width: 80, formatter: function(value, row, index) {
	        	var btnhtml = '<div class="float-e-margins">' +
					'<button onclick="furnitureList_edit(\'' +value + '\')" class="btn btn-xs btn-info " type="button"><i class="fa fa-paste"></i> 编辑</button> ' +
					'<button onclick="furnitureList_delete(\'' +value + '\')" class="btn btn-xs btn-danger " type="button"><i class="fa fa-close"></i> 删除</button>' +
				'</div>';
	        	return btnhtml;
	        }}
	    ]
	});
	
	var furnitureList_add = function() {
		$(this)[0].location.href = 'furniture.do?add';
	};
	
	var furnitureList_edit = function(value) {
		$(this)[0].location.href = 'furniture.do?edit&jjid=' + value;
	};
	
	var furnitureList_delete = function(value) {
		var index = layer.open({
			title: '提示',
			icon: 0,
			btn: ['确定', '取消'],
			content: '您确定要删除该家具数据吗？',
			cancel: function() {},
			yes: function() {
				$.ajax({
					url : '/admin/furniture.do?delete',
					type: 'post',
					data : {jjid: value},
					dataType : 'json',
					success : function(res) {
						if(res.success) {
							$('#furnitureList-grid').bootstrapTable('refresh');
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
 
