package web.game.util;

public class GameServerManager {
	public static GameServerManager self;
	public static GameServerManager getInstance(){
		return self;
	}
	private int serverid;
	private String servername;
	private String weburl;
	private String weburl2;
	
	private String sqlurl;
	private String user;
	private String password;
	private String driver;
	
	private String  system;
	
	private int systemtype;
	
	
	public int getSystemtype() {
		return systemtype;
	}

	public void setSystemtype(int systemtype) {
		this.systemtype = systemtype;
	}

	public String getSystem() {
		return system;
	}

	public void setSystem(String system) {
		this.system = system;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getSqlurl() {
		return sqlurl;
	}

	public void setSqlurl(String sqlurl) {
		this.sqlurl = sqlurl;
	}

	public String getWeburl2() {
		return weburl2;
	}

	public void setWeburl2(String weburl2) {
		this.weburl2 = weburl2;
	}

	public String getWeburl() {
		return weburl;
	}

	public void setWeburl(String weburl) {
		this.weburl = weburl;
	}

	public int getServerid() {
		return serverid;
	}

	public void setServerid(int serverid) {
		this.serverid = serverid;
	}

	public String getServername() {
		return servername;
	}

	public void setServername(String servername) {
		this.servername = servername;
	}

	public void init(){
		self = this;
		system=System.getProperty("os.name");
		
		if(system.contains("Linux")){
			systemtype=1;
		}else{
			systemtype=0;
		}
		
		long start = System.currentTimeMillis();
		System.out.println("[GameServer初始化完成][服务器ID->"+serverid+"]["
			+ (System.currentTimeMillis() - start) + "ms]");
	}
	public void destroy(){
		
	}
	
	
	
	
	
	
	
	
	
	

}
