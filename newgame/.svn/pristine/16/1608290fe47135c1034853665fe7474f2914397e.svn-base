<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:set var="webPath" value="${pageContext.request.contextPath }"></c:set>   
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${webPath}/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="${webPath}/assets/css/app.css">
<script src="${webPath}/assets/js/jquery.min.js"></script>
<script src="${webPath}/assets/js/theme.js"></script>
<script src="${webPath}/assets/js/amazeui.min.js"></script>
<script src="${webPath}/assets/js/app.js"></script>
<script src="${webPath}/assets/js/amazeui-pagination.js"></script>

<script type="text/javascript">
	layui.config({
		  base: '${webPath}/admin/goodstype/goodstypebig/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('goodstypebiglist'); //加载入口
</script>

<title>大类型管理</title>
<script>
	var webPath = "${webPath}";
</script>
</head>
<body class="theme-black">
	<!-- 内容区域 -->
		<div class="row-content am-cf">
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
						<div class="widget-head am-cf">
							<div class="widget-title  am-cf">大类型管理列表</div>
						</div>
						<div class="widget-body  am-fr">
							<div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
								<div class="am-form-group">
									<div class="am-btn-toolbar">
										<div class="am-btn-group am-btn-group-xs">
											<button type="button"
												class="am-btn am-btn-default am-btn-success" id="save-btn">
												<span class="am-icon-plus"></span> 新增
											</button>
										</div>
									</div>
								</div>
							</div>
							
							<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " name="name" id="typebigname">
                                        <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="find-btn" type="button"></button>
          </span>
                                    </div>
                                </div>
							
							<div class="am-u-sm-12">
								<table width="100%"
									class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
									<thead>
										<tr>
											<th>种类编号</th>
											<th>种类名称</th>
											<th>描述</th>
											<th>创建时间</th>
											<th>更新时间</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="CarouselImg">
				
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
	<!-- 删除弹出框 -->
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">Amaze UI</div>
		    <div class="am-modal-bd">
		      你，确定要删除这条记录吗？
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
	</div>
	<!-- 确定弹出框 -->
	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">Amaze UI</div>
	    <div class="am-modal-bd" id="message">
	      Hello world！
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn">确定</span>
	    </div>
	  </div>
	</div>
</body>
</html>