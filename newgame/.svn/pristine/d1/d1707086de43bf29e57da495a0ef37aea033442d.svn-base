package web.game.common;


public class Game2 implements Runnable{
	public static Game2 self;
	public static Game2 getInstance(){
		return self;
	}
	public Thread thread = null;
	
	public void init(){
		thread = new Thread(this,"Game");
		thread.start();
		self = this;
		System.out.println("[系统初始化] [游戏主心跳] ["+this.getClass().getName()+"] [初始化成功]");
	}
	
	
	@Override
	public void run() {

	}

}
