<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${webPath}/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${webPath}/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${webPath}/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="${webPath}/assets/css/app.css">
    <script src="${webPath}/assets/js/jquery.min.js"></script>
    <script src="${webPath}/assets/js/amazeui.min.js"></script>
    <script src="${webPath}/assets/js/app.js"></script>
    <script src="${webPath}/assets/js/theme.js"></script>
    <script src="${webPath}/assets/js/amazeui-pagination.js"></script>
	<script type="text/javascript">
	layui.config({
		  base: '${webPath}/admin/userLevel/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('Level'); //加载入口
		
</script>
</head>
<body class="theme-black">
        <!-- 内容区域 -->
    
            <div class="theme-black">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">文章列表</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button type="button" class="am-btn am-btn-default am-btn-success" id="myadd"><span class="am-icon-plus"></span>新增</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3" >
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p" style="left: 100%">
                                        <input type="text" class="am-form-field " placeholder="请输入会员名称" id="levelname" name="levelname">
                                        <span class="am-input-group-btn">
								            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button" id="mybutton"></button>
								        </span>
                                    </div>
                                </div>

                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>等级名称</th>
                                                <th>等级介绍</th>
                                                <th>创建时间</th>
                                                <th>修改时间</th>

                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
     
                                        </tbody>
                                    </table>
                                </div>
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