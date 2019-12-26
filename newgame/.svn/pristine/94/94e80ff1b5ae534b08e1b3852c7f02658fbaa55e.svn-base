<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加轮播图页面</title>
    <script src="${webPath}/assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="${webPath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${webPath}/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="${webPath}/assets/css/app.css">
    <script src="${webPath}/assets/js/jquery.min.js"></script>
   <script src="${webPath}/assets/js/amazeui.min.js"></script>
    <script src="${webPath}/assets/js/amazeui.datatables.min.js"></script>
    <script src="${webPath}/assets/js/dataTables.responsive.min.js"></script>
    <script src="${webPath}/assets/js/app.js"></script>
    
    <jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
    <script type="text/javascript">
	layui.config({
		base : '${webPath}/admin/CarouselImg/' //你存放新模块的目录，注意，不是layui的模块目录
	}).use('addCarouselImg'); //加载入口
</script>
</head>
<body class="theme-black">
 <!-- 内容区域 -->
            <div class="row-content am-cf" >
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-body am-fr">
                                <form class="am-form tpl-form-border-form tpl-form-border-br" id="addCarouselImg-form">
                                <input type="hidden" id="id" name="id" value="${carouselImg.id}">                           
                                        <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-3 am-form-label">商品编号 <span class="tpl-form-line-small-title">name</span></label>
                                        <div class="am-u-sm-9">
                                            <input type="text" class="tpl-form-input" id="good_id" placeholder="请输入商品编号" name="goodId"  value="${carouselImg.goodId}" >                                        
                                        </div>
                                    </div>
                                    
                                    <div class="am-form-group">
                                        <label for="user-weibo" class="am-u-sm-3 am-form-label">轮播图 <span class="tpl-form-line-small-title">Images</span></label>
                                        <div class="am-u-sm-9">
                                            <div class="am-form-group am-form-file">
                                                <div class="tpl-form-file-img">
                                               <c:if test="${carouselImg.img==null ||carouselImg.img=='' }">
                                                    <img  id="imgUrl"  src="${webPath}/assets/img/a5.png"  width="436px" height="303px"   alt="">
                                                </c:if>    
                                                    <c:if test="${carouselImg.img!=null &&carouselImg.img!='' }">
                                                    <img  id="imgUrl"  src="${webPath}/${carouselImg.img}"  width="436px" height="303px"   alt="">
                                                </c:if>  
                                                </div>
                                                <button type="button" id="kdUploadSelect" class="am-btn am-btn-danger am-btn-sm          ">
														<i class="am-icon-cloud-upload"></i> 添加轮播图片
													</button>
                                                <input type="hidden" name="img"  id="carouselImg" value="/assets/img/a5.png" /> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="user-intro" class="am-u-sm-3 am-form-label">轮播描述</label>
                                        <div class="am-u-sm-9">
                                            <textarea class="" rows="10" id="user-intro" name="mark" placeholder="请输入描述内容">${carouselImg.mark}</textarea>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <div class="am-u-sm-9 am-u-sm-push-3">
                                            <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success " id="addCarouselImg-but">提交</button>
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