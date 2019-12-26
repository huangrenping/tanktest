
/**
 * 购物车管理
 */
$(function(){
	//一点击购物车,根据用户id进行循环加载
	getshopall();
	
	/**
	 * 点击check，数值进行累计相加
	 */
	getbtn();
	
	/**
	 * 点击结算按钮,跳转到支付页面
	 */
	getbalance();
	
	/**
	 * 点击删除购物车
	 */
	getdelete();
	
	
});

var currprice=parseFloat(0);
var arrindex;
//一点击购物车,根据用户id进行循环加载
function getshopall(){
	/**
	 *直接全查询(最后，在添加ID)
	 */
	var uid = $("#uid").val();
	$.ajax({
		url:webPath+'/shopCat/selectShopCatById',
		dataType:'json',
		data:{"uid":1},
		type:'post',
		error:function(){
			
		},	
		success:function(mydata){
			var date = mydata.data.list;
			if(date.length>0){
			$.each(date,function(index,shopCat){
				arrindex=index;
				var id = shopCat.id;
				var price = shopCat.price;
				var num=shopCat.num;
			  $("#div1").append("<div class='weui-panel weui-panel_access'>"+
			"<div class='weui-panel__bd'>"+
				"<div class='weui-media-box_appmsg pd-10'>"+
					"<div class='weui-media-box__hd check-w weui-cells_checkbox'>"+
							"<label class='weui-check__label'>"+
							"<div class='weui-cell__hd cat-check'>"+
								"<input type='checkbox' sunnumFlag="+index+" xiong='"+price+"'gooimg='"+shopCat.goodsImg+"' gooid='"+shopCat.goodsId+"' sc='"+shopCat.specificationsInfo+"' fan='"+id+"' class='weui-check myprice' name='cartpro'"+
									"id='"+id+"'><i class='weui-icon-checked'></i>"+
							"</div>"+
						"</label>"+
					"</div>"+
					"<div class='weui-media-box__hd'>"+
						"<a href='"+webPath+"/showGoodsDetail/"+shopCat.goodsId+"'  ><img id=img"+id+" class='weui-media-box__thumb'"+
							"src='"+webPath+"/"+shopCat.goodsImg+"' alt='' id='img'></a>"+
					"</div>"+
					"<div class='weui-media-box__bd'>"+
						"<h1 class='weui-media-box__desc'>"+
							"<a href='"+webPath+"/showGoodsDetail/"+shopCat.goodsId+"' class='ord-pro-link'>"+shopCat.title+"</a>"+
						"</h1>"+
						"<p class='weui-media-box__desc  '>尺码："+shopCat.specificationsInfo+"</p>"+
						"<div class='clear mg-t-10'>"+
							"<div class='wy-pro-pri fl'>"+
								"单价¥<em class='num font-15' >"+shopCat.price+"</em>"+
							"</div>"+
							"<div class='pro-amount fr'>"+
								"<div class='Spinner sunnum"+index+"' num="+num+" delflag=0 myid='"+id+"'  price='"+price+"'  id='sdid'></div>"+
							"</div>"+
						"</div>"+
					"</div>"+
				"</div>"+
			"</div>"+
		"</div>");
				$(".sunnum"+index).Spinner({ 
					max : 999,
					value:num
			})
			});	

	}else{
		 $("#div1").append("<p align='center'>亲，您的购物车没东西快去购物吧！</p>");
	}

var endoffset=$("#balancef").offset();
//当点击+增加
$(document).on('click','.Increase',function(event){
	var $img=$("#img"+$(this).parent().attr("myid"));
	var startoffset=$img.offset();
	var img = $img.attr('src');
	var flyer = $('<img style="border-radius:50%;width:80px;height:80px;;" class="u-flyer" src="'+img+'">');
	flyer.fly({
		start:{
			left:startoffset.left,
			top:startoffset.top
		},
		end:{
			left:endoffset.left,
			top:endoffset.top,
			width: 0,
        	height: 0
		},
		onEnd:function(){
			this.destory(); //移除dom 
		}
	});
	
	$(this).parent().attr("delflag",1);
	var num=$(this).siblings('.Amount').val();
	if($(this).parent().attr("num")=="0"){
		currprice+=(parseFloat($(this).parent().attr("price"))*2);
		$(this).parent().attr("num",2);
	}else{
		currprice+=parseFloat($(this).parent().attr("price"));
		$(this).parent().attr("num",parseInt($(this).parent().attr("num"))+1);
	}
	$("#"+$(this).parent().attr("myid")).prop("checked","checked");
	$("#priceshop").text(formatNumber(currprice,2,""));
});
//当点击-减少
$(document).on('click','.DisDe',function(){
//	$("#"+$(this).parent().attr("myid")).attr("checked",false);
	if($(this).parent().attr("delflag")=="1"){
		currprice-=(parseFloat($(this).parent().attr("price")));
		$("#priceshop").text(formatNumber(currprice,2,""));
		$(this).parent().attr("delflag",0);
		$(this).parent().attr("num",1);
	}
	
});
//当点击-减少
$(document).on('click','.Decrease',function(){
//	var price=$(this).parents('.pro-amount').prev().children('.num').html();
	var num=$(this).siblings('.Amount').val();
	currprice-=parseFloat($(this).parent().attr("price"));
	$("#priceshop").text(formatNumber(currprice,2,""));
	$(this).parent().attr("num",parseInt($(this).parent().attr("num"))-1);
});



//当手动改变input
$(document).on('change','.Amount',function(){
	var goodsprice= parseFloat($(this).parent().attr("price"));
	$("#"+$(this).parent().attr("myid")).prop("checked","checked");
	$(this).parent().attr("delflag",1);
	var goodsnum=$(this).val();
	var oldnum= $(this).parent().attr("num");
	if(goodsnum>oldnum){
		var $img=$("#img"+$(this).parent().attr("myid"));
	var startoffset=$img.offset();
	var img = $img.attr('src');
	var flyer = $('<img style="border-radius:50%;width:80px;height:80px;;" class="u-flyer" src="'+img+'">');
	flyer.fly({
		start:{
			left:startoffset.left,
			top:startoffset.top
		},
		end:{
			left:endoffset.left,
			top:endoffset.top,
			width: 0,
        	height: 0
		},
		onEnd:function(){
			this.destory(); //移除dom 
		}
	});
		currprice+=goodsprice*(goodsnum-oldnum);
	}else if(goodsnum<oldnum){
		currprice-=goodsprice*(oldnum-goodsnum);
	}
	$(this).parent().attr("num",$(this).val())
	
	$("#priceshop").text(formatNumber(currprice,2,""));
});


		}
	});
	

	
}


