<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.open.OpenManager,
    web.webSocket.open.Open,
    web.webSocket.util.Util,
    web.webSocket.vip.VipManager,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.pojo.WgPlayerserver2,
    web.webSocket.pojo.WgHangup,
    web.webSocket.mapper.WgPlayerserver4Mapper,
    web.webSocket.pojo.Wgselectplayerserver,
    web.webSocket.pojo.WgPlayerserver4"%>
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
	public class WgPlayerserverClient {
	private int id;
	private long serveruid;//id
	private String username;//账号
	private String playername;//昵称
	private int level;//等级
	private int gold;//等级
	private int physical;//爱心
	private int diamond;//钻石
	private int bean;//相思豆
	private int viplevel;//vip等级
	private int totalrmbdiamond;//充值VIP对应领取的钻石
	private int arenagold;//百花勋章
	private String channel;//渠道
	private int lovecurrency;//情缘线索
	private Integer onlinetime;//库里在线时长（秒）  JSP这里显示分钟
    private String lastlogintime;//最后登录时间
    private int hangupnum;//游历值
    private Integer lovesection;//姻缘节
    private Integer redthread;//红线
    
    public Integer getRedthread() {
		return redthread;
	}

	public void setRedthread(Integer redthread) {
		this.redthread = redthread;
	}

	public Integer getLovesection() {
		return lovesection;
	}

	public void setLovesection(Integer lovesection) {
		this.lovesection = lovesection;
	}
    
    public int getHangupnum() {
		return hangupnum;
	}

	public void setHangupnum(int hangupnum) {
		this.hangupnum = hangupnum;
	}
    
	public Integer getOnlinetime() {
		return onlinetime;
	}

	public void setOnlinetime(Integer onlinetime) {
		this.onlinetime = onlinetime;
	}

	public String getLastlogintime() {
		return lastlogintime;
	}

	public void setLastlogintime(String lastlogintime) {
		this.lastlogintime = lastlogintime;
	}
    
    public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}
	
	public int getBean() {
		return bean;
	}
	public void setBean(int bean) {
		this.bean = bean;
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
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getGold() {
		return gold;
	}
	public void setGold(int gold) {
		this.gold = gold;
	}
	public int getPhysical() {
		return physical;
	}
	public void setPhysical(int physical) {
		this.physical = physical;
	}
	public int getDiamond() {
		return diamond;
	}
	public void setDiamond(int diamond) {
		this.diamond = diamond;
	}
	public Integer getTotalrmbdiamond() {
		return totalrmbdiamond;
	}

	public void setTotalrmbdiamond(Integer totalrmbdiamond) {
		this.totalrmbdiamond = totalrmbdiamond;
	}
	public Integer getViplevel() {
    	viplevel=VipManager.getviplv(this.totalrmbdiamond);
		return viplevel;
	}

	public void setViplevel(Integer viplevel) {
		this.viplevel = viplevel;
	}
	public void setLovecurrency(int lovecurrency) {
		this.lovecurrency = lovecurrency;
	}
	public int getLovecurrency() {
		return lovecurrency;
	}
	public int getArenagold() {
		return arenagold;
	}

	public void setArenagold(int arenagold) {
		this.arenagold = arenagold;
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
						if(open.getType()!=1){
							openstr+=open.getToid()+",";
						}
					}
					if(openstr.substring(openstr.length()-1,openstr.length()).equals(",")){
						openstr=openstr.substring(0, openstr.length()-1);
						WgPlayerserver wgPlayerserver=PlayerManager.getInstance().getplayer(uid);
						WgPlayerserver2 wgPlayerserver2=wgPlayerserver.getWgPlayerserver2();
						wgPlayerserver2.setOpen(openstr);
						wgPlayerserver2.setDirty(true);
					}
				}else if(parame==3){
					//跳过引导
					String newbieguide="999,";
					for(Open open:OpenManager.getInstance().getOpenmap().values()){
						if(open.getType()!=1){
							newbieguide+=open.getToid()*1000+999+",";
						}
					}
					if(newbieguide.substring(newbieguide.length()-1,newbieguide.length()).equals(",")){
						newbieguide=newbieguide.substring(0, newbieguide.length()-1);
						WgPlayerserver wgPlayerserver=PlayerManager.getInstance().getplayer(uid);
						wgPlayerserver.setNewbieguide(newbieguide);
					}
				}
				
			}
         	PlayerManager playerManager=PlayerManager.getInstance();
     		Collection<WgPlayerserver> wgplaylist=playerManager.getIdplayermap().values();
			List<WgPlayerserver> wglist=new ArrayList<WgPlayerserver>();
			wglist.addAll(wgplaylist);
        	List<WgPlayerserverClient> wglistclient=new ArrayList<WgPlayerserverClient>();	
        	
        	//存放wg4
			//Hashtable<Long,WgPlayerserver4> idplayerwg4map=playerManager.selectallwg4(0,"");

			for (int i = 0; i < wglist.size(); i++) {
				WgPlayerserver wg=wglist.get(i);
				if(wg.getUsername().equals("-1") || wg.getUsername().equals("-2")){
					continue;
				}
				WgPlayerserverClient wgPlayerserverClient=new WgPlayerserverClient();
				wgPlayerserverClient.setId(wg.getId());
				wgPlayerserverClient.setServeruid(wg.getServeruid());
				wgPlayerserverClient.setDiamond(wg.getDiamond());
				wgPlayerserverClient.setArenagold(wg.getArenagold());
				wgPlayerserverClient.setGold(wg.getGold());
				wgPlayerserverClient.setLevel(wg.getLevel());
				wgPlayerserverClient.setPhysical(wg.getPhysical());
				wgPlayerserverClient.setPlayername(wg.getPlayername());
				wgPlayerserverClient.setUsername(wg.getUsername());
				wgPlayerserverClient.setBean(wg.getBean());
				wgPlayerserverClient.setTotalrmbdiamond(wg.getTotalrmbdiamond());
				wgPlayerserverClient.setViplevel(wgPlayerserverClient.getTotalrmbdiamond());
				wgPlayerserverClient.setChannel(wg.getChannel());
				wgPlayerserverClient.setLovecurrency(wg.getLovecurrency());
				if(wg.getWgHangup2()!=null){
					WgHangup wgHangup=wg.getWgHangup2().getHangupsold();
					if(wgHangup!=null){
					wgPlayerserverClient.setHangupnum(wgHangup.getHangupnum());
					}
				}else{
					wgPlayerserverClient.setHangupnum(0);
				}
				//WgHangup wgHangup=wg.getWgHangup2().getHangups();
				//if(wgHangup!=null){
				//	wgPlayerserverClient.setHangupnum(wgHangup.getHangupnum());
				//}else{
					wgPlayerserverClient.setHangupnum(0);
				//}
				wgPlayerserverClient.setOnlinetime(wg.getOnlinetime()/60);
				if(wg.getLastlogintime()==0){
					wgPlayerserverClient.setLastlogintime("");
				}else{
					wgPlayerserverClient.setLastlogintime(Util.getDate(wg.getLastlogintime()*1000, 1));
				}
				wgPlayerserverClient.setLovesection(wg.getLovesection());
				wgPlayerserverClient.setRedthread(wg.getRedthread());
				wglistclient.add(wgPlayerserverClient); 
			}     
			//每页最大显示数量
			int size=16;
			//总页数
			int PageCount=0;
			int newsize=wglist.size()-2;
			if(newsize%size==0)
			{
				PageCount=newsize/size;
			}else{
				PageCount=newsize/size+1;
			}
			//总条数
			request.setAttribute("max", newsize);
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
	 
	 //跳过引导
	 function skip(){
	 	$(document).on('click','#skip',function(){
	 		var id = $(this).parent().parent().parent().find("td:eq(1)").text();
	 		layer.closeAll();
	 		location.href = webPath+'/adm/wgplayer/allwglist.jsp?serveruid='+id+'&parameter=3';
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
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
								 			'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
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
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
								 			'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
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
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
								 			'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
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
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
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
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
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
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
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
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
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
	 			if(index<${size}*page){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td class="am-text-middle" >'+wg.serveruid+'</td>' +
                                 '<td>'+wg.username+'</td>' +
                                 '<td>'+wg.playername+'</td>' +
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										 	 '</a>'+
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
                                 '<td>'+wg.level+'</td>' +
                                 '<td>'+wg.gold+'</td>' +
                                 '<td>'+wg.physical+'</td>' +
                                 '<td>'+wg.diamond+'</td>' +
                                 '<td>'+wg.arenagold+'</td>'+
                                 '<td>'+wg.lovecurrency+'</td>'+
                                 '<td>'+wg.bean+'</td>' +
                                 '<td>'+wg.hangupnum+'</td>' +
                                 '<td>'+wg.lovesection+'</td>' +
                                 '<td>'+wg.redthread+'</td>'+
                                 '<td>'+wg.onlinetime+'</td>'+
                                 '<td>'+wg.lastlogintime+'</td>' +	
                                 '<td>'+wg.viplevel+'</td>' +
                                 '<td>'+wg.channel+'</td>' +
                                 '<td>'+wg.totalrmbdiamond+'</td>' +       
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                       	'<a id="operation" class="updateBtn" href="javascript:;">'+
												'<i class="am-icon-pencil"></i> 操作'+ 
										'</a>'+
                                    '</div>'+
                                 '</td>'+
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
                                <div class="widget-title  am-cf">所有玩家列表</div>


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
                                        <%-- <input type="text" class="am-form-field " placeholder="请输入熊猫id" id="userName" name="userName">
                                        <input type="text" class="am-form-field" placeholder="请输入昵称" align="left"
										id="playName" name="userName" />
                                        <span class="am-input-group-btn">
								            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button>
								        </span> --%>
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
                                                <th>昵称</th>
                                                <th>等级</th>
                                                <th>铜钱</th>
                                                <th>体力</th>
                                                <th>钻石</th>
                                                <th>百花勋章</th>
												<th>情缘线索</th>
                                                <th>相思豆</th>
                                                <th>游历值</th>
                                                <th>姻缘结</th>
												<th>红线</th>
                                                <th>在线时长(分钟)</th>
												<th>最后登录时间</th>
                                                <th>vip等级</th>
                                                <th>渠道</th>
                                                <th>充值总数</th>
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
	                                                        <td>${wg.level }</td>
	                                                        <td>${wg.gold }</td>
	                                                        <td>${wg.physical }</td>
	                                                        <td>${wg.diamond }</td>
	                                                        <td>${wg.arenagold }</td>
															<td>${wg.lovecurrency }</td>
	                                                        <td>${wg.bean }</td>
	                                                        <td>${wg.hangupnum }</td>
	                                                        <td>${wg.lovesection }</td>
															<td>${wg.redthread }</td>
	                                                        <td>${wg.onlinetime }</td>
															<td>${wg.lastlogintime }</td>
											
	                                                        <td>${wg.viplevel }</td>
	                                                        <td>${wg.channel }</td>
	                                                        <td>${wg.totalrmbdiamond }</td>
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
							                                             <s:if test="${wg.username!='-1' && wg.username!='-2'}">
							                                             	<a id="operation" class="updateBtn" href="javascript:;">
																			<i class="am-icon-pencil"></i> 操作 </a>
							                                             </s:if>
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