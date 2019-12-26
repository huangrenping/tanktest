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
    web.webSocket.player.PlayerManager,
    web.webSocket.rightdress.RightdressManager,
    web.webSocket.pojo.WgMain,
    web.webSocket.article.Article"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%!
	public class Activityorder {
	private int id;
	private int order;
    private String name;
    private String state;
    private String startime;
    private String endtime;
    
    public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
    
    public String getStartime() {
		return startime;
	}
	public void setStartime(String startime) {
		this.startime = startime;
	}
    
    public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
	
 %>
 
<%
			
			ActivityManager activityManager=ActivityManager.getInstance();
			String result=activityManager.getActivityorder();
			if(result!=null && !result.equals("") && result.substring(result.length()-1,result.length()).equals(",")){
					result=result.substring(0, result.length()-1);
			}
			//String[] activityname={"七天登录","等级奖励","累计充值","套装兑换","三日冲级","封测礼包","夏日缘卡","聚宝钱庄","7日限时充值","一元夺宝","月卡福利","限购礼包","钻石抽奖","招财猫","双11","打折"};
			//PlayerManager playerManager=PlayerManager.getInstance();
			String[] activityname=PlayerManager.activityname;
			if(result!=null){
				String[] result2=result.split(",");
				List<Activityorder> list=new ArrayList<Activityorder>();
				int num=0;
				for(int i=0; i<result2.length; i++){
					Activityorder activityorder=new Activityorder();
					String[] result3=result2[i].split(":");
					if(Integer.valueOf(result3[0])==1 || Integer.valueOf(result3[0])==2){
						num++;
					}
					int state=activityManager.getonehuodongstate(Integer.valueOf(result3[0]));
					if(state==0){
						activityorder.setState("");
					}else{
						activityorder.setState("是");
					}
					if(Integer.valueOf(result3[0])==1 || Integer.valueOf(result3[0])==2){
						activityorder.setState("是");
					}
					activityorder.setId(Integer.valueOf(result3[0]));
					activityorder.setOrder(Integer.valueOf(result3[1]));
					activityorder.setName(activityname[Integer.valueOf(result3[0])-1]);
					if(Integer.valueOf(result3[0])!=1 && Integer.valueOf(result3[0])!=2){
						String activitytime=activityManager.getonehuodongtime(Integer.valueOf(result3[0]));
						//System.out.println("activitytime==="+activitytime);
						activityorder.setStartime(Util.getDate(Long.valueOf(activitytime.split(":")[0]), 1));
						activityorder.setEndtime(Util.getDate(Long.valueOf(activitytime.split(":")[1]), 1));
					}else{
						activityorder.setStartime("--");
						activityorder.setEndtime("--");
					}
					
					list.add(activityorder);
				}
				if(num==0){
					for(int i=0;i<2;i++){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(i+1);
						activityorder.setOrder(1);
						activityorder.setName(activityname[i]);
						activityorder.setState("是");
						list.add(activityorder);
					}
				}
				Collections.sort(list, new Comparator<Activityorder>() {
						 @Override  
						    public int compare(Activityorder o1,Activityorder o2) {  
							int result = 0;
							result = o1.getOrder()-o2.getOrder(); //
					        return result;
						    }  
				});
				request.setAttribute("list", list);
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
			getoperation2();
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
	 			content:[webPath+'/adm/activity/upactivityorder.jsp'],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
	 //页面跳转
	 function getoperation2(){
	 
	 	$(document).on('click','#operation2',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		
	 		var arrayurl=new Array(24);
				arrayurl[0]="XX";
				arrayurl[1]="XX";
				arrayurl[2]="/upactivityConf.jsp";
				arrayurl[3]="/upsuitexchange.jsp";
				arrayurl[4]="/upincreaselvreward.jsp";
				arrayurl[5]="/uptestlibao.jsp";
				arrayurl[6]="/upsummer.jsp";
				arrayurl[7]="/upbank.jsp";
				arrayurl[8]="/upsevendays.jsp";
				arrayurl[9]="/upluckdraw.jsp";
				arrayurl[10]="/upmonthcard.jsp";
				arrayurl[11]="/uplimitbag.jsp";
				arrayurl[12]="/upluckdraw2.jsp";
				arrayurl[13]="/upcat.jsp";
				arrayurl[14]="/updouble11.jsp";
				arrayurl[15]="/updaze.jsp";
				arrayurl[16]="/upbless.jsp";
				arrayurl[17]="/upsevenlove.jsp";
				arrayurl[18]="/upclothingcollect.jsp";
				arrayurl[19]="/upcardcollect.jsp";
				arrayurl[20]="/upanswer.jsp";
				arrayurl[21]="/upactivity22.jsp";
				arrayurl[22]="/upquestionnaire.jsp";
				arrayurl[23]="/upchuangguanranking.jsp";
	 		
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
	 			content:[webPath+'/adm/activity'+arrayurl[id-1]],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 
	 	/* $(document).on('click','#operation',function(){
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
	 			content:[webPath+'/adm/activity/upactivityorder.jsp'],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	}); */
	 };
	 
	 function actreset(){
		 	$(document).on('click','#actreset',function(actreset){
			 	 layer.closeAll();
	 			 layer.confirm('注意:确定重置所有活动顺序吗?', {icon: 0, title:'一键重置'}, function(index){
				  	location.href =webPath+'/adm/activity/upactivityorder.jsp?parameter=1';
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
                                <div class="widget-title  am-cf">活动顺序配置信息</div>
                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <%-- <button type="button" class="am-btn am-btn-default am-btn-success" id="myadd"><span class="am-icon-plus"></span> 活动顺序重置</button> --%>
                                                <button type="button" class="am-btn am-btn-default am-btn-secondary" id="actreset"><span class="am-icon-save"></span> 重置</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-warning" id="operation"><span class="am-icon-archive"></span> 编辑</button>
                                                <%-- <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button> --%>
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
                                                <th>序号</th>
                                                <th>id</th>
                                                <th>名字</th>
                                                <th>开启时间</th>
                                                <th>结束时间</th>
                                                <th>是否开启</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
                                        	<s:forEach items="${list }" var="order" varStatus="status">
	                                        	<tr>
	                                         		<td>${order.order}</td>
	                                         		<td>${order.id}</td>
	                                         		<td>${order.name}</td>
	                                         		<td>${order.startime}</td>
	                                         		<td>${order.endtime}</td>
	                                         		<td>${order.state}</td>
	                                         		<s:if test="${status.count<=2}">
		                                         		<td class="am-text-middle">
															<!-- <div class="tpl-table-black-operation">
																<a id="operation" class="updateBtn" href="javascript:;">
																	<i class="am-icon-pencil"></i>顺序编辑</a>
															</div>
															<div class="tpl-table-black-operation">
																<a id="actreset" class="updateBtn" href="javascript:;">
																	<i class="am-icon-pencil"></i>顺序重置</a>
															</div> -->
													    </td>
	                                         		</s:if>
	                                         		<s:if test="${status.count>2}">
		                                         		<td class="am-text-middle">
															<div class="tpl-table-black-operation">
																<a id="operation2" class="updateBtn" href="javascript:;">
																	<i class="am-icon-pencil"></i>编辑</a>
															</div>
													    </td>
	                                         		</s:if>
		                                         </tr>
                                        	</s:forEach>
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