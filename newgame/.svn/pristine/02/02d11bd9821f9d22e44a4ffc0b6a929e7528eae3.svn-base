package web.game.util;

import java.io.Serializable;
import java.util.Map;

/**
 * json 响应返回的数据
 */

@SuppressWarnings("all")
public class JsonResultnew<T> implements Serializable{

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

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
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

	public JsonResultnew() {
	}

	public JsonResultnew(int status) {
		super();
		this.status = status;
	}

	public JsonResultnew(int status, String info) {
		super();
		this.status = status;
		this.info = info;
	}

	public JsonResultnew(int status, String info, T data) {
		super();
		this.status = status;
		this.info = info;
		this.data = data;
	}
	
	
	
	
	
	
	
	
}

