<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.open.OpenManager,
    web.webSocket.vip.VipManager,
    web.webSocket.open.Open,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.plot.PlotManager,
    web.webSocket.pojo.WgPlayerserver2"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt"%>
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
<link rel="apple-touch-icon-precomposed"
	href="<%=path %>/assets/i/app-icon72x72@2x.png">
<link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
<link rel="stylesheet"
	href="<%=path %>/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="<%=path %>/assets/css/app.css">
<script src="<%=path %>/assets/js/jquery.min.js"></script>
<script src="<%=path %>/assets/js/amazeui.min.js"></script>
<script src="<%=path %>/assets/js/app.js"></script>
<script src="<%=path %>/assets/js/theme.js"></script>
<script src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<%!
	public class WgPlayerserverClient {
		private int id;
		private long serveruid;//id
		private String username;//账号
		private String playername;//昵称
		private String isfirst;
		private String one;
		private String six;
		private String three;
		private String maxchapsecid;
		private String ranking;
		private String bank;
		private String sevenday;
		private String monthtime;
		
		public String getMonthtime() {
			return monthtime;
		}
		public void setMonthtime(String monthtime) {
			this.monthtime = monthtime;
		}
		public String getSevenday() {
			return sevenday;
		}
		public void setSevenday(String sevenday) {
			this.sevenday = sevenday;
		}
		public String getBank() {
			return bank;
		}
		public void setBank(String bank) {
			this.bank = bank;
		}
		
		public String getIsfirst() {
			return isfirst;
		}
		public void setIsfirst(String isfirst) {
			this.isfirst = isfirst;
		}
		public String getOne() {
			return one;
		}
		public void setOne(String one) {
			this.one = one;
		}
		public String getSix() {
			return six;
		}
		public void setSix(String six) {
			this.six = six;
		}
		public String getThree() {
			return three;
		}
		public void setThree(String three) {
			this.three = three;
		}
		public String getMaxchapsecid() {
			return maxchapsecid;
		}
		public void setMaxchapsecid(String maxchapsecid) {
			this.maxchapsecid = maxchapsecid;
		}
		public String getRanking() {
			return ranking;
		}
		public void setRanking(String ranking) {
			this.ranking = ranking;
		}
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		public long getServeruid() {
			return serveruid;
		}
		public void setServeruid(long serveruid) {
			this.serveruid = serveruid;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPlayername() {
			return playername;
		}
		public void setPlayername(String playername) {
			this.playername = playername;
		}
	
}
	
 %>

<%
    /* 在线玩家查询 */
    PlayerManager playerManager=PlayerManager.getInstance();
	Collection<WgPlayerserver> wgplaylist=playerManager.getIdplayermap().values();
	List<WgPlayerserver> wglist=new ArrayList<WgPlayerserver>();
	wglist.addAll(wgplaylist);
	List<WgPlayerserverClient> wglistclient=new ArrayList<WgPlayerserverClient>();
		
	for (int i = 0; i < wglist.size(); i++) {
			WgPlayerserver wg=wglist.get(i);
			if(wg.getPlayername().equals("GM") || wg.getPlayername().equals("系统邮件")){
				continue;
			}
			WgPlayerserverClient wgPlayerserverClient=new WgPlayerserverClient();
			wgPlayerserverClient.setId(wg.getId());
			if(wg.getCardtime()==0){
				wgPlayerserverClient.setMonthtime("");
			}else{
				wgPlayerserverClient.setMonthtime(String.valueOf(wg.getCardtime()));
			}
			wgPlayerserverClient.setServeruid(wg.getServeruid());
			wgPlayerserverClient.setPlayername(wg.getPlayername());
			wgPlayerserverClient.setUsername(wg.getUsername());
			if(wg.getSevendayacticity().intValue()!=0){
				wgPlayerserverClient.setSevenday(String.valueOf(wg.getSevendayacticity()));
			}
			if(wg.getBank()==1){
				wgPlayerserverClient.setBank("是");
			}
			if(wg.getIsfirst()>0){
				wgPlayerserverClient.setIsfirst("是");
			}else{
				wgPlayerserverClient.setIsfirst("");
			}
			String one="";
			String three="";
			String six="";
			//>1:0 充值1元礼包  >2:0 充值3元礼包  >3:0 充值6元礼包
			String[] apecialoffergift2=wg.getSpecialoffergift2().split(",");
			if(Integer.valueOf(apecialoffergift2[0])>0){
				one="是";
			}
			if(Integer.valueOf(apecialoffergift2[1])>0){
				three="是";
			}
			if(Integer.valueOf(apecialoffergift2[2])>0){
				six="是";
			}
			wgPlayerserverClient.setOne(one);
			wgPlayerserverClient.setSix(six);
			wgPlayerserverClient.setThree(three);
			if(wg.getMaxcheckpoint()!=null){
				wgPlayerserverClient.setMaxchapsecid(wg.getMaxcheckpoint());
			}else{
				wgPlayerserverClient.setMaxchapsecid("1:1");
			}
			wglistclient.add(wgPlayerserverClient);
		}
			//每页最大显示数量
			int size=16;
			//总页数
			int PageCount=0;
			if(wglistclient.size()%size==0)
			{
				PageCount=wglistclient.size()/size;
			}else{
				PageCount=wglistclient.size()/size+1;
			}
			//总条数
			request.setAttribute("max", wglistclient.size());
			request.setAttribute("size", size);
			String pageNo=request.getParameter("pageNo");
    		if(pageNo==null || pageNo.equals("")){
    			pageNo="1";
    		}
    		request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageCount", PageCount);
			request.setAttribute("list", wglistclient);    
			JSONArray listArray=JSONArray.fromObject(wglistclient);
		    request.setAttribute("listArray", listArray);
%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			selectwg();
			homepage();
			previouspage();
			nextpage();
			lastpage();
			jump();
		});


	 //查询玩家
	 function selectwg(){
	 	$(document).on('click','#queryuser',function(){
	 		var userName=document.getElementById("userName").value;
	 		userName=$.trim(userName);
	 		document.getElementById("userName").value=userName; 
	 		var playName=document.getElementById("playName").value;
	 		playName=$.trim(playName);
	 		document.getElementById("playName").value=playName; 
	 		debugger;
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
                                 '<td>'+wg.isfirst+'</td>' +
                                 '<td>'+wg.one+'</td>' +
                                 '<td>'+wg.three+'</td>' +
                                 '<td>'+wg.six+'</td>' +
                                 '<td>'+wg.bank+'</td>' +
                                 '<td>'+wg.sevenday+'</td>' +
                                 '<td>'+wg.monthtime+'</td>' +
                                 '<td>'+wg.maxchapsecid+'</td>' +
                                 '<td>'+wg.ranking+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                    	'</div>'+
                                    '</td>'+
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
                                 '<td>'+wg.isfirst+'</td>' +
                                 '<td>'+wg.one+'</td>' +
                                 '<td>'+wg.three+'</td>' +
                                 '<td>'+wg.six+'</td>' +
                                 '<td>'+wg.bank+'</td>' +
                                 '<td>'+wg.sevenday+'</td>' +
                                 '<td>'+wg.monthtime+'</td>' +
                                 '<td>'+wg.maxchapsecid+'</td>' +
                                 '<td>'+wg.ranking+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                    	'</div>'+
                                    '</td>'+
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
                                 '<td>'+wg.isfirst+'</td>' +
                                 '<td>'+wg.one+'</td>' +
                                 '<td>'+wg.three+'</td>' +
                                 '<td>'+wg.six+'</td>' +
                                 '<td>'+wg.bank+'</td>' +
                                 '<td>'+wg.sevenday+'</td>' +
                                 '<td>'+wg.monthtime+'</td>' +
                                 '<td>'+wg.maxchapsecid+'</td>' +
                                 '<td>'+wg.ranking+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                    	'</div>'+
                                    '</td>'+
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
                                 '<td>'+wg.isfirst+'</td>' +
                                 '<td>'+wg.one+'</td>' +
                                 '<td>'+wg.three+'</td>' +
                                 '<td>'+wg.six+'</td>' +
                                 '<td>'+wg.bank+'</td>' +
                                 '<td>'+wg.sevenday+'</td>' +
                                 '<td>'+wg.monthtime+'</td>' +
                                 '<td>'+wg.maxchapsecid+'</td>' +
                                 '<td>'+wg.ranking+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                    	'</div>'+
                                    '</td>'+
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
                                 '<td>'+wg.isfirst+'</td>' +
                                 '<td>'+wg.one+'</td>' +
                                 '<td>'+wg.three+'</td>' +
                                 '<td>'+wg.six+'</td>' +
                                 '<td>'+wg.bank+'</td>' +
                                 '<td>'+wg.sevenday+'</td>' +
                                 '<td>'+wg.monthtime+'</td>' +
                                 '<td>'+wg.maxchapsecid+'</td>' +
                                 '<td>'+wg.ranking+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                    	'</div>'+
                                    '</td>'+
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
	 		if(jump>=1 && jump<=${pageCount}){
	 		$.each(${listArray},function(index,wg){
	 			if(index>=${size}*(jump-1)){
	 			if(index<${size}*jump){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.isfirst+'</td>' +
                                 '<td>'+wg.one+'</td>' +
                                 '<td>'+wg.three+'</td>' +
                                 '<td>'+wg.six+'</td>' +
                                 '<td>'+wg.bank+'</td>' +
                                 '<td>'+wg.sevenday+'</td>' +
                                 '<td>'+wg.monthtime+'</td>' +
                                 '<td>'+wg.maxchapsecid+'</td>' +
                                 '<td>'+wg.ranking+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                    	'</div>'+
                                    '</td>'+
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
	 		if(pageno==1){
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
                                 '<td>'+wg.isfirst+'</td>' +
                                 '<td>'+wg.one+'</td>' +
                                 '<td>'+wg.three+'</td>' +
                                 '<td>'+wg.six+'</td>' +
                                 '<td>'+wg.bank+'</td>' +
                                 '<td>'+wg.sevenday+'</td>' +
                                 '<td>'+wg.monthtime+'</td>' +
                                 '<td>'+wg.maxchapsecid+'</td>' +
                                 '<td>'+wg.ranking+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                    	'</div>'+
                                    '</td>'+
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
	 		if(pageno==lastpage){
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
	 			debugger;
	 			if(index<${size}*page){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.isfirst+'</td>' +
                                 '<td>'+wg.one+'</td>' +
                                 '<td>'+wg.three+'</td>' +
                                 '<td>'+wg.six+'</td>' +
                                 '<td>'+wg.bank+'</td>' +
                                 '<td>'+wg.sevenday+'</td>' +
                                 '<td>'+wg.monthtime+'</td>' +
                                 '<td>'+wg.maxchapsecid+'</td>' +
                                 '<td>'+wg.ranking+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                    	'</div>'+
                                    '</td>'+
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
                                 '<td>'+wg.isfirst+'</td>' +
                                 '<td>'+wg.one+'</td>' +
                                 '<td>'+wg.three+'</td>' +
                                 '<td>'+wg.six+'</td>' +
                                 '<td>'+wg.bank+'</td>' +
                                 '<td>'+wg.sevenday+'</td>' +
                                 '<td>'+wg.monthtime+'</td>' +
                                 '<td>'+wg.maxchapsecid+'</td>' +
                                 '<td>'+wg.ranking+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                    	'</div>'+
                                    '</td>'+
				             '</tr>';
	 			
	 			}
	 		});
	 		$("#addressbody").append(content); 
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
						<div class="widget-title  am-cf">礼包统计</div>


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
						<%--  <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        <select data-am-selected="{btnSize: 'sm'}" id="myselect">
							            </select>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " placeholder="请输入账号" id="loginName">
                                        <span class="am-input-group-btn">
								            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryidandlevel" type="button"></button>
								        </span>
                                    </div>
                                </div>
							 --%>
						<!-- 内容区域 -->
						<form action="wglist.jsp" method="post" id="hp_form"
							name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">

							<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
								 <div
									class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
									<%-- <input type="text" class="am-form-field" placeholder="请输入熊猫id" align="right"
										id="userName" name="userName" />
									<input type="text" class="am-form-field" placeholder="请输入昵称" align="left"
										id="playName" name="playName" />
									    <span class="am-input-group-btn">
										 <button
											class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
											id="queryuser" name="queryuser" type="button"
											onclick="selectwg();"></button> 
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
						</form>
						<div class="am-u-sm-12">
							<table width="100%"
								class="am-table am-table-compact am-table-striped tpl-table-black "
								id="example-r">
								<thead>
									<tr>
										<th>编号</th>
										<th>serveruid</th>
										<th>熊猫id</th>
										<th>昵称</th>
										<th>是否首冲</th>
										<th>1元礼包</th>
										<th>3元礼包</th>
										<th>6元礼包</th>
										<th>聚宝钱庄</th>
										<th>七日充值</th>
										<th>月卡剩余时间(天)</th>
										<th>最大关卡</th>
										<!-- <th>竞技场排名</th> -->
									</tr>
								</thead>
								<tbody id="addressbody">
									<s:forEach var="wg" items="${list}" varStatus="status">
										<s:if test="${status.count<=16 }">
										<tr>
											<td>${status.count }</td>
											<td class="am-text-middle">${wg.serveruid}</td>
											<td>${wg.username }</td>
											<td>${wg.playername }</td>
											<td>${wg.isfirst }</td>
											<td>${wg.one }</td>
											<td>${wg.three }</td>
											<td>${wg.six }</td>
											<td>${wg.bank }</td>
											<td>${wg.sevenday }</td>
											<td>${wg.monthtime }</td>
											<td>${wg.maxchapsecid }</td>
											<%-- <td>${wg.ranking }</td> --%>
											<td class="am-text-middle">
												<div class="tpl-table-black-operation">
													<!-- <a id="selectoneuser" class="updateBtn" href="javascript:;">
														<i class="am-icon-pencil"></i> 编辑 </a> 
													<a id="info"
														class="updateBtn" href="javascript:;"> <i
														class="am-icon-pencil"></i> 背包 </a>
													<a id="offline"
													class="updateBtn" href="javascript:;"> <i
													class="am-icon-pencil"></i> 下线 </a> 
													<a id="allopen"
														class="updateBtn" href="javascript:;"> <i
														class="am-icon-pencil"></i> 开启功能 </a>
													<a id="skip"
														class="updateBtn" href="javascript:;"> <i
														class="am-icon-pencil"></i> 跳过引导 </a>
													<a id="openplot"
														class="updateBtn" href="javascript:;"> <i
														class="am-icon-pencil"></i> 开启剧情 </a> 
													<a id="deleteoneuser"
														class="delBtn" href="javascript:;"
														class="tpl-table-black-operation-del"> <i
														class="am-icon-trash"></i> 删除 </a> -->
													<!-- <a id="operation" class="updateBtn" href="javascript:;">
														<i class="am-icon-pencil"></i> 操作 </a> -->
												</div>
										    </td>
										</tr>
										</s:if>
									</s:forEach>
								</tbody>
							</table>
						</div>
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