/**
 * 点击check，数值进行累计相加
 */

function getbtn(){
	$(document).on('click','.myprice',function(){
		debugger
		var $checkbox = $(this).parents("div").find(".sunnum"+$(this).attr("sunnumFlag"));
		var  goodsnum=parseFloat( $checkbox.attr("num"));
		var goodsprice= parseFloat($(this).attr("xiong"));
		if($(this).prop("checked")==false){
			 $checkbox.find('.Amount').val(1);
			 $checkbox.attr("num",0);
			 $checkbox.attr("delflag",0);
			currprice= currprice-goodsnum*goodsprice;
		}else{
			currprice=currprice+goodsprice*goodsnum;
			 $checkbox.attr("num",goodsnum);
		}
			$("#priceshop").text(formatNumber(currprice,2,""));
		 
	});
}
/**
 * 
 * @汪雄威
 * 代号：还有谁
 * 时间：2017-9-18
 */
function getdelete(){
	$(document).on('click','#delete',function(){
			 var arr =new Array();
			$("input[name=cartpro]:checked").each(function(){
				 var data={};
				 data.id=$(this).attr("fan");
				 arr.push(data);
			});
			$.each(arr,function(index,a){
				console.log(index);
			})
			if(arr.length<=0){
				$.toast("删除不能为空","forbidden");
			}else{
					$.ajax({
						type:"post",
						url:webPath+"/shopCat/todelete",
						dataType:"json",
						async:true,
						data:{"idlist":JSON.stringify(arr)},
						success:function(json){
							layer.msg(data.msg);
							window.location.href=webPath+"/shopCat/toCatByUid";
						}
					});
			}

	});

}
/**
 * 点击结算按
钮,跳转到结算页面
 * @returns
 */
