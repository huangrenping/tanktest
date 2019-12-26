<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>欢迎来到坦克后台</title>
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=path %>/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datetimepicker.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=path %>/assets/css/app.css">
    <script src="<%=path %>/assets/js/jquery.min.js"></script>
    <%-- <script src="<%=path %>/assets/js/amazeui.min.js"></script> --%>
    <script src="<%=path %>/assets/js/moment-with-locales.min.js"></script>
    
   <%--  <script src="<%=path %>/assets/js/app.js"></script> --%>
    <script src="<%=path %>/assets/js/theme.js"></script>
    <script src="<%=path %>/assets/js/amazeui-pagination.js"></script>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
     <script type="text/javascript">
     	layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			//editpassword();
		});
     function editpassword(){
     	layer.confirm('暂不支持该功能！');
     };
     
     
     </script>
</head>

<body data-type="index" class="theme-black">
    <script src="<%=path %>/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 头部 -->
        <header>
            <!-- logo -->
            <div class="am-fl tpl-header-logo">
                <%-- <a href="javascript:;"><img src="<%=path %>/assets/img/logo.png" alt=""></a> --%>
            </div>
            <!-- 右侧内容 -->
            <div class="tpl-header-fluid">
                <!-- 侧边切换 -->
                <div class="am-fl tpl-header-switch-button am-icon-list">
                    <span>

                </span>
                </div>
                <!-- 搜索 -->
                <div class="am-fl tpl-header-search">
                    <!-- <form class="tpl-header-search-form" action="javascript:;">
                        <button class="tpl-header-search-btn am-icon-search"></button>
                        <input class="tpl-header-search-box" type="text" placeholder="搜索内容...">
                    </form> -->
                </div>
                <!-- 其它功能-->
                <div class="am-fr tpl-header-navbar">
                    <ul>
                        <!-- 欢迎语 -->
                        <li class="am-text-sm tpl-header-navbar-welcome">
                            <a href="javascript:;">欢迎你  <span>${realname }</span> </a>
                        </li>

                        <!-- 新邮件 -->
                        <%-- <li class="am-dropdown tpl-dropdown" data-am-dropdown>
                            <a href="javascript:;" class="am-dropdown-toggle tpl-dropdown-toggle" data-am-dropdown-toggle>
                                <i class="am-icon-envelope"></i>
                                <span class="am-badge am-badge-success am-round item-feed-badge">4</span>
                            </a>
                            <!-- 弹出列表 -->
                            <ul class="am-dropdown-content tpl-dropdown-content">
                                <li class="tpl-dropdown-menu-messages">
                                    <a href="javascript:;" class="tpl-dropdown-menu-messages-item am-cf">
                                        <div class="menu-messages-ico">
                                            <img src="<%=path %>/assets/img/user04.png" alt="">
                                        </div>
                                        <div class="menu-messages-time">
                                            3小时前
                                        </div>
                                        <div class="menu-messages-content">
                                            <div class="menu-messages-content-title">
                                                <i class="am-icon-circle-o am-text-success"></i>
                                                <span>夕风色</span>
                                            </div>
                                            <div class="am-text-truncate"> Amaze UI 的诞生，依托于 GitHub 及其他技术社区上一些优秀的资源；Amaze UI 的成长，则离不开用户的支持。 </div>
                                            <div class="menu-messages-content-time">2016-09-21 下午 16:40</div>
                                        </div>
                                    </a>
                                </li>

                                <li class="tpl-dropdown-menu-messages">
                                    <a href="javascript:;" class="tpl-dropdown-menu-messages-item am-cf">
                                        <div class="menu-messages-ico">
                                            <img src="<%=path %>/assets/img/user02.png" alt="">
                                        </div>
                                        <div class="menu-messages-time">
                                            5天前
                                        </div>
                                        <div class="menu-messages-content">
                                            <div class="menu-messages-content-title">
                                                <i class="am-icon-circle-o am-text-warning"></i>
                                                <span>禁言小张</span>
                                            </div>
                                            <div class="am-text-truncate"> 为了能最准确的传达所描述的问题， 建议你在反馈时附上演示，方便我们理解。 </div>
                                            <div class="menu-messages-content-time">2016-09-16 上午 09:23</div>
                                        </div>
                                    </a>
                                </li>
                                <li class="tpl-dropdown-menu-messages">
                                    <a href="javascript:;" class="tpl-dropdown-menu-messages-item am-cf">
                                        <i class="am-icon-circle-o"></i> 进入列表…
                                    </a>
                                </li>
                            </ul>
                        </li>
 --%>
                        <!-- 新提示 -->
