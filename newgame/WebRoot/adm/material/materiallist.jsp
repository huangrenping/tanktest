<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.material.MaterialManager,
    java.util.*,    
    net.sf.json.JSONArray,
    web.webSocket.article.ArticleManager,
    web.webSocket.article.Article,
    net.sf.json.JsonConfig,
    web.webSocket.material.Material,
    web.webSocket.util.JacksonManager"%>
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
    public class Material2 {
		private int id;
		private int articleid;
		private String name;
		private int type;//成衣 制衣
		private int subType;//支付小类型
		private int add;//物品价格
		private String description;//服饰说明
		private String ids;//合成材料  id(名字)：数量
		private int drawings;//制造图纸ID
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getDrawings() {
			return drawings;
		}
		public void setDrawings(int drawings) {
			this.drawings = drawings;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getArticleid() {
			return articleid;
		}
		public void setArticleid(int articleid) {
			this.articleid = articleid;
		}
		public int getType() {
			return type;
		}
		public void setType(int type) {
			this.type = type;
		}
		public int getSubType() {
			return subType;
		}
		public void setSubType(int subType) {
			this.subType = subType;
		}
		public int getAdd() {
			return add;
		}
		public void setAdd(int add) {
			this.add = add;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getIds() {
			return ids;
		}
		public void setIds(String ids) {
			this.ids = ids;
		}
	
}
     %>
	<%
			List<Material> materiallist=MaterialManager.getInstance().getMateriallist(); 
			
			List<Material2> material2list=new ArrayList<Material2>();
			for(Material material:materiallist){
				Material2 material2=new Material2();
				material2.setAdd(material.getAdd());
				material2.setArticleid(material.getArticleid());
				material2.setDescription(material.getDescription());
				material2.setDrawings(material.getDrawings());
				material2.setId(material.getId());
				material2.setSubType(material.getSubType());
				material2.setType(material.getType());
				Article article2=ArticleManager.getInstance().getarticle(material.getArticleid());
				if(article2!=null){
					material2.setName(article2.getName());
				}	
				if(material.getType()!=0){
				String[] ids=material.getIds().split(",");
				String nameandid="";
				for(int i=0;i<ids.length;i++){
					String[] ids2=ids[i].split(":");
					Article article=ArticleManager.getInstance().getarticle(Integer.valueOf(ids2[0]));
					nameandid+=ids2[0]+"("+article.getName()+"):"+ids2[1]+",";
				}
				if(nameandid.substring(nameandid.length()-1,nameandid.length()).equals(",")){
					nameandid=nameandid.substring(0, nameandid.length()-1);
				}
				material2.setIds(nameandid);
				}
				material2list.add(material2);
			}  
			
			request.setAttribute("list", material2list);
			//每页最大显示数量
			int size=16;
			//总页数
			int PageCount=0;
			if(materiallist.size()%size==0)
			{
				PageCount=materiallist.size()/size;
			}else{
				PageCount=materiallist.size()/size+1;
			}
			//总条数
			request.setAttribute("max", materiallist.size());
			request.setAttribute("size", size);
			String pageNo=request.getParameter("pageNo");
    		if(pageNo==null || pageNo.equals("")){
    			pageNo="1";
    		}
    		request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageCount", PageCount);
			JSONArray listArray=JSONArray.fromObject(material2list);
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
		//查询商城道具
	 function selectwg(){
	 	$(document).on('click','#queryuser',function(){
	 		var materialid=document.getElementById("materialid").value;
	 		materialid=$.trim(materialid);
	 		document.getElementById("materialid").value=materialid; 
	 		var materianame=document.getElementById("materianame").value;
	 		materianame=$.trim(materianame);
	 		document.getElementById("materianame").value=materianame; 
			$("#addressbody").empty();
	 		var content="";
	 		if(materialid!="" && materialid!=null && (materianame==null || materianame=="")){
	 			 	$.each(${listArray},function(index,material){
	 					if(material.articleid==materialid){
		 						if(material.type==0){
				 					type="是";
				 				}else{
				 					type="";
				 				}
				 				if(material.subType==0){
				 					montype="金币";
				 				}else{
				 					montype="钻石";
				 				}
				 				content+='<tr>'+
											 '<td>'+(index+1)+'</td>' +
											 '<td>'+material.name+'</td>' +
			 								 '<td>'+material.articleid+'</td>' +
			                                 '<td>'+type+'</td>' +
			                                 '<td>'+material.ids+'</td>' +
			                                 '<td>'+material.drawings+'</td>' +
			                                 '<td>'+montype+'</td>' +
			                                 '<td>'+material.add+'</td>' +
							             '</tr>';
		 				}
	 			});
	 		}else if(materialid!="" && materialid!=null && materianame!=null && materianame!=""){
	 			 		$.each(${listArray},function(index,material){
		 					if(material.articleid==materialid && material.name.indexOf(materianame) != -1){
		 						if(material.type==0){
				 					type="是";
				 				}else{
				 					type="";
				 				}
				 				if(material.subType==0){
				 					montype="金币";
				 				}else{
				 					montype="钻石";
				 				}
				 				content+='<tr>'+
											 '<td>'+(index+1)+'</td>' +
											 '<td>'+material.name+'</td>' +
			 								 '<td>'+material.articleid+'</td>' +
			                                 '<td>'+type+'</td>' +
			                                 '<td>'+material.ids+'</td>' +
			                                 '<td>'+material.drawings+'</td>' +
			                                 '<td>'+montype+'</td>' +
			                                 '<td>'+material.add+'</td>' +
							             '</tr>';
			 				}
	 			});
	 		}else if((materialid=="" || materialid==null) && materianame!=null && materianame!=""){
	 			 		$.each(${listArray},function(index,material){
		 					if(material.name.indexOf(materianame) != -1){
		 						if(material.type==0){
				 					type="是";
				 				}else{
				 					type="";
				 				}
				 				if(material.subType==0){
				 					montype="金币";
				 				}else{
				 					montype="钻石";
				 				}
				 				content+='<tr>'+
											 '<td>'+(index+1)+'</td>' +
											 '<td>'+material.name+'</td>' +
			 								 '<td>'+material.articleid+'</td>' +
			                                 '<td>'+type+'</td>' +
			                                 '<td>'+material.ids+'</td>' +
			                                 '<td>'+material.drawings+'</td>' +
			                                 '<td>'+montype+'</td>' +
			                                 '<td>'+material.add+'</td>' +
							             '</tr>';
			 				}
	 			});
	 		}else if((materialid=="" || materialid==null) && (materianame==null || materianame=="")){
	 			$.each(${listArray},function(index,material){
	 			if(index>=0){
	 			if(index<${size}){
	 						if(material.type==0){
	 					type="是";
	 				}else{
	 					type="";
	 				}
	 				if(material.subType==0){
	 					montype="金币";
	 				}else{
	 					montype="钻石";
	 				}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
								 '<td>'+material.name+'</td>' +
 								 '<td>'+material.articleid+'</td>' +
                                 '<td>'+type+'</td>' +
                                 '<td>'+material.ids+'</td>' +
                                 '<td>'+material.drawings+'</td>' +
                                 '<td>'+montype+'</td>' +
                                 '<td>'+material.add+'</td>' +
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
	 		$.each(${listArray},function(index,material){
	 			if(index>=0){
	 			if(index<${size}){
	 					if(material.type==0){
	 					type="是";
	 				}else{
	 					type="";
	 				}
	 				if(material.subType==0){
	 					montype="金币";
	 				}else{
	 					montype="钻石";
	 				}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
								 '<td>'+material.name+'</td>' +
 								 '<td>'+material.articleid+'</td>' +
                                 '<td>'+type+'</td>' +
                                 '<td>'+material.ids+'</td>' +
                                 '<td>'+material.drawings+'</td>' +
                                 '<td>'+montype+'</td>' +
                                 '<td>'+material.add+'</td>' +
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
	 		$.each(${listArray},function(index,material){
	 			if(index>=${size}*(jump-1)){
	 			if(index<${size}*jump){
	 					if(material.type==0){
	 					type="是";
	 				}else{
	 					type="";
	 				}
	 				if(material.subType==0){
	 					montype="金币";
	 				}else{
	 					montype="钻石";
	 				}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
								 '<td>'+material.name+'</td>' +
 								 '<td>'+material.articleid+'</td>' +
                                 '<td>'+type+'</td>' +
                                 '<td>'+material.ids+'</td>' +
                                 '<td>'+material.drawings+'</td>' +
                                 '<td>'+montype+'</td>' +
                                 '<td>'+material.add+'</td>' +
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
	 		$.each(${listArray},function(index,material){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 				if(material.type==0){
	 					type="是";
	 				}else{
	 					type="";
	 				}
	 				if(material.subType==0){
	 					montype="金币";
	 				}else{
	 					montype="钻石";
	 				}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
								 '<td>'+material.name+'</td>' +
 								 '<td>'+material.articleid+'</td>' +
                                 '<td>'+type+'</td>' +
                                 '<td>'+material.ids+'</td>' +
                                 '<td>'+material.drawings+'</td>' +
                                 '<td>'+montype+'</td>' +
                                 '<td>'+material.add+'</td>' +
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
	 		var type="";
	 		var montype="";
	 		$.each(${listArray},function(index,material){
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 				if(material.type==0){
	 					type="是";
	 				}else{
	 					type="";
	 				}
	 				if(material.subType==0){
	 					montype="金币";
	 				}else{
	 					montype="钻石";
	 				}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
								 '<td>'+material.name+'</td>' +
 								 '<td>'+material.articleid+'</td>' +
                                 '<td>'+type+'</td>' +
                                 '<td>'+material.ids+'</td>' +
                                 '<td>'+material.drawings+'</td>' +
                                 '<td>'+montype+'</td>' +
                                 '<td>'+material.add+'</td>' +
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
	 		$.each(${listArray},function(index,material){
	 			if(index>=(lastpage-1)*${size}){
	 				if(material.type==0){
	 					type="是";
	 				}else{
	 					type="";
	 				}
	 				if(material.subType==0){
	 					montype="金币";
	 				}else{
	 					montype="钻石";
	 				}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
								 '<td>'+material.name+'</td>' +
 								 '<td>'+material.articleid+'</td>' +
                                 '<td>'+type+'</td>' +
                                 '<td>'+material.ids+'</td>' +
                                 '<td>'+material.drawings+'</td>' +
                                 '<td>'+montype+'</td>' +
                                 '<td>'+material.add+'</td>' +
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
                                <div class="widget-title  am-cf">成衣、制衣列表</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <%-- <button type="button" class="am-btn am-btn-default am-btn-success" id="myadd"><span class="am-icon-plus"></span> 新增</button> --%>
<!--                                            <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%-- <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        <select data-am-selected="{btnSize: 'sm'}" id="myselect">
							            </select>
                                    </div>
                                </div> --%>
                                <div  id="hp_form" name="hp_form" data-am-validator class="am-form tpl-form-line-form">
	                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
	                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
	                                        <%-- <input type="text" class="am-form-field " placeholder="请输入道具id" id="materialid" name="materialid">
	                                        <span class="am-input-group-btn">
								            	<button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryuser" name="queryuser" type="button" onclick="selectwg();"></button>
								        	</span> --%>
								        	<table>
		                                    	<tr>
		                                    		<td>
													<input type="text" class="am-form-field" placeholder="请输入名称" align="left"
													id="materianame" name="materianame" />
													</td>
		                                    		<td>
														<input type="text" class="am-form-field" placeholder="请输入道具id" align="right"
														id="materialid" name="materialid" />
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
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>名称</th>
                                                <th>道具id</th>
                                                <th>是否成衣</th>
                                                <th>合成材料(道具id:数量)</th>
                                                <th>制造图纸id</th>
                                                <th>货币类型</th>
                                                <th>单价</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
                                        	<s:forEach var="mater" items="${list}" varStatus="status">
	                                        	<s:if test="${status.count<=size }">
	                                        	<tr>
	                                                <td>${status.count }</td>
	                                                <td>${mater.name}</td>
	                                                <td>${mater.articleid}</td>
	                                                <td>
	                                                <s:if test="${mater.type==0}">
	                                               		 是
	                                                </s:if>
	                                                </td>
	                                                <td>${mater.ids}</td>
	                                                <td>${mater.drawings}</td>
	                                                <td>
	                                                <s:if test="${mater.subType==0}">
	                                               			 金币
	                                                </s:if>
	                                                <s:if test="${mater.subType!=0}">
	                                               			  钻石
	                                                </s:if>
	                                                </td>
	                                                <td>${mater.add}</td>
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