package web.game.common.handler;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.codehaus.jackson.node.ObjectNode;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import web.game.Bytes.BytesCommon;
import web.game.Bytes.BytesReader;
import web.game.Bytes.BytesUtil;
import web.game.util.JacksonManager;

@Component
public class SystemWebSocketHandler implements WebSocketHandler {
    public SystemWebSocketHandler() {
    }
    private String server;
	
	public String getServer() {
		return server;
	}
	public void setServer(String server) {
		this.server = server;
	}
	public static SystemWebSocketHandler self;
	public static SystemWebSocketHandler getInstance(){
		return self;
	}
	public void init(){
		self=this;
		System.out.println("SystemWebSocketHandler------------------");
	}
	private Map<String,byte[]> sessionbytelist=new HashMap<String, byte[]>();
//	public  Set<WebSocketSession> WebSocketSessions=new HashSet<WebSocketSession>(); //不重复
	public List<WebSocketSession>  WebSocketSessions=new ArrayList<WebSocketSession>();
	
	public Map<String,WebSocketSession> sessionmap=new HashMap<String, WebSocketSession>();
	public Map<String,Long> idmap=new HashMap<String, Long>();
	public Map<String,Long> errormap=new HashMap<String, Long>();   //玩家异常在线检测；
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	//idmap.put(session.getId(), System.currentTimeMillis());
    	WebSocketSessions.add(session);
    	sessionmap.put(session.getId(), session);
    	System.out.println("当前在线人数-----"+WebSocketSessions.size()+"----"+session.getId());
        //System.out.println("connect to the websocket successss"+session.getId());
        //session.sendMessage(new TextMessage("websocket已连接 "+session.getId()));
    }
    int k = 0;
    @Override
    public  void  handleMessage(WebSocketSession wss, WebSocketMessage<?> wsm) throws Exception {
		
    	long nowtime=System.currentTimeMillis();
    	//两次指令超过3秒，连包的就干掉；
    	String wssid=wss.getId();
       errormap.put(wssid, nowtime);
       byte[] abytelist=sessionbytelist.get(wss.getId());
       ByteBuffer hb=(ByteBuffer) wsm.getPayload();
       if(abytelist!=null){
    	   byte[] dbytes=hb.array(); 
    	   byte[] ebytes=new byte[hb.limit()+abytelist.length];
    	   for (int i = 0; i < hb.limit()+abytelist.length; i++) {
    		   if(i<abytelist.length){
    			   ebytes[i]=abytelist[i]; 
    		   }else{
    			   ebytes[i]=dbytes[i-abytelist.length];
    		   }
    	   }
    	   hb= ByteBuffer.wrap(ebytes);
       }
       abytelist=null;
       byte[] abytes=null;
       while(true){
    	   abytes=new byte[4];
           if(hb.limit()-hb.position()>=4){
        	    hb.get(abytes, 0, 4);
               int a = BytesUtil.bytesToInt(abytes);//19
               if(hb.limit()-hb.position()>=a){
            	   byte[] bbytes=new byte[a];
            	   hb.get(bbytes, 0, a);
            	   BytesReader br=new BytesReader(bbytes); 
            	   int b =br.readInt();
           		   int eventid=b/10000; //10000
           		   int type=b%10000;
            	  // int b = BytesUtil.bytesToInt(bbytes); //10001
           		   //System.out.print(b+"----->");
               	//检查是否禁止玩家登陆
               
               	if( (eventid==1 && type==1) || (eventid==1 && type==15)){
               		//默认通过
               	}else{
               		int openserver=serverCheck(wss);
                   	if(openserver==1){
                   		return ;
                   	}	
               	}
           	    try {
           	   if(eventid==1){
          		   //写用户重新连接逻辑
          		   //玩家类；
          	   }
				} catch (Exception e) {
					e.printStackTrace();
				}
               }else{
            	   abytelist=new byte[hb.limit()-hb.position()+4];
            	   byte[] fbytes=hb.array(); 
            	   for (int i = 0; i < hb.limit(); i++) {
            		   if(i>=hb.position()-4){
            			   abytelist[i-hb.position()+4]=fbytes[i]; 
            		   }
    			   }
            	   break;
               } 
           }else if(hb.limit()-hb.position()>0){
        	   abytelist=new byte[hb.limit()-hb.position()];
        	   byte[] fbytes=hb.array(); 
        	   for (int i = 0; i < hb.limit(); i++) {
        		   if(i>=hb.position()){
        			   abytelist[i-hb.position()]=fbytes[i]; 
        		   }
			   }
        	   break;
           }else{
        	   break;
           }   
       }
       if(abytelist!=null){
    	   sessionbytelist.put(wss.getId(), abytelist);
       }
    }

	private int serverCheck(WebSocketSession wss) throws UnsupportedEncodingException, IOException {
    	return 0;
	}
    
    
    
    
    
    public static String getString(ByteBuffer buffer) {

    	Charset charset = null;

    	CharsetDecoder decoder = null;

    	CharBuffer charBuffer = null;

    	try {

    	charset = Charset.forName("UTF-8");

    	decoder = charset.newDecoder();

    	                       //用这个的话，只能输出来一次结果，第二次显示为空

    	// charBuffer = decoder.decode(buffer);

    	charBuffer = decoder.decode(buffer.asReadOnlyBuffer());

    	return charBuffer.toString();

    	} catch (Exception ex) {

    	ex.printStackTrace();

    	return "error";

    	}

    	}
    
    public static String bytesToHexString(byte[] src) {
        StringBuilder stringBuilder = new StringBuilder("");
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }
    
    public  void send(Object object,int wsstype,String info,WebSocketSession webSocketSession ){
	    JacksonManager jm = JacksonManager.getInstance();
		ObjectNode json = jm.createObjectNode();
		json.put("status",0);
		json.putPOJO("info",info);
		json.putPOJO("data",object);
		ByteBuffer sendbb=null;
		try {
			sendbb = BytesCommon.changebtyes(jm.toJson(json),wsstype);
			BinaryMessage binaryMessage=new BinaryMessage(sendbb);
			synchronized(webSocketSession) {
				//System.out.println("----##########"+webSocketSession.getId());
					try {
						if(webSocketSession.isOpen()){
							webSocketSession.sendMessage(binaryMessage);
						}
					} catch (IOException e) {
						e.printStackTrace();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
//	//广播；
	public  void broadcast(Object object,int wsstype,String info){
		System.out.println("---广播发送成功-");
		int k=0;
		try {
			/*Iterator<WebSocketSession> it=this.WebSocketSessions.iterator();*/
			Collection<WebSocketSession> colle=this.WebSocketSessions;
			Set<WebSocketSession> setone=new HashSet<WebSocketSession>();
			setone.addAll(colle);
			Iterator<WebSocketSession> it = setone.iterator();  
	    	while (it.hasNext()) {
	    			WebSocketSession webSocketSession=it.next();
	    			try {
	    				send(object,wsstype,info,webSocketSession);
	    				k++;
					} catch (Exception e) {
						e.printStackTrace();
					}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("---广播发送成功-总共发送"+k);
	}
	//玩家异常下线检测；
	public void abnormalOffline(String s){
		try {
			System.out.println("----玩家异常下线检测----------");
			List<String> removes=new ArrayList<String>();
			if(errormap.size()==0){
				return ;
			}
			long time=System.currentTimeMillis();
			Iterator<Map.Entry<String,Long>> entries = errormap.entrySet().iterator();
			while (entries.hasNext()) {
				Map.Entry<String,Long>  entry=entries.next();
				try {
					String wssid=entry.getKey();
					long lasttime=errormap.get(wssid);
					if(time-lasttime>=60*1000){
						System.out.println("----异常id");
						removes.add(wssid);
						//玩家异常没有下线；
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
			if(removes.size()>0){
				for (int i = removes.size()-1; i>=0; i--) {
					String delkey=removes.get(i);
					WebSocketSession wss=sessionmap.get(delkey);
					if(wss!=null){
						wss.close();
					}
					errormap.remove(delkey);
				}
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("----玩家异常下线检测完成----------");
	}
	
	
    //公共的发送；
    public void broadcast(Set<WebSocketSession> WebSocketSessions,TextMessage returnMessage){
    	Iterator<WebSocketSession> it = WebSocketSessions.iterator();  
    	while (it.hasNext()) {
    		try {
    			WebSocketSession webSocketSession=it.next();
    			webSocketSession.sendMessage(returnMessage);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
    }
    
    
    

    @Override
    public void handleTransportError(WebSocketSession wss, Throwable thrwbl) throws Exception {
        if(wss.isOpen()){
            wss.close();
        }
        removeone(wss);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession wss, CloseStatus cs) throws Exception {
    	removeone(wss);
    }
    
    
    public void removeone(WebSocketSession wss){
    	//System.out.println(wss.isOpen()+"--wss.isOpen()---");
    	WebSocketSessions.remove(wss);
    	System.out.println(WebSocketSessions.size());
    	//System.out.println(WebSocketSessions.size());
    	long time=System.currentTimeMillis();
    	sessionmap.remove(wss.getId());
    	errormap.remove(wss.getId());
    	System.out.println("删除--------------"+wss.getId());
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }
    
}
