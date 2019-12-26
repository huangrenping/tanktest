package web.game.util;

import java.util.Map;

public class JsonResultUtilgame {

	
	public static final String SUCCESS = "success";
	public static final String ERROR = "error";
	public static final int SUCCESS_CODE= 200;
	public static final int ERROR_CODE = 500;
	public static final int STATUSSUCCESS=0;
	public static final int STATUSERROR=1;
	public static final int NOERROR=-1;
	
	/*****************************
	 * 
	 * @param msg 响应消息
	 * @param data 响应数据
	 * @return
	 * 按照自定义消息返回正确逻辑的Result
	 */	
	
	public static <T> JsonResultgame<T> result( T data,String info,int status,int eventId) {
		JsonResultgame<T> result = new JsonResultgame<>(eventId,status,info,data);
		return result;
	}
	
	public static <T> JsonResultgame<T> result( T data,String info,int status,int eventId,Map<String,Object> message) {
		JsonResultgame<T> result = new JsonResultgame<>(eventId,status,info,data,message);
		return result;
	}
	
	
	
	/**
	 * 
	 * @param status响应状态
	 * @param info响应消息
	 * @param data  json数据
	 * @return
	 */
	public static <T> JsonResultgame<T> toJson(int status, String info, T data,int eventId) {
		JsonResultgame<T> result = new JsonResultgame<>(eventId,status, info, data);
		return result;
	}
	
	
	

}
