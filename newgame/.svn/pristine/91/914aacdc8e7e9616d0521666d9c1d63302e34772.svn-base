package web.game.controller;

import static org.springframework.web.bind.ServletRequestUtils.getStringParameter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuanzhi.tools.text.ParamUtils;

import web.game.player.PlayerController;
import web.game.player.PlayerManager;
import web.game.pojo.WgPlayer;
import web.game.tasks.TasksController;
import web.game.util.JacksonManager;
import web.game.util.JsonResultUtilgame;
import web.game.util.JsonResultUtilnew;
import web.game.util.JsonResultgame;
import web.game.util.JsonResultnew;

//http://localhost:8080/newgame/Common/http.do
//@CrossOrigin(origins = "*",methods = {RequestMethod.GET,RequestMethod.POST,RequestMethod.DELETE,RequestMethod.PUT})
@Controller
@CrossOrigin(origins = "*",methods = {RequestMethod.GET,RequestMethod.POST,RequestMethod.DELETE,RequestMethod.PUT})
public class CommonController {
	
	@Autowired
	private PlayerController playerController;
	@Autowired
	private TasksController tasksController;
	

	@RequestMapping("/http.do")
	@ResponseBody
	public JsonResultgame<Map<String,Object>> httpindex(HttpServletRequest request, HttpSession session,
			HttpServletResponse response){
//		response.setHeader("Content-type", "text/html;charset=utf-8");
//		response.addHeader("Access-Control-Allow-Origin", "*");
//		response.addHeader("Access-Control-Allow-Methods",
//				"GET, POST, PUT, DELETE, OPTIONS");
//		response.addHeader("Access-Control-Allow-Headers",
//				"origin, content-type, accept, x-requested-with, sid, mycustom, smuser");
//		response.addHeader("Access-Control-Max-Age", "1800");// 30 min
//		System.out.println(request.getParameter("token"));
		
		Map<String,Object> map=new HashMap<String,Object>();
		int eventID=ParamUtils.getIntParameter(request, "eventID", 0);
		String token = getStringParameter(request, "token", "");
		String userdata = getStringParameter(request, "data", "");
		//System.out.println("userdata+-----"+userdata);
		map.put("eventID", eventID);
		if(eventID==0){
			return JsonResultUtilgame.result(map,"",-100,eventID);
		}
		if(PlayerManager.getInstance().getWgmain().getOpen()==0){
			return JsonResultUtilgame.result(map,"",-102,eventID);
		}
		
		map.put("token", token);
		int eventid=eventID/10000; //10000
		int type=eventID%10000;
		long playerid=-1;
		long time=System.currentTimeMillis();
		if(eventid==1 &&  type==1){
			String channel = getStringParameter(request, "channel", "");
			String username = getStringParameter(request, "username", "");
			WgPlayer wgPlayer=PlayerManager.getInstance().checktoken(token,username);//验证token；
			if(wgPlayer==null){
				return JsonResultUtilgame.result(map,PlayerManager.content(1),-100,eventID);
			}else{
				playerid=wgPlayer.getServeruid();
				wgPlayer.setLastlogintime(time);
				if(wgPlayer.getChannel()==null || !wgPlayer.getChannel().equals(channel)){
					wgPlayer.setChannel(channel);
					wgPlayer.setDirty(true);
				}
			}
		}else{
			WgPlayer wgPlayer=PlayerManager.getInstance().checktoken2(token);//验证token；
			if(wgPlayer==null){
				return JsonResultUtilgame.result(map,PlayerManager.content(1),-101,eventID);
			}else{
				playerid=wgPlayer.getServeruid();
			}
			wgPlayer.setLastlogintime(time);
		}
		if(eventid==1){
			return playerController.httpSend(type,playerid,eventID,userdata);
		}else if(eventid==2){
			return tasksController.httpSend(type,playerid,eventID,userdata);
		}
		return JsonResultUtilgame.result(map,PlayerManager.content(1),-101,eventID);
	}
	
	
	
	@RequestMapping("/index")
	@ResponseBody
	public JsonResultnew<Map<String,Object>> index(HttpServletRequest request, HttpSession session,
			HttpServletResponse response){
		//String playName = ParamUtils.getParameter(request, "playName","");//用户名
		//long unionId=ParamUtils.getLongParameter(request, "unionId", 0);
		String id=request.getParameter("id");
		
		String serverType = getStringParameter(request, "serverType", "");//处理类型
		String eventID =  getStringParameter(request, "eventID", "0");
		
		int type=ParamUtils.getIntParameter(request, "type", 0);
		//request.get
		System.out.println(request+"--"+session+"--"+response);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("type", type);
		map.put("serverType", serverType);
		map.put("eventID", eventID);
		map.put("error", 0);
		return JsonResultUtilnew.success(map);
	}

	
	
	
	
	
	
	
	
	
	
}
