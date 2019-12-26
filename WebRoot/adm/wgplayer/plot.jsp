<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.plot.Chapter,
    web.webSocket.plot.Section,
    web.webSocket.message.Messagepush,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.plot.PlotManager"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
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

<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script>
<%!
	public class ChapterClient {
	private int id;
	private String chaptername;
	private int isopen;
	private int maxsection;//当前章节最大小节
	
	public int getMaxsection() {
		return maxsection;
	}
	public void setMaxsection(int maxsection) {
		this.maxsection = maxsection;
	}
	
	public int getIsopen() {
		return isopen;
	}
	public void setIsopen(int isopen) {
		this.isopen = isopen;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getChaptername() {
		return chaptername;
	}
	public void setChaptername(String chaptername) {
		this.chaptername = chaptername;
	}
	
}
	
 %> 
<%
 	String playerid=request.getParameter("serveruid");
 	long seruid=Long.parseLong(playerid);
 	String id=request.getParameter("id");
 	if(playerid==null || playerid.equals("")){
 		return ;
 	}
 	
 	List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
 	int num=0;
 	//检查账号是否有该权限
	for(Messagepush messagepush:listthree){
		if(messagepush.getType()==20116){
			num++;
			break;
		}
	}
	if(num<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	}
 	//开启剧情
 	if(seruid!=0 && id!=null && !id.equals("")){
 		PlotManager.getInstance().openplot(seruid,Integer.valueOf(id));
 	}
	WgPlayerserver wg=PlayerManager.getInstance().getplayer(seruid);
	PlotManager plotManager=PlotManager.getInstance();
	Map<String, Object> map=plotManager.getchapterlist(seruid);
	List<Chapter> chapterlist=(List<Chapter>) map.get("chapterlist");
	List<ChapterClient> chapterlist2=new ArrayList<ChapterClient>();
	if(chapterlist==null){
		return;
	}
	for(Chapter chapter:chapterlist){
		ChapterClient chapterClient=new ChapterClient();
		chapterClient.setId(chapter.getId());
		chapterClient.setIsopen(chapter.getIsopen());
		chapterClient.setChaptername(chapter.getChaptername());
		Map<String, Object> map2=plotManager.getInstance().getsectionlist2(chapter.getId(), seruid);
		List<Section> sectionlist=(List<Section>)map2.get("sectionlist");
		for(Section section:sectionlist){
			if(section.getIsopen()>0){
				chapterClient.setMaxsection(section.getId());
			}else{
				break;
			}
		}
		chapterlist2.add(chapterClient);
	}
	for(int i=1;i<chapterlist.size();i++){
		int result=chapterlist2.get(i).getMaxsection()-chapterlist2.get(i-1).getMaxsection();
		if(result==1){
			chapterlist2.get(i).setIsopen(0);
		}
	}
	if(chapterlist2.get(0).getMaxsection()<=1){
		chapterlist2.get(0).setIsopen(0);
	}
	request.setAttribute("chapterlist", chapterlist2);
	request.setAttribute("wg", wg);
 %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			getreceedit();	
		});
		
	//编辑弹窗
	function getreceedit(){
	 	$(document).on('click','#selectoneuser',function(){
	 		var id = $(this).parent().parent().find("td:eq(1)").text();
	 		var serveruid=document.getElementById("serveruid").value;
	 		var playname=document.getElementById("playername").value;
	 		layer.closeAll();
	 		//location.href = webPath+'/adm/wgplayer/plot.jsp?serveruid='+serveruid+'&parameter=20116'+'&id='+id;
	 		
 			 layer.confirm('注意:确定后请稍等！', {icon: 0, title:'开启剧情:'+playname,offset: '100px'}, function(index){
			 var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
           	 location.href = webPath+'/adm/wgplayer/plot.jsp?serveruid='+serveruid+'&parameter=20116'+'&id='+id;
			});	
	 	});
	 };
</script>
</head>
<body class="theme-black">

	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
<%-- 					<button onclick="window.history.go(-1)" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button> --%>
				</div>
			</div>

			<div class="row">

				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">

						<form id="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">玩家昵称
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									 <input value="${wg.playername}" id="rolename" readonly="readonly" name="rolename" type="text"
										class="tpl-form-input" >
								</div>
							</div>
 							
 						  	<div class="am-u-sm-12">
 						  	
 						  	<%-- <table>
                                 
	                             <s:forEach var="a2" items="${list2}">
										<tr>
		                                 	<td>${a2.aid }:</td>
		                                 	<td>${a2.num }</td>
	                                 	</tr>
                                 </s:forEach>
                                 	 
                              </table>    --%>
                                 
                                 
 						  		<table>
	                                 <tr>
	                                 	<td>编号</td>
	                                 	<td>章节</td>
	                                 	<td>小节</td>
	                                 	<td>是否开启</td>
	                                 	<td></td>
	                                 </tr>
	                                 <s:forEach var="list" items="${chapterlist}" varStatus="status">
			                                 <tr>
			                                 	 <td><input type="text" value="${status.count}" readonly="readonly"/></td>
			                                 	 <td class="am-text-middle" style="display: none">${list.id}</td>
				                                 <td><input type="text" value="${list.chaptername}"  readonly="readonly"/></td>
				                                 <s:if test="${list.maxsection>0}">
				                                 	<td><input type="text" value="${list.maxsection}"  readonly="readonly"/></td>
				                                 </s:if>
				                                 <s:if test="${list.maxsection==0}">
				                                 	<td><input type="text" value=""  readonly="readonly"/></td>
				                                 </s:if>
				                                 <s:if test="${list.isopen==0}">
					                                 <td><input type="text" value="否"  readonly="readonly"/></td>
					                                 	<td><a id="selectoneuser" value="" class="updateBtn" href="javascript:;">
										                     <i class="am-icon-pencil"></i>开启
										                 </a>
										             </td>
				                                 </s:if>
				                                <s:if test="${list.isopen!=0}">
				                                 	<td><input type="text" value="是"  readonly="readonly"/></td>
				                                 	<td></td>
				                                 </s:if> 
			                                 </tr>
                                 	 </s:forEach>
                                 </table>       
 							</div>
 
							<!-- 隐藏域-->
 									 <input id="serveruid" name="serveruid" type="hidden"
										value="${wg.serveruid}" />
									<input id="playername" name="playername" type="hidden"
										value="${wg.playername}" />
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>

</body>
</html>