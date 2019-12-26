<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsMobilePage.jsp"></jsp:include>
<html>

<head>
	<title>产品详情</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
		<script src="${webPath}/mobile/pageJs/pro_info.js"></script>
		<script type="text/javascript" src="${webPath }/eudit/ueditor.parse.js"></script>
</head>

<body ontouchstart>
	<!--主体-->
	<div class="weui-content">
		<!--产品详情-->
		<div class="weui-tab">

			<div class="weui-navbar" style="position:fixed; top:0; left:0; right:0; height:44px;">
				<div class=" wy-header-icon-back" style="z-index: 3;"> <span></span></div>
				<a class="weui-navbar__item proinfo-tab-tit weui-bar__item--on" href="#tab1">商品</a>
				<a class="weui-navbar__item proinfo-tab-tit" href="#tab2">详情</a>
				<a class="weui-navbar__item proinfo-tab-tit" href="#tab3">评价</a>

			</div>
			<div class="weui-tab__bd proinfo-tab-con">
				<div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
					<input type="hidden" value="${goods.id}" id="goodId">
					<input type="hidden" value="${goods.title}" id="title">
					<input type="hidden" value="${goods.price}" id="price">
					<input type="hidden" value="${goods.coverimg}" id="coverImg">
					<input type="hidden" value="${loginUser.id }" id="user"> 
					<input type="hidden" value="${shortUserId }" id="shortId"> 
					<!--主图轮播-->
					<div class="swiper-container swiper-zhutu">
						<div class="swiper-wrapper">
							<c:forEach var="coverimg" items="${goods.carouselImg }">
								<div class="swiper-slide"><img src="${webPath}/${coverimg}" /></div>
							</c:forEach>
						</div>
						<div class="swiper-pagination swiper-zhutu-pagination"></div>
					</div>
					<div class="wy-media-box-nomg weui-media-box_text">
						<h4 class="wy-media-box__title">${goods.title}</h4>
						<div class="wy-pro-pri mg-tb-5">¥<em class="num font-20">${goods.price}</em></div>
						<p class="weui-media-box__desc">${goods.subtitle}</p>
					</div>
					<div class="wy-media-box2 weui-media-box_text">
						<div class="weui-media-box_appmsg">
							<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">优惠</span></div>
							<div class="weui-media-box__bd">
								<div class="promotion-message clear">
									<i class="yhq"><span class="label-text">优惠券</span></i>
									<span class="promotion-item-text">满197.00减40.00</span>
								</div>
								<div class="promotion-message clear">
									<i class="yhq"><span class="label-text">优惠券</span></i>
									<span class="promotion-item-text">满197.00减40.00</span>
								</div>
								<div class="yhq-btn clear">
									<a href="yhq_list.html">去领券</a>
								</div>
							</div>
						</div>
					</div>
					<div class="wy-media-box2 weui-media-box_text">
						<div class="weui-media-box_appmsg">
							<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">尺码</span></div>
							<div class="weui-media-box__bd">
								<div class="promotion-sku clear">
									<ul id="size">
										<c:forEach var="size" items="${goods.sizes}">
											<li>
												<a href="javascript:;">${size}</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div class="weui-media-box_appmsg">
							<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">颜色</span></div>
							<div class="weui-media-box__bd">
								<div class="promotion-sku clear">
									<ul id="color">
										<c:forEach var="color" items="${goods.colors}">
											<li>
												<a href="javascript:;">${color}</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="wy-media-box2 txtpd weui-media-box_text">
						<div class="weui-media-box_appmsg">
							<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">送至</span></div>
							<div class="weui-media-box__bd">
								<div class="promotion-message clear">
									<span class="promotion-item-text">湖北</span>
									<span class="promotion-item-text">武汉市</span>
									<span class="promotion-item-text">花山</span>
								</div>
							</div>
						</div>
						<div class="weui-media-box_appmsg">
							<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">运费</span></div>
							<div class="weui-media-box__bd">
								<div class="promotion-message clear">
									<span class="promotion-item-text">${goods.freight}<!--<div class="wy-pro-pri">¥<span class="num">11.00</span></div>--></span>
							</div>
						</div>
					</div>
					<div class="weui-media-box_appmsg">
						<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">收藏</span></div>
						<div class="weui-media-box__bd">
							<div class="promotion-message clear">
								<span class="promotion-item-text" id="collectnum">${goods.collectionnum}人</span>
							</div>
						</div>
					</div>
					<div class="weui-media-box_appmsg">
						<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">提示</span></div>
						<div class="weui-media-box__bd">
							<div class="promotion-message clear">
								<span class="promotion-item-text"><p class="txt-color-ml">支持7天无理由退换货</p></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="tab2" class="weui-tab__bd-item ">

				<div class="pro-detail">

					<div id="contents">
						${goods.detail}
					</div>

				</div>

			</div>
			<div id="tab3" class="weui-tab__bd-item">
				<!--评价-->

				<a href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link list-more">
					<div class="weui-cell__bd">查看更多</div>
					<span class="weui-cell__ft"></span>
				</a>

			</div>
		</div>
	</div>
	</div>
	<span id="tophovertree" title="返回顶部"></span>
	<!--底部导航-->
	<div class="foot-black"></div>
	<div class="weui-tabbar wy-foot-menu">
		<a href="javascript:;" class="promotion-foot-menu-items">
			<div class="weui-tabbar__icon promotion-foot-menu-kefu"></div>
			<p class="weui-tabbar__label">客服</p>
		</a>
		<a href="javascript:;" id='show-toast' class="promotion-foot-menu-items">
			<div class="weui-tabbar__icon promotion-foot-menu-collection"></div>
			<p class="weui-tabbar__label">收藏</p>
		</a>
		<a href="${webPath}/shopCat/toCatByUid"  class="promotion-foot-menu-items" >
			<span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;display: none;" id="shopCat" ></span>
			<div class="weui-tabbar__icon promotion-foot-menu-cart"></div>
			<p class="weui-tabbar__label">购物车</p>
		</a>
		<a href="javascript:;" class="weui-tabbar__item yellow-color open-popup"  id="mycat" data-target="#join_cart">
			<p class="promotion-foot-menu-label">加入购物车</p>
		</a>
		
		<a href="javascript:;" class="weui-tabbar__item red-color open-popup" data-target="#selcet_sku">
			<p class="promotion-foot-menu-label">立即购买</p>
		</a>
	</div>
	<div id="join_cart" class='weui-popup__container popup-bottom' style="z-index:600;">
		<div class="weui-popup__overlay" style="opacity:1;"></div>
		<div class="weui-popup__modal">
			<div class="modal-content">
				<div class="weui-msg" style="padding-top:0;">
					<div class="weui-msg__icon-area"><i class="weui-icon-success weui-icon_msg"></i></div>
					<div class="weui-msg__text-area">
						<h2 class="weui-msg__title">成功加入购物车</h2>
						<p class="weui-msg__desc">亲爱的用户，您的商品已成功加入购物车，为了保证您的商品快速送达，请您尽快到购物车结算。</p>
					</div>
					<div class="weui-msg__opr-area">
						<p class="weui-btn-area">
							<a href="${webPath}/shopCat/toCatByUid" class="weui-btn weui-btn_primary">去购物车结算</a>
							<a href="javascript:;" class="weui-btn weui-btn_default close-popup">不，我再看看</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="selcet_size" class='weui-popup__container popup-bottom' style="z-index:600;">
		<div class="weui-popup__overlay" style="opacity:1;"></div>
		<div class="weui-popup__modal">
			<div class="toolbar">
				<div class="toolbar-inner">
					<a href="javascript:;" class="picker-button close-popup">关闭</a>
					<h1 class="title">请选择商品属性</h1>
				</div>
			</div>
			<div class="modal-content">
				<div class="weui-msg" style="padding-top:0;">
					<div class="wy-media-box2 weui-media-box_text" style="margin:0;">
						<div class="weui-media-box_appmsg">
							<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">尺码</span></div>
							<div class="weui-media-box__bd">
								<div class="promotion-sku clear">
									<ul id="size1">
										<c:forEach var="size" items="${goods.sizes}">
											<li>
												<a href="javascript:;">${size}</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div class="weui-media-box_appmsg">
							<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">颜色</span></div>
							<div class="weui-media-box__bd">
								<div class="promotion-sku clear">
									<ul id="color1">
										<c:forEach var="color" items="${goods.colors}">
											<li>
												<a href="javascript:;">${color}</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="weui-msg__opr-area">
						<p class="weui-btn-area">
							<a href="#" class="weui-btn weui-btn_primary" id="mycat">加入购物车</a>
							<a href="javascript:;" class="weui-btn weui-btn_default close-popup">不，我再看看</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="selcet_sku" class='weui-popup__container popup-bottom' style="z-index:600;">
		<div class="weui-popup__overlay" style="opacity:1;"></div>
		<div class="weui-popup__modal">
			<div class="toolbar">
				<div class="toolbar-inner">
					<a href="javascript:;" class="picker-button close-popup">关闭</a>
					<h1 class="title">商品属性</h1>
				</div>
			</div>
			<div class="modal-content">
				<div class="weui-msg" style="padding-top:0;">
					<div class="wy-media-box2 weui-media-box_text" style="margin:0;">
						<div class="weui-media-box_appmsg">
							<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">尺码</span></div>
							<div class="weui-media-box__bd">
								<div class="promotion-sku clear">
									<ul id="size2">
										<c:forEach var="size" items="${goods.sizes}">
											<li>
												<a href="javascript:;">${size}</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div class="weui-media-box_appmsg">
							<div class="weui-media-box__hd proinfo-txt-l"><span class="promotion-label-tit">颜色</span></div>
							<div class="weui-media-box__bd">
								<div class="promotion-sku clear">
									<ul id="color2">
										<c:forEach var="color" items="${goods.colors}">
											<li>
												<a href="javascript:;">${color}</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="weui-msg__opr-area">
						<p class="weui-btn-area">
							<a  class="weui-btn weui-btn_primary" id="paynow">立即购买</a>
							<a href="javascript:;" class="weui-btn weui-btn_default close-popup">不，我再看看</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			FastClick.attach(document.body);
			$(".wy-header-icon-back").click(function(e) {
				window.history.back();
				e.stopPropagation();
			});
		});
	</script>
	<script>
		$(".swiper-zhutu").swiper({
			loop: true,
			paginationType: 'fraction',
			autoplay: 5000
		});
	</script>
	<script>
		$(function() {
			$(".promotion-sku li").click(function() {
				$(this).addClass("active").siblings("li").removeClass("active");
			})
		})
	</script>

	<script>
		$(document).on("open", ".weui-popup-modal", function() {
			console.log("open popup");
		}).on("close", ".weui-popup-modal", function() {
			console.log("close popup");
		});
	</script>
	<script>
		$(function() { initTopHoverTree("tophov" + "ertree", 30, 10, 10); })
	</script>
	<script>
		function initTopHoverTree(hvtid, times, right, bottom) {
			$("#" + hvtid).css("right", right).css("bottmo", bottom);
			$("#" + hvtid).on("click", function() { goTopHovetree(times); })
			$(window).scroll(function() {
				if($(window).scrollTop() > 268) {
					$("#" + hvtid).fadeIn(100);
				} else {
					$("#" + hvtid).fadeOut(100);
				}
			});
		}
		//返回顶部动画
		//goTop(500);//500ms内滚回顶部
		function goTopHovetree(times) {
			if(!!!times) {
				$(window).scrollTop(0);
				return;
			}
			var sh = $('body').scrollTop(); //移动总距离
			var inter = 13.333; //ms,每次移动间隔时间
			var forCount = Math.ceil(times / inter); //移动次数
			var stepL = Math.ceil(sh / forCount); //移动步长
			var timeId = null;

			function aniHovertree() {
				!!timeId && clearTimeout(timeId);
				timeId = null;
				//console.log($('body').scrollTop());
				if($('body').scrollTop() <= 0 || forCount <= 0) { //移动端判断次数好些，因为移动端的scroll事件触发不频繁，有可能检测不到有<=0的情况
					$('body').scrollTop(0);
					return;
				}
				forCount--;
				sh -= stepL;
				$('body').scrollTop(sh);
				timeId = setTimeout(function() { aniHovertree(); }, inter);
			}
			aniHovertree();
		}
	</script>
</body>

</html>