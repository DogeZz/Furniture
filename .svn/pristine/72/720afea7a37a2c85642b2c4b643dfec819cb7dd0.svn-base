	yhlx = $("#yhlx_hidden").val();
	//根据用户类型的不同显示不用的菜单，实现权限的管理。
	nav = $(".nav_son");
	if(yhlx == "学生"){
		nav.eq(0).remove();
		nav.eq(1).remove();
		nav.eq(3).remove();
	}else if(yhlx == "教师"){
		nav.eq(0).remove();
		nav.eq(2).remove();
		nav.eq(3).remove();
	}
	//中间板块的页面显示。
	var homePage_menuSubmit = function(url,name){	
		//先判断所请求页面是否已经存在
		var hasTab = $('#homePage_center').tabs('getTab', name);
		if(hasTab == null) {
			if(url === '') return false;
			$('#homePage_center').tabs('add', {
				title: name,
				tools:[{
					iconCls: 'icon-mini-refresh',
					handler: function() {
						$('#homePage_center').tabs('getTab', name).panel('refresh', url);
					}
				}],
				href: url,
				closable: true
			});
		}else {
			$('#homePage_center').tabs('select', name);
			hasTab.panel('refresh', url);
		}
	};
	//鼠标进入和离开时的a连接颜色变化。
	$(".nav_son p a").mouseenter(function(){
		$(this).css("color","green");
	});
	$(".nav_son p a").mouseleave(function(){
		$(this).css("color","black");
	});
	//格式转换的两个统用方法。
	var formatBoolean = function(value, row, index){
    	if (value) return "<font color='green'>是</font>";
    	else return "<font color='red'>否</font>";
	};

	var formatDate = function(value, row, index) {
		return new Date(value.time).Format("yyyy-MM-dd hh:mm:ss");
	};