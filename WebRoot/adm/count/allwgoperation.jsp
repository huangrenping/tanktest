<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    net.sf.json.JsonConfig,
    web.webSocket.open.OpenManager,
    web.webSocket.vip.VipManager,
    web.webSocket.open.Open,
    web.webSocket.message.Messagepush,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.plot.PlotManager,
    java.sql.DriverManager,
	java.sql.ResultSet,
	java.sql.SQLException,
	java.sql.Statement,
	java.sql.Connection,
	web.webSocket.util.GameServerManager,
    web.webSocket.pojo.WgPlayerserver5,
    web.webSocket.pojo.WgPlayerserver2"%>
<%@ taglib prefix="s" uri="http://java.sun.com/jstl/core_rt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="<%=path %>/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=path %>/assets/i/app-icon72x72@2x.png">
<link rel="stylesheet" href="<%=path %>/assets/css/amazeui.min.css" />
<link rel="stylesheet"
	href="<%=path %>/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="<%=path %>/assets/css/app.css">
<script src="<%=path %>/assets/js/jquery.min.js"></script>
<script src="<%=path %>/assets/js/amazeui.min.js"></script>
<script src="<%=path %>/assets/js/app.js"></script>
<script src="<%=path %>/assets/js/theme.js"></script>
<script src="<%=path %>/assets/js/amazeui-pagination.js"></script>


<%
	List<Messagepush> listtwo=(List<Messagepush>)session.getAttribute("listtwo");
	 	int num=0;
	 	//检查账号是否有该权限
	 	if(listtwo!=null){
		 	for(Messagepush messagepush:listtwo){
				if(messagepush.getType()==905){
					num++;
					break;
				}
			}
	 	}
		if(num<1){
			response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
			return ;
		}
		GameServerManager servers=GameServerManager.getInstance();
		String URL=servers.getSqlurl();
		int sid=servers.getServerid();
		//String URL="jdbc:mysql://121.40.182.51:3306/webgame?useUnicode=true&amp;characterEncoding=utf-8";
        String USER=servers.getUser();
        String PASSWORD=servers.getPassword();
        //1.加载驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        //2.获得数据库链接
        Connection conn=DriverManager.getConnection(URL, USER, PASSWORD);
        //3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
        Statement st=conn.createStatement();

        ResultSet rs=st.executeQuery("SELECT count(case wg5.login when 1 then 1 end) AS login,count(case wg5.level when 1 then 1 end) AS `level`,count(case wg5.`suit` when 1 then 1 end) AS `suit`,count(case wg5.`sign` when 1 then 1 end) AS `sign`,count(case wg5.`physical` when 1 then 1 end) AS `physical`,count(case wg5.`arena` when 1 then 1 end) AS `arena`,count(case wg5.`everydayactivity` when 1 then 1 end) AS `everydayactivity`,count(case wg5.`sendphysical` when 1 then 1 end) AS `sendphysical`,count(case wg5.`bless` when 1 then 1 end) AS `bless`,count(case wg5.`makeclothes` when 1 then 1 end) AS `makeclothes`,count(case wg5.`engagement` when 1 then 1 end) AS `engagement`,count(case wg5.`shopclothes` when 1 then 1 end) AS `shopclothes`,count(case wg5.`tree` when 1 then 1 end) AS `tree`,count(case wg5.`achievement` when 1 then 1 end) AS `achievement`,count(case wg5.`summer` when 1 then 1 end) AS `summer`,count(case wg5.`oneyuan` when 1 then 1 end) AS `oneyuan`,count(case wg5.`bank` when 1 then 1 end) AS `bank`,count(case wg5.`sevenday` when 1 then 1 end) AS `sevenday`,count(case wg5.`monthcard` when 1 then 1 end) AS `monthcard`,count(case wg5.`typebug` when 1 then 1 end) AS `typebug`,count(case wg5.`superbag` when 1 then 1 end) AS `superbag`,count(case wg5.`diamondluckdraw` when 1 then 1 end) AS `diamondluckdraw`,count(case wg5.`catluckdraw` when 1 then 1 end) AS `catluckdraw`,count(case wg5.`hangup` when 1 then 1 end) AS `hangup`,count(case wg5.`dream` when 1 then 1 end) AS `dream` FROM wg_playerserver5 wg5 where sid="+sid+";");
      
        //4.处理数据库的返回结果(使用ResultSet类)
        while(rs.next()){
        	//1登录奖励领取
            request.setAttribute("login", rs.getString("login"));
            //2.等级奖励领取
            request.setAttribute("level", rs.getString("level"));
            //3.套装兑换
            request.setAttribute("suit", rs.getString("suit"));
            //4.签到
            request.setAttribute("sign", rs.getString("sign"));
            //6.百花盛宴活动参与人数统计
            request.setAttribute("arena", rs.getString("arena"));
            //续情缘活动参与人数统计
            request.setAttribute("engagement", rs.getString("engagement"));
            //爱情树
            request.setAttribute("tree", rs.getString("tree"));
            //成就图鉴
            request.setAttribute("achievement", rs.getString("achievement"));
            //每日任务
            request.setAttribute("everydayactivity", rs.getString("everydayactivity"));
            //发送体力
            request.setAttribute("sendphysical", rs.getString("sendphysical"));
            //祈福
            request.setAttribute("bless", rs.getString("bless"));
            //做衣服
            request.setAttribute("makeclothes", rs.getString("makeclothes"));
            //买衣服
            request.setAttribute("shopclothes", rs.getString("shopclothes"));
            //领取每日体力
            request.setAttribute("physical", rs.getString("physical"));
            //夏日活动
            request.setAttribute("summer", rs.getString("summer"));
            
            //一元
            request.setAttribute("oneyuan", rs.getString("oneyuan"));
            //聚宝钱庄
            request.setAttribute("bank", rs.getString("bank"));
            //限时7日
            request.setAttribute("sevenday", rs.getString("sevenday"));
            //月卡福利
            request.setAttribute("monthcard", rs.getString("monthcard"));
            //限购礼包
            request.setAttribute("typebug", rs.getString("typebug"));
            //超值礼包
            request.setAttribute("superbag", rs.getString("superbag"));
            
            //钻石抽奖
            request.setAttribute("diamondluckdraw", rs.getString("diamondluckdraw"));
            //招财猫
            request.setAttribute("catluckdraw", rs.getString("catluckdraw"));
            //游历
            request.setAttribute("hangup", rs.getString("hangup"));
            //两生梦
            request.setAttribute("dream", rs.getString("dream"));
        }
        //关闭资源
        rs.close();
        st.close();
        conn.close();
