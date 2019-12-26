package web.game.common;

import java.util.Date;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.xuanzhi.tools.text.DateUtil;

import web.game.language.Translate;


public class ContextLoadFinishedListener implements ServletContextListener{
	private static boolean loadFinished;
	public static boolean isLoadFinished() {
		return loadFinished;
	}

	public static void setLoadFinished(boolean loadFinished) {
		ContextLoadFinishedListener.loadFinished = loadFinished;
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		String time = DateUtil.formatDate(new Date(), Translate.time_1);
		System.out.println("===================================================================================");
		System.out.println(" 系统于" + time + "开始销毁! ");
		System.out.println("===================================================================================");
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		loadFinished = true;
		String time = DateUtil.formatDate(new Date(), Translate.time_1);
		System.out.println("===================================================================================");
		System.out.println(" 系统于" + time + "加载完成! ");
		System.out.println("===================================================================================");
		
	}

}