<!--                         <li class="am-dropdown" data-am-dropdown>
                            <a href="javascript:;" class="am-dropdown-toggle" data-am-dropdown-toggle>
                                <i class="am-icon-bell"></i>
                                <span class="am-badge am-badge-warning am-round item-feed-badge">5</span>
                            </a> -->

                            <!-- 弹出列表 -->
                           <!--  <ul class="am-dropdown-content tpl-dropdown-content">
                                <li class="tpl-dropdown-menu-notifications">
                                    <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                        <div class="tpl-dropdown-menu-notifications-title">
                                            <i class="am-icon-line-chart"></i>
                                            <span> 有6笔新的销售订单</span>
                                        </div>
                                        <div class="tpl-dropdown-menu-notifications-time">
                                            12分钟前
                                        </div>
                                    </a>
                                </li>
                                <li class="tpl-dropdown-menu-notifications">
                                    <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                        <div class="tpl-dropdown-menu-notifications-title">
                                            <i class="am-icon-star"></i>
                                            <span> 有3个来自人事部的消息</span>
                                        </div>
                                        <div class="tpl-dropdown-menu-notifications-time">
                                            30分钟前
                                        </div>
                                    </a>
                                </li>
                                <li class="tpl-dropdown-menu-notifications">
                                    <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                        <div class="tpl-dropdown-menu-notifications-title">
                                            <i class="am-icon-folder-o"></i>
                                            <span> 上午开会记录存档</span>
                                        </div>
                                        <div class="tpl-dropdown-menu-notifications-time">
                                            1天前
                                        </div>
                                    </a>
                                </li>


                                <li class="tpl-dropdown-menu-notifications">
                                    <a href="javascript:;" class="tpl-dropdown-menu-notifications-item am-cf">
                                        <i class="am-icon-bell"></i> 进入列表…
                                    </a>
                                </li>
                            </ul>
                        </li> -->

                        <!-- 退出 -->
                        <li class="am-text-sm">
                            <a href="<%=path %>/admin/loginout">
                                <span class="am-icon-sign-out"></span> 退出
                            </a>
                        </li>
                        
                        <!-- 修改密码 -->
                        <li class="am-text-sm">
                            <a href="javascript:;" onclick="editpassword();" target="frame" >
		                        <i class="am-icon-calendar sidebar-nav-link-logo"></i> 修改密码
		                    </a>
                        </li>
                        
