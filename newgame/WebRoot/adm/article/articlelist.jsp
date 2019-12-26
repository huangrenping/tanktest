<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.article.ArticleManager,
    java.util.*,
    web.webSocket.util.GameServerManager,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.plot.PlotManager,
    web.webSocket.article.Article"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
			Map<Integer, Article> articlemap=ArticleManager.getInstance().getArticlemap();
			Map<Integer, String> diaoluolist = PlotManager.getInstance().getDiaoluolist();
			List<Article> listarticle=new ArrayList<Article>();
			Collection<Article> wplist=articlemap.values();
			listarticle.addAll(wplist);
			for(Article article:listarticle){
				if(article.getArticleType()==2){
					String diaoluo = diaoluolist.get(article.getId());
						if (diaoluo == "" || diaoluo == null) {
							article.setPurchase(1);//购买
						}else{
							article.setPurchase(0);//掉落
						}
				}
			}
			request.setAttribute("listarticle", listarticle);
			//每页最大显示数量
			int size=16;
			//总页数
			int PageCount=0;
			if(listarticle.size()%size==0)
			{
				PageCount=listarticle.size()/size;
			}else{
				PageCount=listarticle.size()/size+1;
			}
			//总条数
			request.setAttribute("max", listarticle.size());
			request.setAttribute("size", size);
			String pageNo=request.getParameter("pageNo");
    		if(pageNo==null || pageNo.equals("")){
    			pageNo="1";
    		}
    		request.setAttribute("pageNo", pageNo);
			request.setAttribute("pageCount", PageCount);
			JSONArray listArray=JSONArray.fromObject(listarticle);
     		request.setAttribute("listArray", listArray);
     		request.setAttribute("weburl2", GameServerManager.getInstance().getWeburl2());
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
	 		var articleid=document.getElementById("articleid").value;
	 		articleid=$.trim(articleid);
	 		document.getElementById("articleid").value=articleid; 
	 		var articlename=document.getElementById("articlename").value;
	 		articlename=$.trim(articlename);
	 		document.getElementById("articlename").value=articlename; 
			$("#addressbody").empty();
	 		var content="";
	 		var isdrawings="";
	 		var ispurchase="";
	 		if(articleid!=""){
	 			 	$.each(${listArray},function(index,artic){
	 				if(artic.id==articleid){
		 				if(artic.articleType==2){
	 							isdrawings="是";
		 					if(artic.purchase==1){
		 						ispurchase="能";
		 					}
	 					}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td>'+artic.name+'</td>' +
 								 '<td>'+artic.id+'</td>' +
                                 '<td><img style="width: 50px;height: 50px;" src="${weburl2 }/bin/h5/icon/'+artic.iconName+'"/></td>' +
                                 '<td>'+artic.articleType+'</td>' +
                                 '<td>'+artic.subType+'</td>' +
                                 '<td>'+artic.articleLevel+'</td>' +
                                 '<td>'+artic.add+'</td>' +
                                 '<td>'+artic.sellnum+'</td>' +
                                 '<td>'+isdrawings+'</td>' +
                                 '<td>'+ispurchase+'</td>' +
				             	 '<td>'+artic.secondid+'</td>' +
				             '</tr>';
	 				}
	 			});
	 		}else if(articlename!=""){
	 			$.each(${listArray},function(index,artic){
	 				if(artic.name.indexOf(articlename) != -1){
		 				if(artic.articleType==2){
	 							isdrawings="是";
		 					if(artic.purchase==1){
		 						ispurchase="能";
		 					}
	 					}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td>'+artic.name+'</td>' +
 								 '<td>'+artic.id+'</td>' +
                                 '<td><img style="width: 50px;height: 50px;" src="${weburl2 }/bin/h5/icon/'+artic.iconName+'"/></td>' +
                                 '<td>'+artic.articleType+'</td>' +
                                 '<td>'+artic.subType+'</td>' +
                                 '<td>'+artic.articleLevel+'</td>' +
                                 '<td>'+artic.add+'</td>' +
                                 '<td>'+artic.sellnum+'</td>' +
                                 '<td>'+isdrawings+'</td>' +
                                 '<td>'+ispurchase+'</td>' +
				             	 '<td>'+artic.secondid+'</td>' +
				             '</tr>';
	 				}
	 			});
	 		}else if(articleid=="" && articlename==""){
	 			$.each(${listArray},function(index,artic){
	 			isdrawings="";
	 			ispurchase="";
	 			if(index>=0){
	 			if(index<${size}){
	 					if(artic.articleType==2){
	 							isdrawings="是";
		 					if(artic.purchase==1){
		 						ispurchase="能";
		 					}
	 					}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td>'+artic.name+'</td>' +
 								 '<td>'+artic.id+'</td>' +
                                 '<td><img style="width: 50px;height: 50px;" src="${weburl2 }/bin/h5/icon/'+artic.iconName+'"/></td>' +
                                 '<td>'+artic.articleType+'</td>' +
                                 '<td>'+artic.subType+'</td>' +
                                 '<td>'+artic.articleLevel+'</td>' +
                                 '<td>'+artic.add+'</td>' +
                                 '<td>'+artic.sellnum+'</td>' +
                                 '<td>'+isdrawings+'</td>' +
                                 '<td>'+ispurchase+'</td>' +
				             	 '<td>'+artic.secondid+'</td>' +
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
	 		var isdrawings="";
	 		var ispurchase="";
	 		$.each(${listArray},function(index,artic){
	 			isdrawings="";
	 			ispurchase="";
	 			if(index>=0){
	 			if(index<${size}){
	 					if(artic.articleType==2){
	 							isdrawings="是";
		 					if(artic.purchase==1){
		 						ispurchase="能";
		 					}
	 					}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td>'+artic.name+'</td>' +
 								 '<td>'+artic.id+'</td>' +
                                 '<td><img style="width: 50px;height: 50px;" src="${weburl2 }/bin/h5/icon/'+artic.iconName+'"/></td>' +
                                 '<td>'+artic.articleType+'</td>' +
                                 '<td>'+artic.subType+'</td>' +
                                 '<td>'+artic.articleLevel+'</td>' +
                                 '<td>'+artic.add+'</td>' +
                                 '<td>'+artic.sellnum+'</td>' +
                                 '<td>'+isdrawings+'</td>' +
                                 '<td>'+ispurchase+'</td>' +
				             	 '<td>'+artic.secondid+'</td>' +
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
	 		var isdrawings="";
	 		var ispurchase="";
	 		if(jump>=1 && jump<=${pageCount}){
	 		$.each(${listArray},function(index,artic){
	 			isdrawings="";
	 			ispurchase="";
	 			if(index>=${size}*(jump-1)){
	 			if(index<${size}*jump){
	 				if(artic.articleType==2){
	 						isdrawings="是";
	 					if(artic.purchase==1){
	 						ispurchase="能";
	 					}
	 				}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td>'+artic.name+'</td>' +
 								 '<td>'+artic.id+'</td>' +
                                 '<td><img style="width: 50px;height: 50px;" src="${weburl2 }/bin/h5/icon/'+artic.iconName+'"/></td>' +
                                 '<td>'+artic.articleType+'</td>' +
                                 '<td>'+artic.subType+'</td>' +
                                 '<td>'+artic.articleLevel+'</td>' +
                                 '<td>'+artic.add+'</td>' +
                                 '<td>'+artic.sellnum+'</td>' +
                                 '<td>'+isdrawings+'</td>' +
                                 '<td>'+ispurchase+'</td>' +
				             	 '<td>'+artic.secondid+'</td>' +
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
	 		var isdrawings="";
	 		var ispurchase="";
	 		$.each(${listArray},function(index,artic){
	 			isdrawings="";
	 			ispurchase="";
	 			if(index>=${size}*(page-1)){
	 			if(index<${size}*page){
	 				   if(artic.articleType==2){
	 							isdrawings="是";
		 					if(artic.purchase==1){
		 						ispurchase="能";
		 					}
	 					}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td>'+artic.name+'</td>' +
 								 '<td>'+artic.id+'</td>' +
                                 '<td><img style="width: 50px;height: 50px;" src="${weburl2 }/bin/h5/icon/'+artic.iconName+'"/></td>' +
                                 '<td>'+artic.articleType+'</td>' +
                                 '<td>'+artic.subType+'</td>' +
                                 '<td>'+artic.articleLevel+'</td>' +
                                 '<td>'+artic.add+'</td>' +
                                 '<td>'+artic.sellnum+'</td>' +
                                 '<td>'+isdrawings+'</td>' +
                                 '<td>'+ispurchase+'</td>' +
				             	 '<td>'+artic.secondid+'</td>' +
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
	 		var isdrawings="";
	 		var ispurchase="";
	 		$.each(${listArray},function(index,artic){
	 			isdrawings="";
	 		 	ispurchase="";
	 			if(index>=${size}*(page-1)){
	 				if(index<${size}*page){
	 					if(artic.articleType==2){
	 						isdrawings="是";
		 					if(artic.purchase==1){
		 						ispurchase="能";
		 					}
	 					}
	 					 	content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td>'+artic.name+'</td>' +
 								 '<td>'+artic.id+'</td>' +
                                 '<td><img style="width: 50px;height: 50px;" src="${weburl2 }/bin/h5/icon/'+artic.iconName+'"/></td>' +
                                 '<td>'+artic.articleType+'</td>' +
                                 '<td>'+artic.subType+'</td>' +
                                 '<td>'+artic.articleLevel+'</td>' +
                                 '<td>'+artic.add+'</td>' +
                                 '<td>'+artic.sellnum+'</td>' +
                                 '<td>'+isdrawings+'</td>' +
                                 '<td>'+ispurchase+'</td>' +
				             	 '<td>'+artic.secondid+'</td>' +
				             '</tr>'; 
	 				}
	 			}
	 		});
	 		$("#addressbody").append(content);   
	 });
	 }
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
	 		var isdrawings="";
	 		var ispurchase="";
	 		$.each(${listArray},function(index,artic){
	 		 	isdrawings="";
	 		 	ispurchase="";
	 			if(index>=(lastpage-1)*${size}){
	 				if(artic.articleType==2){
	 						isdrawings="是";
		 					if(artic.purchase==1){
		 						ispurchase="能";
		 					}
	 					}
	 				content+='<tr>'+
								 '<td>'+(index+1)+'</td>' +
 								 '<td>'+artic.name+'</td>' +
 								 '<td>'+artic.id+'</td>' +
                                 '<td><img style="width: 50px;height: 50px;" src="${weburl2 }/bin/h5/icon/'+artic.iconName+'"/></td>' +
                                 '<td>'+artic.articleType+'</td>' +
                                 '<td>'+artic.subType+'</td>' +
                                 '<td>'+artic.articleLevel+'</td>' +
                                 '<td>'+artic.add+'</td>' +
                                 '<td>'+artic.sellnum+'</td>' +
                                 '<td>'+isdrawings+'</td>' +
                                 '<td>'+ispurchase+'</td>' +
				             	 '<td>'+artic.secondid+'</td>' +
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
                                <div class="widget-title  am-cf">道具列表</div>


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
		                                    		<td>
														<input type="text" class="am-form-field" placeholder="请输入道具名称" align="left"
														id="articlename" name="articlename" />
													</td>
		                                    		<td>
														<input type="text" class="am-form-field" placeholder="请输入道具id" align="right"
														id="articleid" name="articleid" />
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
                                                <th>图片</th>
                                                <th>大类型</th>
                                                <th>小类型</th>
                                                <th>使用等级</th>
                                                <th>增加量</th>
                                                <th>出售价</th>
                                                <th>是否图纸</th>
                                                <th>能否购买(图纸)</th>
                                                <th>纸娃娃ID</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
                                         <s:forEach var="article" items="${listarticle}" varStatus="status">
	                                         <s:if test="${status.count<=size }">
	                                         <tr>
	                                         		<td>${status.count }</td>
	                                         		<td>${article.name}</td>
	                                         		<td>${article.id}</td>
	                                         		<td><img style="width: 50px;height: 50px;" src="${weburl2 }/bin/h5/icon/${article.iconName }" /></td>
	                                                <td>${article.articleType}</td>
	                                                <td>${article.subType}</td>
	                                                <td>${article.articleLevel}</td>
	                                                <td>${article.add}</td>
	                                                <td>${article.sellnum}</td>
	                                                <td>
	                                                	<s:if test="${article.articleType==2}">
	                                                			是
	                                                	</s:if>
	                                                </td>
	                                                <td>
	                                                    <s:if test="${article.articleType==2}">
                                                			<s:if test="${article.purchase==1}">
                                               					能
	                                                		</s:if>
	                                                	</s:if>
	                                                </td>
	                                                <td>${article.secondid}</td>
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