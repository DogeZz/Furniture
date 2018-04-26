<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>用户列表</title>
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
			<table id="statisticsList-grid"></table>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('#statisticsList-grid').bootstrapTable({
		url: '/admin/statistics.do?datas',
		search: true,
      	showRefresh: true,
      	showColumns: true,
		striped: true,
		cache: false,  
		pagination: true,
		queryParamsType: '',
		queryParams: function(params) {
			params['name'] = params.searchText;
			return params;
		},
		sidePagination: 'client',
		pageNumber: 1,
		pageSize: 25,
		pageList: [10, 25, 50, 100],
		idField: 'jjid',
		iconSize: 'outline',
	    columns: [
	   		{field: 'jjbt',title: '家具标题', width: 300},
	   		{field: 'jjtp',title: '家具图片', align: 'center', width: 60, formatter: function(value, row, index) {
	   			if(value === '' || value === null || value === undefined){value = '/views/admin/imgs/User-005.png';}
	        	return '<img alt="用户头像" src="'+value+'" onclick="lookImg(\''+ value +'\')" onerror="javascript:this.src=\'/views/admin/imgs/User-005.png\');" style="max-width:100px;max-height:100px;cursor: pointer;">';
	        }},
	        {field: 'jjjg',title: '单价', width: 20},
	   		{field: 'xsl',title: '销售量', width: 20},
	   		{field: 'jjsl',title: '剩余量', width: 20}
	    ]
	});

</script>
</html>
 
