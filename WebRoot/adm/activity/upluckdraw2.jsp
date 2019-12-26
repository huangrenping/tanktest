<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.util.Util,
    web.webSocket.message.Messagepush,
    web.webSocket.activity.ActivityManager,
    web.webSocket.article.ArticleManager,
    web.webSocket.pojo.WgMain2,
    web.webSocket.article.Article,
    web.webSocket.pojo.WgActivity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datetimepicker-se.min.css" />
    <script src="<%=path %>/assets/js/moment-with-locales.min.js"></script> 
    <!-- <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> -->
	<!-- <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> -->
	<script src="<%=path %>/assets/js/jquery.min.js"></script>
    <script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/app.js"></script>
    <script src="<%=path %>/assets/js/theme.js"></script>
    <script src="<%=path %>/assets/js/amazeui-pagination.js"></script>
		<%	
			ActivityManager activityManager=ActivityManager.getInstance();
			List<Messagepush> listthree=(List<Messagepush>)session.getAttribute("listthree");
		 	int num=0;
		 	//检查账号是否有该权限
			for(Messagepush messagepush:listthree){
				if(messagepush.getType()==101801){
					num++;
					break;
				}
			}
			if(num<1){
				response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
				return ;
			}
			String parameter=request.getParameter("parameter");
			//清空
			if(parameter!=null && !parameter.equals("")){
				if(parameter.equals("1")){
					WgMain2 wgMain2=activityManager.getWgMain2();
					wgMain2.setLuckdrawnamesa("");
					activityManager.updatewgmain2(wgMain2);
					response.getWriter().write("<script>window.location.href='../activity/luckdraw2.jsp'</script>");
					return;
				}
				
			}
			String datetimepicker1=request.getParameter("datetimepicker1");
			String datetimepicker2=request.getParameter("datetimepicker2");
			String radio1=request.getParameter("radio1");
			String price=request.getParameter("price");
			String explain=request.getParameter("explain");
			
			String newaid=request.getParameter("newaid");
			String newaid2=request.getParameter("newaid2");
			String newaid3=request.getParameter("newaid3");
			String newaid4=request.getParameter("newaid4");
			String newaid5=request.getParameter("newaid5");
			String newaid6=request.getParameter("newaid6");
			
			String num1=request.getParameter("num");
			String num2=request.getParameter("num2");
			String num3=request.getParameter("num3");
			String num4=request.getParameter("num4");
			String num5=request.getParameter("num5");
			String num6=request.getParameter("num6");
			
			//String radio2=request.getParameter("radio2");
			if(datetimepicker1!=null && !datetimepicker1.equals("") &&
			   datetimepicker2!=null && !datetimepicker2.equals("") &&
			   radio1!=null && !radio1.equals("") &&
			   price!=null && !price.equals("") &&
			   explain!=null && !explain.equals("") &&
			   newaid!=null && !newaid.equals("") &&
			   newaid2!=null && !newaid2.equals("") &&
			   newaid3!=null && !newaid3.equals("") &&
			   newaid4!=null && !newaid4.equals("") &&
			   newaid5!=null && !newaid5.equals("") &&
			   newaid6!=null && !newaid6.equals("") &&
			   num1!=null && !num1.equals("") &&
			   num2!=null && !num2.equals("") &&
			   num3!=null && !num3.equals("") &&
			   num4!=null && !num4.equals("") &&
			   num5!=null && !num5.equals("") &&
			   num6!=null && !num6.equals("")){
			   long time1=Util.dateTimeStamp2(datetimepicker1, "yyyy-MM-dd");
			   long time2=Util.dateTimeStamp2(datetimepicker2, "yyyy-MM-dd");
			   String huodongstr2=activityManager.getHuodong();
			   String[] huodongstr3=huodongstr2.split(",");
			   for(int i=0; i<huodongstr3.length; i++){
			   		String[] huodongstr4=huodongstr3[i].split("@");
			   		if(Integer.valueOf(huodongstr4[0])==13){
			   			huodongstr3[i]="13@"+radio1+"@"+time1+"@"+time2+"@"+0;
			   			WgMain2 wgMain2=activityManager.getWgMain2();
			   			wgMain2.setLuckdrawdiamond(Integer.valueOf(price));
			   			wgMain2.setLuckdrawtexplain(explain);
			   			wgMain2.setLuckdrawarticle(newaid+":"+num1+","+newaid2+":"+num2+","+newaid3+":"+num3+","+newaid4+":"+num4+","+newaid5+":"+num5+","+newaid6+":"+num6);
			   			activityManager.updatewgmain2(wgMain2);
			   			activityManager.upWgmainhuodong(Util.Join(huodongstr3, ","));
			   			break;
			   		}
			   }
			}
			String huodong=activityManager.getHuodong();
			String[] huodong2=huodong.split(",");
			for(int i=0; i<huodong2.length; i++){
				String[] huodong3=huodong2[i].split("@");
				if(Integer.valueOf(huodong3[0])==13){
					request.setAttribute("id", huodong3[0]);
					request.setAttribute("state", huodong3[1]);
					request.setAttribute("price", activityManager.getWgMain2().getLuckdrawdiamond());
					if(huodong3[2].equals("0")){
						request.setAttribute("startime", "");
					}else{
						request.setAttribute("startime", Util.getDate(Long.valueOf(huodong3[2]), 1));
					}
					if(huodong3[3].equals("0")){
						request.setAttribute("endtime", "");
					}else{
						request.setAttribute("endtime", Util.getDate(Long.valueOf(huodong3[3]), 1));
					}
					break;
				}
			}
			request.setAttribute("explain", activityManager.getWgMain2().getLuckdrawtexplain());
			
		    ArticleManager articleManager=ArticleManager.getInstance();
		    Collection<Article> articlecollection=articleManager.getArticlemap().values();
		    List<Article> articlelist=new ArrayList<Article>();
			articlelist.addAll(articlecollection);
		    request.setAttribute("articlelist", articlelist);
		    
		    String luckdrawarticle=activityManager.getWgMain2().getLuckdrawarticle();
		    List<String> list=new ArrayList<String>();
		    List<Integer> listnum=new ArrayList<Integer>();
		    if(luckdrawarticle!=null && !luckdrawarticle.equals("")){
		    	String[] luckdrawarticle2=luckdrawarticle.split(",");
		    	for(int i=0;i<luckdrawarticle2.length;i++){
		    		String[] result=luckdrawarticle2[i].split(":");
		    		if(result.length>=2){
		    			list.add(result[0]);
		    			listnum.add(Integer.valueOf(result[1]));
		    		}else{
		    			list.add(0+"");
		    			listnum.add(0);
		    		}
		    	}
		    }
		    request.setAttribute("list", list);
		    request.setAttribute("listnum", listnum);
		%>

