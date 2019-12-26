package web.game.Bytes;

import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;

public class BytesCommon {
	
	public static ByteBuffer changebtyes(String s,int type) throws UnsupportedEncodingException{
	   //String s="nihao";
 	   byte dd[] = s.getBytes("UTF-8");//String转换为byte[]
 	  // int type=type;
 	   byte bb[]=BytesUtil.intToBytes(type);
 	   byte cc[] =BytesUtil.intToBytes(dd.length);
 	   byte aa[] = BytesUtil.intToBytes(bb.length+dd.length+cc.length);
 	   //System.out.println((bb.length+cc.length)+"---!!!---");
 	   byte[] sendlist=new byte[aa.length+bb.length+cc.length+dd.length];
 	   for (int i = 0; i < aa.length; i++) {
 		   sendlist[i]=aa[i];
 	   };
 	   for (int i = 0; i < bb.length; i++) {
 		   sendlist[i+aa.length]=bb[i];
 	   }
 	   for (int i = 0; i < cc.length; i++) {
 		   sendlist[i+aa.length+bb.length]=cc[i];
 	   }
 	   for (int i = 0; i < dd.length; i++) {
 		   sendlist[i+aa.length+bb.length+cc.length]=dd[i];
 	   }
 	   //System.out.println(sendlist);
 	   ByteBuffer sendbb= ByteBuffer.wrap(sendlist);
 	   return sendbb;
	}

}