<!--                         <li class="sidebar-nav-link sidebar-nav-item">
		                    <a href="../shopping/shoppinglist.jsp" target="frame" >
		                        <i class="am-icon-calendar sidebar-nav-link-logo"></i> 修改密码
		                    </a>
               		    </li> -->
                
                    </ul>
                </div>
            </div>

        </header>
        <!-- 风格切换 -->
        <div class="tpl-skiner">
            <div class="tpl-skiner-toggle am-icon-cog">
            </div>
            <div class="tpl-skiner-content">
                <div class="tpl-skiner-content-title">
                    选择主题
                </div>
                <div class="tpl-skiner-content-bar">
                	<span class="skiner-color skiner-black" data-color="theme-black"></span>
                    <span class="skiner-color skiner-white" data-color="theme-white"></span>
                    
                </div>
            </div>
        </div>
        <!-- 侧边导航栏 -->
        <div class="left-sidebar">
            <!-- 用户信息 -->
            <div class="tpl-sidebar-user-panel">
                <div class="tpl-user-panel-slide-toggleable">
                    <div class="tpl-user-panel-profile-picture">
                        <img src="<%=path %>/assets/img/user07.png" alt="">
                    </div>
                    <span class="user-panel-logged-in-text">
              <!-- <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i> -->
              ${admin.username }
          </span>
                    <%-- <a href="javascript:;" class="tpl-user-panel-action-link"> <span class="am-icon-pencil"></span> 账号设置</a> --%>
                </div>
            </div>

            <!-- 菜单 -->
            <ul class="sidebar-nav">
                <!--<li class="sidebar-nav-heading">Components <span class="sidebar-nav-heading-info"> 附加组件</span></li>-->
                <li class="sidebar-nav-link sidebar-nav-item">
                    <a href="<%=path %>/admin/welcome" class="active" target="frame" >
                        <i class="am-icon-home sidebar-nav-link-logo"></i> 首页
                    </a>
                </li>
                <!--玩家管理模块-->
                <!-- 权限管理 -->
                 <s:forEach items="${listone }" var="one" >
	                <li class="sidebar-nav-link">
	                	
	                		<a href="javascript:;" class="sidebar-nav-sub-title">
	                        	<i class="am-icon-table sidebar-nav-link-logo"></i> ${one.content } 
	                        	<span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
	                   		</a>
	                	
	                    
	                    <!--二级目录 -->
	                    <s:forEach items="${listtwo}" var="two">
	                    	<fmt:formatNumber var="twotype" type="number" value="${two.type/100}" maxFractionDigits="0"></fmt:formatNumber>
	                    	<s:set var="onetype" value="${one.type}"></s:set>
	                    	<%-- <s:out value="${twotype }"></s:out>
	                    	<s:out value="${onetype }"></s:out> --%>
	                    	<s:if test="${twotype==onetype }">
			                    <ul class="sidebar-nav sidebar-nav-sub">
			                        <li class="sidebar-nav-link sidebar-nav-item">
			                        
										<s:if test="${two.type1==1}">
			                            <a href="<%=path %>/${two.url1}" target="frame" >
			                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> ${two.content }
			                            </a>
			                            </s:if>
			                            <s:if test="${two.type1==0}">
			                             <a href="../${two.url }" target="frame" >
			                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> ${two.content }
			                            </a>
			                            </s:if>
			                        </li>
			                    </ul>
			                </s:if>
		                    
	                    </s:forEach>
	                </li>
                </s:forEach>
           		<!--  -->
                <%-- <li class="sidebar-nav-link">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 玩家管理
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link sidebar-nav-item">

                            <a href="../wgplayer/wglist.jsp" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 在线玩家
                            </a>
                        </li>
                        
                        <li class="sidebar-nav-link sidebar-nav-item">

                            <a href="../wgplayer/allwglist.jsp" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 玩家列表
                            </a>
                        </li>
                        
                    </ul>
                </li> --%>
                <!--用户管理模块-->
