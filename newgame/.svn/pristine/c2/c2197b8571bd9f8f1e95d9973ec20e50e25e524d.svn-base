<%@page import="web.webSocket.lovetree.LovetreeManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.open.OpenManager,
    web.webSocket.open.Open,
    web.webSocket.vip.VipManager,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.card.CardManager,
    web.webSocket.pojo.WgPlayerserver2,
    web.webSocket.lovetree.Lovetree,
    web.webSocket.plotone.Host,
    web.webSocket.pojo.WgLovetree,
    web.webSocket.card.Card"%>
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
        <%!
        public class LovetreeCount {
		private Integer id;
	    
	    private Long lid;
	
	    private Long serveruid;
	
	    private Integer hostid;
	
	    private Long luid;
	
	    private Integer growth;
	
	    private Integer health;
	    
	    private Integer level;
	    private String playername;
	    private String username;
	      /**
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }
    private String hostname;
    

	public String getPlayername() {
		return playername;
	}

	public void setPlayername(String playername) {
		this.playername = playername;
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	
		public Long getLid() {
			return lid;
		}
	
		public void setLid(Long lid) {
			this.lid = lid;
		}
	
		public Integer getLevel() {
			return level;
		}
	
		public void setLevel(Integer level) {
			this.level = level;
		}
	
		/**
	     * @return id
	     */
	    public Integer getId() {
	        return id;
	    }
	
	    /**
	     * @param id
	     */
	    public void setId(Integer id) {
	        this.id = id;
	    }
	
	    /**
	     * @return serveruid
	     */
	    public Long getServeruid() {
	        return serveruid;
	    }
	
	    /**
	     * @param serveruid
	     */
	    public void setServeruid(Long serveruid) {
	        this.serveruid = serveruid;
	    }
	
	    /**
	     * @return hostid
	     */
	    public Integer getHostid() {
	        return hostid;
	    }
	
	    /**
	     * @param hostid
	     */
	    public void setHostid(Integer hostid) {
	        this.hostid = hostid;
	    }
	
	    /**
	     * @return luid
	     */
	    public Long getLuid() {
	        return luid;
	    }
	
	    /**
	     * @param luid
	     */
	    public void setLuid(Long luid) {
	        this.luid = luid;
	    }
	
	    /**
	     * @return growth
	     */
	    public Integer getGrowth() {
	        return growth;
	    }
	
	    /**
	     * @param growth
	     */
	    public void setGrowth(Integer growth) {
	    	if(this.level!=null){
	        	int maxgroth=LovetreeManager.getmaxgrowth(this.level);
	        	if(growth>maxgroth){
	        		growth=maxgroth;
	        	}
	    	}
	        this.growth = growth;
	        
	        
	        
	        
	    }

    /**
     * @return health
     */
    public Integer getHealth() {
        return health;
    }

    /**
     * @param health
     */
    public void setHealth(Integer health) {
    	if(health<=0){
    		health=0;
    	}
    	if(health>120){
    		health=120;
    	}
        this.health = health;
    }
	
}
	
 %>
        
         <%
     		String serveruid=request.getParameter("serveruid");
			String parameter=request.getParameter("parameter");
     		//parameter=1 删除  2一键开启
			if(parameter!=null && !parameter.equals("")){
				//删除
				int parame=Integer.valueOf(parameter);
				long uid=Long.parseLong(serveruid);
				if(parame==1){
					//删除
					if(serveruid!=null && !serveruid.equals("")){
						PlayerManager.getInstance().del(uid);
					}
				}else if(parame==2){
					//一键开启
					//Map<Integer, Open> openmap=OpenManager.getInstance().getOpenmap().values();
					String openstr="";
					for(Open open:OpenManager.getInstance().getOpenmap().values()){
						openstr+=open.getToid()+",";
					}
					if(openstr.substring(openstr.length()-1,openstr.length()).equals(",")){
						openstr=openstr.substring(0, openstr.length()-1);
						WgPlayerserver wgPlayerserver=PlayerManager.getInstance().getplayer(uid);
						WgPlayerserver2 wgPlayerserver2=wgPlayerserver.getWgPlayerserver2();
						wgPlayerserver2.setOpen(openstr);
						wgPlayerserver2.setDirty(true);
					}
				}
			}
         	
     		Collection<WgPlayerserver> wgplaylist=PlayerManager.getInstance().getIdplayermap().values();
			List<WgPlayerserver> wglist=new ArrayList<WgPlayerserver>();
			wglist.addAll(wgplaylist);
        	List<LovetreeCount> lovetreelist2=new ArrayList<LovetreeCount>();
			CardManager cardManager=CardManager.getInstance();	
       		//Map<Integer,Host> map=cardManager.mainhost();
			for (int i = 0; i < wglist.size(); i++) {
				WgPlayerserver wg=wglist.get(i);
				List<WgLovetree> lovetreelist=wg.getLovetree().getListlovetree();
				if(lovetreelist!=null && lovetreelist.size()>0){
					for(WgLovetree wgLovetree:lovetreelist){
						LovetreeCount lovetreeCount=new LovetreeCount();
						lovetreeCount.setLid(wgLovetree.getLid());
						lovetreeCount.setPlayername(wg.getPlayername());
						lovetreeCount.setUsername(wg.getUsername());
						lovetreeCount.setHostid(wgLovetree.getHostid());
						lovetreeCount.setHostname(cardManager.mainhost().get(wgLovetree.getHostid()).getName());
						lovetreeCount.setLevel(wgLovetree.getLevel());
						lovetreeCount.setGrowth(wgLovetree.getGrowth());
						lovetreeCount.setId(wgLovetree.getId());
						lovetreeCount.setServeruid(wg.getServeruid());
						lovetreelist2.add(lovetreeCount);
					}
				}
			}     
			//每页最大显示数量
			int size=16;
			//总页数
			int PageCount=0;
			
			if(lovetreelist2.size()%size==0)
			{
				PageCount=lovetreelist2.size()/size;
			}else{
				PageCount=lovetreelist2.size()/size+1;
			}
			//总条数
			request.setAttribute("max", wglist.size());
			request.setAttribute("size", size);
			String pageNo=request.getParameter("pageNo");
    		if(pageNo==null || pageNo.equals("")){
    			pageNo="1";
    		}
    		request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageCount", PageCount);
     		request.setAttribute("list", lovetreelist2);
     		JSONArray listArray=JSONArray.fromObject(lovetreelist2);
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
			deleteoneuser();
			allopen();
			skip();
			getoperation();
		});
	 //逻辑删除
	 function deleteoneuser(){
	 	$(document).on('click','#deleteoneuser',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		var playname = $(this).parent().parent().parent().find("td:eq(3)").text();
	 		layer.closeAll();
	 		layer.confirm('注意:删除后无法找回！', {icon: 2, title:'删除'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/allwglist.jsp?serveruid='+id+'&parameter=1';
				});
	 	});
	 }
	 
	 //一键开启
	 function allopen(){
	 	$(document).on('click','#allopen',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		location.href = webPath+'/adm/wgplayer/allwglist.jsp?serveruid='+id+'&parameter=2';
	 	});
	 }
	 
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
	 			shadeClose:true,
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
	 		var userName=document.getElementById("userName").value;
	 		userName=$.trim(userName);
	 		document.getElementById("userName").value=userName; 
	 		var playName=document.getElementById("playName").value;
	 		playName=$.trim(playName);
	 		document.getElementById("playName").value=playName; 
			$("#addressbody").empty();
	 		var content="";
	 		//1.只查账号
	 		if(userName!="" && playName==""){
	 			 		$.each(${listArray},function(index,wg){
	 					if(wg.username==userName){
	 						content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
 								 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.hostid+'('+wg.hostname+')</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.growth+'</td>' +
				             '</tr>';
	 				}			                                        				                                         
	 			});
	 		}else if(playName!="" &&userName==""){
	 		//2.只查昵称
	 			 		$.each(${listArray},function(index,wg){
	 					if(wg.playername.indexOf(playName) != -1){
	 						content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
 								 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.hostid+'('+wg.hostname+')</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.growth+'</td>' +
				             '</tr>';
	 				}			                                        				                                         
	 			});
	 		}else if(playName!="" && userName!=""){
	 		//3.账号、昵称都查
	 			 		$.each(${listArray},function(index,wg){
	 					if(wg.playername==playName && wg.username==userName){
	 					content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
 								 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.hostid+'('+wg.hostname+')</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.growth+'</td>' +
				             '</tr>';
	 				}			                                        				                                         
	 			});
	 		}else{
	 		//都不查
	 			$.each(${listArray},function(index,wg){
	 			if(index>=0){
	 			if(index<${size}){
	 					content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
 								 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.hostid+'('+wg.hostname+')</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.growth+'</td>' +
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
	 		$.each(${listArray},function(index,wg){
	 			if(index>=0){
	 			if(index<${size}){
	 					content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
 								 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.hostid+'('+wg.hostname+')</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.growth+'</td>' +
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
			}else{
	 		document.getElementById("pageNo").value=jump;
	 		$("#addressbody").empty();
	 		var content="";
	 		if(jump>=1 && jump<=${pageCount}){
	 		$.each(${listArray},function(index,wg){
	 			if(index>=${size}*(jump-1)){
	 			if(index<${size}*jump){
	 					content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
 								 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.hostid+'('+wg.hostname+')</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.growth+'</td>' +
				             '</tr>';
	 			}
	 			}
	 		});
	 		}
	 		$("#addressbody").append(content);     
	 		}
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
	 		$.each(${listArray},function(index,wg){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 					content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
 								 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.hostid+'('+wg.hostname+')</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.growth+'</td>' +
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
	 		$.each(${listArray},function(index,wg){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 					content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
 								 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.hostid+'('+wg.hostname+')</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.growth+'</td>' +
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
	 		document.getElementById("pageNo").value=lastpage;
			$("#addressbody").empty();
	 		var content="";
	 		$.each(${listArray},function(index,wg){
	 			if(index>=(lastpage-1)*${size}){
	 					content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
 								 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.hostid+'('+wg.hostname+')</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.growth+'</td>' +
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
	 			shadeClose:true,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/knapsack.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
	 	    	}
	 		});
	 	});
	 };
	 
	 //操作
	 function getoperation(){
	 	$(document).on('click','#operation',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
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
	 			content:[webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&type=all'],
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
                                <div class="widget-title  am-cf">爱情树统计</div>


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
                                        <%-- <input type="text" class="am-form-field " placeholder="请输入熊猫id" id="userName" name="userName">
                                        <input type="text" class="am-form-field" placeholder="请输入昵称" align="left"
										id="playName" name="userName" />
                                        <span class="am-input-group-btn">
								            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button>
								        </span> --%>
								        <table>
	                                    	<tr>
	                                    		<td>
													<input type="text" class="am-form-field" placeholder="请输入熊猫id" align="right"
													id="userName" name="userName" />
												</td>	
												<td>
												<input type="text" class="am-form-field" placeholder="请输入昵称" align="left"
												id="playName" name="playName" />
												</td>
										    	<td>
											    	<span class="am-input-group-btn">
													    <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
														id="queryuser" name="queryuser" type="button"
														onclick="selectwg();"></button> 
													</span>
												</td>
	                                       </tr>
                                 		</table>
                                    </div>
                                </div>
							</div>
                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>serveruid</th>
                                                <th>熊猫id</th>
                                                <th>玩家昵称</th>
                                                <th>男主id(男主名称)</th>
                                                <th>爱情树等级</th>
                                                <th>成长值</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
												 <s:forEach var="wg" items="${list}" varStatus="status">
												 	<s:if test="${status.count<=size }">
													<tr>
	                                                       	<td>${status.count }</td>
	                                                       	<td class="am-text-middle">${wg.serveruid}</td>
	                                                       	<td>${wg.username }</td>
	                                                        <td>${wg.playername }</td>
	                                                        <td>${wg.hostid}(${wg.hostname })</td>
	                                                        <td>${wg.level}</td>
	                                                        <td>${wg.growth }</td>
	                                                        <td class="am-text-middle">
							                                     <div class="tpl-table-black-operation">
							                                         <!-- <a id="selectoneuser" class="updateBtn" href="javascript:;">
							                                             <i class="am-icon-pencil"></i> 编辑</a>
							                                         <a id="info" class="updateBtn" href="javascript:;">
							                                             <i class="am-icon-pencil"></i> 背包</a>
							                                         <a id="allopen"
																		class="updateBtn" href="javascript:;"> <i
																		class="am-icon-pencil"></i> 开启功能 </a>
																	 <a id="skip"
																		class="updateBtn" href="javascript:;"> <i
																		class="am-icon-pencil"></i> 跳过引导 </a> 
							                                         <a id="deleteoneuser" class="delBtn" href="javascript:;" class="tpl-table-black-operation-del">
							                                             <i class="am-icon-trash"></i> 删除</a> -->
							                                            <!--  <a id="operation" class="updateBtn" href="javascript:;">
																			<i class="am-icon-pencil"></i> 操作 </a> -->
							                                     </div>
							                                 </td>
	                                                 </tr>
	                                                 </s:if>
                                                 </s:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- <form action="allwglist.jsp" method="post" id="pagenofrom"> -->
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