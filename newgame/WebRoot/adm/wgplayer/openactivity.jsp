<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="web.webSocket.player.PlayerManager,
    java.util.*,
    web.webSocket.pojo.WgPlayerserver,
    web.webSocket.message.Messagepush,
    web.webSocket.pojo.WgPlayerserver2"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">   
      <%
      	//2018/6/12 用于开启玩家功能
      	/* List<Messagepush> listtwo=(List<Messagepush>)session.getAttribute("listtwo");
	 	int num=0;
	 	//检查账号是否有该权限
	 	if(listtwo!=null && listtwo.size()>0){
	 		for(Messagepush messagepush:listtwo){
				if(messagepush.getType()==203){
					num++;
					break;
				}
			}
	 	}
		if(num<1){
			response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
			return ;
		} */
	
 		Collection<WgPlayerserver> wgplaylist=PlayerManager.getInstance().getIdplayermap().values();
		List<WgPlayerserver> wglist=new ArrayList<WgPlayerserver>();
		wglist.addAll(wgplaylist);
		for (int i = 0; i < wglist.size(); i++) {
			WgPlayerserver wg=wglist.get(i);
			String open=wg.getWgPlayerserver2().getOpen();
			if(open!=null && !open.equals("")){
				String[] openstr=open.split(",");
				List<String> list = Arrays.asList(openstr);
				if(list.contains("10")){
					continue;
				}else{
					wg.getWgPlayerserver2().setOpen(open+",10");
					wg.getWgPlayerserver2().setDirty(true);
					/* String maxcheckpoint=wg.getWgPlayerserver2().getMaxcheckpoint2();
					if(maxcheckpoint!=null && !maxcheckpoint.equals("")){
						String[] seciton=maxcheckpoint.split(":");
						if(seciton!=null && Integer.valueOf(seciton[1])>=16){
							wg.getWgPlayerserver2().setOpen(open+",10");
							wg.getWgPlayerserver2().setDirty(true);
						}
					} */
				}
			}	
		}
      %>
<html>
	<body bgcolor="white">
		同步成功！
	</body>
</html>