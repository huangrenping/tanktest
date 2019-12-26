package web.game.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * json 响应返回的数据
 */

@SuppressWarnings("all")
public class JsonResultgame<T> implements Serializable{

	private int eventID;
	
	private long time;
	/**
	 * 响应吗
	 */
	private int status;
	/**
	 * 响应消息
	 */
	private String info;
	
	
	/**
	 * json 对象
	 */
	private T data;
	
	public long getTime() {
		return time;
	}


	public void setTime(long time) {
		this.time = time;
	}

	private Map<String,Object> message=new HashMap<String, Object>();


//	public Map<String, Object> getMessage() {
//		return message;
//	}
//
//
//	public void setMessage(Map<String, Object> message) {
//		this.message = message;
//	}


	public int getEventID() {
		return eventID;
	}


	public void setEventID(int eventID) {
		this.eventID = eventID;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}


	public T getData() {
		return data;
	}


	public void setData(T data) {
		this.data = data;
	}


	public JsonResultgame(int eventID, int status, String info, T data) {
		this.time=System.currentTimeMillis();
		this.eventID = eventID;
		this.status = status;
		this.info = info;
		this.data = data;
	}
	
	public JsonResultgame(int eventID, int status, String info, T data,Map<String,Object> message) {
		if(message==null){
			this.message=new HashMap<String, Object>(); 
			this.message.put("eventID",10100);
		}
		this.time=System.currentTimeMillis();
		this.eventID = eventID;
		this.status = status;
		this.info = info;
		this.data = data;
	}
	
	
	
}