function getbalance(){
	
	$(document).on('click','#balancef',function(){
		
		
		
			 var arr =new Array();
			 var arr1 =new Array();
			$("input[name=cartpro]:checked").each(function(){
				var data={};
				var id=$(this).attr("fan");
				var goodsnum=$(this).parents("div").find(".sunnum"+$(this).attr("sunnumFlag")).attr("num");
				var goodtitle=$(this).parents("div").find(".ord-pro-link").html();
				var goodspecificationsInfo=$(this).attr("sc");
				var img=$(this).attr("gooimg");
				var gid=$(this).attr("gooid");
				var goodprice=$(this).attr("xiong");
				
				data.goodsId=gid;
				data.num=goodsnum;
				data.title=goodtitle;
				data.goodsImg=img;
				data.specificationsInfo=goodspecificationsInfo;
				data.price=goodprice;
				arr.push(data);
				arr1.push(id);
			});
			
			
			$.each(arr,function(index,a){
				console.log(index);
			})
			var name=$("#priceshop").text();
			if(arr.length<=0){
				$.toast("亲,请选择你要购卖的商品哦","forbidden");
			}else{
					$.ajax({
						type:"post",
						url:webPath+"/order/OrderSave",
						dataType:"json",
						async:true,
						data:{"orderList":JSON.stringify(arr),"catids":JSON.stringify(arr1)},
						success:function(data1){
							//正常登录跳转
							if(data1.code==200){
								window.location.href=webPath+"/order/getOneOrderByNo/"+data1.data+"";
							
						    }else{
								$.toast("亲,请先登录","cancel", function() {
									window.location.href=webPath+"/toMobileLogin";
								});
							}
							
						}
					});
			}

	});

}
$(document).ready(function() {
			$(".allselect").click(function() {
				if ($(this).find("input[name=all-sec]").prop("checked")) {
					$("input[name=cartpro]").each(function() {
						if($(this).prop("checked")==false){
							$(this).prop("checked", true);
							var $checkbox = $(this).parents("div").find(".sunnum"+$(this).attr("sunnumFlag"));
							var  goodsnum=parseFloat( $checkbox.attr("num"));
							var goodsprice= parseFloat($(this).attr("xiong"));
							currprice=currprice+goodsprice;
							$checkbox.attr("num",1);
						}
					});
	
				} else {
					$("input[name=cartpro]").each(function() {
						if ($(this).prop("checked")) {
							$(this).prop("checked", false);
						} else {
							$(this).prop("checked", true);
						}
						var $checkbox = $(this).parents("div").find(".sunnum"+$(this).attr("sunnumFlag"));
						var  goodsnum=parseFloat( $checkbox.attr("num"));
						var goodsprice= parseFloat($(this).attr("xiong"));
						
						$checkbox.find('.Amount').val(1);
						$checkbox.attr("num",0);
						$checkbox.attr("delflag",0);
						currprice= 0;
					});
				}
				$("#priceshop").text(formatNumber(currprice,2,""));
			});
	
		});

function formatNumber(num, precision, separator) {
    var parts;
    // 判断是否为数字
    if (!isNaN(parseFloat(num)) && isFinite(num)) {
        // 把类似 .5, 5. 之类的数据转化成0.5, 5, 为数据精度处理做准, 至于为什么
        // 不在判断中直接写 if (!isNaN(num = parseFloat(num)) && isFinite(num))
        // 是因为parseFloat有一个奇怪的精度问题, 比如 parseFloat(12312312.1234567119)
        // 的值变成了 12312312.123456713
        num = Number(num);
        // 处理小数点位数
        num = (typeof precision !== 'undefined' ? num.toFixed(precision) : num).toString();
        // 分离数字的小数部分和整数部分
        parts = num.split('.');
        // 整数部分加[separator]分隔, 借用一个著名的正则表达式
        parts[0] = parts[0].toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1' + (separator || ','));

        return parts.join('.');
    }
    return NaN;
}
