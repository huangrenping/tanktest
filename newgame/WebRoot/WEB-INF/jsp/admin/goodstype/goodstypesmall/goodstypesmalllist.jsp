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
   <script src="${webPath}/assets/js/amazeui.min.js"></script>
    <script src="${webPath}/assets/js/amazeui.datatables.min.js"></script>
    <script src="${webPath}/assets/js/dataTables.responsive.min.js"></script>
    <script src="${webPath}/assets/js/app.js"></script>
    <script src="${webPath}/assets/js/amazeui-pagination.js"></script>
    <jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>

<script type="text/javascript">
	layui.config({
		  base: '${webPath}/admin/goodstype/goodstypesmall/' //你存放新模块的目录，注意，不是layui的模块目录
		}).use('goodstypesmalllist'); //加载入口
</script>

<title>大类型管理</title>
<script>
	var webPath = "${webPath}";
</script>
</head>
<body class="theme-black">
	<!-- 内容区域 -->
		<div class="row-content am-cf" >
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
					<div class="widget am-cf">
						<div class="widget-head am-cf">
							<div class="widget-title  am-cf">小类型管理列表</div>
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
							
							<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        <select data-am-selected="{btnSize: 'sm'}" name="goodsTypeIda" id="goodsTypeId">
								              <option value="">所有类别</option>
								              
								        </select>
                                    </div>
                            </div>
							
							<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " name="namea" id="typebigname">
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
											<th>小类编号</th>
											<th>小类简图</th>
											<th>小类名称</th>
											<th>所属大类</th>
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
	<!-- 修改表单 -->
	<!-- 内容区域 -->
		<div class="row-content am-cf" style="display: none;text-align: center;padding: 10px;"id="upd-from">
			
			<div class="row">
				<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
						<div class="widget am-cf">
							<div class="widget-head am-cf">
								<div class="widget-title am-fl">增加商品小类</div>
								<div class="widget-function am-fr">
									<a href="javascript:;" class="am-icon-cog"></a>
								</div>
							</div>
							<div class="widget-body am-fr">

								<form class="am-form tpl-form-border-form tpl-form-border-br" id="save-form">
									<input type="hidden" id="id" name="id">
									<div class="am-form-group">
										<label for="user-name" class="am-u-sm-3 am-form-label">小类名称：
										</label>
										<div class="am-u-sm-9">
											<input type="text" class="tpl-form-input" name="name" id="Smallname"
												placeholder="请输入小类名称"> <small>请规范输入小类名称。</small>
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-phone" class="am-u-sm-3 am-form-label">所属大类：
										</label>

										<div class="am-u-sm-9">
											<select data-am-selected="" style="display: none;" name="goodsTypeId" id="goodsTypeIds">
											     
											</select>
										</div>

									</div>
									<div class="am-form-group">
										<label for="user-weibo" class="am-u-sm-3 am-form-label">小类简图：
										</label>
										<div class="am-u-sm-9">
											<div class="am-form-group am-form-file">
												<div class="tpl-form-file-img">
													<img id="imgUrl" src="${webPath }/admin/goodstype/img/tx02S.jpg"
														width="500px" height="300px">
												</div>
				    							
												 <button type="button" id="kdUploadSelect" class="am-btn am-btn-danger am-btn-sm          ">
														<i class="am-icon-cloud-upload"></i> 添加小类简图
												</button>
												<input id="fImg" name="img" type="hidden" value="/admin/goodstype/img/tx02S.jpg">
											</div>
										</div>
									</div>
                                    <input type="hidden" value="1" id=isdelete>
									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<button type="button" id="btn-save"
												class="am-btn am-btn-primary tpl-btn-bg-color-success ">确定添加</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>