%>
<jsp:include page="${webRoot}/WEB-INF/jsp/common/cssJsPage.jsp"></jsp:include>
<script type="text/javascript">
		layui.define(['form','layer','laypage','laydate'], function(exports){
		var $ = layui.jquery, form = layui.form(),layer = layui.layer,laypage = layui.laypage;
			selectwg();
			homepage();
			previouspage();
			nextpage();
			lastpage();
			jump();
		});
</script>
</head>
<body class="theme-black">
	<!-- 内容区域 -->

	<div class="theme-black">
		<div class="row">
			<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
				<div class="widget am-cf">
					<div class="widget-head am-cf">
						<div class="widget-title  am-cf">各种活动参加人数统计</div>


					</div>
					<div class="widget-body  am-fr">

						<%-- <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
							<div class="am-form-group">
								<div class="am-btn-toolbar">
									<div class="am-btn-group am-btn-group-xs">
										<button type="button" class="am-btn am-btn-default am-btn-success" id="myadd"><span class="am-icon-plus"></span> 新增</button>
										<!--                                                 <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button> -->
									</div>
								</div>
							</div>
						</div> --%>
						<%--  <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        <select data-am-selected="{btnSize: 'sm'}" id="myselect">
							            </select>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field " placeholder="请输入账号" id="loginName">
                                        <span class="am-input-group-btn">
								            <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" id="queryidandlevel" type="button"></button>
								        </span>
                                    </div>
                                </div>
							 --%>
						<!-- 内容区域 -->
						<form action="wglist.jsp" method="post" id="hp_form"
							name="hp_form" data-am-validator
							class="am-form tpl-form-line-form">

							<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
								 <div
									class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
									<%-- <input type="text" class="am-form-field" placeholder="请输入熊猫id" align="right"
										id="userName" name="userName" />
									<input type="text" class="am-form-field" placeholder="请输入昵称" align="left"
										id="playName" name="playName" />
									    <span class="am-input-group-btn">
										 <button
											class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
											id="queryuser" name="queryuser" type="button"
											onclick="selectwg();"></button> 
										</span> --%>
										<table>
	                                    	<%-- <tr>
	                                    		<td>
													<input type="text" class="am-form-field" placeholder="请输入熊猫id" align="right"
													id="userName" name="userName" />
												</td>	
												<td>
												<input type="text" class="am-form-field" placeholder="请输入昵称" align="left"
												id="playName" name="playName" />
												</td>
										    	<td>
											    	<span class="am-input-group-btn">
													    <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
														id="queryuser" name="queryuser" type="button"
														onclick="selectwg();"></button> 
													</span>
												</td>
	                                       </tr> --%>
                                 		</table>
								</div>
							</div>
						</form>
						<div class="am-u-sm-12">
							<table width="100%"
								class="am-table am-table-compact am-table-striped tpl-table-black "
								id="example-r">
								<thead>
									<tr>
										<th>编号</th>
										<th>登录奖励</th>
										<th>等级奖励</th>
										<th>套装兑换</th>
										<th>签到</th>
										<th>领取每日体力</th>
										<th>百花盛宴</th>
										<th>每日必做</th>
										<th>送体力</th>
										<th>祈福</th>
										<th>制衣坊</th>
										<th>续情缘</th>
										<th>服装店</th>
										<th>爱情树</th>
										<th>夏日缘卡</th>
										<th>成就图鉴</th>
										
										<th>一元夺宝</th>
										<!-- <th>聚宝钱庄(不准)</th>
										<th>限时7日(不准)</th>
										<th>月卡福利(不准)</th>
										<th>限购礼包(不准)</th>
										<th>超值礼包(不准)</th> -->
										<!-- 以上不准字段针对1-3区 -->
										
										<th>聚宝钱庄</th>
										<th>限时7日</th>
										<th>月卡福利</th>
										<th>限购礼包</th>
										<th>超值礼包</th>
										
										<th>钻石抽奖</th>
										<th>招财猫</th>
										<th>游历</th>
										<th>两生梦</th>
									</tr>
								</thead>
								<tbody id="addressbody">
										<tr>
											<td>1</td>
											<td>${login}</td>
											<td>${level}</td>
											<td>${suit}</td>
											<td>${sign}</td>
											<td>${physical }</td>
											<td>${arena}</td>
											<td>${everydayactivity }</td>
											<td>${sendphysical }</td>
											
											<td>${bless }</td>
											<td>${makeclothes }</td>
											<td>${engagement }</td>
											<td>${shopclothes }</td>
											<td>${tree }</td>
											<td>${summer }</td>
											<td>${achievement }</td>
											
											<td>${oneyuan }</td>
											<td>${bank }</td>
											<td>${sevenday }</td>
											<td>${monthcard }</td>
											<td>${typebug }</td>
											<td>${superbag }</td>
											<td>${diamondluckdraw }</td>
											<td>${catluckdraw }</td>
											<td>${hangup }</td>
											<td>${dream }</td>
											<td class="am-text-middle">
												<div class="tpl-table-black-operation">
												</div>
										    </td>
										</tr>
								</tbody>
							</table>
						</div>
						   <%--  当前页:<input readonly="readonly" size="1px" style="color: red;" type="text" name="pageNo" id="pageNo" value="${pageNo }" >
                                		    跳转到:<input size="1px" style="color: red;" type="text" name="jumptext" id="jumptext" value="${jump }" >
                                		  <input type="hidden" name="lastpage" id="lastpage" value="${pageCount }" >
                                		  <input type="hidden" name="max" id="max" value="${max }" >
                                		  <input type="hidden" name="size" id="size" value="${size }" >
                                		      总页数:${pageCount }&nbsp&nbsp
                                		  <button type="button" id="jumpbut" class="am-btn am-btn-default am-btn-success"><span class="am-icon-save"></span>跳转</button>
                                		  <button type="button" id="homepage" class="am-btn am-btn-default am-btn-success"><span class="am-icon-save"></span>首页</button>
                                          <button type="button" id="previouspage" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span>上一页</button>
                                          <button type="button" id="nextpage" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span>下一页</button>
                                          <button type="button" id="lastpage" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span>末页</button>
						<div class="am-u-lg-12 am-cf">
							<div class="am-fr">
								<ul class="am-pagination tpl-pagination"></ul>
							</div>
						</div> --%>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>