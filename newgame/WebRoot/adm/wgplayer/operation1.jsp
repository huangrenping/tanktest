<%@page import="web.webSocket.activity.ActivityManager"%>
<%@page import="web.webSocket.rightdress.RightdressManager"%>
<%@page import="web.webSocket.plotone.PlotoneManager"%>
<%@page import="web.webSocket.card.CardManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    java.util.regex.Pattern,
    java.util.regex.Matcher,
    web.webSocket.open.OpenManager,
    web.webSocket.activity.ActivityManager,
    web.webSocket.answer.AnswerManager,
    web.webSocket.open.Open,
    web.webSocket.message.Messagepush,
    web.webSocket.pojo.WgPlayerserver2,
    web.webSocket.pojo.WgPlayerserver7,
    web.webSocket.plot.PlotManager,
    web.webSocket.pojo.WgPlayerserverClient,
    web.webSocket.pojo.WgHost,
    web.webSocket.util.MD5Util,
    web.webSocket.pojo.WgPlayerserver"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
<link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="<%=path %>/assets/css/app.css">
<link rel="stylesheet" href="<%=path %>/assets/js/amazeui.datetimepicker-se.min.css">

<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script> 


<style>
* {
    margin: 0;
    border: 0;
    padding: 0;
    font-size: 13pt;
}
 
/* #nav {
    height: 40px;
    border-top: #060 2px solid;
    border-bottom: #060 2px solid;
    background-color: #690;
} */
 
#nav ul {
    list-style: none;
    margin-left: 50px;
}
 
#nav li {
    display: inline;
    line-height: 40px;
    float:left
}
 
#nav a {
    color: #fff;
    text-decoration: none;
    padding: 10px 20px;
}
 
#nav a:hover {
    background-color: #0e90d2;
}
</style>

