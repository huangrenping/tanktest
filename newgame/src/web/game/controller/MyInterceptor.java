package web.game.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import web.game.common.LoginFilter;
import web.game.common.Messagepush;
import web.game.util.GameServerManager;
import web.game.util.SendgetManager;

public class MyInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		//System.out.println("aaaa1");
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		//System.out.println("aaaa2");
		
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		//System.out.println("aaaa3");
		boolean islogin= LoginFilter.checklogin(arg0.getSession());
		if(islogin==false){
			//arg1.sendRedirect("/adm/index.jsp");
			//System.out.println(System.getProperty("user.dir"));
			arg0.getRequestDispatcher("/adm/systeminfo/error.jsp").forward(arg0, arg1);
			//arg1.sendRedirect("/adm/index.jsp");
		}
		return islogin;
	}
}
