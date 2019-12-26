package web.game.controller;

import static org.springframework.web.bind.ServletRequestUtils.getStringParameter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuanzhi.tools.text.ParamUtils;

import web.game.player.PlayerManager;
import web.game.pojo.WgPlayer;
import web.game.util.JsonResultUtilnew;
import web.game.util.JsonResultnew;

@Controller
@RequestMapping("/http.do")
public class CommonBaseController{
	@RequestMapping("/index")
	@ResponseBody
	public JsonResultnew<Map<String,Object>> httpindex(HttpServletRequest request, HttpSession session,
			HttpServletResponse response){
		response.setHeader("Content-type", "text/html;charset=utf-8");
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Methods",
				"GET, POST, PUT, DELETE, OPTIONS");
		response.addHeader("Access-Control-Allow-Headers",
				"origin, content-type, accept, x-requested-with, sid, mycustom, smuser");
		response.addHeader("Access-Control-Max-Age", "1800");// 30 min
		String token = getStringParameter(request, "token", "");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("token", token);
		return JsonResultUtilnew.success(map);
	}

}
