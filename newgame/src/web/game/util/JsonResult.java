package web.game.util;

import java.io.Serializable;
import java.util.Map;

/**
 * json 响应返回的数据
 */

@SuppressWarnings("all")
public class JsonResult<T> implements Serializable{

	/**
	 * 响应吗
	 */
	private int code;
	/**
	 * 响应消息
	 */
	private String msg;
	
	
	/**
	 * json 对象
	 */
	private T data;
	
	/**
	 * json数据map  额外数据
	 */

	private Map<String, Object> jsonMap;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}

	public void setJsonMap(Map<String, Object> jsonMap) {
		this.jsonMap = jsonMap;
	}

	public JsonResult() {
	}

	public JsonResult(String msg) {
		this.code=code;
	}
	
	public JsonResult(Integer code,String msg) {
		this.code=code;
		this.msg=msg;
	}
	
	

	public JsonResult(int code, String msg, T data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	
	
	
	
}

