package web.game.tank;

public class Tank {
	//<tank id="1001" level="1" name="1级坦克" articleid="1000101" tankskinid="1001" produce="1" attack="50" hp="20" range="700" attackspeed="1000" bullettype="1" price="20" plusprice="8" price1="4" plusprice1="1" />
	private int id;
	private int level;
	private String name;
	private int articleid;
	private int tankskinid;
	private String produce;
	private String attack;
	private String hp;
	private int range;
	private int attackspeed;
	private int bullettype;
	private String price;
	private String plusprice;
	private int price1;
	private int plusprice1;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getArticleid() {
		return articleid;
	}
	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}
	public int getTankskinid() {
		return tankskinid;
	}
	public void setTankskinid(int tankskinid) {
		this.tankskinid = tankskinid;
	}
	public String getProduce() {
		return produce;
	}
	public void setProduce(String produce) {
		this.produce = produce;
	}
	public String getAttack() {
		return attack;
	}
	public void setAttack(String attack) {
		this.attack = attack;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public int getAttackspeed() {
		return attackspeed;
	}
	public void setAttackspeed(int attackspeed) {
		this.attackspeed = attackspeed;
	}
	public int getBullettype() {
		return bullettype;
	}
	public void setBullettype(int bullettype) {
		this.bullettype = bullettype;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPlusprice() {
		return plusprice;
	}
	public void setPlusprice(String plusprice) {
		this.plusprice = plusprice;
	}
	public int getPrice1() {
		return price1;
	}
	public void setPrice1(int price1) {
		this.price1 = price1;
	}
	public int getPlusprice1() {
		return plusprice1;
	}
	public void setPlusprice1(int plusprice1) {
		this.plusprice1 = plusprice1;
	}
	
	
}
