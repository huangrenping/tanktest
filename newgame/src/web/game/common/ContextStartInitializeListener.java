package web.game.common;

import java.util.Date;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.xuanzhi.tools.text.DateUtil;

import web.game.language.Translate;


public class ContextStartInitializeListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent event) {
		//ObjectTrackerService.config(System.getProperty("user.dir") + "/objectTrackerService.ddc", 30, "com.xuanzhi.sanguo.common.Game", null);
		String time = DateUtil.formatDate(new Date(), Translate.time_1);
		System.out.println("===================================================================================");
		System.out.println(" 系统于" + time + "开始启动! ");
		System.out.println("===================================================================================");
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		String time = DateUtil.formatDate(new Date(), Translate.time_1);
		System.out.println("===================================================================================");
		System.out.println(" 系统于" + time + "安全关闭! ");
		System.out.println("===================================================================================");
	}

}
