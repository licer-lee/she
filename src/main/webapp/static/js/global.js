/**
 *自定义全局js
*/

$(function(){
	
	//TODO 
	
	
	
});


Date.prototype.format = function (format) {  
    var o = {  
        "M+": this.getMonth() + 1, // month  
        "d+": this.getDate(), // day  
        "h+": this.getHours(), // hour  
        "m+": this.getMinutes(), // minute  
        "s+": this.getSeconds(), // second  
        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter  
        "S": this.getMilliseconds()  
        // millisecond  
    }  
    if (/(y+)/.test(format))  
        format = format.replace(RegExp.$1, (this.getFullYear() + "")  
            .substr(4 - RegExp.$1.length));  
    for (var k in o)  
        if (new RegExp("(" + k + ")").test(format))  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));  
    return format;  
}  
function formatDatebox(value) {  
    if (value == null || value == '') {  
        return '';  
    }  
    var dt;  
    if (value instanceof Date) {  
        dt = value;  
    } else {  
        dt = new Date(value);  
    }  
  
    return dt.format("yyyy-MM-dd hh:mm:ss"); //扩展的Date的format方法(上述插件实现)  
} 



/**  
 * 更换主题
 */  
changeTheme = function(type){  
    var $easyuiTheme = $('#easyuiTheme');  
    var url = $easyuiTheme.attr('href');  
    console.info(url);  
    var href = url.substring(0, url.indexOf('easyui'))+ 'easyui/themes/' + type + '/easyui.css';  
    console.info(href);  
    $easyuiTheme.attr('href',href);  
      
    /* 如果使用了iframe  则要添加下面这段代码、否则的话iframe中的内容不会出现样式的改变  
    var $iframe = $('iframe');  
    if($ifram.length > 0){  
        for ( var i = 0; i < $iframe.length; i++) {  
            var ifr = $iframe[i];  
            $(ifr).contents.find('#easyuiTheme').attr('href', href);  
              
        }  
    }  
    */

    $.cookie('easyuiThemeName', type, {  
        expires : 7  
    });
}; 