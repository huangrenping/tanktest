<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${webPath}/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${webPath}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="${webPath}/assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${webPath}/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="${webPath}/assets/css/app.css">
    <script src="${webPath}/assets/js/jquery.min.js"></script>
    <script src="${webPath}/assets/js/amazeui-pagination.js"></script>

	<script type="text/javascript">
	layui.config({
		  base: '${webPath}/admin/address/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('list'); //加载入口
</script>
</head>
<body class="theme-black">
  <!-- 内容区域 -->
    
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">收货地址列表</div>


                            </div>
                            <div class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button type="button" class="am-btn am-btn-default am-btn-success" id="savebut"><span class="am-icon-plus"></span> 新增</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                      
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field ">
                                        <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button"></button>
          </span>
                                    </div>
                                </div>

                                <div class="am-u-sm-12">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                        <thead>
                                            <tr>
                                                <th>地址编号</th>
                                                <th>收货人姓名</th>
                                                <th>收货人电话</th>
                                                <th>用户表ID</th>
                                                <th>省</th>
                                                <th>省编码</th>
                                                <th>市</th>
                                                <th>市编码</th>
                                                <th>区域</th>
                                                <th>区域编码</th>
                                                <th>详细地址</th>
                                                <th>是否默认地址</th>
                                                <th>创建时间</th>
                                                <th>更新时间</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addressbody">
                                            
                                           
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