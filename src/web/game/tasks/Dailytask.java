package web.game.tasks;

/*
 *  1.字段  id；不能重复；
	2.type（大分类）  0-成长之路   1-甜蜜约会   2-精彩剧情  3-不解之缘    4-女神衣柜
    3.tasktype（小分类）   例如1-赚取金币
	4.nextid  下一个id为多少；
	5.award    例如（1000069:1,1000070:2）
	6.count 数量
	7.first（线性第一个） 
 * */
public class Dailytask {
	private int id; 
	private int type;
	private int tasktype;
	private int nextid;
	private String reward;
	private int count;
	private int first;
	private String description;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getTasktype() {
		return tasktype;
	}
	public void setTasktype(int tasktype) {
		this.tasktype = tasktype;
	}
	public int getNextid() {
		return nextid;
	}
	public void setNextid(int nextid) {
		this.nextid = nextid;
	}
	
	public String getReward() {
		return reward;
	}
	public void setReward(String reward) {
		this.reward = reward;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


}
