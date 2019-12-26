<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.card.CardManager,
    java.util.*,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.card.Host"%>
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
     		Map<Integer, Host> hostmap=CardManager.getInstance().getHostmap();
			List<Host> listhost=new ArrayList<Host>();
			Collection<Host> hostlist=hostmap.values();
			listhost.addAll(hostlist);
			request.setAttribute("listhost", listhost);
			//每页最大显示数量
			int size=16;
			//总页数
			int PageCount=0;
			if(listhost.size()%size==0)
			{
				PageCount=listhost.size()/size;
			}else{
				PageCount=listhost.size()/size+1;
			}
			//总条数
			request.setAttribute("max", listhost.size());
			request.setAttribute("size", size);
			String pageNo=request.getParameter("pageNo");
    		if(pageNo==null || pageNo.equals("")){
    			pageNo="1";
    		}
    		request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageCount", PageCount);
			
			JSONArray listArray=JSONArray.fromObject(listhost);
     		request.setAttribute("listArray", listArray);
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
	 		var hostname=document.getElementById("hostname").value;
	 		hostname=$.trim(hostname);
	 		document.getElementById("hostname").value=hostname; 
			$("#addressbody").empty();
	 		var content="";
	 		if(hostname!=""){
	 			 		$.each(${listArray},function(index,host){
	 					if(host.name==hostname){
	 						content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+host.id+'</td>' +
                                 '<td>'+host.name+'</td>' +
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
	 		}else if(hostname==""){
	 			$.each(${listArray},function(index,host){
	 			if(index>=0){
	 			if(index<${size}){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+host.id+'</td>' +
                                 '<td>'+host.name+'</td>' +
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
	 		$.each(${listArray},function(index,host){
	 			if(index>=0){
	 			if(index<${size}){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+host.id+'</td>' +
                                 '<td>'+host.name+'</td>' +
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
	 		if(jump.length==0){
	 			layer.msg("请输入页码！");
	 			return false;
	 		}
	 		if(isNaN(jump)){
				layer.msg("页码只能输入数字！");
				return false;
			}
	 		document.getElementById("pageNo").value=jump;
	 		$("#addressbody").empty();
	 		var content="";
	 		if(jump>=1 && jump<=${pageCount}){
	 		$.each(${listArray},function(index,host){
	 			if(index>=${size}*(jump-1)){
	 			if(index<${size}*jump){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+host.id+'</td>' +
                                 '<td>'+host.name+'</td>' +
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
	 	});
	 };
	 
	 
	 //上一页
	 function previouspage(){
	 	$(document).on('click','#previouspage',function(){
	 		var pageno=document.getElementById("pageNo").value;
	 		var page=1;
	 		if(pageno=="1"){
		 		layer.msg("已是首页！");
		 		return;
	 		}else{
	 			page=parseInt(pageno)-1;
		 		document.getElementById("pageNo").value=page;
	 		}
			document.getElementById("pageNo").value=page;
	 		$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,host){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+host.id+'</td>' +
                                 '<td>'+host.name+'</td>' +
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
	 		if(parseInt(pageno)==parseInt(lastpage)){
	 			 layer.msg("已是末页！");
	 			 return;
	 		}else{
	 			 page=parseInt(pageno)+1;	
	 		}
	 		document.getElementById("pageNo").value=page;
	 		$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,host){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+host.id+'</td>' +
                                 '<td>'+host.name+'</td>' +
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
	 		var lastpage=document.getElementById("lastpage").value;
	 		document.getElementById("pageNo").value=lastpage;
			$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,host){
	 			if(index>=(lastpage-1)*${size}){
							content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+host.id+'</td>' +
                                 '<td>'+host.name+'</td>' +
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
                                <div class="widget-title  am-cf">男主列表</div>


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
                                        <input type="text" class="am-form-field " placeholder="请输入名称" id="hostname" name="hostname">
                                        <span class="am-input-group-btn">
								            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button>
								        </span>
                                    </div>
                                </div>
								</form>
                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>id</th>
                                                <th>名称</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
												<s:forEach var="host" items="${listhost}" varStatus="status">
													<s:if test="${status.count<=size }">
														<tr>
		                                                       	<td>${status.count }</td>
		                                                        <td>${host.id }</td>
		                                                        <td>${host.name }</td>
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