<%@page import="web.webSocket.card.CardManager"%>
<%@page import="web.webSocket.lovetree.LovetreeManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.lovetree.Lovetree,
    web.webSocket.message.Messagepush,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.pojo.WgLovetree,
    web.webSocket.card.CardManager,
    web.webSocket.card.Host"%>
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
	public class WgLovetree2 {

    private Integer id;
    
    private Long lid;

    private Integer hostid;
	
	private String hostname;
	
    private Long luid;

    private Integer level;
    private Integer growth;
    public Integer getGrowth() {
		return growth;
	}

	public void setGrowth(Integer growth) {
		this.growth = growth;
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
	

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

}
 %> 
<%
 	String playerid=request.getParameter("serveruid");
 	
  	if(playerid==null || playerid.equals("")){
 		return ;
 	}
 	String lid=request.getParameter("lid");
	long seruid=Long.parseLong(playerid);
	WgPlayerserver wg=PlayerManager.getInstance().getplayer(seruid);
	if(wg==null){
 		return ;
 	}
 	List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
 	int num=0;
 	//检查账号是否有该权限
 	if(listthree!=null && listthree.size()>0){
	 	for(Messagepush messagepush:listthree){
			if(messagepush.getType()==20107){
				num++;
				break;
			}
		}
 	}
	if(num<1){
		response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
		return ;
	}
	Lovetree lovetree=wg.getLovetree();
	String parameter=request.getParameter("parameter");
	String levelStr=request.getParameter("level");
	String lidStr=request.getParameter("lidStr");
	String idStr=request.getParameter("id");
	//修改爱情树等级
	if(levelStr!=null&&lidStr!=null&&idStr!=null){
		lovetree.upt(Long.parseLong(lidStr),Integer.parseInt(levelStr),Integer.parseInt(idStr));
	}	
 	if(parameter!=null &&!parameter.equals("")){
 		//删除
 		if(Integer.valueOf(parameter)==1){
 			lovetree.del(Long.parseLong(lid));
 		}
 	}
	if(wg!=null){
		List<WgLovetree> lovetreelist=lovetree.getListlovetree();
		CardManager cardManager=CardManager.getInstance();
		Map<Integer,Host> map=cardManager.mainhost();
		List<WgLovetree2> wgLovetree2list=new ArrayList<WgLovetree2>();
		for(WgLovetree wgLovetree:lovetreelist){
			WgLovetree2 wgLovetree2=new WgLovetree2();
			wgLovetree2.setHostname(map.get(wgLovetree.getHostid()).getName());
			wgLovetree2.setHostid(wgLovetree.getHostid());
			wgLovetree2.setLevel(wgLovetree.getLevel());
			wgLovetree2.setLid(wgLovetree.getLid());
			wgLovetree2.setGrowth(wgLovetree.getGrowth());
			wgLovetree2.setId(wgLovetree.getId());
			wgLovetree2list.add(wgLovetree2);
		}
		request.setAttribute("list", wgLovetree2list);
		request.setAttribute("wg", wg);
	}
	
 %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
		del();
		
		});
		
	 //逻辑删除
	 function del(){
	 	$(document).on('click','#del',function(){
	 		//var lid = $(this).parent().parent().find("td:eq(0)").text();
	 		var lid=$("#lid").val();
	 		var id = $("#serveruid").val();
	 		layer.closeAll();
	 		layer.confirm('注意:删除后无法找回！', {icon: 2, title:'删除:'}, function(index){
				  var index = layer.load(0,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
            	  location.href = webPath+'/adm/wgplayer/lovetree.jsp?lid='+lid+'&parameter=1'+'&serveruid='+id;
				});
	 	});
	 }
	 //表单校验
	function validate_form(thisform){
	var level=$("#level").val();
	var lid=$("#lid").val();
	if (lid==null) {
		layer.msg("您还没有爱情树");
		return false;
	} 
	if(level==""||isNaN(level)||level>10||level<1) {
	 	layer.msg("只能填入1-10的数字");
	 	return false;
		}
		$("#hp_form").submit();
	}
	 
</script>

</head>
<form action="lovetree.jsp" method="post" id="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
<body class="theme-black">

	<!-- 内容区域 -->
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="submit" onclick="return validate_form(this);"
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
 						  	
 						  	
                                 
                                 
 						  		<table>
	                                 <tr>
	                                 	<td></td>
	                                 	<td></td>
	                                 	<td>男主id(名字)</td>
	                                 	<td>爱情树等级</td>
	                                 	<td>成长值</td>
	                                 	<td>操作</td>
	                                 </tr>
	                                 <s:forEach var="list" items="${list}">
		                                 
			                                 <tr>
				                                 <%-- <td><img style="width: 50px;height: 50px;" src="http://hougong.xmwan.com/bin/h5/icon/${wgkna.iconName }" /></td> --%>
				                                 <%-- <td class="am-text-middle" style="display: none" >${list.lid}</td> --%>
				                                 <td><input type="hidden" value="${list.lid}" name="lidStr" id="lid" /></td>
				                                 <td><input type="hidden" value="${list.id}" name="id"/></td>
				                                 <td><input type="text" value="${list.hostid}(${list.hostname})"  readonly="readonly"/></td>
				                                 <td><input type="text" value="${list.level}" name="level" id="level"/></td>
				                                 <td><input type="text" value="${list.growth}" name="growth" readonly="readonly" /></td>
				                                 <td><a id="del" class="updateBtn" href="javascript:;">
									                     <i class="am-icon-pencil"></i>删除
									                 </a>
									             </td>
			                                 </tr>
		                                 
                                 	 </s:forEach>
                                 </table>       
 							</div>
 
							<!-- 隐藏域-->
 									 <input id="serveruid" name="serveruid" type="hidden"
										value="${wg.serveruid}" />
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>

</body>
</html>