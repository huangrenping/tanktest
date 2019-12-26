package web.game.article;

public class Article {

	private int id;
	private String name;//物品名字
	private String iconName;//img
	private int articleType;//大类型
	private int subType;//小类型
	private String description;//备注说明：打开背包后的结果
	private int overlap;//最小重叠数
	private int overLapNum;//最大重叠数
	private int articleLevel;//物品等级
	private String add;//增加道具数量
	private String ids;//礼包打开兑换物品
	private int batch;//是否能批量使用
	private int secondid;//纸娃娃id
	private int type;
	private int sellnum;
	private String produce;//掉落关卡
	private int purchase;// 0掉落 1购买
	private String obtain;
	private int pinzhi;
	
	
	public int getPinzhi() {
		return pinzhi;
	}
	public void setPinzhi(int pinzhi) {
		this.pinzhi = pinzhi;
	}
	public String getObtain() {
		return obtain;
	}
	public void setObtain(String obtain) {
		this.obtain = obtain;
	}
	public int getPurchase() {
		return purchase;
	}
	public void setPurchase(int purchase) {
		this.purchase = purchase;
	}
	public String getProduce() {
		return produce;
	}
	public void setProduce(String produce) {
		this.produce = produce;
	}
	public int getSellnum() {
		return sellnum;
	}
	public void setSellnum(int sellnum) {
		this.sellnum = sellnum;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getSecondid() {
		return secondid;
	}
	public void setSecondid(int secondid) {
		this.secondid = secondid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIconName() {
		return iconName;
	}
	public void setIconName(String iconName) {
		this.iconName = iconName;
	}
	public int getArticleType() {
		return articleType;
	}
	public void setArticleType(int articleType) {
		this.articleType = articleType;
	}
	public int getSubType() {
		return subType;
	}
	public void setSubType(int subType) {
		this.subType = subType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getOverlap() {
		return overlap;
	}
	public void setOverlap(int overlap) {
		this.overlap = overlap;
	}
	public int getOverLapNum() {
		return overLapNum;
	}
	public void setOverLapNum(int overLapNum) {
		this.overLapNum = overLapNum;
	}
	public int getArticleLevel() {
		return articleLevel;
	}
	public void setArticleLevel(int articleLevel) {
		this.articleLevel = articleLevel;
	}
	
	public String getAdd() {
		return add;
	}
	public void setAdd(String add) {
		this.add = add;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public int getBatch() {
		return batch;
	}
	public void setBatch(int batch) {
		this.batch = batch;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", name=" + name + ", iconName="
				+ iconName + ", articleType=" + articleType + ", subType="
				+ subType + ", description=" + description + ", overlap="
				+ overlap + ", overLapNum=" + overLapNum + ", articleLevel="
				+ articleLevel + ", add=" + add + ", ids=" + ids + ", batch="
				+ batch + ", secondid=" + secondid + ", type=" + type
				+ ", sellnum=" + sellnum + ", produce=" + produce + "]";
	}
}
