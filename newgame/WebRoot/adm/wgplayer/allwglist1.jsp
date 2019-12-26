<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			selectwg();
			previouspage();
			nextpage();
			lastpage();
			homepage();
			jump();
			getoperation();
		});
		function selectwg(){
			$(document).on('click','#queryuser',function(){
	 		var userName=document.getElementById("userName").value;
	 		userName=$.trim(userName);
	 		document.getElementById("userName").value=userName; 
	 		var playName=document.getElementById("playName").value;
	 		playName=$.trim(playName);
	 		document.getElementById("playName").value=playName; 
	 		
	 		var roleName=document.getElementById("roleName").value;
	 		roleName=$.trim(roleName);
			$("#addressbody").empty();
			
	 		var content="";
	 		location.href = webPath+'/admin/allwglist1?username='+userName+'&playername='+playName+'&rolename='+roleName;
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
			location.href = webPath+'/admin/allwglist1?pageNo='+page;
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
	 		location.href = webPath+'/admin/allwglist1?pageNo='+page;
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
	 		location.href = webPath+'/admin/allwglist1?pageNo='+lastpage;
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
	 		location.href = webPath+'/admin/allwglist1?pageNo=1';
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
	 		location.href = webPath+'/admin/allwglist1?pageNo='+jump;
	 		}
	 	});
	 };	
	 	 //操作
	 function getoperation(){
	 	$(document).on('click','#operation',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(2)").text();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['操作'],
	 			area:['90%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			shadeClose:true,
	 			anim:0,
	 			content:[webPath+'/admin/userone?serveruid='+id+'&type=all'],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
	 
	function formatDateTime(inputTime) {
    var date = new Date(inputTime);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    h = h < 10 ? ('0' + h) : h;
    var minute = date.getMinutes();
    var second = date.getSeconds();
    minute = minute < 10 ? ('0' + minute) : minute;
    second = second < 10 ? ('0' + second) : second;
    return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
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
                                <div class="widget-title  am-cf">所有玩家列表(总人数：${newpage.getTotal() })</div>


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
							<div id="hp_form" name="hp_form" data-am-validator class="am-form tpl-form-line-form">
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                    	<table>
	                                    	<tr>
	                                    		<td>
													<input type="text" class="am-form-field" placeholder="请输入用户编号" align="right"
													id="userName" name="userName" />
												</td>	
												<td>
												<input type="text" class="am-form-field" placeholder="请输入用户名" align="left"
												id="playName" name="playName" />
												</td>
												<td>
												<input type="text" class="am-form-field" placeholder="请输入角色名" align="left"
												id="roleName" name="roleName" />
												
										    	<td>
											    	<span class="am-input-group-btn">
													    <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
														id="queryuser" name="queryuser" type="button"
														onclick="selectwg();"></button> 
													</span>
												</td>
	                                       </tr>
                                 		</table>
                                        <%-- <input type="text" class="am-form-field " placeholder="请输入熊猫id" id="userName" name="userName">
                                        <input type="text" class="am-form-field" placeholder="请输入昵称" align="left"
										id="playName" name="userName" />
                                        <span class="am-input-group-btn">
								            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button>
								        </span> --%>
                                    </div>
                                </div>
							</div>
                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                 <th>渠道</th>
                                                <th>用户id</th>
                                                <th>用户名字</th>
                                                <th>角色名</th>
                                                <th>用户编号</th>
                                                <th>金币</th>
                                                <th>钻石</th>
                                                <th>等级</th>
                                                <th>段位</th>
                                                <th>充值</th>
                                                <th>注册时间</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
												 <s:forEach var="wg" items="${list}" varStatus="status">
													<tr>
	                                                       	<td>${status.count}</td>
	                                                       	<td>${wg.channel }</td>
	                                                       	<td class="am-text-middle">${wg.serveruid}</td>
	                                                       	<td>
	                                                       	<s:if test="${wg.playername==null}">
	                                                       		暂无
							                                </s:if>
							                                <s:if test="${wg.playername!=null}">
							                                  	${wg.playername }
							                                </s:if>
							                                </td>

	                                                       	<td>${wg.rolename }</td>
	                                                        <td>${wg.username }</td>
	                                                        <td>${wg.gold }</td>
	                                                        <td>${wg.diamond}</td>
	                                                        <td>${wg.level}</td>
	                                                        <td>${wg.missionlevel}</td>
	                                                        <td>${wg.totaldiamond}</td>
	                                                        <td>${wg.time1}</td>
	                                                        <td class="am-text-middle">
							                                     <div class="tpl-table-black-operation">
							                                             <s:if test="${wg.username!='-1' && wg.username!='-2'}">
							                                             	<a id="operation" class="updateBtn" href="javascript:;">
																			<i class="am-icon-pencil"></i> 操作 </a>
							                                             </s:if>
							                                     </div>
							                                 </td>
	                                                 </tr>
                                                 </s:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- <form action="allwglist.jsp" method="post" id="pagenofrom"> -->
                                		    当前页:<input readonly="readonly" size="1px" style="color: red;" type="text" name="pageNo" id="pageNo" value="${newpage.getPageNum()}" >
                                		    跳转到:<input size="1px" style="color: red;" type="text" name="jumptext" id="jumptext" value="${jump }" >
                                		  <input type="hidden" name="lastpage" id="lastpage" value="${newpage.getPages() }" >
                                		  <input type="hidden" name="max" id="max" value="${newpage.getTotal() }" >
                                		  <input type="hidden" name="size" id="size" value="${newpage.getPageSize() }" >
                                		      总页数:${newpage.getPages() }&nbsp&nbsp
                                		  <button type="button" id="jumpbut" class="am-btn am-btn-default am-btn-success"><span class="am-icon-save"></span>跳转</button>
                                		  <button type="button" id="homepage" class="am-btn am-btn-default am-btn-success"><span class="am-icon-save"></span>首页</button>
                                          <button type="button" id="previouspage" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span>上一页</button>
                                          <button type="button" id="nextpage" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span>下一页</button>
                                          <button type="button" id="lastpage" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span>末页</button>
                                <!-- </form> -->
<!--                                
                                <input type="text" value="0"> -->
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