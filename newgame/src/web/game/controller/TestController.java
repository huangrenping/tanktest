package web.game.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController{
	
	@RequestMapping(value = "/testuser/info", method = RequestMethod.GET)
	@ResponseBody
	public String userindex(){
		System.out.println("2222222");
		return "adm/index";	
	}
	
	//http://192.168.0.199:8080/newgame/testuser/test
	@RequestMapping(value = "/testuser/test", method = RequestMethod.GET)
	@ResponseBody
	public String test(){
		return "helloworld";
	}

}
