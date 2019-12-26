package web.game.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import web.game.util.GameServerManager;
import web.game.util.MD5Util;
import web.game.util.SendgetManager;

import org.springframework.web.filter.OncePerRequestFilter;


/**
 * 
 * @author 还有谁 功能：登录过滤器 date:2017-11-5
 */
public class LoginFilter extends OncePerRequestFilter {
	public static String appid="webgamehougong#$%";
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.filter.OncePerRequestFilter#doFilterInternal(
	 * javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse, javax.servlet.FilterChain)
	 */
	public static boolean checklogin(HttpSession session){
		
		String username = (String) session.getAttribute("username");
		String passward = (String) session.getAttribute("passward");
		String newtoken = (String) session.getAttribute("newtoken");
		String userid = (String) session.getAttribute("userid");
		String realname = (String) session.getAttribute("realname");
		List<Messagepush> listone =  (List<Messagepush>) session.getAttribute("listone");
		List<Messagepush> listtwo = (List<Messagepush>) session.getAttribute("listtwo");
		List<Messagepush> listthree = (List<Messagepush>) session.getAttribute("listthree");
		if(username!=null && passward!=null && "success".equals(newtoken)){
			session.setAttribute("username", username);
			session.setAttribute("passward", passward);
			session.setAttribute("newtoken", "success");
			session.setAttribute("listone", listone);
			session.setAttribute("listtwo", listtwo);
			session.setAttribute("listthree", listthree);
			session.setAttribute("userid", userid);
			session.setAttribute("realname", realname);
			return true;
		}else{
			session.setAttribute("newtoken", "error");
			return false;
		}
	}
	
	
	
	
	public boolean login(String loginName, String loginPwd,HttpSession session) {
		if(loginName!=null && !"".equals(loginName)){
			GameServerManager servers=GameServerManager.getInstance();
			String weburl=servers.getWeburl();
			String url=weburl+"/Admin/checkAuthFromServer?username="+loginName+"&password="+loginPwd;
/*			if(Publicmain.getInstance().getWgMain().getIshefu()==1){
				String username1[]=loginName.split("_sid");
				url=weburl+"/Admin/checkAuthFromServer?username="+username1[0]+"&password="+loginPwd;
			}*/
			String getreturn=SendgetManager.SendGET(url);
			JSONObject json = JSONObject.fromObject(getreturn);  
			String status=json.getString("status");
			if(status.equals("success")){
				String manageid=json.getString("manageid");
				String managename=json.getString("managename");
				List<Messagepush> listone=new ArrayList<Messagepush>();
				List<Messagepush> listtwo=new ArrayList<Messagepush>();
				List<Messagepush> listthree=new ArrayList<Messagepush>();
				JSONArray jsonArray = JSONArray.fromObject(json.getString("role"));  
		         for (int i = 0; i < jsonArray.size(); i++) {  
		        	 Messagepush messagepush=new Messagepush();
		        	 messagepush.setContent(jsonArray.getJSONObject(i).getString("title"));
		        	 int type=jsonArray.getJSONObject(i).getInt("type");
		        	 int type1=jsonArray.getJSONObject(i).getInt("type1");
		        	 messagepush.setType(type);
		        	 messagepush.setUrl(jsonArray.getJSONObject(i).getString("url"));
		        	 messagepush.setType1(type1);
		        	 messagepush.setUrl1(jsonArray.getJSONObject(i).getString("url1"));
		        	 
		        	 if(type<99){
		        		 //1级目录
		        		 listone.add(messagepush);
		        	 }else if(type<9999){
		 	        	 //2级目录
		        		 listtwo.add(messagepush);
		        	 }else{
		        		 //3级目录
		        		 listthree.add(messagepush);
		        	 }
		        }
				session.setAttribute("username", loginName);
				session.setAttribute("passward", loginPwd);
				session.setAttribute("newtoken", "success");
				//权限
				session.setAttribute("listone", listone);
				session.setAttribute("listtwo", listtwo);
				session.setAttribute("listthree", listthree);
				
				session.setAttribute("userid", manageid);
				session.setAttribute("realname", managename);
				return true;
			}else{
				session.setAttribute("newtoken", "error");
				return false;
			}
		}else{
			return LoginFilter.checklogin(session);
		}
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		String loginName = request.getParameter("loginName");
		String loginPwd = request.getParameter("loginPwd");
		String url = request.getRequestURL().toString();
		String queryString = request.getQueryString();
		//System.out.println(uri+"---"+loginName+"--"+loginPwd);
		//System.out.println(url + "?" + queryString);
		/**
		 * 登录非首页 1.拦截 登录页面 不拦截
		 * 
		 * 登录首页 不拦截
		 * 
		 */
		if (uri.indexOf(".jsp") != -1) {
			// 登录首页放行
			if (uri.indexOf("index.jsp") != -1 || uri.indexOf("publicupdate") != -1) {
				filterChain.doFilter(request, response);
				return;
			} else {
				//免密登录
				//增加钻石
				if(uri.indexOf("diamond.jsp") != -1){
					String token = request.getParameter("token");
					String diamond = request.getParameter("diamond");
					String username = request.getParameter("username");
					String sid = request.getParameter("sid");
					String md5pwd=MD5Util.md5Jdk(diamond+sid+username+appid);
					if(md5pwd.equalsIgnoreCase(token)){
						filterChain.doFilter(request, response);
						return;
					}else{
						response.sendRedirect("../index.jsp");
						return;
					}
				}
				//发送礼包
				if(uri.indexOf("gift.jsp") != -1){
					String token = request.getParameter("token");
					String type = request.getParameter("type");
					String username = request.getParameter("username");
					String sid = request.getParameter("sid");
					String md5pwdstr=MD5Util.md5Jdk(type+sid+username+appid);
					if(md5pwdstr.equals(token)){
						filterChain.doFilter(request, response);
						return;
					}
					response.sendRedirect("../index.jsp");
					return;
				}
				//基金礼包；
				if(uri.indexOf("jijin.jsp") != -1){
					String token = request.getParameter("token");
					String type = request.getParameter("type");
					String username = request.getParameter("username");
					String sid = request.getParameter("sid");
					String md5pwdstr=MD5Util.md5Jdk(type+sid+username+appid);
					if(md5pwdstr.equals(token)){
						filterChain.doFilter(request, response);
						return;
					}
					response.sendRedirect("../index.jsp");
					return;
				}
				
				//特价礼包
				if(uri.indexOf("discount.jsp") != -1){
					String token = request.getParameter("token");
					String type = request.getParameter("type");
					String username = request.getParameter("username");
					String sid = request.getParameter("sid");
					String md5pwdstr=MD5Util.md5Jdk(type+sid+username+appid);
					if(md5pwdstr.equals(token)){
						filterChain.doFilter(request, response);
						return;
					}
					response.sendRedirect("../index.jsp");
					return;
				}
				//月卡
				if(uri.indexOf("mouthcard.jsp") != -1){
					String token = request.getParameter("token");
					String username = request.getParameter("username");
					String sid = request.getParameter("sid");
					String md5pwdstr=MD5Util.md5Jdk(sid+username+appid);
					if(md5pwdstr.equals(token)){
						filterChain.doFilter(request, response);
						return;
					}
					response.sendRedirect("../index.jsp");
					return;
				}
				//周卡
				if(uri.indexOf("weeklycard.jsp") != -1){
					String token = request.getParameter("token");
					String username = request.getParameter("username");
					String sid = request.getParameter("sid");
					String md5pwdstr=MD5Util.md5Jdk(sid+username+appid);
					if(md5pwdstr.equals(token)){
						filterChain.doFilter(request, response);
						return;
					}
					response.sendRedirect("../index.jsp");
					return;
				}
				
				//季卡
				if(uri.indexOf("jika.jsp") != -1){
					String token = request.getParameter("token");
					String username = request.getParameter("username");
					String sid = request.getParameter("sid");
					String md5pwdstr=MD5Util.md5Jdk(sid+username+appid);
					if(md5pwdstr.equals(token)){
						filterChain.doFilter(request, response);
						return;
					}
					response.sendRedirect("../index.jsp");
					return;
				}
				//聚宝钱庄
				if(uri.indexOf("bankdiamond.jsp") != -1){
					String token = request.getParameter("token");
					String diamond = request.getParameter("diamond");
					String username = request.getParameter("username");
					String sid = request.getParameter("sid");
					String md5pwd=MD5Util.md5Jdk(diamond+sid+username+appid);
					if(md5pwd.equalsIgnoreCase(token)){
						filterChain.doFilter(request, response);
						return;
					}else{
						response.sendRedirect("../index.jsp");
						return;
					}
				}
				//一元夺宝
				if(uri.indexOf("oneyuan.jsp") != -1){
					String token = request.getParameter("token");
					String type = request.getParameter("type");
					String username = request.getParameter("username");
					String sid = request.getParameter("sid");
					String md5pwd=MD5Util.md5Jdk(type+sid+username+appid);
					if(md5pwd.equalsIgnoreCase(token)){
						filterChain.doFilter(request, response);
						return;
					}else{
						response.sendRedirect("../index.jsp");
						return;
					}
				}
				// 1.查询有账号密码放行 2.有session放行
					if (this.login(loginName, loginPwd,session)) {
						filterChain.doFilter(request, response);
						return;
					} else {
						if(loginName == null || "".equals(loginName)){
							response.getWriter().write("<script>window.top.location.href='../index.jsp'</script>");
						}else{
							response.sendRedirect("../index.jsp?error=1");
						}
						return;
					}
			}
		}
	}
}