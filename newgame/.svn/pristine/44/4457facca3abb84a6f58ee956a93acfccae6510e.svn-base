<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.card.CardManager,
    java.util.*,
    web.webSocket.util.GameServerManager,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.card.Card"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/app.css">
    <script src="<%=path %>/assets/js/jquery.min.js"></script>
    <script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/app.js"></script>
    <script src="<%=path %>/assets/js/theme.js"></script>
    <script src="<%=path %>/assets/js/amazeui-pagination.js"></script>
    <%
     		Map<Integer, Card> cardmap=CardManager.getInstance().getCardmap();
			List<Card> listcard=new ArrayList<Card>();
			Collection<Card> cardlist=cardmap.values();
			listcard.addAll(cardlist);
			request.setAttribute("listcard", listcard);
			//每页最大显示数量
			int size=16;
			//总页数
			int PageCount=0;
			if(listcard.size()%size==0)
			{
				PageCount=listcard.size()/size;
			}else{
				PageCount=listcard.size()/size+1;
			}
			//总条数
			request.setAttribute("max", listcard.size());
			request.setAttribute("size", size);
			String pageNo=request.getParameter("pageNo");
    		if(pageNo==null || pageNo.equals("")){
    			pageNo="1";
    		}
    		request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageCount", PageCount);
			JSONArray listArray=JSONArray.fromObject(listcard);
     		request.setAttribute("listArray", listArray);
     		request.setAttribute("weburl2", GameServerManager.getInstance().getWeburl2());
	%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
				layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			getreceedit();
			getknapsack();
			selectwg();
			homepage();
			previouspage();
			nextpage();
			lastpage();
			jump();
		});

	 //编辑弹窗
	 function getreceedit(){
	 	$(document).on('click','#selectoneuser',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑用户'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/wgupdate.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
 	 
	 //查询玩家
	 function selectwg(){
	 	$(document).on('click','#queryuser',function(){
	 		var carname=document.getElementById("carname").value;
	 		carname=$.trim(carname);
	 		document.getElementById("carname").value=carname; 
	 		var cardquality=document.getElementById("cardquality").value;
	 		cardquality=$.trim(cardquality);
	 		document.getElementById("cardquality").value=cardquality; 
			$("#addressbody").empty();
			var list=new Array();
	 		var content="";
	 		if(carname=="" || carname==null){
	 			 		$.each(${listArray},function(index,card){
	 							list.push(card);
	 					});		
	 		}
	 		if(carname!="" && carname!=null){
	 			 		$.each(${listArray},function(index,card){
	 						if(card.name.indexOf(carname) != -1){
	 							list.push(card);
	 						}
	 					});		
	 		}
	 		if(cardquality!="" && cardquality!=null){
				for(var i=list.length-1;i>=0;i--){
	   				if(parseInt(list[i].quality)!=parseInt(cardquality)){
	   					list.splice(i,1);
	   				}
				}
			}
	 		for(var i=0;i<list.length;i++){
					content+='<tr>'+
								 '<td>'+(parseInt(i)+1)+'</td>' +
 								 '<td class="am-text-middle" style="display: none">'+list[i].id+'</td>' +
                                 '<td>'+list[i].name+'</td>' +
                                 '<td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/'+list[i].iconname+'" /></td>' +
                                 '<td>'+list[i].quality+'</td>' +
                                 '<td>'+list[i].taste+'</td>' +
                                 '<td>'+list[i].disposition+'</td>' +
                                 '<td>'+list[i].practicality+'</td>' +
                                 '<td>'+list[i].temperament+'</td>' +
                                 '<td>'+list[i].toid+'</td>' +
								 '<td class="am-text-middle">'+
                                    '</td>'+
				             '</tr>';
			}
	 		/* if((carname!="" && carname!=null) && (cardquality==null || cardquality=="")){
	 			 		$.each(${listArray},function(index,card){
	 					if(card.name.indexOf(carname) != -1){
	 						content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" style="display: none">'+card.id+'</td>' +
                                 '<td>'+card.name+'</td>' +
                                 '<td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/'+card.iconname+'" /></td>' +
                                 '<td>'+card.quality+'</td>' +
                                 '<td>'+card.taste+'</td>' +
                                 '<td>'+card.disposition+'</td>' +
                                 '<td>'+card.practicality+'</td>' +
                                 '<td>'+card.temperament+'</td>' +
                                 '<td>'+card.toid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 编辑'+
                                        	'</a>'+
                                        	'<a id="info" class="updateBtn" href="javascript:;">'+
                                           	'<i class="am-icon-pencil"></i> 信息'+
                                       	'</a>'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 				}
	 			});
	 		}else if(carname!="" && carname!=null && cardquality!=null && cardquality!=""){
	 			 		$.each(${listArray},function(index,card){
	 					if(card.name.indexOf(carname) != -1 && parseInt(card.quality)==parseInt(cardquality)){
	 						content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" style="display: none">'+card.id+'</td>' +
                                 '<td>'+card.name+'</td>' +
                                 '<td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/'+card.iconname+'" /></td>' +
                                 '<td>'+card.quality+'</td>' +
                                 '<td>'+card.taste+'</td>' +
                                 '<td>'+card.disposition+'</td>' +
                                 '<td>'+card.practicality+'</td>' +
                                 '<td>'+card.temperament+'</td>' +
                                 '<td>'+card.toid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 编辑'+
                                        	'</a>'+
                                        	'<a id="info" class="updateBtn" href="javascript:;">'+
                                           	'<i class="am-icon-pencil"></i> 信息'+
                                       	'</a>'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 				}
	 			});
	 		}else if((carname=="" || carname==null) && cardquality!=null && cardquality!=""){
	 			 		$.each(${listArray},function(index,card){
	 					if(parseInt(card.quality)==parseInt(cardquality)){
	 						content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" style="display: none">'+card.id+'</td>' +
                                 '<td>'+card.name+'</td>' +
                                 '<td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/'+card.iconname+'" /></td>' +
                                 '<td>'+card.quality+'</td>' +
                                 '<td>'+card.taste+'</td>' +
                                 '<td>'+card.disposition+'</td>' +
                                 '<td>'+card.practicality+'</td>' +
                                 '<td>'+card.temperament+'</td>' +
                                 '<td>'+card.toid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 编辑'+
                                        	'</a>'+
                                        	'<a id="info" class="updateBtn" href="javascript:;">'+
                                           	'<i class="am-icon-pencil"></i> 信息'+
                                       	'</a>'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 				}
	 			});
	 		}else if((carname=="" || carname==null) && (cardquality==null || cardquality=="")){
	 			$.each(${listArray},function(index,card){
	 			if(index>=0){
	 			if(index<${size}){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" style="display: none">'+card.id+'</td>' +
                                 '<td>'+card.name+'</td>' +
                                 '<td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/'+card.iconname+'" /></td>' +
                                 '<td>'+card.quality+'</td>' +
                                 '<td>'+card.taste+'</td>' +
                                 '<td>'+card.disposition+'</td>' +
                                 '<td>'+card.practicality+'</td>' +
                                 '<td>'+card.temperament+'</td>' +
                                 '<td>'+card.toid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 编辑'+
                                        	'</a>'+
                                        	'<a id="info" class="updateBtn" href="javascript:;">'+
                                           	'<i class="am-icon-pencil"></i> 信息'+
                                       	'</a>'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 			}
	 			}
	 		});
	 		} */
	 		$("#addressbody").append(content); 
	 	});
	 };
	 
	 //首页
	 function homepage(){
	 	$(document).on('click','#homepage',function(){
	 		var pageno=document.getElementById("pageNo").value;
	 		if(pageno==1){
	 			layer.msg("已是首页！");
	 			return;
	 		}
	 		document.getElementById("pageNo").value="1";
			$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,card){
	 			if(index>=0){
	 			if(index<${size}){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" style="display: none">'+card.id+'</td>' +
                                 '<td>'+card.name+'</td>' +
                                 '<td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/'+card.iconname+'" /></td>' +
                                 '<td>'+card.quality+'</td>' +
                                 '<td>'+card.taste+'</td>' +
                                 '<td>'+card.disposition+'</td>' +
                                 '<td>'+card.practicality+'</td>' +
                                 '<td>'+card.temperament+'</td>' +
                                 '<td>'+card.toid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	/* '<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 编辑'+
                                        	'</a>'+
                                        	'<a id="info" class="updateBtn" href="javascript:;">'+
                                           	'<i class="am-icon-pencil"></i> 信息'+
                                       	'</a>'+ */
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 			}
	 			}
	 		});
	 		$("#addressbody").append(content); 
	 	});
	 };
	 
	 //跳转
	 function jump(){
	 	$(document).on('click','#jumpbut',function(){
	 		var jump=document.getElementById("jumptext").value;
	 		var pageno=document.getElementById("pageNo").value;
	 		if(jump==pageno){
	 			layer.msg("已是当前页！");
	 			return;
	 		}
	 		if(jump.length==0){
	 			layer.msg("请输入页码！");
	 			return false;
	 		}
	 		if(isNaN(jump)){
				layer.msg("页码只能输入数字！");
			}else{
	 		document.getElementById("pageNo").value=jump;
	 		$("#addressbody").empty();
	 		var content="";
	 		if(jump>=1 && jump<=${pageCount}){
	 		$.each(${listArray},function(index,card){
	 			if(index>=${size}*(jump-1)){
	 			if(index<${size}*jump){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" style="display: none">'+card.id+'</td>' +
                                 '<td>'+card.name+'</td>' +
                                 '<td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/'+card.iconname+'" /></td>' +
                                 '<td>'+card.quality+'</td>' +
                                 '<td>'+card.taste+'</td>' +
                                 '<td>'+card.disposition+'</td>' +
                                 '<td>'+card.practicality+'</td>' +
                                 '<td>'+card.temperament+'</td>' +
                                 '<td>'+card.toid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	/* '<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 编辑'+
                                        	'</a>'+
                                        	'<a id="info" class="updateBtn" href="javascript:;">'+
                                           	'<i class="am-icon-pencil"></i> 信息'+
                                       	'</a>'+ */
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 			}
	 			}
	 		});
	 		}
	 		$("#addressbody").append(content);   
	 		}  
	 	});
	 };
	 
	 
	 //上一页
	 function previouspage(){
	 	$(document).on('click','#previouspage',function(){
	 		var pageno=document.getElementById("pageNo").value;
	 		var page=1;
	 		if(pageno==1){
	 			layer.msg("已是首页！");
		 		return;
	 		}else{
	 			page=parseInt(pageno)-1;
		 		document.getElementById("pageNo").value=page;
	 		}
			document.getElementById("pageNo").value=page;
	 		$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,card){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" style="display: none">'+card.id+'</td>' +
                                 '<td>'+card.name+'</td>' +
                                 '<td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/'+card.iconname+'" /></td>' +
                                 '<td>'+card.quality+'</td>' +
                                 '<td>'+card.taste+'</td>' +
                                 '<td>'+card.disposition+'</td>' +
                                 '<td>'+card.practicality+'</td>' +
                                 '<td>'+card.temperament+'</td>' +
                                 '<td>'+card.toid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	/* '<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 编辑'+
                                        	'</a>'+
                                        	'<a id="info" class="updateBtn" href="javascript:;">'+
                                           	'<i class="am-icon-pencil"></i> 信息'+
                                       	'</a>'+ */
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 			}
	 			}
	 		});
	 		$("#addressbody").append(content);     
	 	});
	 };
	 
	 //下一页
	 function nextpage(){
	 	$(document).on('click','#nextpage',function(){
	 		var pageno=document.getElementById("pageNo").value;
	 		var lastpage=document.getElementById("lastpage").value;
	 		var page;
	 		if(pageno==lastpage){
	 			 layer.msg("已是末页！");
	 			 return;
	 		}else{
	 			 page=parseInt(pageno)+1;	
	 		}
	 		document.getElementById("pageNo").value=page;
	 		$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,card){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" style="display: none">'+card.id+'</td>' +
                                 '<td>'+card.name+'</td>' +
                                 '<td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/'+card.iconname+'" /></td>' +
                                 '<td>'+card.quality+'</td>' +
                                 '<td>'+card.taste+'</td>' +
                                 '<td>'+card.disposition+'</td>' +
                                 '<td>'+card.practicality+'</td>' +
                                 '<td>'+card.temperament+'</td>' +
                                 '<td>'+card.toid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	/* '<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 编辑'+
                                        	'</a>'+
                                        	'<a id="info" class="updateBtn" href="javascript:;">'+
                                           	'<i class="am-icon-pencil"></i> 信息'+
                                       	'</a>'+ */
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 			}
	 			}
	 		});
	 		$("#addressbody").append(content);             
	 	});
	 };
	 //末页
	 function lastpage(){
	 	$(document).on('click','#lastpage',function(){
	 		var pageno=document.getElementById("pageNo").value;
	 		var lastpage=document.getElementById("lastpage").value;
	 		if(pageno==lastpage){
	 			layer.msg("已是末页！");
	 			return;
	 		}
	 		document.getElementById("pageNo").value=lastpage;
			$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,card){
	 			if(index>=(lastpage-1)*${size}){
							content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" style="display: none">'+card.id+'</td>' +
                                 '<td>'+card.name+'</td>' +
                                 '<td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/'+card.iconname+'" /></td>' +
                                 '<td>'+card.quality+'</td>' +
                                 '<td>'+card.taste+'</td>' +
                                 '<td>'+card.disposition+'</td>' +
                                 '<td>'+card.practicality+'</td>' +
                                 '<td>'+card.temperament+'</td>' +
                                 '<td>'+card.toid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	/* '<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 编辑'+
                                        	'</a>'+
                                        	'<a id="info" class="updateBtn" href="javascript:;">'+
                                           	'<i class="am-icon-pencil"></i> 信息'+
                                       	'</a>'+ */
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 			}
	 		});
	 		$("#addressbody").append(content); 
	 	});
	 };
	 //查看玩家背包
	 function getknapsack(){
	 	$(document).on('click','#info',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑用户'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/knapsack.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
	 	    	}
	 		});
	 	});
	 };
