<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.article.ArticleManager,
    java.util.*,
    web.webSocket.util.Util,
    web.webSocket.rightdress.Part,
    web.webSocket.util.GameServerManager,
    net.sf.json.JSONArray,
    web.webSocket.activity.ActivityManager,
    net.sf.json.JsonConfig,
    web.webSocket.article.ArticleManager,
    web.webSocket.pojo.WgMain2,
    web.webSocket.rightdress.RightdressManager,
    web.webSocket.article.Article"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
			ActivityManager activityManager=ActivityManager.getInstance();
			String huodong=activityManager.getHuodong();
			WgMain2 wgMain2=activityManager.getWgMain2();
			if(huodong==null || huodong.equals("")){
				//活动id:0关闭或1开启:开始时间:结束时间 :0未发送1已发送
				activityManager.upWgmainhuodong("13@0@0@0@0");
			}else{
				int num=0;
				String[] huodong2=huodong.split(",");
				for(int i=0; i<huodong2.length; i++){
					String[] huodong3=huodong2[i].split("@");
					if(Integer.valueOf(huodong3[0])==13){
						num++;
						break;
					}
				}
				if(num==0){
					activityManager.upWgmainhuodong(huodong+",13@0@0@0@0");
				}
			}
			String huodong4=activityManager.getHuodong();
			String[] huodong5=huodong4.split(",");
			for(int i=0; i<huodong5.length; i++){
				String[] huodong6=huodong5[i].split("@");
				if(Integer.valueOf(huodong6[0])==13){
					request.setAttribute("id", huodong6[0]);
					request.setAttribute("price", wgMain2.getLuckdrawdiamond());
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
<%-- 	layui.config({
		  base: '<%=path %>/admin/article/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('articlelist'); //加载入口 --%>
		
		layui.define(['form','layer','laypage','laydate'], function(exports){
			var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			getoperation();
			actreset();
		});
		//操作
	 function getoperation(){
	 	$(document).on('click','#operation',function(){
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
	 			content:[webPath+'/adm/activity/upluckdraw2.jsp'],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
	 function actreset(){
		 	$(document).on('click','#actreset',function(actreset){
			 	 layer.closeAll();
	 			 layer.confirm('注意:确定清空钻石抽奖记录吗?', {icon: 0, title:'一键清空'}, function(index){
				  	location.href =webPath+'/adm/activity/upluckdraw2.jsp?parameter=1';
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
                                <div class="widget-title  am-cf">钻石抽奖配置信息</div>


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
                                                <th>id</th>
                                                <th>钻石数量</th>
                                                <th>开始时间</th>
                                                <th>结束时间</th>
                                                <th>状态</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
	                                         <tr>
	                                         		<td>${id}</td>
	                                         		<td>${price}</td>
	                                         		<td>${starttime}</td>
	                                         		<td>${endtime}</td>
	                                         		<td>${state}</td>
	                                         		<td class="am-text-middle">
												<div class="tpl-table-black-operation">
													<a id="operation" class="updateBtn" href="javascript:;">
														<i class="am-icon-pencil"></i>编辑</a>
													<a id="actreset" class="updateBtn" href="javascript:;">
							                            <i class="am-icon-pencil"></i>清空</a>
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
            </div>
     
</body>
</html>