<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>用户列表</title>
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
             <div id="userList-gridToolbar" class="btn-group">
				<button onclick="userList_add()" class="btn btn-primary " type="button"><i class="fa fa-plus"></i>&nbsp;添加</button>
            </div>
			<table id="userList-grid"></table>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	$('#userList-grid').bootstrapTable({
		toolbar: '#userList-gridToolbar',
		url: '/admin/user.do?datas',
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
		idField: 'yhid',
		iconSize: 'outline',
	    columns: [
	   		{field: 'username',title: '用户名', width: 60},
	   		{field: 'zsxm',title: '真实名称', width: 60},
	   		{field: 'xb', title:'性别', width: 60, formatter: function(value, row, index) {
	        	if (value) return '女';
	   			else return '男';
	        }},
	        {field: 'yhtx',title: '用户头像', align: 'center', width: 110, formatter: function(value, row, index) {
	   			if(value === '' || value === null || value === undefined){value = '/views/admin/imgs/User-005.png';}
	        	return '<img alt="用户头像" src="'+value+'" onclick="lookImg(\''+ value +'\')" onerror="javascript:this.src=\'/views/admin/imgs/User-005.png\');" style="max-width:100px;max-height:100px;cursor: pointer;">';
	        }},
	        {field: 'yhlx', title:'用户类型', width: 60, formatter: function(value, row, index) {
	        	if (value == 1) return '商铺';
	   			else if (value == 2) return '普通用户';
	   			else return '超级管理员';
	        }},
	        {field: 'xgsj', title: '最后修改时间', width: 60, formatter: function(value, row, index) {
	        	return new Date(value.time).Format('yyyy-MM-dd hh:mm:ss');
	        }},
	        {field: 'yhid', title: '主要操作', width: 80, formatter: function(value, row, index) {
	        	var btnhtml = '<div class="float-e-margins">' +
					'<button onclick="userList_edit(\'' +value + '\')" class="btn btn-xs btn-info " type="button"><i class="fa fa-paste"></i> 编辑</button> ' +
					'<button onclick="userList_delete(\'' +value + '\')" class="btn btn-xs btn-danger " type="button"><i class="fa fa-close"></i> 删除</button>' +
				'</div>';
	        	return btnhtml;
	        }}
	    ]
	});
	
	var userList_add = function() {
		$(this)[0].location.href = 'user.do?add';
	};
	
	var userList_edit = function(value) {
		$(this)[0].location.href = 'user.do?edit&yhid=' + value;
	};
	
	var userList_delete = function(value) {
		var index = layer.open({
			title: '提示',
			icon: 0,
			btn: ['确定', '取消'],
			content: '您确定要删除该用户数据吗？',
			cancel: function() {},
			yes: function() {
				$.ajax({
					url : '/admin/user.do?delete',
					type: 'post',
					data : {yhid: value},
					dataType : 'json',
					success : function(res) {
						if(res.success) {
							$('#userList-grid').bootstrapTable('refresh');
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
 