<%
	
    //删除账号逻辑
	String serveruid=request.getParameter("serveruid");
	if(serveruid==null || serveruid.equals("")){
 		return ;
 	}
	String parameter=request.getParameter("parameter");
	String type=request.getParameter("type");
	long seruid=Long.parseLong(serveruid);
	WgPlayerserver wg=PlayerManager.getInstance().getplayer(seruid);
	request.setAttribute("type", type);
	if(wg!=null){
		request.setAttribute("wg", wg);
	}
	List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
	ActivityManager activityManager=ActivityManager.getInstance();
	
	int num=0;
	//parameter=1 删除  2一键开启
	if(wg!=null && parameter!=null && !parameter.equals("")){
		int parame=Integer.valueOf(parameter);
		//long uid=Long.parseLong(serveruid);
		if(parame==20108){
			//检查账号是否有该权限
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20108){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			//删除
			PlayerManager.getInstance().del(seruid);
			
		}else if(parame==20104){
		//检查账号是否有该权限
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20104){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			//一键开启
			String openstr="";
			for(Open open:OpenManager.getInstance().getOpenmap().values()){
				if(open.getType()!=1){
					openstr+=open.getToid()+",";
				}
			}
			if(openstr.substring(openstr.length()-1,openstr.length()).equals(",")){
				openstr=openstr.substring(0, openstr.length()-1);
				//WgPlayerserver wgPlayerserver=PlayerManager.getInstance().getplayer(uid);
				WgPlayerserver2 wgPlayerserver2=wg.getWgPlayerserver2();
				wgPlayerserver2.setOpen(openstr);
				wgPlayerserver2.setDirty(true);
			}
		}else if(parame==20105){
			//检查账号是否有该权限
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20105){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			//跳过引导
			String newbieguide="999,";
			for(Open open:OpenManager.getInstance().getOpenmap().values()){
				newbieguide+=open.getToid()*1000+999+",";
			}
			if(newbieguide.substring(newbieguide.length()-1,newbieguide.length()).equals(",")){
				newbieguide=newbieguide.substring(0, newbieguide.length()-1);
				WgPlayerserver wgPlayerserver=PlayerManager.getInstance().getplayer(seruid);
				wgPlayerserver.setNewbieguide(newbieguide);
			}
		}else if(parame==20103){
			//检查账号是否有该权限
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20103){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			//下线
			PlayerManager.getInstance().offline(seruid);
		}/* else if(parame==20106){
			//检查账号是否有该权限
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20106){
					num++;
					break;
				}
			}
			if(num<1){
				return ;
			}
			//开启剧情
			PlotManager.getInstance().openplot(seruid);
			
		} */else if(parame==20109){
			//重置当日数据
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20109){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			long time=System.currentTimeMillis();
			wg.resetData(time,1);
			//AnswerManager.getInstance().getAnswerEverydayScoreList().clear();
		}else if(parame==20111){
			//重置当月签到数据
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20111){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			wg.getWgPlayerserver8().setSignagainlist(new ArrayList<Integer>());
			wg.getWgPlayerserver8().setSignagaingetlist(new ArrayList<Integer>());
			wg.getWgPlayerserver2().setSignstr("");
			wg.getWgPlayerserver7().setSigntotalstate(new int [10]);
			wg.getWgPlayerserver2().setRetroactivenum(0);
			wg.getWgPlayerserver2().setCarsignstr("");
		}else if(parame==20112){
			//赠送所有卡牌
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20112){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			String userid=(String)session.getAttribute("userid");
			int userid2=Integer.valueOf(userid);
			CardManager.getInstance().addallcard(userid2,seruid);
		}else if(parame==20113){
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20113){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			//开启所有约会剧情
			List<WgHost>listhost=wg.getHost().getList();
			for(WgHost wghost:listhost){
					wghost.setIsopen(1);
					wghost.setDirty(true);
			}		
	
		}else if(parame==20118){
			//赠送所有纸娃娃
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20118){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			String userid=(String)session.getAttribute("userid");
			int userid2=Integer.valueOf(userid);
			RightdressManager.getInstance().addallrightdress(userid2,seruid);
	
		}else if(parame==20119){
			//允许聊天
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20119){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			wg.getWgPlayerserver4().setShutup(0);
		}else if(parame==20120){
			//禁止聊天
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20120){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			wg.getWgPlayerserver4().setShutup(1);
		}else if(parame==20121){
			//允许登录
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20121){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			wg.getWgPlayerserver4().setSignin(0);
		}else if(parame==20122){
			//允许登录
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20122){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			wg.getWgPlayerserver4().setSignin(1);
			PlayerManager.getInstance().offline(wg.getServeruid());
		}else if(parame==20123){
			//赠送一个抽奖码
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20123){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			activityManager.oneyuannumer(0,wg.getServeruid());
		}else if(parame==20124){
			//赠送一个抽奖码
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20124){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			activityManager.oneyuannumer(1,wg.getServeruid());
		}else if(parame==20125){
			//充值月卡
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20125){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(sid+username, 0);//sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/mouthcard.jsp?username="+username+"&sid="+sid+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20126){
			//充值聚宝钱庄
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20126){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(580+sid+username, 0);//diamond+sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/bankdiamond.jsp?username="+username+"&sid="+sid+"&diamond=680"+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20127){
			//充值6元
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20127){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(60+sid+username, 0);//diamond+sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/diamond.jsp?username="+username+"&sid="+sid+"&diamond=60"+"&token="+token+"'</script>");
				
				
				//String token=PlayerManager.getInstance().houtaichongzhi(569+sid+username, 0);
				//response.getWriter().write("<script>window.location.href='../system/gift.jsp?username="+username+"&sid="+sid+"&type=569"+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20128){
			//充值18元
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20128){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(180+sid+username, 0);//diamond+sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/diamond.jsp?username="+username+"&sid="+sid+"&diamond=180"+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20129){
			//充值68元
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20129){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(680+sid+username, 0);//diamond+sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/diamond.jsp?username="+username+"&sid="+sid+"&diamond=680"+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20130){
			//充值128元
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20130){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(1280+sid+username, 0);//diamond+sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/diamond.jsp?username="+username+"&sid="+sid+"&diamond=1280"+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20131){
			//充值328元
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20131){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(3280+sid+username, 0);//diamond+sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/diamond.jsp?username="+username+"&sid="+sid+"&diamond=3280"+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20132){
			//充值648元
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20132){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(6480+sid+username, 0);//diamond+sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/diamond.jsp?username="+username+"&sid="+sid+"&diamond=6480"+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20133){
			//充值周卡
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20133){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(sid+username, 0);//sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/weeklycard.jsp?username="+username+"&sid="+sid+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20134){
			//心跳容错
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20134){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(sid+username, 0);//sid+username+appid
				response.getWriter().write("<script>window.location.href='"+path+"/Admincheck/resetheart?username="+username+"&sid="+sid+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20135){
			//心跳容错
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20134){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(sid+username, 0);//sid+username+appid
				response.getWriter().write("<script>window.location.href='"+path+"/Admincheck/xiuniangreset?username="+username+"&sid="+sid+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20136){
			//充值月卡
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20136){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi(sid+username, 0);//sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/jika.jsp?username="+username+"&sid="+sid+"&token="+token+"'</script>");
				return ;
			}
		}else if(parame==20137){
			//充值基金
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==20137){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}else{
				String username = wg.getUsername();
				String sid = String.valueOf(wg.getSid());
				String token=PlayerManager.getInstance().houtaichongzhi("0"+sid+username, 0);//sid+username+appid
				response.getWriter().write("<script>window.location.href='../system/jijin.jsp?username="+username+"&sid="+sid+"&type=0&token="+token+"'</script>");
				return ;
			}
		}
	}

