<%@page import="web.webSocket.util.GameServerManager"%>
<%@page import="web.webSocket.activity.ActivityManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.login.LoginManager,
		    web.webSocket.player.PlayerManager,
		    java.util.*,
		    java.util.Date,
		    net.sf.json.JSONArray,
		    web.webSocket.util.GameServerManager,
		    net.sf.json.JsonConfig,
		    java.text.SimpleDateFormat,
		    web.webSocket.pojo.WgPlayerserver,
		    web.webSocket.message.Messagepush,
		    web.webSocket.activity.ActivityManager,
		    java.util.regex.Pattern,
		    web.webSocket.util.Util,
		    web.webSocket.pojo.WgActivity,
		    web.webSocket.pojo.WgFeedback"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datetimepicker-se.min.css" />
    <script src="<%=path %>/assets/js/moment-with-locales.min.js"></script> 
    <script src="<%=path %>/assets/js/jquery.min.js"></script>
    <script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/app.js"></script>
    <script src="<%=path %>/assets/js/theme.js"></script>
    <script src="<%=path %>/assets/js/amazeui-pagination.js"></script>
    <%  
	 	List<Messagepush> listtwo=(List<Messagepush>)session.getAttribute("listtwo");
	 	int num=0;
	 	//检查账号是否有该权限
	 	if(listtwo!=null && listtwo.size()>0){
		 	for(Messagepush messagepush:listtwo){
				if(messagepush.getType()==1001){
					num++;
					break;
				}
			}
	 	}
		if(num<1){
			response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
			return ;
		}
			ActivityManager activityManager=ActivityManager.getInstance();
			String huodong=activityManager.getHuodong();
			if(huodong==null || huodong.equals("")){
				//活动id:0关闭或1开启:开始时间:结束时间 :0未发送1已发送
				activityManager.upWgmainhuodong("3@0@0@0@0");
			}else{
				int num2=0;
				String[] huodong2=huodong.split(",");
				for(int i=0; i<huodong2.length; i++){
					String[] huodong3=huodong2[i].split("@");
					if(Integer.valueOf(huodong3[0])==3){
						num2++;
						break;
					}
				}
				if(num2==0){
					activityManager.upWgmainhuodong(huodong+",3@0@0@0@0");
				}
			}
			String huodong4=activityManager.getHuodong();
			String[] huodong5=huodong4.split(",");
			for(int i=0; i<huodong5.length; i++){
				String[] huodong6=huodong5[i].split("@");
				if(Integer.valueOf(huodong6[0])==3){
					request.setAttribute("id", huodong6[0]);
					if(Integer.valueOf(huodong6[1])==0){
						request.setAttribute("state", "关闭");
					}else{
						request.setAttribute("state", "开启");
					}
					if(huodong6[2].equals("0")){
						request.setAttribute("starttime", "");
					}else{
						request.setAttribute("starttime", Util.getDate(Long.valueOf(huodong6[2]), 1));
						
					}
     				if(huodong6[3].equals("0")){
						request.setAttribute("endtime", "");
					}else{
						request.setAttribute("endtime", Util.getDate(Long.valueOf(huodong6[3]), 1));
					}
				}
			}
     %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
 		actsave();//编辑
 		actreset();//活动重置	
		});
			 
	 //操作
	 function actsave(){
	 	$(document).on('click','#actsave',function(){
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
	 			content:[webPath+'/adm/activity/upactivityConf.jsp'],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
		
		 function actreset(){
		 	$(document).on('click','#actreset',function(actreset){
			 	 layer.closeAll();
	 			 layer.confirm('注意:确定玩家累计充值活动数据清空吗?', {icon: 0, title:'一键重置'}, function(index){
				  	location.href =webPath+'/adm/activity/upactivityConf.jsp?parameter=1';
				}) 
			})
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
                                <div class="widget-title  am-cf">累计充值配置列表</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                	<!-- 内容区域 -->
							<form action="activityConf.jsp" method="post" id="hp_form" name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
                               
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p" style="display: inline;">
                                        <!--  <input type="text" class="am-form-field " placeholder="" readonly="readonly" id="userName" name="userName" style="display: inline;"> -->
	                                        <span class="am-input-group-btn" style="display: inline;">
									           <!--  <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button> -->
									        </span>
                                    </div>
                                </div>
								
                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                            	<th>id</th>
                                                <th>活动开始时间</th>
                                                <th>活动结束时间</th>
                                                <th>状态</th>
                                                <!-- <th>活动内容</th> -->
                                               	<th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
													<tr>	
															<td>${id}</td>
															<td>${starttime}</td>
															<td>${endtime}</td>
															<td>${state}</td>
	                                                        <!-- <td class="am-text-middle" >累计充值奖励</td> -->
	                                                      	
	                                                        <td class="am-text-middle">
							                                     <div class="tpl-table-black-operation">
							                                         <a id="actsave" class="updateBtn" href="javascript:;">
							                                             <i class="am-icon-save"></i> 编辑
							                                         </a>
							                                         <a id="actreset" class="updateBtn" href="javascript:;">
							                                             <i class="am-icon-pencil"></i> 重置
							                                         </a>
							                                     </div>
							                                 </td>
	                                                 </tr>
                                        </tbody>
                                    </table>
                                </div>
                               </form>
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
            <script src="<%=path %>/assets/js/amazeui.datetimepicker-se.min.js"></script>
</body>
</html>