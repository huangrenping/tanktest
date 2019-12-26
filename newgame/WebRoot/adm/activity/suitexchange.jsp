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
    web.webSocket.rightdress.RightdressManager,
    web.webSocket.article.Article"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
			
			ActivityManager activityManager=ActivityManager.getInstance();
			int[] suitpart=activityManager.getSuitpart();
			int[] num=activityManager.getSuitnum();
			int aid=activityManager.getSuitaid();
			String suitexplain=activityManager.getSuitexplain();
			int opportunity=activityManager.getOpportunity();
			request.setAttribute("opportunity", opportunity);
			if(suitexplain!=null && !suitexplain.equals("")){
				request.setAttribute("suiname", suitexplain.split(":")[0]);
			}
			String namenum=null;
			RightdressManager rightdressManager=RightdressManager.getInstance();
			for(int i=0;i<suitpart.length;i++){
				Part part=rightdressManager.getone(suitpart[i]);
				if(part!=null){
					if(namenum==null){
						namenum=part.getName()+":"+num[i];
					}else{
						namenum+=","+part.getName()+":"+num[i];
					}
				}
				
			}
			//活动开启时间
			String huodong=activityManager.getHuodong();
			if(huodong!=null && !huodong.equals("")){
				String[] huodongnew=huodong.split(",");
				int result=0;
				for(int i=0; i<huodongnew.length; i++){
					String[] huodongnew2=huodongnew[i].split("@");
					if(huodongnew2[0].equals("4")){
						result++;
						break;
					}
				}
				if(result==0){
					activityManager.upWgmainhuodong(huodong+",4@0@0@0@0");//活动id@0关闭或1开启@开始时间@结束时间 @0未发送1已发送,
				}
			}else{
				activityManager.upWgmainhuodong("4@0@0@0@0");//活动id@0关闭或1开启@开始时间@结束时间 @0未发送1已发送,
			}
			String[] huodong2=activityManager.getHuodong().split(",");
			for(int i=0; i<huodong2.length; i++){
				String [] huodong3=huodong2[i].split("@");
				if(Integer.valueOf(huodong3[0])==4){
					request.setAttribute("huodongid", huodong3[0]);
					if(huodong3[1].equals("0")){
						request.setAttribute("state", "关闭");
					}else{
						request.setAttribute("state", "开启");
					}
					if(huodong3[2].equals("0")){
						request.setAttribute("startime", "");
					}else{
						request.setAttribute("startime", Util.getDate(Long.valueOf(huodong3[2]), 1));
					}
					if(huodong3[3].equals("0")){
						request.setAttribute("endtime", "");
					}else{
						request.setAttribute("endtime", Util.getDate(Long.valueOf(huodong3[3]), 1));
					}
					break;
				}
			}
			ArticleManager articleManager=ArticleManager.getInstance();
			Article article=articleManager.getarticle(aid);
			String name2="";
			if(article!=null){
				name2=article.getName();
			}
     		request.setAttribute("namenum", namenum);
     		request.setAttribute("name", name2);
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
	 			content:[webPath+'/adm/activity/upsuitexchange.jsp'],
	 	    	end:function(){
	 	    		window.location.reload();
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
                                <div class="widget-title  am-cf">套装兑换列表</div>


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
                                                <th>套装</th>
                                                <th>服装名称:兑换道具数量</th>
                                                <th>兑换道具掉落几率(0-100)</th>
                                                <th>兑换道具</th>
                                                <th>开始时间</th>
                                                <th>结束时间</th>
                                                <th>状态</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
	                                         <tr>
	                                         		<td>${huodongid}</td>
	                                         		<td>${suiname}</td>
	                                         		<td>${namenum}</td>
	                                         		<td>${opportunity}</td>
	                                         		<td>${name}</td>
	                                         		<td>${startime }</td>
                                                	<td>${endtime }</td>
                                                	<td>${state }</td>
	                                         		<td class="am-text-middle">
												<div class="tpl-table-black-operation">
													<a id="operation" class="updateBtn" href="javascript:;">
														<i class="am-icon-pencil"></i>编辑</a>
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