%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			getreceedit();
			getknapsack();
			deleteoneuser();
			allopen();
			skip();
			offline();
			openplot();
			getlovetree();
			resetdata();
			getcard();
			resetsign();
			allcard();
			plotone();
			addlove();
			getplot();
			getgrowup();
			allrightdress();//一键赠送所有服饰
			yesspeak();
			nosspeak();
			yeslogin();
			nologin();
			oneyuanstate();
			tenyuanstate();
			givemonthcard();
			giveyuekacard();
			jijin();
			
			givebank();
			give6yuan();
			give18yuan();
			give68yuan();
			give128yuan();
			give328yuan();
			give648yuan();
			giveweekcard();
			heartbeatfault();
			xiuniangfault();
		});
		
	 //逻辑删除
	 function deleteoneuser(){
	 	$(document).on('click','#deleteoneuser',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		var ranking = $("#ranking").val();
	 		layer.closeAll();
	 		//百花排行-1的，可以直接删除，否者修改熊猫玩id
	 		if(ranking!=-1){
	 			layer.confirm('注意:百花盛宴有排名无法删除,是否强制删除！', {icon: 2, title:'删除:'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20108';
				});
	 		}else{
			 	layer.confirm('注意:删除后无法找回！', {icon: 2, title:'删除:'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20108';
				});
	 		}
	 	});
	 }
	 
	 //一键开启
	 function allopen(){
	 	$(document).on('click','#allopen',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("成功开启功能")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20104';
	 		} */
	 		 layer.closeAll();
 			 layer.confirm('注意:是否一键开启所有功能！', {icon: 0, title:'一键开启:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20104';
			});
	 	});
	 }
	 //跳过引导
	 function skip(){
	 	$(document).on('click','#skip',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("成功跳过引导")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
    			layer.closeAll();
				location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20105';
 	    	} */
 	    	layer.closeAll();
	 		layer.confirm('注意:是否跳过引导！', {icon: 0, title:'跳过引导:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20105';
			});
	 	});
	 }
	  //一键开启约会剧情
	 function plotone(){
	 	$(document).on('click','#plotone',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['约会信息'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/plotone.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
	 	    	}
	 		});
	 	});
	 }
	 //查看与男主甜蜜度
	 function addlove(){
	 	$(document).on('click','#addlove',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑甜蜜度'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/addlove.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
	 	    	}
	 		});
	 	});
	 };
	 //下线
	 function offline(){
	 	$(document).on('click','#offline',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家已被踢下线")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20103';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:是否踢玩家下线！', {icon: 0, title:'下线:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20103';
			});
	 	});
	 }
	 //重置当日数据
	 function resetdata(){
	 	$(document).on('click','#resetdata',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:是否重置当日数据！', {icon: 0, title:'重置当日数据:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
			});
	 	});
	 }
	 //允许聊天
	 function yesspeak(){
	 	$(document).on('click','#yesspeak',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:允许玩家聊天！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20119';
			});
	 	});
	 }
	 //允许聊天
	 function nosspeak(){
	 	$(document).on('click','#nosspeak',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:禁止玩家聊天！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20120';
			});
	 	});
	 }
	 //允许登录
	 function yeslogin(){
	 	$(document).on('click','#yeslogin',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:允许玩家登录！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20121';
			});
	 	});
	 }
	 //禁止登录
	 function nologin(){
	 	$(document).on('click','#nologin',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:允许玩家登录！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20122';
			});
	 	});
	 }
	 //1元抽奖码
	 function oneyuanstate(){
	 	$(document).on('click','#onyuanstate',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定送玩家1个抽奖码！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20123';
			});
	 	});
	 }
	 //11元抽奖码
	 function tenyuanstate(){
	 	$(document).on('click','#tenyuanstate',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定送玩家11个抽奖码！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20124';
			});
	 	});
	 }
	 //开启剧情
	 function openplot(){
	 	$(document).on('click','#openplot',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		layer.closeAll();
	 		layer.confirm('注意:确定后请稍等10秒刷新进入游戏！', {icon: 0, title:'开启剧情:'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20106';
			});	
	 	});
	 }
	 //剧情信息
	 function getplot(){
	 	$(document).on('click','#plot',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['剧情信息'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/plot.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
	 //成长任务
	 function getgrowup(){
	 	$(document).on('click','#growup',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['成长任务'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/growup.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };
	 //重置当月签到数据
	 function resetsign(){
	 	$(document).on('click','#resetsign',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		layer.closeAll();
	 		layer.confirm('注意:确定重置当月签到数据吗？', {icon: 0, title:'重置当月签到数据:'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20111';
			});	
	 	});
	 }
	 //赠送所有卡牌
	 function allcard(){
	 	$(document).on('click','#allcard',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送全部卡牌吗？', {icon: 0, title:'赠送全部卡牌:'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20112';
			});	
	 	});
	 }
	 	 //赠送所有纸娃娃
	 function allrightdress(){
	 	$(document).on('click','#allrightdress',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送全部服饰吗？', {icon: 0, title:'赠送全部服饰:'+playname}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20118';
			});	
	 	});
	 }
	 //编辑弹窗
	 function getreceedit(){
	 	$(document).on('click','#selectoneuser',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑用户'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/wgupdate.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		window.location.reload();
	 	    	}
	 		});
	 	});
	 };

	 //查看玩家背包
	 function getknapsack(){
	 	$(document).on('click','#info',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑背包'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/knapsack.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
	 	    	}
	 		});
	 	});
	 };
	 
	 //查看约会信息
	 function getplotone(){
	 	$(document).on('click','#plotone',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑背包'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/plotone.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
	 	    	}
	 		});
	 	});
	 };
	 //查看爱情树
	 function getlovetree(){
	 	$(document).on('click','#lovetree',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑爱情树'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/lovetree.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
	 	    	}
	 		});
	 	});
	 };
	 //查看玩家卡牌
	 function getcard(){
	 	$(document).on('click','#card',function(){
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['编辑卡牌'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/card.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
	 	    	}
	 		});
	 	});
	 };
	
	function givemonthcard(){
	 	$(document).on('click','#givemonthcard',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送玩家月卡吗！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20125';
			});
	 	});
	 }
	 
	 function giveyuekacard(){
	 	$(document).on('click','#jika',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送玩家季卡吗！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20136';
			});
	 	});
	 }
	 function jijin(){
	 	$(document).on('click','#jijin',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送玩家基金吗！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20137';
			});
	 	});
	 }
	 
	 
	 function givebank(){
	 	$(document).on('click','#givebank',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送玩家聚宝钱庄吗！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20126';
			});
	 	});
	 }
	 function give6yuan(){
	 	$(document).on('click','#give6yuan',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送玩家6元吗！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20127';
			});
	 	});
	 }
	 function give18yuan(){
	 	$(document).on('click','#give18yuan',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送玩家18元吗！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20128';
			});
	 	});
	 }
	 function give68yuan(){
	 	$(document).on('click','#give68yuan',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送玩家68元吗！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20129';
			});
	 	});
	 }
	 function give128yuan(){
	 	$(document).on('click','#give128yuan',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送玩家128元吗！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20130';
			});
	 	});
	 }
	 function give328yuan(){
	 	$(document).on('click','#give328yuan',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送玩家328元吗！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20131';
			});
	 	});
	 }
	 function give648yuan(){
	 	$(document).on('click','#give648yuan',function(){
	 		var id = $("#serveruid").val();
	 		var playname = $("#playername").val();
	 		/* layer.msg("玩家当日数据已经重置")
	 		//延迟0.8S关闭
 	    	setTimeout(timeout,800)
 	    	function timeout(){
		 		layer.closeAll();
		 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
	 		} */
	 		layer.closeAll();
	 		layer.confirm('注意:确定赠送玩家648元吗！', {icon: 0, title:'玩家:'+playname}, function(index){
			  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20132';
			});
	 	});
	 }
		function giveweekcard(){
		 	$(document).on('click','#giveweekcard',function(){
		 		var id = $("#serveruid").val();
		 		var playname = $("#playername").val();
		 		/* layer.msg("玩家当日数据已经重置")
		 		//延迟0.8S关闭
	 	    	setTimeout(timeout,800)
	 	    	function timeout(){
			 		layer.closeAll();
			 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
		 		} */
		 		layer.closeAll();
		 		layer.confirm('注意:确定赠送玩家周卡吗！', {icon: 0, title:'玩家:'+playname}, function(index){
				  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
	           	  	location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20133';
				});
		 	});
		 }
		function heartbeatfault(){
		 	$(document).on('click','#heartbeatfault',function(){
		 		var id = $("#serveruid").val();
		 		var playname = $("#playername").val();
		 		/* layer.msg("玩家当日数据已经重置")
		 		//延迟0.8S关闭
	 	    	setTimeout(timeout,800)
	 	    	function timeout(){
			 		layer.closeAll();
			 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
		 		} */
		 		layer.closeAll();
		 		layer.confirm('注意:确定执行吗!！', {icon: 0, title:'玩家:'+playname}, function(index){
				  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
	           	  	//location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20134';
	           	  	location.href =webPath +'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20134';
				});
		 	});
		 }
		 function xiuniangfault(){
		 	$(document).on('click','#xiuniangfault',function(){
		 		var id = $("#serveruid").val();
		 		var playname = $("#playername").val();
		 		/* layer.msg("玩家当日数据已经重置")
		 		//延迟0.8S关闭
	 	    	setTimeout(timeout,800)
	 	    	function timeout(){
			 		layer.closeAll();
			 		location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20109';
		 		} */
		 		layer.closeAll();
		 		layer.confirm('注意:确定执行绣娘容错吗!', {icon: 0, title:'玩家:'+playname}, function(index){
				  	var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
	           	  	//location.href = webPath+'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20134';
	           	  	location.href =webPath +'/adm/wgplayer/operation.jsp?serveruid='+id+'&parameter=20135';
				});
		 	});
		 }
