<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,web.webSocket.mail.MailManager,java.util.*,web.webSocket.pojo.WgPlayerserverClient,web.webSocket.pojo.WgPlayerserver,web.webSocket.util.BillingCenter"%>
		<%
		String username=request.getParameter("username");
		long getid=PlayerManager.getInstance().getplayerid(username);
		String sid=request.getParameter("sid");
		String diamond=request.getParameter("diamond");
		WgPlayerserver wg=PlayerManager.getInstance().getplayer(getid);
		if(wg!=null && (diamond!=null || !diamond.equals(""))){
			//wg.setDiamond(wg.getDiamond()+Integer.valueOf(diamond));
			//第一个1  钻石   第二个5标识 充值
			BillingCenter.playerIncrease(wg, Integer.valueOf(diamond), 1, 5)
			MailManager.getInstance().sendmail("系统的邮件", "充值成功", "成功充值"+diamond+"颗钻石", "", (long)-1, getid, 1,1);
			if()
			out.print("success");
		}else{
			out.print("用户不存在");
		}
		%>