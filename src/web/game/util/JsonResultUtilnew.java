package web.game.util;

public class JsonResultUtilnew {

	
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
	public static <T> JsonResultnew<T> success(String msg, T data,int status) {
		JsonResultnew<T> result = new JsonResultnew<>(status, msg, data);
		return result;
	}
	
	public static <T> JsonResultnew<T> success( T data) {
		JsonResultnew<T> result = new JsonResultnew<>(STATUSSUCCESS, SUCCESS, data);
		return result;
	}
	
	public static <T> JsonResultnew<T> error( T data) {
		JsonResultnew<T> result = new JsonResultnew<>(NOERROR, ERROR, data);
		return result;
	}
	
	public static <T> JsonResultnew<T> error( T data,int status) {
		JsonResultnew<T> result = new JsonResultnew<>(status, ERROR, data);
		return result;
	}
	
	public static <T> JsonResultnew<T> error( T data,String info,int status) {
		JsonResultnew<T> result = new JsonResultnew<>(status, info, data);
		return result;
	}
	
	public static <T> JsonResultnew<T> result( T data,String info,int status) {
		JsonResultnew<T> result = new JsonResultnew<>(status, info, data);
		return result;
	}
	
	
	
	/**
	 * 
	 * @param status响应状态
	 * @param info响应消息
	 * @param data  json数据
	 * @return
	 */
	public static <T> JsonResultnew<T> toJson(int status, String info, T data) {
		JsonResultnew<T> result = new JsonResultnew<>(status, info, data);
		return result;
	}
	
	
	

}
