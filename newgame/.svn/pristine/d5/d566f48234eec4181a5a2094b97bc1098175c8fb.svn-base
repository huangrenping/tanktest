<%@page import="web.webSocket.card.CardManager"%>
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
    web.webSocket.card.Card,
    web.webSocket.pojo.WgMain2,
    web.webSocket.article.ArticleManager,
    web.webSocket.rightdress.RightdressManager,
    web.webSocket.card.CardManager,
    web.webSocket.article.Article"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
			ActivityManager activityManager=ActivityManager.getInstance();
			CardManager cardManager=CardManager.getInstance();
			request.setAttribute("name", "");
			WgMain2 wgMain2=activityManager.getWgMain2();
			String cardid=wgMain2.getHangupcardid();
			String hanguptime=wgMain2.getHanguptime();
			if(hanguptime!=null){
				List<String> listnum=Arrays.asList(hanguptime.split(","));
				request.setAttribute("listnum", listnum);
			}
			request.setAttribute("jilv", wgMain2.getHangupprobability());
			String name="";
			if(cardid==null || cardid.equals("")){
				String cardid2="";
				for(int i=1; i<=3; i++){
					cardid2+=cardManager.gethostidlist3(i).getId()+",";
				}
				if(cardid2.substring(cardid2.length()-1, cardid2.length()).equals(",")){
					cardid2=cardid2.substring(0, cardid2.length()-1);
				}
				wgMain2.setHangupcardid(cardid2);
				activityManager.updatewgmain2(wgMain2);
			}
			String cardid3=wgMain2.getHangupcardid();
			if(cardid3!=null && !cardid3.equals("")){
				String[] cardid4=cardid3.split(",");
				for(int i=0;i<cardid4.length;i++){
					Card card=cardManager.getcardone(Integer.valueOf(cardid4[i]));
					if(card!=null){
						name+=card.getName()+",";
					}
				}
				if(name.substring(name.length()-1, name.length()).equals(",")){
					name=name.substring(0, name.length()-1);
				}
				request.setAttribute("name", name);
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
	 			content:[webPath+'/adm/activity/uphangupcardid.jsp'],
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
                                <div class="widget-title  am-cf">游历配置信息</div>


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
                                            	<th>初、中、高</th>
                                                <th>初级分钟数</th>
                                                <th>中级分钟数</th>
                                                <th>高级分钟数</th>
                                                <th>事件几率</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
	                                         <tr>
	                                         		<td>${name}</td>
	                                         		<td>${listnum.get(0)}</td>
	                                         		<td>${listnum.get(1)}</td>
	                                         		<td>${listnum.get(2)}</td>
	                                         		<td>${jilv }</td>
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