</script>
</head>
<body class="theme-black">

	<!-- 内容区域 -->
	<form action="wgupdate.jsp" method="post" id="hp_form" name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<!--<button id="saveBtn" type="button" onclick="return save();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>  -->
					<%-- <button id="saveBtn" type="submit" onclick="return;"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button> --%>
<%-- 					<button onclick="window.history.go(-1)" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button> --%>
				</div>
			</div>
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
						<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">玩家昵称:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${wg.playername}" name="playername" id="playername" type="text" readonly="readonly"
										class="tpl-form-input" placeholder="" />
								</div>
						</div>
<!-- <div>基本操作：</div> -->
						<div id="nav">
						<ul>
							<s:forEach items="${listthree }" var="three">
							<fmt:formatNumber var="threetype" type="number" value="${three.type/10000}" maxFractionDigits="0"></fmt:formatNumber>
								<s:if test="${threetype==2 }">
									<!-- <div class="am-form-group"> -->
										<li>
										 <a id=${three.url } 
										 	class="updateBtn" href="javascript:;">
											<i class=""></i> ${three.content } </a>
										</li>
									
								</s:if>
							</s:forEach>
							</ul>
						</div>
							<%-- <div class="am-form-group">
								 <a id="selectoneuser" 
								 	class="updateBtn" href="javascript:;">
									<i class="am-icon-pencil"></i> 编辑 </a>
							</div>
							
							<div class="am-form-group">
								<a id="info"
									class="updateBtn" href="javascript:;"> <i
									class="am-icon-pencil"></i> 背包 </a>
							</div>
							<s:if test="${type=='online'}">
								<div class="am-form-group">
									<a id="offline"
										class="updateBtn" href="javascript:;"> <i
										class="am-icon-pencil"></i> 下线 </a> 
								</div>
							</s:if>
							

							<div class="am-form-group">
								<a id="allopen"
									class="updateBtn" href="javascript:;"> <i
									class="am-icon-pencil"></i> 开启功能 </a>
							</div>
							
							<div class="am-form-group">
								<a id="skip"
									class="updateBtn" href="javascript:;"> <i
									class="am-icon-pencil"></i> 跳过引导 </a>
							</div>
							
							<div class="am-form-group">
								<a id="openplot"
									class="updateBtn" href="javascript:;"> <i
									class="am-icon-pencil"></i> 开启剧情 </a> 
							</div>
							
							<div class="am-form-group">
								<a id="lovetree"
									class="updateBtn" href="javascript:;"> <i
									class="am-icon-pencil"></i> 爱情树 </a> 
							</div>
							
							<div class="am-form-group">
								<a id="deleteoneuser"
									class="delBtn" href="javascript:;"
									class="tpl-table-black-operation-del"> <i
									class="am-icon-trash"></i> 删除 </a>
							</div> --%>
							
							<!-- 隐藏域-->
 									<input id="serveruid" name="serveruid" style="color: red" type="hidden"
										value="${wg.serveruid}" />
									<%-- <input id="playername" name="playername" style="color: red" type="hidden"
										value="${wg.playername}" /> --%>
									<input id="ranking" name="ranking" style="color: red" type="hidden"
									value="${wg.getWgArenamain().getRanking()}" />
						<!-- 表单体  end-->
					</div>
					
				</div>
				
		</div>

</body>
</html>