</script>
</head>
<body class="theme-black">
        <!-- 内容区域 -->
    
            <div class="theme-black">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">卡牌列表</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <%-- <button type="button" class="am-btn am-btn-default am-btn-success" id="myadd"><span class="am-icon-plus"></span> 新增</button> --%>
<!--                                                 <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
           					
				     		<!-- 内容区域 -->
							<form action="wglist.jsp" method="post" id="hp_form" name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                    	<table>
                                    		<tr>
                                    			<td>
                                    				<input type="text" class="am-form-field " placeholder="请输入名称" id="carname" name="carname">

                                    			</td>
                                    			<td>
			                                        <input type="text" class="am-form-field " placeholder="卡牌等级" id="cardquality" name="cardquality">
                                    			</td>
                                    			<td>
			                                        <span class="am-input-group-btn">
											            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button>
											        </span>
                                    			</td>
                                    		</tr>
                                    	</table>
                                    </div>
                                </div>
                                
								</form>
                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>名称</th>
                                                <th>图片</th>
                                                <th>卡牌等级</th>
                                                <th>品味</th>
                                                <th>性格</th>
                                                <th>实用</th>
                                                <th>气质</th>
                                                <th>男主id</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
												<s:forEach var="card" items="${listcard}" varStatus="status">
													<s:if test="${status.count<=size }">
														<tr>
		                                                       	<td>${status.count }</td>
		                                                       	<td class="am-text-middle" style="display: none">${card.id}</td>
		                                                        <td>${card.name }</td>
		                                                        <td><img width="50px" height="50px" src="${weburl2 }/bin/h5/cardicon/${card.iconname }" /></td>
		                                                        <td>${card.quality }</td>
		                                                        <td>${card.taste }</td>
		                                                        <td>${card.disposition }</td>
		                                                        <td>${card.practicality }</td>
		                                                        <td>${card.temperament }</td>
		                                                        <td>${card.toid }</td>
		                                                        <td class="am-text-middle">
								                                     <div class="tpl-table-black-operation">
								                                         <!-- <a id="selectoneuser" class="updateBtn" href="javascript:;">
								                                             <i class="am-icon-pencil"></i> 编辑
								                                         </a>
								                                         <a  id="info" class="updateBtn" href="javascript:;">
								                                             <i class="am-icon-pencil"></i> 信息
								                                         </a> -->
								                                         <!-- <a  id="deleteoneuser" class="delBtn" href="javascript:;" class="tpl-table-black-operation-del">
								                                             <i class="am-icon-trash"></i> 删除
								                                         </a> -->
								                                     </div>
								                                 </td>
		                                                 </tr>
	                                                 </s:if>
                                                 </s:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                
                                		      当前页:<input readonly="readonly" size="1px" style="color: red;" type="text" name="pageNo" id="pageNo" value="${pageNo }" >
                                		      跳转到:<input size="1px" style="color: red;" type="text" name="jumptext" id="jumptext" value="${jump }" >
                                		  <input type="hidden" name="lastpage" id="lastpage" value="${pageCount }" >
                                		  <input type="hidden" name="max" id="max" value="${max }" >
                                		  <input type="hidden" name="size" id="size" value="${size }" >
                                		      总页数:${pageCount }&nbsp&nbsp
                                		  <button type="button" id="jumpbut" class="am-btn am-btn-default am-btn-success"><span class="am-icon-save"></span>跳转</button>
                                		  <button type="button" id="homepage" class="am-btn am-btn-default am-btn-success"><span class="am-icon-save"></span>首页</button>
                                          <button type="button" id="previouspage" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span>上一页</button>
                                          <button type="button" id="nextpage" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span>下一页</button>
                                          <button type="button" id="lastpage" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span>末页</button>
                                          
                                          
                   				 <div class="am-u-lg-12 am-cf">
                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     
</body>
</html>