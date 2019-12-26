<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.message.Messagepush,
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
         	if(listtwo!=null && listtwo.size()>0){
         		for(Messagepush messagepush:listtwo){
					if(messagepush.getType()==904){
						num++;
						break;
					}
				}
         	}
		 	//检查账号是否有该权限
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
     		Collection<WgPlayerserver> wgplaylist=PlayerManager.getInstance().getIdplayermap().values();
			List<WgPlayerserver> wglist=new ArrayList<WgPlayerserver>();
			wglist.addAll(wgplaylist);
        	int online=0;//在线玩家
        	int online2=0;//所有玩家
        	int Totalrmbdiamond=0;//充值总数
			for (int i = 0; i < wglist.size(); i++) {
				WgPlayerserver wg=wglist.get(i);
				if(wg.isIslogin()==true){
					online++;
				}
				if(wg.getTotalrmbdiamond()!=null && wg.getTotalrmbdiamond()!=0 && !wg.getTotalrmbdiamond().equals("")){
					Totalrmbdiamond=Totalrmbdiamond+wg.getTotalrmbdiamond();
				}

			}     
			request.setAttribute("online2", wglist.size());
			request.setAttribute("online", online);
    		request.setAttribute("totalrmbdiamond", Totalrmbdiamond);

      %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;

		});

</script>
</head>
<body class="theme-black">
        <!-- 内容区域 -->
    
            <div class="theme-black">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">玩家充值统计列表</div>
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
                                                <th>在线人数</th>
                                                <th>总人数</th>
                                                <th>充值总数</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
													<tr>
															<td>1</td>
	                                                       	<td>${online }</td>
	                                                        <td>${online2 }</td>
	                                                        <td>${totalrmbdiamond }</td>
	                                                 </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- <form action="allwglist.jsp" method="post" id="pagenofrom"> -->
                                <!-- </form> -->
<!--                                 <a href="allwglist.jsp">上一页</a><a href="allwglist.jsp">下一页</a>
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