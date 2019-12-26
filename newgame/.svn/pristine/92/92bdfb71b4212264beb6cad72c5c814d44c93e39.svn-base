package web.game.language;

import java.lang.reflect.Field;

public class CommonTranslate {
	public static CommonTranslate self;
	public static CommonTranslate getInstance;
	
	public void init(){
		
	}
	
	public static String String_1="error";
	
	
	
	public static String Translate(String id){
		String s=null;
		Translate1 st=new Translate1();
		try {
			Field f=st.getClass().getDeclaredField(id);
			s=(String) f.get(st);
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return s;
	}
	public static void main(String[] args) {
		System.out.println(CommonTranslate.Translate(CommonTranslate.String_1));
		
	}
	
	

}
