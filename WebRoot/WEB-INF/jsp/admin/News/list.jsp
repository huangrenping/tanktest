<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻列表页面</title>
<link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${webPath}/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="${webPath}/assets/css/app.css">
<script src="${webPath}/assets/js/jquery.min.js"></script>
<script src="${webPath}/assets/js/theme.js"></script>
<script src="${webPath}/assets/js/amazeui.min.js"></script>
<script src="${webPath}/assets/js/app.js"></script>
<script src="${webPath}/assets/js/amazeui-pagination.js"></script>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<script type="text/javascript">
	layui.config({
		base : '${webPath}/admin/News/' //你存放新模块的目录，注意，不是layui的模块目录
	}).use('NewsList'); //加载入口
</script>

</head>
<body class="theme-black">
	<!-- 内容区域 -->
            <div class="row-content am-cf">
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
                                                <button type="button" class="am-btn am-btn-default am-btn-success"  id="savebut"><span class="am-icon-plus" ></span> 新增</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-u-sm-12">         
                                <table width="100%" class="am-table am-table-compact am-table-bordered am-table-radius am-table-striped tpl-table-black " id="example-r">
                                    <thead>
                                        <tr>
                                            <th>文章ID</th>
											<th>文章标题</th>								
											<th>时间</th>
											<th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody  id="news">
                                     
                                        <!-- more data -->
                                    </tbody>
                                </table>    
  
                                </div>
                             <div class="am-u-lg-12 am-cf">
                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination">
                                           
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>