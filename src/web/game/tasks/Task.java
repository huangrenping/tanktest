package web.game.tasks;

public class Task {
	private int id;
	private String name;
	private int num;//需要完成的数量
	private String reward;//奖励
	private int add;//增加活跃度
	private int addexperience;
	private String description;
	private String factory;
	private String args;
	private int toid;
	private int paixu;
	public int getPaixu() {
		return paixu;
	}
	public void setPaixu(int paixu) {
		this.paixu = paixu;
	}
	public int getToid() {
		return toid;
	}
	public void setToid(int toid) {
		this.toid = toid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