<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;

		}); 
		function send(){
			var datetimepicker1=document.getElementById("datetimepicker1").value;
			var datetimepicker2=document.getElementById("datetimepicker2").value;
			var price=document.getElementById("price").value;
			var explain=document.getElementById("explain").value;
			var num=document.getElementById("num").value;
			var num2=document.getElementById("num2").value;
			var num3=document.getElementById("num3").value;
			var num4=document.getElementById("num4").value;
			var num5=document.getElementById("num5").value;
			var num6=document.getElementById("num6").value;
			
			debugger;
			if(datetimepicker1.length<=0){
				layer.msg("开始时间不允许为空!");
				return false;
			}else if(datetimepicker2.length<=0){
				layer.msg("结束时间不允许为空!");
				return false;
			}else if(isNaN(price)){
				layer.msg("钻石消费数量输入有误!");
				return false;
			}else if(parseInt(price)<=0){
				layer.msg("钻石消费数量要大于0!");
				return false;
			}else if(isNaN(num) || parseInt(num)<=0){
				layer.msg("数量1输入有误!");
				return false;
			}else if(isNaN(num2) || parseInt(num2)<=0){
				layer.msg("数量2输入有误!");
				return false;
			}else if(isNaN(num3) || parseInt(num3)<=0){
				layer.msg("数量3输入有误!");
				return false;
			}else if(isNaN(num4) || parseInt(num4)<=0){
				layer.msg("数量4输入有误!");
				return false;
			}else if(isNaN(num5) || parseInt(num5)<=0){
				layer.msg("数量5输入有误!");
				return false;
			}else if(isNaN(num6) || parseInt(num6)<=0){
				layer.msg("数量6输入有误!");
				return false;
			}else if(explain.length<=0){
				layer.msg("文案不允许为空!");
				return false;
			}else{
				document.getElementById("send").submit();
			}
		}
		/* $(function() {
		    $('#datetimepicker1').datetimepicker()({ format: 'yyyy-mm-dd' });
		  });
		  
		  $(function() {
		    $('#datetimepicker2').datetimepicker()({ format: 'yyyy-mm-dd' });
		  }); */

	//表单校验
	/* function validate_form(thisform){
		$("#hp_form").submit();
		//parent.layer.msg("保存成功!");
		var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
		parent.layer.close(index); //执行关闭  这两句的意思是关闭当前窗口
	} */	

