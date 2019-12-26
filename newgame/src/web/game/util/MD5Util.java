package web.game.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;



import org.junit.Test;
import org.springframework.stereotype.Repository;

@Repository
public class MD5Util
{
	private static String hougongkey="6QVHWKOX99aznNEq";
    public static String converByteToHexString(byte[] bytes){
    	String result="";
    	for(int i=0;i<bytes.length;i++){
    		int temp=bytes[i] & 0xff;
    		String tempHex=Integer.toHexString(temp);
    		if(tempHex.length()<2){
    			result+="0"+tempHex;
    		}else{
    			result+=tempHex;
    		}
    	}
		return result;
    }
    public static String md5Jdk(String msg){
    	String temp="";
    	try {
			MessageDigest md5Digest=MessageDigest.getInstance("MD5");
			byte[] encodeMd5Digest=md5Digest.digest(msg.getBytes());
			temp=converByteToHexString(encodeMd5Digest);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;
    }
    //用户jsp调控登录与发言
    public static String getmd5(String serveruid,int action){
    	String password=md5Jdk(serveruid+action+hougongkey);
    	//System.out.println("password="+password);
    	return password;
    }
    @Test
    public void test(){
		String a=md5Jdk("youxiqunyxq");
    	String b=md5Jdk(a+"SnyjFA");
    	System.out.println(b);
    	//System.out.println(b);
    	//90603c4f26ae658c4ca268bc945ab392
    }
}
