<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>商户列表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
             <div id="merchantList-gridToolbar" class="btn-group">
				<button onclick="merchantList_add()" class="btn btn-primary " type="button"><i class="fa fa-plus"></i>&nbsp;添加</button>
            </div>
			<table id="merchantList-grid"></table>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	$('#merchantList-grid').bootstrapTable({
		toolbar: '#merchantList-gridToolbar',
		url: '/admin/merchant.do?datas',
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
		idField: 'shid',
		iconSize: 'outline',
	    columns: [
	   		{field: 'shmc',title: '商户名', width: 60},
	   		{field: 'yhmc',title: '用户名称', width: 60},
	   		{field: 'shms',title: '描述', width: 60},
	   		{field: 'shtx',title: '商户头像', align: 'center', width: 110, formatter: function(value, row, index) {
	   			if(value === '' || value === null || value === undefined){value = '/views/admin/imgs/User-005.png';}
	        	return '<img alt="商户头像" src="'+value+'" onclick="lookImg(\''+ value +'\')" onerror="javascript:this.src=\'/views/admin/imgs/User-005.png\');" style="max-width:100px;max-height:100px;cursor: pointer;">';
	        }},
	        {field: 'xgsj', title: '最后修改时间', width: 60, formatter: function(value, row, index) {
	        	return new Date(value.time).Format('yyyy-MM-dd hh:mm:ss');
	        }},
	        {field: 'shid', title: '主要操作', width: 80, formatter: function(value, row, index) {
	        	var btnhtml = '<div class="float-e-margins">' +
					'<button onclick="merchantList_edit(\'' +value + '\')" class="btn btn-xs btn-info " type="button"><i class="fa fa-paste"></i> 编辑</button> ' +
					'<button onclick="merchantList_delete(\'' +value + '\')" class="btn btn-xs btn-danger " type="button"><i class="fa fa-close"></i> 删除</button>' +
				'</div>';
	        	return btnhtml;
	        }}
	    ]
	});
	
	var merchantList_add = function() {
		$(this)[0].location.href = 'merchant.do?add';
	};
	
	var merchantList_edit = function(value) {
		$(this)[0].location.href = 'merchant.do?edit&shid=' + value;
	};
	
	var merchantList_delete = function(value) {
		var index = layer.open({
			title: '提示',
			icon: 0,
			btn: ['确定', '取消'],
			content: '您确定要删除该商户数据吗？',
			cancel: function() {},
			yes: function() {
				$.ajax({
					url : '/admin/merchant.do?delete',
					type: 'post',
					data : {shid: value},
					dataType : 'json',
					success : function(res) {
						if(res.success) {
							$('#merchantList-grid').bootstrapTable('refresh');
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
 
