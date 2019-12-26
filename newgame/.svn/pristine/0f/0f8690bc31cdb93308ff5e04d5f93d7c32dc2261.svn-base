<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.article.ArticleManager,
    java.util.*,
    web.webSocket.util.GameServerManager,
    net.sf.json.JSONArray,
    web.webSocket.activity.ActivityManager,
    net.sf.json.JsonConfig,
    web.webSocket.util.Util,
    web.webSocket.article.ArticleManager,
    web.webSocket.rightdress.RightdressManager,
    web.webSocket.rightdress.Part,
    web.webSocket.pojo.WgMain,
    web.webSocket.player.PlayerManager,
    web.webSocket.message.Messagepush,
    web.webSocket.article.Article"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<link rel="stylesheet" href="path/to/css/amazeui.min.css"/>
<!-- <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> -->
<!-- <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> -->
<script src="<%=path %>/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script> 
<%!
	public class Activityorder {
	private int id;
	private int order;
    private String name;
    
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
	List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
	ActivityManager activityManager=ActivityManager.getInstance();
	PlayerManager playerManager=PlayerManager.getInstance();
 	int second=0;
 	//检查账号是否有该权限
 	if(listthree!=null && listthree.size()>0){
 		for(Messagepush messagepush:listthree){
			if(messagepush.getType()==101101){
				second++;
				break;
			}
		}
 	}
	if(second<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	}
		    String parameter=request.getParameter("parameter");
			//重置
			if(parameter!=null && !parameter.equals("")){
				if(parameter.equals("1")){
					WgMain wgMain=activityManager.getWgMain();
					String result="";
					int max=PlayerManager.activityname.length;
					for(int i=1; i<=max ;i++){
						result+=i+":"+i+",";
					}
					if(result.substring(result.length()-1, result.length()).equals(",")){
						result=result.substring(0, result.length()-1);
					}
					wgMain.setActivityorder(result);
					activityManager.updatewgmain(wgMain);
					response.getWriter().write("<script>window.location.href='../activity/activityorder.jsp'</script>");
					//out.println("重置成功");
					return;
				}
				
			}
			
	
			String oneorder=request.getParameter("oneorder");
			String twoorder=request.getParameter("twoorder");
			String threeorder=request.getParameter("threeorder");
			String fourorder=request.getParameter("fourorder");
			String fiveorder=request.getParameter("fiveorder");
			String sixorder=request.getParameter("sixorder");
			String sevenorder=request.getParameter("sevenorder");
			String eightorder=request.getParameter("eightorder");
			String nineorder=request.getParameter("nineorder");
			String tenorder=request.getParameter("tenorder");
			String elevenorder=request.getParameter("elevenorder");
			String twelveorder=request.getParameter("twelveorder");
			String thirteenorder=request.getParameter("thirteenorder");
			String fourteenorder=request.getParameter("fourteenorder");
			String fifteenorder=request.getParameter("fifteenorder");
			String sixteenorder=request.getParameter("sixteenorder");
			String seventeenorder=request.getParameter("seventeenorder");
			String eighteenorder=request.getParameter("eighteenorder");
			String nineteenorder=request.getParameter("nineteenorder");
			String twentyorder=request.getParameter("twentyorder");
			String twentyoneorder=request.getParameter("twentyoneorder");
			String twentytwoorder=request.getParameter("twentytwoorder");
			String twentythreeorder=request.getParameter("twentythreeorder");
			String twentyfourorder=request.getParameter("twentyfourorder");
			
			
			String oneid=request.getParameter("oneid");
			String twoid=request.getParameter("twoid");
			String threeid=request.getParameter("threeid");
			String fourid=request.getParameter("fourid");
			String fiveid=request.getParameter("fiveid");
			String sixid=request.getParameter("sixid");
			String sevenid=request.getParameter("sevenid");
			String eightid=request.getParameter("eightid");
			String nineid=request.getParameter("nineid");
			String tenid=request.getParameter("tenid");
			String elevenid=request.getParameter("elevenid");
			String twelveid=request.getParameter("twelveid");
			String thirteenid=request.getParameter("thirteenid");
			String fourteenid=request.getParameter("fourteenid");
			String fifteenid=request.getParameter("fifteenid");
			String sixteenid=request.getParameter("sixteenid");
			String seventeenid=request.getParameter("seventeenid");
			String eighteenid=request.getParameter("eighteenid");
			String nineteenid=request.getParameter("nineteenid");
			String twentyid=request.getParameter("twentyid");
			String twentyoneid=request.getParameter("twentyoneid");
			String twentytwoid=request.getParameter("twentytwoid");
			String twentythreeid=request.getParameter("twentythreeid");
			String twentyfourid=request.getParameter("twentyfourid");
			
			
			if(oneorder!=null && !oneorder.equals("") &&
				twoorder!=null && !twoorder.equals("") &&
				threeorder!=null && !threeorder.equals("") &&
				fourorder!=null && !fourorder.equals("") &&
				fiveorder!=null && !fiveorder.equals("") &&
				sixorder!=null && !sixorder.equals("") &&
				sevenorder!=null && !sevenorder.equals("") &&
				eightorder!=null && !eightorder.equals("") &&
				nineorder!=null && !nineorder.equals("") &&
				tenorder!=null && !tenorder.equals("") &&
				elevenorder!=null && !elevenorder.equals("") &&
				twelveorder!=null && !twelveorder.equals("") &&
				thirteenorder!=null && !thirteenorder.equals("") &&
				fourteenorder!=null && !fourteenorder.equals("") &&
				fifteenorder!=null && !fifteenorder.equals("") &&
				sixteenorder!=null && !sixteenorder.equals("") &&
				seventeenorder!=null && !seventeenorder.equals("") &&
				eighteenorder!=null && !eighteenorder.equals("") &&
				nineteenorder!=null && !nineteenorder.equals("") &&
				twentyorder!=null && !twentyorder.equals("") &&
				twentyoneorder!=null && !twentyoneorder.equals("") &&
				twentytwoorder!=null && !twentytwoorder.equals("") &&
				twentythreeorder!=null && !twentythreeorder.equals("") &&
				twentyfourorder!=null && !twentyfourorder.equals("") &&
				oneid!=null && !oneid.equals("") &&
				twoid!=null && !twoid.equals("") &&
				threeid!=null && !threeid.equals("") &&
				fourid!=null && !fourid.equals("") &&
				fiveid!=null && !fiveid.equals("") &&
				sixid!=null && !sixid.equals("") &&
				sevenid!=null && !sevenid.equals("") &&
				eightid!=null && !eightid.equals("") &&
				nineid!=null && !nineid.equals("") &&
				tenid!=null && !tenid.equals("")  &&
				elevenid!=null && !elevenid.equals("") &&
				twelveid!=null && !twelveid.equals("") &&
				thirteenid!=null && !thirteenid.equals("") &&
				fourteenid!=null && !fourteenid.equals("") &&
				fifteenid!=null && !fifteenid.equals("") && 
				sixteenid!=null && !sixteenid.equals("") &&
				seventeenid!=null && !seventeenid.equals("") &&
				eighteenid!=null && !eighteenid.equals("") &&
				nineteenid!=null && !nineteenid.equals("") && 
				twentyid!=null && !twentyid.equals("") && 
				twentyoneid!=null && !twentyoneid.equals("") &&
				twentytwoid!=null && !twentytwoid.equals("") &&
				twentythreeid!=null && !twentythreeid.equals("") &&
				twentyfourid!=null && !twentyfourid.equals("")){
				
				String result=oneid+":"+oneorder+","+
								twoid+":"+twoorder+","+
								threeid+":"+threeorder+","+
								fourid+":"+fourorder+","+
								fiveid+":"+fiveorder+","+
								sixid+":"+sixorder+","+
								sevenid+":"+sevenorder+","+
								eightid+":"+eightorder+","+
								nineid+":"+nineorder+","+
								tenid+":"+tenorder+","+
								elevenid+":"+elevenorder+","+
								twelveid+":"+twelveorder+","+
								thirteenid+":"+thirteenorder+","+
								fourteenid+":"+fourteenorder+","+
								fifteenid+":"+fifteenorder+","+
								sixteenid+":"+sixteenorder+","+
								seventeenid+":"+seventeenorder+","+
								eighteenid+":"+eighteenorder+","+
								nineteenid+":"+nineteenorder+","+
								twentyid+":"+twentyorder+","+
								twentyoneid+":"+twentyoneorder+","+
								twentytwoid+":"+twentytwoorder+","+
								twentythreeid+":"+twentythreeorder+","+
								twentyfourid+":"+twentyfourorder;
				WgMain wgMain=activityManager.getWgMain();
				wgMain.setActivityorder(result);
				activityManager.updatewgmain(wgMain);
			}
			String result=activityManager.getActivityorder();
			if(result!=null && !result.equals("") && result.substring(result.length()-1,result.length()).equals(",")){
					result=result.substring(0, result.length()-1);
			}
			//1.七天登录  2.等级奖励  3累计充值 4套装兑换 5三日冲级 6封测礼包 7夏日缘卡  8聚宝钱庄  9.7日限时充值 10一元夺宝 11月卡福利 12限购礼包 13钻石抽奖 14招财猫 15打折      (待定剧情副本)
			String[] activityname=PlayerManager.activityname;
			int maxid=activityname.length;
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
					activityorder.setId(Integer.valueOf(result3[0]));
					activityorder.setOrder(Integer.valueOf(result3[1]));
					activityorder.setName(activityname[Integer.valueOf(result3[0])-1]);
					list.add(activityorder);
				}
				if(num==0){
					for(int i=0;i<2;i++){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(i+1);
						activityorder.setOrder(1);
						activityorder.setName(activityname[i]);
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
					request.setAttribute("maxid", maxid);
					request.setAttribute("list", list);
					request.setAttribute("one", list.get(0));
					request.setAttribute("two", list.get(1));
					if(list.size()<3){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(3);
						activityorder.setOrder(3);
						activityorder.setName(activityname[2]);
						list.add(activityorder);
						request.setAttribute("three", list.get(2));
					}else{
						request.setAttribute("three", list.get(2));
					}
					if(list.size()<4){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(4);
						activityorder.setOrder(4);
						activityorder.setName(activityname[3]);
						list.add(activityorder);
						request.setAttribute("four", list.get(3));
					}else{
						request.setAttribute("four", list.get(3));
					}
					if(list.size()<5){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(5);
						activityorder.setOrder(5);
						activityorder.setName(activityname[4]);
						list.add(activityorder);
						request.setAttribute("five", list.get(4));
					}else{
						request.setAttribute("five", list.get(4));
					}
					if(list.size()<6){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(6);
						activityorder.setOrder(6);
						activityorder.setName(activityname[5]);
						list.add(activityorder);
						request.setAttribute("six", list.get(5));
					}else{
						request.setAttribute("six", list.get(5));
					}
					if(list.size()<7){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(7);
						activityorder.setOrder(7);
						activityorder.setName(activityname[6]);
						list.add(activityorder);
						request.setAttribute("seven", list.get(6));
					}else{
						request.setAttribute("seven", list.get(6));
					}
					if(list.size()<8){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(8);
						activityorder.setOrder(8);
						activityorder.setName(activityname[7]);
						list.add(activityorder);
						request.setAttribute("eight", list.get(7));
					}else{
						request.setAttribute("eight", list.get(7));
					}
					if(list.size()<9){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(9);
						activityorder.setOrder(9);
						activityorder.setName(activityname[8]);
						list.add(activityorder);
						request.setAttribute("nine", list.get(8));
					}else{
						request.setAttribute("nine", list.get(8));
					}
					if(list.size()<10){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(10);
						activityorder.setOrder(10);
						activityorder.setName(activityname[9]);
						list.add(activityorder);
						request.setAttribute("ten", list.get(9));
					}else{
						request.setAttribute("ten", list.get(9));
					}
					if(list.size()<11){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(11);
						activityorder.setOrder(11);
						activityorder.setName(activityname[10]);
						list.add(activityorder);
						request.setAttribute("eleven", list.get(10));
					}else{
						request.setAttribute("eleven", list.get(10));
					}
					if(list.size()<12){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(12);
						activityorder.setOrder(12);
						activityorder.setName(activityname[11]);
						list.add(activityorder);
						request.setAttribute("twelve", list.get(11));
					}else{
						request.setAttribute("twelve", list.get(11));
					}
					if(list.size()<13){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(13);
						activityorder.setOrder(13);
						activityorder.setName(activityname[12]);
						list.add(activityorder);
						request.setAttribute("thirteen", list.get(12));
					}else{
						request.setAttribute("thirteen", list.get(12));
					}
					if(list.size()<14){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(14);
						activityorder.setOrder(14);
						activityorder.setName(activityname[13]);
						list.add(activityorder);
						request.setAttribute("fourteen", list.get(13));
					}else{
						request.setAttribute("fourteen", list.get(13));
					}
					if(list.size()<15){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(15);
						activityorder.setOrder(15);
						activityorder.setName(activityname[14]);
						list.add(activityorder);
						request.setAttribute("fifteen", list.get(14));
					}else{
						request.setAttribute("fifteen", list.get(14));
					}
					if(list.size()<16){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(16);
						activityorder.setOrder(16);
						activityorder.setName(activityname[15]);
						list.add(activityorder);
						request.setAttribute("sixteen", list.get(15));
					}else{
						request.setAttribute("sixteen", list.get(15));
					}
					//祈福限时概率
					if(list.size()<17){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(17);
						activityorder.setOrder(17);
						activityorder.setName(activityname[16]);
						list.add(activityorder);
						request.setAttribute("seventeen", list.get(16));
					}else{
						request.setAttribute("seventeen", list.get(16));
					}
					//七日情缘
					if(list.size()<18){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(18);
						activityorder.setOrder(18);
						activityorder.setName(activityname[17]);
						list.add(activityorder);
						request.setAttribute("eighteen", list.get(17));
					}else{
						request.setAttribute("eighteen", list.get(17));
					}
					//19 服装收集
					if(list.size()<19){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(19);
						activityorder.setOrder(19);
						activityorder.setName(activityname[18]);
						list.add(activityorder);
						request.setAttribute("nineteen", list.get(18));
					}else{
						request.setAttribute("nineteen", list.get(18));
					}
					if(list.size()<20){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(20);
						activityorder.setOrder(20);
						activityorder.setName(activityname[19]);
						list.add(activityorder);
						request.setAttribute("twenty", list.get(19));
					}else{
						request.setAttribute("twenty", list.get(19));
					}
					if(list.size()<21){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(21);
						activityorder.setOrder(21);
						activityorder.setName(activityname[20]);
						list.add(activityorder);
						request.setAttribute("twentyone", list.get(20));
					}else{
						request.setAttribute("twentyone", list.get(20));
					}
					if(list.size()<22){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(22);
						activityorder.setOrder(22);
						activityorder.setName(activityname[21]);
						list.add(activityorder);
						request.setAttribute("twentytwo", list.get(21));
					}else{
						request.setAttribute("twentytwo", list.get(21));
					}
					if(list.size()<23){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(23);
						activityorder.setOrder(23);
						activityorder.setName(activityname[22]);
						list.add(activityorder);
						request.setAttribute("twentythree", list.get(22));
					}else{
						request.setAttribute("twentythree", list.get(22));
					}
					if(list.size()<24){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(24);
						activityorder.setOrder(24);
						activityorder.setName(activityname[23]);
						list.add(activityorder);
						request.setAttribute("twentyfour", list.get(23));
					}else{
						request.setAttribute("twentyfour", list.get(23));
					}
					/* if(list.size()<11){
						Activityorder activityorder=new Activityorder();
						activityorder.setId(11);
						activityorder.setOrder(11);
						activityorder.setName(activityname[10]);
						list.add(activityorder);
						request.setAttribute("eleven", list.get(10));
					}else{
						request.setAttribute("eleven", list.get(10));
					} */
			}
    %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			//send();
		});
		function send(){
			
			
			var oneorder=document.getElementById("oneorder").value;
			var twoorder=document.getElementById("twoorder").value;
			var threeorder=document.getElementById("threeorder").value;
			var fourorder=document.getElementById("fourorder").value;
			var fiveorder=document.getElementById("fiveorder").value;
			
			var sixorder=document.getElementById("sixorder").value;
			var sevenorder=document.getElementById("sevenorder").value;
			var eightorder=document.getElementById("eightorder").value;
			var nineorder=document.getElementById("nineorder").value;
			var fourorder=document.getElementById("tenorder").value;
			
			var fiveorder=document.getElementById("elevenorder").value;
			var sixorder=document.getElementById("twelveorder").value;
			var sevenorder=document.getElementById("thirteenorder").value;
			var eightorder=document.getElementById("fourteenorder").value;
			var nineorder=document.getElementById("fifteenorder").value;
			
			var sevenorder=document.getElementById("sixteenorder").value;
			var eightorder=document.getElementById("seventeenorder").value;
			var sevenorder=document.getElementById("eighteenorder").value;
			var eightorder=document.getElementById("nineteenorder").value;
			var eightorder=document.getElementById("twentyorder").value;
			
			var twentyoneorder=document.getElementById("twentyoneorder").value;
			var twentytwoorder=document.getElementById("twentytwoorder").value;
			var twentythreeorder=document.getElementById("twentythreeorder").value;
			var twentyfourorder=document.getElementById("twentyfourorder").value;
			
			
			//("oneorder=="+oneorder+","+"twoorder=="+twoorder+","+"threeorder=="+threeorder+","+"fourorder=="+fourorder+","+"fiveorder=="+fiveorder);
			
			var maxid=document.getElementById("maxid").value;
			
			/* if(isNaN(oneorder) || 
			   isNaN(twoorder) || 
			   isNaN(threeorder) || 
			   isNaN(fourorder) || 
			   isNaN(fiveorder) || 
			   isNaN(sixorder) || 
			   isNaN(sevenorder) || 
			   isNaN(eightorder) || 
			   isNaN(nineorder) ||
			   isNaN(tenorder) ||
			   isNaN(elevenorder) ||
			   isNaN(twelveorder) ||
			   isNaN(thirteenorder) ||
			   isNaN(fourteenorder) ||
			   isNaN(fifteenorder) ||
			   isNaN(sixteenorder) ||
			   isNaN(seventeenorder) ||
			   isNaN(eighteenorder) ||
			   isNaN(nineteenorder) ||
			   isNaN(twentyorder)){ //||isNaN(twentyoneorder)
			   layer.msg("有字段序号输入有误!");
			   return false;
			}else   */if(parseInt(oneorder)<=0 || 
			         parseInt(twoorder)<=0 || 
			         parseInt(threeorder)<=0 || 
			         parseInt(fourorder)<=0 || 
			         parseInt(fiveorder)<=0 || 
			         parseInt(sixorder)<=0 || 
			         parseInt(sevenorder)<=0 || 
			         parseInt(eightorder)<=0 || 
			         parseInt(nineorder)<=0 ||
			         parseInt(tenorder)<=0 || 
			         parseInt(elevenorder)<=0 || 
			         parseInt(twelveorder)<=0 || 
			         parseInt(thirteenorder)<=0 || 
			         parseInt(fourteenorder)<=0 || 
			         parseInt(fifteenorder)<=0 || 
			         parseInt(sixteenorder)<=0 || 
			         parseInt(seventeenorder)<=0 ||
			         parseInt(eighteenorder)<=0 ||
			         parseInt(nineteenorder)<=0 ||
			         parseInt(twentyorder)<=0 ||
			         parseInt(twentyoneorder)<=0 ||
			         parseInt(twentytwoorder)<=0 || 
			         parseInt(twentythreeorder)<=0 ||
			         parseInt(twentyfourorder)<=0){
				layer.msg("序号需要大于0!");
				return false;
			}else if(parseInt(oneorder)>parseInt(maxid) || 
				     parseInt(twoorder)>parseInt(maxid) || 
				     parseInt(threeorder)>parseInt(maxid) || 
				     parseInt(fourorder)>parseInt(maxid) || 
				     parseInt(fiveorder)>parseInt(maxid) || 
				     parseInt(sixorder)>parseInt(maxid) || 
				     parseInt(sevenorder)>parseInt(maxid) || 
				     parseInt(eightorder)>parseInt(maxid) || 
				     parseInt(nineorder)>parseInt(maxid) ||
				     parseInt(tenorder)>parseInt(maxid) || 
				     parseInt(elevenorder)>parseInt(maxid) || 
				     parseInt(twelveorder)>parseInt(maxid) || 
				     parseInt(thirteenorder)>parseInt(maxid) || 
				     parseInt(fourteenorder)>parseInt(maxid) || 
				     parseInt(fifteenorder)>parseInt(maxid) || 
				     parseInt(sixteenorder)>parseInt(maxid) || 
				     parseInt(seventeenorder)>parseInt(maxid)|| 
				     parseInt(eighteenorder)>parseInt(maxid)|| 
				     parseInt(nineteenorder)>parseInt(maxid)|| 
				     parseInt(twentyorder)>parseInt(maxid) ||
				     parseInt(twentyoneorder)>parseInt(maxid) ||
				     parseInt(twentytwoorder)>parseInt(maxid) ||
				     parseInt(twentythreeorder)>parseInt(maxid) ||
				     parseInt(twentyfourorder)>parseInt(maxid)){
				layer.msg("序号不能大于"+maxid);
				return false;
			}else{
				document.getElementById("send").submit();
			}
		}
