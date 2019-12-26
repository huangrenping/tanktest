package web.game.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UseradminController {
	
	/**
	 * @背包里显示列表；
	 */
	@RequestMapping("/admin/knapsack")
	public String userindex(){
		return "adm/index";	
	}

}
