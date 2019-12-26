<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.message.Messagepush,
    web.webSocket.pojo.WgPlayerserver3,
    web.webSocket.util.Util,
    web.webSocket.tasks.TasksManager,
    web.webSocket.tasks.Dailytask,
    web.webSocket.pojo.WgPlayerserver"%>
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
         	List<Messagepush> listtwo=(List<Messagepush>)session.getAttribute("listtwo");
		 	int num=0;
		 	//检查账号是否有该权限
			for(Messagepush messagepush:listtwo){
				if(messagepush.getType()==904){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			//得到参数进行操作
			String parameter=request.getParameter("parameter");
			String taskidStr=request.getParameter("taskid"); 
			if(taskidStr!=null){
				int taskid=Integer.parseInt(taskidStr);
				Dailytask dailytask=TasksManager.getInstance().getDailytaskone(taskid);
				if(dailytask==null){
					return;
				}
				
				Collection<WgPlayerserver> wgplaylist=PlayerManager.getInstance().getIdplayermap().values();
				List<WgPlayerserver> wglist=new ArrayList<WgPlayerserver>();
				wglist.addAll(wgplaylist);
				boolean flag = false;
				//获取玩家的dailymessage
				//如果玩家的dailymessage不为空而且里面没有taskid则添加，
				for(WgPlayerserver wgPlayerserver:wglist){
					WgPlayerserver3 wg3=wgPlayerserver.getWgPlayerserver3();
					String dailymessage=wg3.getDailymessage();
					if(dailymessage!=null){
						String[] messages=dailymessage.split(",");
				    	for (int i = 0; i < messages.length; i++) {
				    		String[] ones=messages[i].split(":");//ones的角标2代表taskid
				    		int j=Integer.parseInt(ones[2]);
				    		if(taskid-j>=0&&taskid-j<=20){//代表有补充的任务成就 阶段20以内
				    			flag=true;
				    			break;//跳出内循环并不执行外层代码
				    		}
						}
						if(flag){
							continue;
						}
						//内循环结束没有找到补充任务则在末尾追加
						dailymessage=dailymessage+","+dailytask.getType()+":"+dailytask.getTasktype()+":"+dailytask.getId()+":0";
				    	wg3.setDailymessage(dailymessage);
				    	wg3.setDirty(true);
					}
			    	
				}
			}
     		        	
			//request.setAttribute("taskid", taskidStr);

      %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
		syncranking();//百花榜成就同步
		});
		//约会剧情同步
		function syncranking(){
		 	$(document).on('click','#syncranking',function(syncranking){
			var taskid=$(this).parent().parent().find("td input:eq(0)").val();		 	 	
			location.href =webPath+'/adm/activity/synctask.jsp?parameter=1&taskid='+taskid;
			 
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
                                <div class="widget-title  am-cf">task同步列表</div>
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
                                    </div>
                                </div>
							</div>
                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>同步taskid</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
													<tr>
															<td>1</td>
	                                                       	 <td><input type="text" value=""  id="taskid" class="am-form-field"/></td>
	                                                       	<td><a id="syncranking"  href="javascript:;" >
																<i class="am-icon-pencil"></i>同步 </a>
															</td>
	                                                 </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
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