</script>
</head>
<body class="theme-black">
	<form id="send" action="upactivityorder.jsp" method="post" data-am-validator
							class="am-form tpl-form-line-form">
	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
					<button onclick="window.history.go(-1)" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button>
				</div>
			</div>

			<div class="row">

				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
					
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="活动名字" name="activityname" type="text" readonly="readonly"
														class="tpl-form-input" id="activityname">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="序号" name="activityorder" type="text" readonly="readonly"
														class="tpl-form-input" id="activityorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
							
							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${one.name}" name="onename" type="text" readonly="readonly"
														class="tpl-form-input" id="onename">
														<input value="${one.id}" name="oneid" type="hidden"
														class="tpl-form-input" id="oneid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${one.order}" name="oneorder" type="text"
														class="tpl-form-input" id="oneorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${two.name}" name="twoname" type="text" readonly="readonly"
														class="tpl-form-input" id="twoname">
														<input value="${two.id}" name="twoid" type="hidden"
														class="tpl-form-input" id="twoid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${two.order}" name="twoorder" type="text"
														class="tpl-form-input" id="twoorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${three.name}" name="threename" type="text" readonly="readonly"
														class="tpl-form-input" id="threename">
														<input value="${three.id}" name="threeid" type="hidden"
														class="tpl-form-input" id="threeid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${three.order}" name="threeorder" type="text"
														class="tpl-form-input" id="threeorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${four.name}" name="fourname" type="text" readonly="readonly"
														class="tpl-form-input" id="fourname">
														<input value="${four.id}" name="fourid" type="hidden"
														class="tpl-form-input" id="fourid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${four.order}" name="fourorder" type="text"
														class="tpl-form-input" id="fourorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${five.name}" name="fivename" type="text" readonly="readonly"
														class="tpl-form-input" id="fivename">
														<input value="${five.id}" name="fiveid" type="hidden"
														class="tpl-form-input" id="fiveid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${five.order}" name="fiveorder" type="text"
														class="tpl-form-input" id="fiveorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${six.name}" name="sixname" type="text" readonly="readonly"
														class="tpl-form-input" id="sixname">
														<input value="${six.id}" name="sixid" type="hidden"
														class="tpl-form-input" id="sixid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${six.order}" name="sixorder" type="text"
														class="tpl-form-input" id="sixorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${seven.name}" name="sevenname" type="text" readonly="readonly"
														class="tpl-form-input" id="sevenname">
														<input value="${seven.id}" name="sevenid" type="hidden"
														class="tpl-form-input" id="sixid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${seven.order}" name="sevenorder" type="text"
														class="tpl-form-input" id="sevenorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>	
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${eight.name}" name="eightname" type="text" readonly="readonly"
														class="tpl-form-input" id="eightname">
														<input value="${eight.id}" name="eightid" type="hidden"
														class="tpl-form-input" id="eightid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${eight.order}" name="eightorder" type="text"
														class="tpl-form-input" id="eightorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>		

						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${nine.name}" name="ninename" type="text" readonly="readonly"
														class="tpl-form-input" id="ninename">
														<input value="${nine.id}" name="nineid" type="hidden"
														class="tpl-form-input" id="nineid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${nine.order}" name="nineorder" type="text"
														class="tpl-form-input" id="nineorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>	
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${ten.name}" name="tenname" type="text" readonly="readonly"
														class="tpl-form-input" id="tenname">
														<input value="${ten.id}" name="tenid" type="hidden"
														class="tpl-form-input" id="tenid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${ten.order}" name="tenorder" type="text"
														class="tpl-form-input" id="tenorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${eleven.name}" name="elevenname" type="text" readonly="readonly"
														class="tpl-form-input" id="elevenname">
														<input value="${eleven.id}" name="elevenid" type="hidden"
														class="tpl-form-input" id="elevenid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${eleven.order}" name="elevenorder" type="text"
														class="tpl-form-input" id="elevenorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twelve.name}" name="twelvename" type="text" readonly="readonly"
														class="tpl-form-input" id="twelvename">
														<input value="${twelve.id}" name="twelveid" type="hidden"
														class="tpl-form-input" id="twelveid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twelve.order}" name="twelveorder" type="text"
														class="tpl-form-input" id="twelveorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${thirteen.name}" name="thirteenname" type="text" readonly="readonly"
														class="tpl-form-input" id="thirteenname">
														<input value="${thirteen.id}" name="thirteenid" type="hidden"
														class="tpl-form-input" id="thirteenid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${thirteen.order}" name="thirteenorder" type="text"
														class="tpl-form-input" id="thirteenorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${fourteen.name}" name="fourteenname" type="text" readonly="readonly"
														class="tpl-form-input" id="fourteenname">
														<input value="${fourteen.id}" name="fourteenid" type="hidden"
														class="tpl-form-input" id="fourteenid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${fourteen.order}" name="fourteenorder" type="text"
														class="tpl-form-input" id="fourteenorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${fifteen.name}" name="fifteenname" type="text" readonly="readonly"
														class="tpl-form-input" id="fifteenname">
														<input value="${fifteen.id}" name="fifteenid" type="hidden"
														class="tpl-form-input" id="fifteenid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${fifteen.order}" name="fifteenorder" type="text"
														class="tpl-form-input" id="fifteenorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${sixteen.name}" name="sixteenname" type="text" readonly="readonly"
														class="tpl-form-input" id="sixteenname">
														<input value="${sixteen.id}" name="sixteenid" type="hidden"
														class="tpl-form-input" id="sixteenid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${sixteen.order}" name="sixteenorder" type="text"
														class="tpl-form-input" id="sixteenorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${seventeen.name}" name="seventeenname" type="text" readonly="readonly"
														class="tpl-form-input" id="seventeenname">
														<input value="${seventeen.id}" name="seventeenid" type="hidden"
														class="tpl-form-input" id="seventeenid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${seventeen.order}" name="seventeenorder" type="text"
														class="tpl-form-input" id="seventeenorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${eighteen.name}" name="eighteenname" type="text" readonly="readonly"
														class="tpl-form-input" id="eighteenname">
														<input value="${eighteen.id}" name="eighteenid" type="hidden"
														class="tpl-form-input" id="eighteenid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${eighteen.order}" name="eighteenorder" type="text"
														class="tpl-form-input" id="eighteenorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${nineteen.name}" name="nineteenname" type="text" readonly="readonly"
														class="tpl-form-input" id="nineteenname">
														<input value="${nineteen.id}" name="nineteenid" type="hidden"
														class="tpl-form-input" id="nineteenid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${nineteen.order}" name="nineteenorder" type="text"
														class="tpl-form-input" id="nineteenorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twenty.name}" name="twentyname" type="text" readonly="readonly"
														class="tpl-form-input" id="twentyname">
														<input value="${twenty.id}" name="twentyid" type="hidden"
														class="tpl-form-input" id="twentyid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twenty.order}" name="twentyorder" type="text"
														class="tpl-form-input" id="twentyorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twentyone.name}" name="twentyonename" type="text" readonly="readonly"
														class="tpl-form-input" id="twentyonename">
														<input value="${twentyone.id}" name="twentyoneid" type="hidden"
														class="tpl-form-input" id="twentyoneid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twentyone.order}" name="twentyoneorder" type="text"
														class="tpl-form-input" id="twentyoneorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twentytwo.name}" name="twentytwoname" type="text" readonly="readonly"
														class="tpl-form-input" id="twentytwoname">
														<input value="${twentytwo.id}" name="twentytwoid" type="hidden"
														class="tpl-form-input" id="twentytwoid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twentytwo.order}" name="twentytwoorder" type="text"
														class="tpl-form-input" id="twentytwoorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twentythree.name}" name="twentythreename" type="text" readonly="readonly"
														class="tpl-form-input" id="twentythreename">
														<input value="${twentythree.id}" name="twentythreeid" type="hidden"
														class="tpl-form-input" id="twentythreeid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twentythree.order}" name="twentythreeorder" type="text"
														class="tpl-form-input" id="twentythreeorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						
						<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
								<table>
									<tr>
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twentyfour.name}" name="twentyfourname" type="text" readonly="readonly"
														class="tpl-form-input" id="twentyfourname">
														<input value="${twentyfour.id}" name="twentyfourid" type="hidden"
														class="tpl-form-input" id="twentyfourid">
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${twentyfour.order}" name="twentyfourorder" type="text"
														class="tpl-form-input" id="twentyfourorder">
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
						
						<!-- 表单体  end-->
						<input id="maxid" name="maxid"  type="hidden" value="${maxid }"></input>
					</div>
				</div>
		</div>
	</form>
</body>
</html>