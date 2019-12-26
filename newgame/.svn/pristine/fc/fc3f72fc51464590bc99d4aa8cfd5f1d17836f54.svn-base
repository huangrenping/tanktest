//将表单序列化成json
( function ($){
	$.fn.serializeJson= function (){
		var serializeObj={};
		$( this .serializeArray()).each( function (){
			serializeObj[ this .name]= this .value .trim();
		});
		return serializeObj;
	};
})(jQuery);



var common={
	showPage:function(pages,pageNum,showDataList){
        var pagination = new Pagination({
      	  wrap: $('.am-pagination'), // 存放分页内容的容器
      	  count: pages, // 总页数
      	  current: pageNum, // 当前的页数（默认为1）
      	  prevText: '上一页', // prev 按钮的文本内容
      	  nextText: '下一页', // next 按钮的文本内容
      	  callback: function(page) { // 每一个页数按钮的回调事件
      	    if(showDataList){
      	    	showDataList(page);
      	    }
      	  }
      	});
	},

   showConsole:function(){
	   console.log("%c", "padding:50px 300px;line-height:150px;background:url('http://www.myhopu.com/skin/style/images/logo.jpg?2016') no-repeat;");	  
	   console.log('%chttp://www.myhopu.com/', 'background-image:-webkit-gradient( linear, left top, right top, color-stop(0, #f22), color-stop(0.15, #f2f), color-stop(0.3, #22f), color-stop(0.45, #2ff), color-stop(0.6, #2f2),color-stop(0.75, #2f2), color-stop(0.9, #ff2), color-stop(1, #f22) );color:transparent;-webkit-background-clip: text;font-size:2em;');
	   console.log('%c加入我们吧', 'background-image:-webkit-gradient( linear, left top, right top, color-stop(0, #f22), color-stop(0.15, #f2f), color-stop(0.3, #22f), color-stop(0.45, #2ff), color-stop(0.6, #2f2),color-stop(0.75, #2f2), color-stop(0.9, #ff2), color-stop(1, #f22) );color:transparent;-webkit-background-clip: text;font-size:2em;');
	   //console.log("%c加入我们吧"," text-shadow: 0 1px 0 #ccc,0 2px 0 #c9c9c9,0 3px 0 #bbb,0 4px 0 #b9b9b9,0 5px 0 #aaa,0 6px 1px rgba(0,0,0,.1),0 0 5px rgba(0,0,0,.1),0 1px 3px rgba(0,0,0,.3),0 3px 5px rgba(0,0,0,.2),0 5px 10px rgba(0,0,0,.25),0 10px 10px rgba(0,0,0,.2),0 20px 20px rgba(0,0,0,.15);font-size:5em")
}
}
// 打波广告
//common.showConsole();




// 无数据样式
var hp_noData='<div class="am-u-sm-3 am-u-sm-offset-5">' +
'<span class="">暂无数据</span>' +
'</div>';
