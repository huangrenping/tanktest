package web.game.util;

import java.io.Serializable;

/**
 * json 响应返回的数据 status info data
 */
public class JsonNewResult<T> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 响应码
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


	public JsonNewResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JsonNewResult(int status, String info, T data) {
		super();
		this.status = status;
		this.info = info;
		this.data = data;
	}
	

}
