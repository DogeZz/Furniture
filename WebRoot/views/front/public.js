var username = sessionStorage.getItem("username");
if(username != null && username != "" && username != undefined){
	$(".header_operating").find("a").eq(0).html(username);
	$(".header_operating").find("a").eq(0).attr("href","/front/personalInfo.fjsp");
	$(".header_operating").find("a").eq(1).html("退出");
	$(".header_operating").find("a").eq(1).attr("href","javascript: Logout();");
}

var Logout = function(){
	sessionStorage.clear();
	window.location.href = '/front/login.fjsp';
}