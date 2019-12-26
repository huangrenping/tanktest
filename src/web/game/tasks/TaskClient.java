package web.game.tasks;

public class TaskClient {
	private int id;
	private String name;
	private int num;
	private int wgnum;//玩家已完成的数量
	private int isreceive;//是否领取
	private String reward;//奖励
	private int add;//增加活跃度
	private int adddiamond;
	private int addgold;
	private int addexperience;
	private String factory;
	private String args;
	private String description;
	private int paixu;
	public int getPaixu() {
		return paixu;
	}
	public void setPaixu(int paixu) {
		this.paixu = paixu;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getIsreceive() {
		return isreceive;
	}
	public void setIsreceive(int isreceive) {
		this.isreceive = isreceive;
	}
	public int getWgnum() {
		return wgnum;
	}
	public void setWgnum(int wgnum) {
		this.wgnum = wgnum;
	}
	public String getFactory() {
		return factory;
	}
	public void setFactory(String factory) {
		this.factory = factory;
	}
	public String getArgs() {
		return args;
	}
	public void setArgs(String args) {
		this.args = args;
	}
	public int getAdddiamond() {
		return adddiamond;
	}
	public void setAdddiamond(int adddiamond) {
		this.adddiamond = adddiamond;
	}
	public int getAddgold() {
		return addgold;
	}
	public void setAddgold(int addgold) {
		this.addgold = addgold;
	}
	public int getAddexperience() {
		return addexperience;
	}
	public void setAddexperience(int addexperience) {
		this.addexperience = addexperience;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getReward() {
		return reward;
	}
	public void setReward(String reward) {
		this.reward = reward;
	}
	public int getAdd() {
		return add;
	}
	public void setAdd(int add) {
		this.add = add;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}

