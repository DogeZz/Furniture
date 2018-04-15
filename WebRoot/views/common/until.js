//时间格式化
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

var lookImg = function(value) {
	parent.layer.open({
		title:false,
	    type: 1,
	    skin: 'layui-layer-demo',
		shadeClose: true, 
		maxWidth: window.screen.availWidth,
	    content: '<img src="'+value+'" style="max-width:400px;" />'
	});
};

/**
 * 获取地址栏参数
 * @param name
 * @returns {*}
 */
var getAttribute = function(name) {
	 var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"),
	     r = window.location.search.substr(1).match(reg),
	     qs = '';
	 if (r != null) qs = decodeURIComponent(r[2]);
	 return qs;
};

/**
 * 判断一个对象是否为空.
 * @param _obj
 * @returns {*}
 */
var isNull = function(_obj) {
	 if(_obj == null || _obj == "" || _obj == undefined){
		 return true;
	 } else {
		 return false;
	 }
};

/**
 * 判断一个对象是否不为空.
 * @param _obj
 * @returns {*}
 */
var isNotNull = function(_obj) {
	 if(_obj == null || _obj == "" || _obj == undefined){
		 return false;
	 } else {
		 return true;
	 }
};