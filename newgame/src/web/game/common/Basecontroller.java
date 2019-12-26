package web.game.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public abstract class Basecontroller extends AbstractController{

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String agent = request.getHeader("USER-AGENT"); 
		response.setContentType("text/html;charset=UTF-8");   
		response.setHeader("Cache-Control","no-cache");
		String username=request.getParameter("username");
		
		
		
		
		
		
		
		
		
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	

}
