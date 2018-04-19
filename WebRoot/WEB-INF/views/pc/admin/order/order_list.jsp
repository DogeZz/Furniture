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
			<table id="orderList-grid"></table>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	$('#orderList-grid').bootstrapTable({
		toolbar: '#orderList-gridToolbar',
		url: '/admin/order.do?datas',
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
		idField: 'ddid',
		iconSize: 'outline',
	    columns: [
	   		{field: 'zsxm',title: '真实名称', width: 60},
	   		{field: 'jjbt',title: '家具标题', width: 60},
	   		{field: 'sl',title: '数量', width: 60},
	   		{field: 'ze',title: '总额', width: 60},
	   		{field: 'ddzt', title: '订单状态', width: 60, formatter: function(value, row, index) {
	   			if(value == 0){
		        	return "<span style='color: blue;'>等待用户付款</span>";
	        	}else if(value == 1){
	        		return "<span style='color: green;'>请您发货</span>";
	        	}else if(value == 2){
	        		return "<span style='color: yello;'>等待用户收货</span>";
	        	}else if(value == 3){
	        		return "<span style='color: red;'>交易完成</span>";
	        	}
	        }},
	        {field: 'cjsj', title: '时间', width: 60, formatter: function(value, row, index) {
	        	return new Date(value.time).Format('yyyy-MM-dd hh:mm:ss');
	        }},
	        {field: 'ddid', title: '主要操作', width: 40, formatter: function(value, row, index) {
	        	if(row.ddzt == 1){
		        	var btnhtml = '<div class="float-e-margins">' +
						'<button onclick="toFH(\'' +value + '\')" class="btn btn-xs btn-info " type="button"><i class="fa fa-paste"></i> 发货</button> ' +
					'</div>';
		        	return btnhtml;
	        	}
	        }}
	    ]
	});
	
	var toFH = function(value){
		$.ajax({
			url:'/admin/order.do?save', 
			type: 'post',
			data: { 
				ddid : value
			}, 
			dataType: 'json',
			success: function(res) {
				 layer.msg(res.title);
				 $('#orderList-grid').bootstrapTable('refresh');
			}
		}); 
	}
</script>
</html>
 
