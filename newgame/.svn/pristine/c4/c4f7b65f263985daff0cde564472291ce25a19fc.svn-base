<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.plot.PlotManager,
    java.util.*,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.article.ArticleManager,
    web.webSocket.article.Article,
    web.webSocket.pojo.WgPlayerserverClient,
    web.webSocket.plot.Section"%>
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
			public class Wgsection{
				private int chapterid;
				private int id;
				private String sectionname;
				private String rightdress;
				private String property;	//标签
	
				public String getProperty() {
					return property;
				}
				public void setProperty(String property) {
					this.property = property;
				}
				public String getRightdress() {
					return rightdress;
				}
			
				public void setRightdress(String rightdress) {
					this.rightdress = rightdress;
				}
				
				private String nameandid;//掉落道具与名字
				
				public int getChapterid() {
					return chapterid;
				}
			
				public void setChapterid(int chapterid) {
					this.chapterid = chapterid;
				}
			
				public int getId() {
					return id;
				}
			
				public void setId(int id) {
					this.id = id;
				}
			
				public String getSectionname() {
					return sectionname;
				}
			
				public void setSectionname(String sectionname) {
					this.sectionname = sectionname;
				}
			
				public String getNameandid() {
					return nameandid;
				}
			
				public void setNameandid(String nameandid) {
					this.nameandid = nameandid;
				}
				
			}
		 %>
         <%
			List<Section> sectionlist=PlotManager.getInstance().getSectionlist(); 
			List<Wgsection> wgsectionlist=new ArrayList<Wgsection>();
			for(Section section:sectionlist){
				Wgsection wgsection=new Wgsection();
				wgsection.setChapterid(section.getChapterid());
				wgsection.setId(section.getId());
				String[] diaoluo=section.getDiaoluoid().split(",");
				String nameandid="";
				for(int i=0;i<diaoluo.length;i++){
					String diaoluos[]=diaoluo[i].split(":");
					Article article=ArticleManager.getInstance().getarticle(Integer.valueOf(diaoluos[0]));
					nameandid+=diaoluo[i]+"("+article.getName()+"),";
				}
				if(nameandid.substring(nameandid.length()-1,nameandid.length()).equals(",")){
					nameandid=nameandid.substring(0, nameandid.length()-1);
				}
				if(section.getRightdress()==0){
				
				}else{
					wgsection.setRightdress("是");
				}
				String str="";
				
				String hostids= section.getHostattribute();
				if(!hostids.equals("")){
					String hostid[]= hostids.split(",");
					for(int i=0;i<hostid.length;i++){
						if(hostid[i].equals("0")){
							str+="设计  ";
						}else if(hostid[i].equals("1")){
							str+="工艺  ";
						}else if(hostid[i].equals("2")){
							str+="裁剪  ";
						}else if(hostid[i].equals("3")){
							str+="品质  ";
						}
					}
				}
				
				
				
				String ids= section.getAttribute();
				if(!ids.equals("")){
					String attributeid[]= ids.split(",");
					for(int i=0;i<attributeid.length;i++){
						if(attributeid[i].equals("0")){
							str+="简约  ";
						}else if(attributeid[i].equals("1")){
							str+="华丽  ";
						}else if(attributeid[i].equals("2")){
							str+="可爱  ";
						}else if(attributeid[i].equals("3")){
							str+="成熟  ";
						}else if(attributeid[i].equals("4")){
							str+="清凉  ";
						}else if(attributeid[i].equals("5")){
							str+="保暖  ";
						}else if(attributeid[i].equals("6")){
							str+="活泼  ";
						}else if(attributeid[i].equals("7")){
							str+="优雅  ";
						}
					}
				}
				
				wgsection.setNameandid(nameandid);
				wgsection.setSectionname(section.getSectionname());
				wgsection.setProperty(str);
				wgsectionlist.add(wgsection);
			}  
			//每页最大显示数量
			int size=16;
			//总页数
			int PageCount=0;
			if(sectionlist.size()%size==0)
			{
				PageCount=sectionlist.size()/size;
			}else{
				PageCount=sectionlist.size()/size+1;
			}
			//总条数
			request.setAttribute("max", sectionlist.size());
			request.setAttribute("size", size);
			String pageNo=request.getParameter("pageNo");
    		if(pageNo==null || pageNo.equals("")){
    			pageNo="1";
    		}
    		request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageCount", PageCount);
     		request.setAttribute("list", wgsectionlist);
     		JSONArray listArray=JSONArray.fromObject(wgsectionlist);
     		request.setAttribute("listArray", listArray);
      %>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			getreceedit();
			getknapsack();
			//selectwg();
			homepage();
			previouspage();
			nextpage();
			lastpage();
			jump();
		});

	 //编辑弹窗
	 function getreceedit(){
	 	$(document).on('click','#selectoneuser',function(){
	 		var sectionid = $(this).parent().parent().parent().find("td:eq(2)").text();
	 		layer.closeAll();
	 		layer.open({
	 			type:2,
	 			title:['章节内容'],
	 			area:['80%','90%'],
	 			shade:0.3,
	 			resize:false,
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/plot/updatesection.jsp?sectionid='+sectionid],
	 	    	end:function(){
	 	    		//window.location.reload();
	 	    	}
	 		});
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
	 		$.each(${listArray},function(index,section){
	 			if(index>=0){
	 			if(index<${size}){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+section.chapterid+'</td>' +
                                 '<td>'+section.id+'</td>' +
                                 '<td>'+section.property+'</td>' +
                                 '<td>'+section.rightdress+'</td>' +
                                 '<td>'+section.sectionname+'</td>' +
                                 '<td>'+section.nameandid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 查看'+
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
	 		$.each(${listArray},function(index,section){
	 			if(index>=${size}*(jump-1)){
	 			if(index<${size}*jump){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+section.chapterid+'</td>' +
                                 '<td>'+section.id+'</td>' +
                                 '<td>'+section.property+'</td>' +
                                 '<td>'+section.rightdress+'</td>' +
                                 '<td>'+section.sectionname+'</td>' +
                                 '<td>'+section.nameandid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 查看'+
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
	 		$.each(${listArray},function(index,section){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+section.chapterid+'</td>' +
                                 '<td>'+section.id+'</td>' +
                                 '<td>'+section.property+'</td>' +
                                 '<td>'+section.rightdress+'</td>' +
                                 '<td>'+section.sectionname+'</td>' +
                                 '<td>'+section.nameandid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 查看'+
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
	 		$.each(${listArray},function(index,section){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+section.chapterid+'</td>' +
                                 '<td>'+section.id+'</td>' +
                                 '<td>'+section.property+'</td>' +
                                 '<td>'+section.rightdress+'</td>' +
                                 '<td>'+section.sectionname+'</td>' +
                                 '<td>'+section.nameandid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 查看'+
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
	 		$.each(${listArray},function(index,section){
	 			if(index>=(lastpage-1)*${size}){
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
                                 '<td>'+section.chapterid+'</td>' +
                                 '<td>'+section.id+'</td>' +
                                 '<td>'+section.property+'</td>' +
                                 '<td>'+section.rightdress+'</td>' +
                                 '<td>'+section.sectionname+'</td>' +
                                 '<td>'+section.nameandid+'</td>' +
								 '<td class="am-text-middle">'+
								 	'<div class="tpl-table-black-operation">'+
                                        	'<a id="selectoneuser" class="updateBtn" href="javascript:;">'+
                                            	'<i class="am-icon-pencil"></i> 查看'+
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
	 			closeBtn:1,
	 			anim:0,
	 			content:[webPath+'/adm/wgplayer/knapsack.jsp?serveruid='+id],
	 	    	end:function(){
	 	    		/* getaddall(1); */
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
                                <div class="widget-title  am-cf">剧情列表</div>


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
							<form action="allwglist.jsp" method="post" id="hp_form" name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
                               
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p" style="display: inline;">
                                         <input type="text" class="am-form-field " placeholder="" readonly="readonly" id="userName" name="userName" style="display: inline;">
	                                        <span class="am-input-group-btn" style="display: inline;">
									           <!--  <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button> -->
									        </span>
                                    </div>
                                </div>
								</form>
                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>章id</th>
                                                <th>节id</th>
                                                <th>标签</th>
                                                <th>是否换装</th>
                                                <th>节名称</th>
                                                <th>掉落道具</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
												 <s:forEach var="section" items="${list}" varStatus="status">
												 	<s:if test="${status.count<=16 }">
													<tr>
	                                                       	<td>${status.count }</td>
	                                                        	<%-- <td class="am-text-middle" style="display: none">${wg.id}</td> --%>
	                                                        <td>${section.chapterid }</td>
	                                                        <td>${section.id }</td>
	                                                        <td>${section.property }</td>
	                                                        <td>${section.rightdress }</td>
	                                                        <td>${section.sectionname }</td>
	                                                        <td>${section.nameandid }</td>
	                                                        <td class="am-text-middle">
							                                     <div class="tpl-table-black-operation">
							                                         <a id="selectoneuser" class="updateBtn" href="javascript:;">
							                                             <i class="am-icon-pencil"></i> 查看
							                                         </a>
							                                         <!-- <a  id="info" class="updateBtn" href="javascript:;">
							                                             <i class="am-icon-pencil"></i> 信息
							                                         </a>
							                                         <a  id="deleteoneuser" class="delBtn" href="javascript:;" class="tpl-table-black-operation-del">
							                                             <i class="am-icon-trash"></i> 删除
							                                         </a> -->
							                                     </div>
							                                 </td>
	                                                 </tr>
	                                                 </s:if>
                                                 </s:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <form action="allwglist.jsp" method="post" id="pagenofrom">
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
                                </form>
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