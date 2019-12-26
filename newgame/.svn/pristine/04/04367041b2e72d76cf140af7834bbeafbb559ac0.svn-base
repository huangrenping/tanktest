<%@page import="web.webSocket.article.ArticleManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    net.sf.json.JSONArray,
    web.webSocket.util.MD5Util,
    net.sf.json.JsonConfig,
	web.webSocket.util.JacksonManager,
	org.codehaus.jackson.node.ObjectNode,
	web.webSocket.util.Util,
	web.webSocket.activity.WgPlayerservernew,
	web.webSocket.common.Publicmain,
	web.webSocket.mail.MailManager,
	web.webSocket.player.PlayerManager,
	web.webSocket.lovetree.Lovetree,
	web.webSocket.pojo.WgLovetree,
	web.webSocket.login.LoginManager,
	web.webSocket.pojo.WgFeedback,
	web.webSocket.util.JacksonManager,
	org.codehaus.jackson.node.ObjectNode,
	web.webSocket.lovetree.Treefruit,
	web.webSocket.lovetree.LovetreeManager,
	web.webSocket.article.Article,
	web.webSocket.util.GameServerManager,
	web.webSocket.pojo.WgPlayerserver"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String type=request.getParameter("type");
String id=request.getParameter("id");
String serveruid=request.getParameter("serveruid");
String articleandnum=request.getParameter("articleandnum");
String mark=request.getParameter("mark");
String replypeople=request.getParameter("replypeople");
PlayerManager playerManager=PlayerManager.getInstance();
int result=playerManager.resultjspkey(type);
if("".equals(type)||type==null){
}else if(result==1){
			JacksonManager jm = JacksonManager.getInstance();
			ObjectNode json = jm.createObjectNode();
			String result2="";

         	
         	if(id==null || id.equals("")){
         		json.putPOJO("msg", "fail");
				json.putPOJO("status",2); 
		 		result2=jm.toJson(json);
		 		out.print(result2);
		 		return;
         	}
         	
         	System.out.println("id==="+id);
         	WgFeedback wgFeedback=new WgFeedback();
       		wgFeedback.setId(Integer.valueOf(id));
       		wgFeedback.setUid(Long.valueOf(serveruid));
       		WgFeedback wgFeedback2=LoginManager.getInstance().selectOne(wgFeedback);

		
			if(wgFeedback2!=null){
				//判断道具是否存在
				if(articleandnum!=null && !articleandnum.equals("")){
					String[] articleandnum2=articleandnum.split(",");
					ArticleManager articleManager=ArticleManager.getInstance();
					for(int i=0;i<articleandnum2.length;i++){
						String[] articleandnum3=articleandnum2[i].split(":");
						Article article=articleManager.getarticle(Integer.valueOf(articleandnum3[0]));
						if(article==null){
							json.putPOJO("msg", "fail");
							json.putPOJO("status",1); 
					 		result2=jm.toJson(json);
					 		out.print(result2);
						}
					}
				}
				if(mark==null || mark.equals("")){
						mark="";
				}
				if(wgFeedback2.getStatus()==0){
					if(articleandnum==null || articleandnum.equals("")){
						articleandnum="";
					}
					wgFeedback2.setAttachment(articleandnum);
					MailManager.getInstance().sendmail("GM的邮件", "反馈回复", mark, articleandnum, (long)-1, Long.valueOf(serveruid), 1,1);
				}else{
					MailManager.getInstance().sendmail("GM的邮件", "反馈回复", mark, "", (long)-1, Long.valueOf(serveruid), 1,1);
				}
				wgFeedback2.setAnswer(mark);
				wgFeedback2.setStatus(1);
				wgFeedback2.setAnswertime(System.currentTimeMillis());
				if(replypeople==null || replypeople.equals("")){
					replypeople="";
				}
				wgFeedback2.setReplypeople(replypeople);
				LoginManager.getInstance().updateOne(wgFeedback2);
			}
				json.putPOJO("msg", "success");
				json.putPOJO("status",0); 
		 		result2=jm.toJson(json);
		 		out.print(result2);
}	
%>