<%--                 <li class="sidebar-nav-link">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 权限管理
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                    	<!-- <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="../user/userlist.jsp" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 账号管理
                            </a>
                        </li> -->
                        
                        <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="../user/userlist.jsp" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 账号管理
                            </a>
                        </li>
                    
                        <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="../usertype/userlisttype.jsp" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 类型管理
                            </a>
                        </li>
                        
                        <!-- <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="../usertype/userlisttypetwo.jsp" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 类型管理测试
                            </a>
                        </li> -->
							
						<!-- <li class="sidebar-nav-link sidebar-nav-item">

                            <a href="../usertype/saveusertype.jsp" target="frame" >

                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 类型权限管理
                            </a>
                        </li> -->
                        
                        <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="${webPath }/Level/AllLevel" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 用户等级管理
                            </a>
                        </li>
                    </ul>
                </li> --%>
               <!--商城模块-->
                <!-- <li class="sidebar-nav-link sidebar-nav-item">
                    <a href="../shopping/shoppinglist.jsp" target="frame" >
                        <i class="am-icon-calendar sidebar-nav-link-logo"></i> 商城管理
                    </a>
                </li>
                成、制衣管理模块
               <li class="sidebar-nav-link sidebar-nav-item">
                    <a href="../material/materiallist.jsp" target="frame" >
                        <i class="am-icon-bar-chart sidebar-nav-link-logo"></i> 成、制衣管理
                    </a>
                </li> -->
               <!--道具管理模块-->
              <!--  <li class="sidebar-nav-link sidebar-nav-item">
                    <a href="../article/articlelist.jsp"  target="frame" >
                        <i class="am-icon-bar-chart sidebar-nav-link-logo"></i> 道具管理

                    </a>
                </li> -->
               <!--收货地址管理模块-->
               <!-- <li class="sidebar-nav-link sidebar-nav-item">
                    <a href="../mail/send.jsp"  target="frame" >
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 送道具
                    </a>
                </li> -->
                
                <!-- <li class="sidebar-nav-link sidebar-nav-item">
                    <a href="../plot/allplotlist.jsp"  target="frame" >
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 剧情管理
                    </a>
                </li> -->
                
                <!-- <li class="sidebar-nav-link sidebar-nav-item">
                    <a href="../givecard/send.jsp"  target="frame" >
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 送卡片
                    </a>
                </li> -->
                
                <!-- <li class="sidebar-nav-link sidebar-nav-item">
                    <a href="../feedback/feedbacklist.jsp"  target="frame" >
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 反馈管理
                    </a>
                </li> -->
     
                
               <!--订单管理模块--> 
               <%-- <li class="sidebar-nav-link">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> 卡牌管理
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="../card/cardlist.jsp" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 卡片列表
                            </a>
                        </li>

                        <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="../card/male.jsp" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 男主列表
                            </a>
                        </li>
                    </ul>
                </li> --%>
                <!--商品管理模块--> 
               <%-- <li class="sidebar-nav-link sidebar-nav-item">
                    <a href="<%=path %>/goods/toGoodsList" target="frame" >
                        <i class="am-icon-calendar sidebar-nav-link-logo"></i> XXX
                    </a>
                </li> --%>
                <!--商品类型管理模块--> 
              <%--  <li class="sidebar-nav-link">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> XXX
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="${webPath }/goodstypebig/tolist" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 大类型管理
                            </a>
                        </li>

                        <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="${webPath }/goodstypesamll/tolist" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 小类型管理
                            </a>
                        </li>
                    </ul>
                </li> --%>
                

                  <!--商品类型管理模块--> 
              <%-- <li class="sidebar-nav-link">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-table sidebar-nav-link-logo"></i> XXX
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="<%=path %>/specifications/tolist" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 规格种类表
                            </a>
                        </li>

                        <li class="sidebar-nav-link sidebar-nav-item">
                            <a href="<%=path %>/specificationsdetail/tolist" target="frame" >
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 规格明细表
                            </a>
                        </li>
                    </ul>
                </li> --%>
            </ul>
        </div>
        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
        
			<div class="tpl-content-item">
				<iframe id="contentIframe" src="<%=path %>/admin/welcome" name="frame"></iframe>
			</div>
        </div>
    </div>

    <script src="<%=path %>/assets/js/amazeui.min.js"></script>
    <script src="<%=path %>/assets/js/amazeui.datatables.min.js"></script>
    <script src="<%=path %>/assets/js/dataTables.responsive.min.js"></script>
    <script src="<%=path %>/assets/js/app.js"></script>

</body>

</html>