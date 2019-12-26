package web.game.util;

import java.util.ArrayList;
import java.util.List;

public class Hefumessage {
	private String sid;
	private int start;
	private int end;
	private List<Integer> list=new ArrayList<Integer>();
	private int newsid;
	
	public int getNewsid() {
		return newsid;
	}

	public void setNewsid(int newsid) {
		this.newsid = newsid;
	}

	public List<Integer> getList() {
		return list;
	}

	public void setList(List<Integer> list) {
		this.list = list;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}
	
	

}
