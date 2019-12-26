package web.game.common;

public class Messagepush {
	private String content;
	private int type;
	private String url;
	private int type1;
	private String url1;

	
	public int getType1() {
		return type1;
	}

	public void setType1(int type1) {
		this.type1 = type1;
	}

	public String getUrl1() {
		return url1;
	}

	public void setUrl1(String url1) {
		this.url1 = url1;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	public Messagepush(){
	}

	public Messagepush(String content,String url,int type){
		this.content=content;
		this.url=url;
		this.type=type;
	}

}
