<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.mail.MailManager,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.article.Knapsack,
    web.webSocket.util.BillingCenter,
    web.webSocket.message.Messagepush,
    web.webSocket.article.Article,
    web.webSocket.article.ArticleManager,
    web.webSocket.article.ArticleClient,
    web.webSocket.pojo.WgKnapsack,
    web.webSocket.article.logic.impl.ArticleLogicImpl"%>
<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String mytext=request.getParameter("mytext");
	String username=request.getParameter("username");
	String type=request.getParameter("type");
	String key=request.getParameter("key");
	if(key!=null && key.equals(PlayerManager.publickey)){
		if(title!=null && content!=null && username!=null){
		PlayerManager playerManager=PlayerManager.getInstance();
		Long getid=PlayerManager.getInstance().getplayerid(username);
	 	if(getid==null){
	 		out.println("error");
	 		return ;
	 	}
	 	if("dati".equals(type)){
	 		WgPlayerserver wgPlayerserver=PlayerManager.getInstance().getplayer(getid);
	 		wgPlayerserver.getWgPlayerserver3().setCanyuaward(1);
	 	}
	 	MailManager.getInstance().sendmail("系统邮件", title, content, mytext, (long)-1, getid , 1,1);
	 	out.println("success");
		return ;
	}
	}else{
		out.println("error1");
	 	return ;
	}

	
 %>