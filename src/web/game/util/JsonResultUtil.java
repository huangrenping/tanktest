package web.game.util;


public class JsonResultUtil {

	
	public static final String SUCCESS = "success";
	public static final String ERROR = "error";
	public static final int SUCCESS_CODE= 200;
	public static final int ERROR_CODE = 500;
	
	
	/*****************************
	 * 
	 * @param msg 响应消息
	 * @param data 响应数据
	 * @return
	 * 按照自定义消息返回正确逻辑的Result
	 */
	public static <T> JsonResult<T> success(String msg, T data) {
		JsonResult<T> result = new JsonResult<>(SUCCESS_CODE, msg, data);
		return result;
	}
	
	public static <T> JsonResult<T> success( T data) {
		JsonResult<T> result = new JsonResult<>(SUCCESS_CODE, SUCCESS, data);
		return result;
	}
	
	public static <T> JsonResult<T> error(String msg, T data) {
		JsonResult<T> result = new JsonResult<>(ERROR_CODE, msg, data);
		return result;
	}
	
	/**
	 * 
	 * @param status响应状态
	 * @param info响应消息
	 * @param data  json数据
	 * @return
	 */
	public static <T> JsonNewResult<T> toJson(int status, String info, T data) {
		JsonNewResult<T> result = new JsonNewResult<>(status, info, data);
		return result;
	}
	
	
	

}
