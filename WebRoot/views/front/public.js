var username = sessionStorage.getItem("username");
if(username != null && username != "" && username != undefined){
	$(".header_operating").find("a").eq(0).html(username);
	$(".header_operating").find("a").eq(0).attr("href","/front/userCenter.fjsp");
	$(".header_operating").find("a").eq(1).html("退出");
	$(".header_operating").find("a").eq(1).attr("href","javascript: Logout();");
}

var Logout = function(){
	sessionStorage.clear();
	window.location.href = '/front/login.fjsp';
}

var showTopSearch = function(selection, seleceIndex = 1, value = "", scrollHeight){
	var showTopSearchhtml = '<div class="'+ selection +'" style="position:fixed;top:0;left:0; width:100%;z-index: 999;display:none;">'+
								'<div class="logo_style l_f">'+
									'<h1 style="font-weight: 200;font-weight: 600;height: 60px;width: 600px;line-height: 60px;padding-left: 50px;">一家一世界</h1>'+
								'</div>' +
								'<div style="background: #88c523;height: 100%;width:100%;position:absolute;z-index:-999;opacity:0.5;"></div>' +
								'<div class="Search_style" style="margin: 5px auto 6px;background: #fff;">' +
									'<div class="select">' +
									'<h3 style="height:35px; line-height:35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品&nbsp;&nbsp;&nbsp;</h3>'+
								'</div>' +
								'<input name="" type="text" class="add_Search" value="'+ value +'" /> ' +
								'<input name="" type="button" value="" class="submit_Search" onclick="header_toSearch(1)" />' +
							'</div>' +
						'</div>';
	$(document.body).append(showTopSearchhtml);
	scrollHeight ? scrollHeight : scrollHeight = 500;
    $(window).scroll(function(){
        var s = $(window).scrollTop();
        if( s > scrollHeight){
            $("."+selection).show();
        }else{
            $("."+selection).hide();
        };
    });
}

var goToTop = function(selection, min_height){
	var toTopHtml = "<div class="+selection+">"
						+"<a><img src='/views/front/images/goToTop.png' style='max-width:60px;position:fixed;right:2vw;bottom:1vw;cursor:pointer;' /></a>"
					+"</div>";
	$(document.body).append(toTopHtml);
	$("."+selection).hide();
    $("."+selection).click(function(){
        $("html, body").animate({scrollTop : 0}, 600);
    });
    min_height ? min_height = min_height : min_height = 600;
    $(window).scroll(function(){
        var s = $(window).scrollTop();
        if( s > min_height){
            $("."+selection).fadeIn(500);
        }else{
            $("."+selection).fadeOut(500);
        };
    });
};

var header_toSearch = function(index){
	var value = $(".add_Search").eq(index).val();
	window.location.href = "/front/type.fjsp?searchValue=" + value;
}

var getGwcCount = function(selectClass) {
	$.ajax({
		url:'/front/getGwcCount.ajx', 
		type: 'post',
		data: {
			username: sessionStorage.getItem("username")
		}, 
		dataType: 'json',
		success: function(res) {
			$('.'+selectClass).html(res.title);
		}
	});
};

var _yhtx = sessionStorage.getItem("jj_yhtx");
if(_yhtx != null && _yhtx != "" && _yhtx != undefined) $(".header_touxiang img").attr("src", _yhtx);