</script>
</head>
<body class="theme-black">

	<!-- 内容区域 -->
	<form id="send" action="upluckdraw2.jsp" method="post" id="hp_form" name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
		<div class="theme-black">
				<div class="am-btn-group am-btn-group-xs" style="margin-top: 10px">
					<button id="saveBtn" type="button" onclick="send();"
						class="am-btn am-btn-default am-btn-secondary">
						<span class="am-icon-save"></span> 保存
					</button>
				</div>
			</div>
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
					
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">名称
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="钻石抽奖活动" id="name" name="name" type="text"
										class="tpl-form-input" readonly="readonly">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">消费钻石数量:
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${price}" id="price" name="price" type="text"
										class="tpl-form-input"placeholder=""> <small></small>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">开始时间
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<%-- <input value="${startime}" class="am-form-field" id='datetimepicker1' name='datetimepicker1'> --%>
									<input type="text" value="${startime}" id="datetimepicker1" name="datetimepicker1" class="am-form-field" placeholder="日历组件" data-am-datepicker readonly required />
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">结束时间
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<%-- <input value="${endtime}" class="am-form-field" id='datetimepicker2' name='datetimepicker2'> --%>
									<input type="text" value="${endtime}" id="datetimepicker2" name="datetimepicker2" class="am-form-field" placeholder="日历组件" data-am-datepicker readonly required />
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">状态
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<c:if test="${state==0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck>
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck checked="checked">
							      		关闭
							    	</label>
									</c:if>
									
									<c:if test="${state!=0 }">
									<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck checked="checked">
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck >
							      		关闭
							    	</label>
									</c:if>
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
												<label for="user-phone" class="am-u-sm-3 am-form-label">道具1:
												</label>
												<div class="am-u-sm-9">
													<select id="newaid" name="newaid" data-am-selected="{searchBox: 1,maxHeight: 400}">
													  <c:if test="${articleid==-1 }">
														  <option value="-1" selected="selected"></option>
													  </c:if>
													  <c:if test="${articleid!=-1 }">
													  	  <option value="-1"></option>
													  </c:if>
													  <c:forEach items="${articlelist }" var="article">
													  			<c:if test="${article.id==list.get(0) }">
													  				<option value="${article.id }" selected="selected">${article.name }</option>
													  			</c:if>
																<c:if test="${article.id!=list.get(0) }">
													  				<option value="${article.id }">${article.name }</option>
													  			</c:if>
													  </c:forEach>
													</select>
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量1：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${listnum.get(0)}" name="num" type="text"
														class="tpl-form-input" id="num"><small style="color: white;">几率:30</small>
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
												<label for="user-phone" class="am-u-sm-3 am-form-label">道具2:
												</label>
												<div class="am-u-sm-9">
													<select id="newaid2" name="newaid2" data-am-selected="{searchBox: 1,maxHeight: 400}">
													  <c:if test="${articleid==-1 }">
														  <option value="-1" selected="selected"></option>
													  </c:if>
													  <c:if test="${articleid!=-1 }">
													  	  <option value="-1"></option>
													  </c:if>
													  <c:forEach items="${articlelist }" var="article">
													  			<c:if test="${article.id==list.get(1) }">
													  				<option value="${article.id }" selected="selected">${article.name }</option>
													  			</c:if>
																<c:if test="${article.id!=list.get(1) }">
													  				<option value="${article.id }">${article.name }</option>
													  			</c:if>
													  </c:forEach>
													</select>
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量2：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${listnum.get(1)}" name="num2" type="text"
														class="tpl-form-input" id="num2"><small style="color: white;">几率:30</small>
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
												<label for="user-phone" class="am-u-sm-3 am-form-label">道具3:
												</label>
												<div class="am-u-sm-9">
													<select id="newaid3" name="newaid3" data-am-selected="{searchBox: 1,maxHeight: 400}">
													  <c:if test="${articleid==-1 }">
														  <option value="-1" selected="selected"></option>
													  </c:if>
													  <c:if test="${articleid!=-1 }">
													  	  <option value="-1"></option>
													  </c:if>
													  <c:forEach items="${articlelist }" var="article">
													  			<c:if test="${article.id==list.get(2) }">
													  				<option value="${article.id }" selected="selected">${article.name }</option>
													  			</c:if>
																<c:if test="${article.id!=list.get(2) }">
													  				<option value="${article.id }">${article.name }</option>
													  			</c:if>
													  </c:forEach>
													</select>
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量3：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${listnum.get(2)}" name="num3" type="text"
														class="tpl-form-input" id="num3"><small style="color: white;">几率:20</small>
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
												<label for="user-phone" class="am-u-sm-3 am-form-label">道具4:
												</label>
												<div class="am-u-sm-9">
													<select id="newaid4" name="newaid4" data-am-selected="{searchBox: 1,maxHeight: 400}">
													  <c:if test="${articleid==-1 }">
														  <option value="-1" selected="selected"></option>
													  </c:if>
													  <c:if test="${articleid!=-1 }">
													  	  <option value="-1"></option>
													  </c:if>
													  <c:forEach items="${articlelist }" var="article">
													  			<c:if test="${article.id==list.get(3) }">
													  				<option value="${article.id }" selected="selected">${article.name }</option>
													  			</c:if>
																<c:if test="${article.id!=list.get(3) }">
													  				<option value="${article.id }">${article.name }</option>
													  			</c:if>
													  </c:forEach>
													</select>
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量4：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${listnum.get(3)}" name="num4" type="text"
														class="tpl-form-input" id="num4"><small style="color: white;">几率:12</small>
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
												<label for="user-phone" class="am-u-sm-3 am-form-label">道具5:
												</label>
												<div class="am-u-sm-9">
													<select id="newaid5" name="newaid5" data-am-selected="{searchBox: 1,maxHeight: 400}">
													  <c:if test="${articleid==-1 }">
														  <option value="-1" selected="selected"></option>
													  </c:if>
													  <c:if test="${articleid!=-1 }">
													  	  <option value="-1"></option>
													  </c:if>
													  <c:forEach items="${articlelist }" var="article">
													  			<c:if test="${article.id==list.get(4) }">
													  				<option value="${article.id }" selected="selected">${article.name }</option>
													  			</c:if>
																<c:if test="${article.id!=list.get(4) }">
													  				<option value="${article.id }">${article.name }</option>
													  			</c:if>
													  </c:forEach>
													</select>
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量5：
													<span class="tpl-form-line-small-">
												</label>
												<div class="am-u-sm-9">
													<input value="${listnum.get(4)}" name="num5" type="text"
														class="tpl-form-input" id="num5"></span><small style="color: white;">几率:7</small>
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
												<label for="user-phone" class="am-u-sm-3 am-form-label">道具6:
												</label>
												<div class="am-u-sm-9">
													<select id="newaid6" name="newaid6" data-am-selected="{searchBox: 1,maxHeight: 400}">
													  <c:if test="${articleid==-1 }">
														  <option value="-1" selected="selected"></option>
													  </c:if>
													  <c:if test="${articleid!=-1 }">
													  	  <option value="-1"></option>
													  </c:if>
													  <c:forEach items="${articlelist }" var="article">
													  			<c:if test="${article.id==list.get(5) }">
													  				<option value="${article.id }" selected="selected">${article.name }</option>
													  			</c:if>
																<c:if test="${article.id!=list.get(5) }">
													  				<option value="${article.id }">${article.name }</option>
													  			</c:if>
													  </c:forEach>
													</select>
												</div>
											</div>
										</td>
									
										<td>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-3 am-form-label">数量6：
													<span class="tpl-form-line-small-"></span>
												</label>
												<div class="am-u-sm-9">
													<input value="${listnum.get(5)}" name="num6" type="text"
														class="tpl-form-input" id="num6"></span><small style="color: white;">几率:1</small>
												</div>
											</div>
										</td>
								</tr>
							</table>
							</div>
						</div>
						
							
							<div class="am-form-group">
						      <label for="doc-ta-1">活动文案:</label>
						      <textarea class="" id="explain" name="explain" rows="10">${explain}</textarea>
						    </div>
						    
							<%-- <div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">状态
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<s:if test="${state==0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck>
							      		开启
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck checked="checked">
							      		关闭
							    	</label>
									</s:if>
									
									<s:if test="${state!=0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="1" data-am-ucheck checked="checked">
							      		是
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio1" id="radio1" value="0" data-am-ucheck >
							      		否
							    	</label>
									</s:if>
								</div>
							</div> --%>
							
							<%-- <div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">是否发送奖励
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<s:if test="${issend==0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="0" data-am-ucheck checked="checked">
							      		未发送
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="1" data-am-ucheck >
							      		已发送
							    	</label>
									</s:if>
									
									<s:if test="${issend!=0 }">
										<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="0" data-am-ucheck >
							      		未发送
							    	</label>
							    	<label class="am-radio">
							     	 <input type="radio" name="radio2" id="radio2" value="1" data-am-ucheck checked="checked">
							      		已发送
							    	</label>
									</s:if>
								</div>
							</div> --%>
							
				</div>							
						<input value="${wgActivity.id}" class="am-form-field" name='wgActivityid' id='wgActivityid' type="hidden">
						<input value="${parameter}" class="am-form-field" name='parameter' id='parameter' type="hidden">
						</form>
					</div>
				</div>
		</div>
		<script src="<%=path %>/assets/js/amazeui.datetimepicker-se.min.js"></script>
</body>
</html>