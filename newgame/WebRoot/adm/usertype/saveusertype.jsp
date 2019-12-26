<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script type="text/javascript" src="<%=path %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui.datetimepicker-se.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/moment.min.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<script type="text/javascript" src="<%=path %>/assets/js/common.js"></script> 
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
 /**
	汪雄威
	用户管理分页查询
	2019-9-5
* */
layui.define(['form','layer','laypage','laydate'], function(exports){
	var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
	 exports('addusertype', {});
   //注意，这里是模块输出的核心，模块名必须和list时的模块名一致

	 //查询所有用户等级，放到下拉框
	 //LevelAll();
	 //增加
	 saveuser();

	  //获得焦点事件
	  $(function() {
		  $("#loginname").focus();
		  });
	  //失去焦点时，判断用户名是否重复
	  $("#loginname").blur(function(){
		  var loginname=$("#loginname").val();
		  if(loginname.length>0){
			  $.ajax({
				  url:webPath+"/user/selectoneloginName?loginname="+loginname,
			 	  type:'post',
			 	  cache:false,
			 	  error : function(XMLHttpRequest, textStatus, errorThrown) {
			 			layer.closeAll('loading');
			 			layer.msg("网络异常!请刷新。。。")
			 		}, 
			 	    success:function(json){
			 	    	layer.msg(json.msg);
			 	    	//延迟0.5S关闭
			 	    }
			  })
		  }

		});
		 function LevelAll(){
			 	$.ajax({
			 		url:webPath+"/user/selectAllUserLevel",
			 	    type:'post',
			 	    cache:false,
			 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
			 			layer.closeAll('loading');
			 			layer.msg("网络异常!请刷新。。。")
			 		}, 
			 	    success:function(json){
			 	    	   var content="";
			 	    	    var id=$("#levellist").val();
			 				$.each(json.data,function(index,item){
			 					if(item.id!=id){
			 						content+='<option selected="selected" value="'+item.id+'">'+item.name+'</option>';
			 					}		
			 				});
			 				$("#levellist").append(content);
			 	    }
			 	});
			 }
		 function saveuser() {
			 $("#saveBtn").click(function(){
				 var chk_value =[];
				 var rolename=$("#rolename").val();
				 var description=$("#description").val()
				 var roleid=$("#roleid").val();
				 var form=$("#hp_form").serialize();
				 $('input[name="checkbox"]:checked').each(function(){ 
					 chk_value.push($(this).val()); 
					 }); 
				 /*if(chk_value.length==0){
					 layer.msg("您还没有选择任何权限")
				 }else{}*/
				 	$.ajax({
				 		url:webPath+"/usertype/saveusertypeorupdate",
				 	    type:'post',
				 	    data:{"msg":JSON.stringify(chk_value),"roleid":roleid,"rolename":rolename,"description":description},
				 	    dataType:"json",
				 	    cache:false,
				 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
				 			
				 			layer.msg("网络异常!请刷新。。。")
				 		}, 
				 	    success:function(json){
				 	    	layer.msg(json.msg)
				 	    	//延迟0.5S关闭
				 	    	setTimeout(timeout,500)
				 	    	function timeout(){
				 	    		var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
					    		parent.layer.close(index); //执行关闭  这两句的意思是关闭当前窗口
				 	    	}
			 				
				 	    }
				 		
				 	});
			 
			})
		 }

/*				$("#saveBtn").click(function(){
					var loginname=$("#loginname").val().replace(/\s+/g,"");
					var email=$("#email").val();
					if(loginname.length==0){
						layer.msg("用户名不能为空！");
					}else if(!isEmail(email)){
						layer.msg("邮箱格式不正确(正确为xx@.xx)");
					}else{
					var formdata=$("#hp_form").serialize();
				 	$.ajax({
				 		url:webPath+"/user/saveuserorupdate",
				 	    type:'post',
				 	    data:formdata,
				 	    dataType:"json",
				 	    cache:false,
				 	    error : function(XMLHttpRequest, textStatus, errorThrown) {
				 			
				 			layer.msg("网络异常!请刷新。。。")
				 		}, 
				 	    success:function(json){
				 	    	layer.msg(json.msg)
				 	    	//延迟0.5S关闭
				 	    	setTimeout(timeout,500)
				 	    	function timeout(){
				 	    		var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
					    		parent.layer.close(index); //执行关闭  这两句的意思是关闭当前窗口
				 	    	}
			 				
				 	    }
				 		
				 	});
				}
				 	
				})*/
			

	/**
	 * 正则表达his验证邮箱
	 */
	  	 function isEmail(str){
	         var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	         return reg.test(str);
	     }
	 
})
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
					<button onclick="window.history.go(-1)" type="button"
						class="am-btn am-btn-default am-btn-warning">
						<span class="am-icon-reply"></span> 返回
					</button>
				</div>
			</div>

			<div class="row">

				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">

						<form id="hp_form" data-am-validator
							class="am-form tpl-form-line-form">
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">类型昵称
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${usertype.rolename}" id="rolename" name="rolename" type="text"
										class="tpl-form-input">
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">类型功能
									<span class="tpl-form-line-small-"></span>
								</label>
								<div class="am-u-sm-9">
									<input value="${usertype.description}" id="description" name="description" type="text"
										class="tpl-form-input">
								</div>
							</div>
							
							 <div class="am-u-sm-12">
                                  <c:forEach var="list" items="${data}">
                                  	<c:set var="number" value="0" />
	                                    <label class="am-checkbox am-secondary am-u-sm-3">
	                                    	<c:forEach var="list2" items="${liststring}">
		                                    	<c:if test="${list2==list.type }">
		                                    	<c:set var="number" value="1" />
		                                    	</c:if>
	                                    	</c:forEach>
	                                    	
	                                    	<c:if test="${number>0 }">
		                                    		<input type="checkbox" checked="checked" name="checkbox" value="${list.type}" data-am-ucheck>&nbsp&nbsp${list.title }
		                                    </c:if>
		                                    <c:if test="${number==0 }">
		                                    		<input type="checkbox" name="checkbox" value="${list.type}" data-am-ucheck>&nbsp&nbsp${list.title }
		                                    </c:if>
										</label>
                                   </c:forEach>
 							</div>
							<!-- 隐藏域-->
 									<input id="roleid" name="roleid" type="hidden"
										value="${usertype.roleid}" /> 
						</form>
						<!-- 表单体  end-->
					</div>
				</div>
		</div>

</body>
</html>