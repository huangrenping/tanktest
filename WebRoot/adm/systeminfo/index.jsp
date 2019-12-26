<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datetimepicker.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/app.css">
    <script src="<%=path %>/assets/js/jquery.min.js"></script>
    <script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
    
    <script src="<%=path %>/assets/js/app.js"></script>
    <script src="<%=path %>/assets/js/theme.js"></script>
    <script src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
      <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
			var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			//openserver();
		});
		//操作
/* 	 function openserver(){
	 	$(document).on('click','#openserver',function(){
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑'],
	 			area:['90%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			shadeClose:true,
	 			anim:0,
	 			content:[webPath+'/admin/systeminfo'],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };	 */
	 function openserver(id){
	 location.href = webPath+'/admin/systeminfo?id='+id;
	 /* 
	 	$(document).on('click','#openserver',function(){
			
	 	}); */
	 };	
	 function sendtime(){
	 var time=$("#datetimepickera").val();
	 location.href = webPath+'/admin/systeminfo?time='+time;
	 }
</script>
</head>

<body class="theme-black">
        <!-- 内容区域 -->
    <script src="<%=path %>/assets/js/amazeui.datetimepicker.min.js"></script>
            <div class="theme-black">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf"></div>
                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <%-- <button type="button" class="am-btn am-btn-default am-btn-success" id="myadd"><span class="am-icon-plus"></span> 新增</button> --%>
<!--                                            <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div  id="hp_form" name="hp_form" data-am-validator class="am-form tpl-form-line-form">
	                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
	                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
	                                        <%-- <input type="text" class="am-form-field " placeholder="请输入道具id" id="articleid" name="articleid">
	                                        <input type="text" class="am-form-field" placeholder="请输入道具名称" align="left" id="articlename" name="articlename" />
	                                        <span class="am-input-group-btn">
								            	<button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button>
								        	</span> --%>
								        	<table>
		                                    	<tr>
		                                       </tr>
                                 			</table>
	                                    </div>
	                                </div>
								</div>

                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                        <thead>
                                            <tr>
                                                <th>服务器状态</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
	                                         <tr>
	                                         		<td width="50%">${message1}</td>
	                                         		<td class="am-text-middle">
												<div class="tpl-table-black-operation">
													<a id="operation" class="updateBtn" href="javascript:;" onclick="openserver(${isopen });">
														<i class="am-icon-pencil"></i>${message }</a>
												</div>
										    </td>
	                                         </tr>
                                        </tbody>
                                    </table>
                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination"></ul>
                                    </div>
                                </div>
                                
                                   <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                        <thead>
                                            <tr >
                                                <th>服务器开服时间</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
	                                         <tr>
	                                         		<td width="50%">		
	                                         			<div class="am-u-sm-0">
															<input type="text" value="${time}" id="datetimepickera" name="datetimepickera" class="am-form-field" placeholder="服务器开服时间" data-am-datepicker readonly required />
														</div>
													</td>
	                                         		<td class="am-text-middle">
												<div class="tpl-table-black-operation">
													<a id="operation1" class="updateBtn" href="javascript:;" onclick="sendtime();">
														<i class="am-icon-pencil"></i>修改</a>
												</div>
										    </td>
	                                         </tr>
                                        </tbody>
                                    </table>
                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination"></ul>
                                    </div>
                                </div>
                                
                                
                            </div>
                        </div>
                    </div>

            </div>
            <br>
    <%--  <button id="openserver" type="button" value="${isopen }" class="am-btn am-btn-warning" onclick="openserver(${isopen });" >${message}</button> --%>
     
<%-- 	<form id="send" action="sss" method="post" data-am-validator
							class="am-form tpl-form-line-form">
	<div class="am-form-group">
		<label for="user-name" class="am-u-sm-3 am-form-label" style="color: white;">服务器开服时间 <span
			class="tpl-form-line-small-"></span> </label>
		<div class="am-u-sm-0">
			<input type="text" value="${serverTime}" id="datetimepicker1"
				name="datetimepicker1" class="am-form-field" placeholder="服务器开服时间"
				data-am-datepicker readonly required />
		</div>
		<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 修改
					</button>
	</div>
	</form> --%>
	<table>
</body>

</html>