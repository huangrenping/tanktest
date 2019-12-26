package web.game.util;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonToken;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;



/**
 *
 * @author Frank E-mail:chudaping＠hotmail.com
 * @version 创建时间：Sep 9, 2011 10:41:52 AM
 * 
 */
public class JacksonManager {
	
	private ObjectMapper mapper = new ObjectMapper();
	
	private static JacksonManager instance;
	
	private Gson gson=null;
	
	
	public Gson getGson() {
		if(gson==null){
			gson=new Gson();
		}
		return gson;
	}

	public void setGson(Gson gson) {
		this.gson = gson;
	}
	
	public static Map<String,String> maphttpget(String s){
		Map<String,String> mapone=new HashMap<String, String>();
		mapone= JacksonManager.getInstance().getGson().fromJson(s, new TypeToken<Map<String,String>>() {
		}.getType());
		if(mapone==null){
			mapone=new HashMap<String, String>();
		}
		return mapone;
	}
	
	
	

	public static JacksonManager getInstance() {
		if(instance == null) {
			synchronized(JacksonManager.class) {
				if(instance == null) {
					try {
						instance = (JacksonManager)Class.forName(JacksonManager.class.getName()).newInstance();
					} catch (InstantiationException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return instance;
	}
	
	/**
	 * 创建一个ObjectNode
	 * @return
	 */
	public ObjectNode createObjectNode() {
		return mapper.createObjectNode();
	}
	
	/**
	 * 创建一个arrayNode
	 * @return
	 */
	public ArrayNode createArrayNode() {
		return mapper.createArrayNode();
	}
	
	public String toJsonString(Collection collection) {
		try {
			return mapper.writeValueAsString(collection);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	public String toJsonString2(Object collection) {
		try {
			return mapper.writeValueAsString(collection);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	public String toJsonString(Map map) {
		try {
			return mapper.writeValueAsString(map);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	public void addToArray(ArrayNode array, Object object) {
		JsonNode node = mapper.valueToTree(object);
		array.add(node);
	}
	
	/**
	 * 得到json串的的字节数据
	 * @param node
	 * @return
	 */
	public byte[] toJsonBytes(ObjectNode node) {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		try {
			JsonGenerator gener = mapper.getJsonFactory().createJsonGenerator(out);
			gener.writeTree(node);
			gener.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return out.toByteArray();
	}
	
	/**
	 * 得到json字符串
	 * @param node
	 * @return
	 */
	public String toJson(ObjectNode node) {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		try {
			JsonGenerator gener = mapper.getJsonFactory().createJsonGenerator(out);
			gener.writeTree(node);
			gener.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		try {
			return out.toString("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	public Map jsonDecodeMap(String json) {
		JsonParser jsonParser = null;
		try {
			jsonParser = mapper.getJsonFactory().createJsonParser(json);
			jsonParser.nextToken();
			Map map = new HashMap();
			if (jsonParser.nextToken() == JsonToken.START_OBJECT) {
				while (jsonParser.nextToken() != JsonToken.END_OBJECT) {   
					jsonParser.nextToken();   
					map.put(jsonParser.getCurrentName(), jsonParser.getText());   
				}
			}
			return map;
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				jsonParser.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public List jsonDecodeList(String json) {
		JsonParser jsonParser = null;
		try {
			jsonParser = mapper.getJsonFactory().createJsonParser(json);
			if (jsonParser.nextToken() == JsonToken.START_ARRAY) {
				List list = new ArrayList();
				while (jsonParser.nextToken() != JsonToken.END_ARRAY) {
//					System.out.println("list-text"+jsonParser.getText());
					list.add(jsonParser.getText());
				}
				return list;
			}
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				jsonParser.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public Object jsonDecodeObject(String json) throws JsonParseException, IOException {
		JsonParser jp = mapper.getJsonFactory().createJsonParser(json);
		Object ob =  mapStreamToObject(jp, jp.nextToken());
		return ob;
	}
	
	private Object mapStreamToObject(JsonParser jp, JsonToken t) throws IOException {
		switch (t) {
		case VALUE_FALSE:
			return Boolean.FALSE;
		case VALUE_TRUE:
			return Boolean.TRUE;
		case VALUE_STRING:
			return jp.getText();
		case VALUE_NUMBER_INT:
		case VALUE_NUMBER_FLOAT:
			return jp.getNumberValue();
		case VALUE_EMBEDDED_OBJECT:
			return jp.getEmbeddedObject();
		case START_ARRAY: {
			ArrayList<Object> kids = new ArrayList<Object>(4);
			while ((t = jp.nextToken()) != JsonToken.END_ARRAY) {
				kids.add(mapStreamToObject(jp, t));
			}
			return kids;
		}
		case START_OBJECT: {
			// HashMap<String, Object> kids = new LinkedHashMap<String, Object>();
			HashMap<String, Object> kids = new HashMap<String, Object>(8);
			while ((t = jp.nextToken()) != JsonToken.END_OBJECT) {
				kids.put(jp.getCurrentName(), mapStreamToObject(jp, jp.nextToken()));
			}
			return kids;
		}
		case VALUE_NULL : {
			return null;
		}
		default:
			throw new RuntimeException("Unexpected token: " + t);
		}
	}
	
	public static class Person {
		private long id;
		
		private String name;
		
		private boolean male;
		
		
		public long getId() {
			return id;
		}

		public void setId(long id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public boolean isMale() {
			return male;
		}

		public void setMale(boolean male) {
			this.male = male;
		}

		public Person(long id, String name, boolean male) {
			this.id = id;
			this.name = name;
			this.male = male;
		}
		
		@JsonIgnore
		public String getLogStr() {
			return "{id:"+id+"}{name:"+name+"}{male:"+male+"}";
		}
	}
	
//	public static void main(String args[]) throws JsonParseException, IOException {
//		List<Avatar> avatarlist = new ArrayList<Avatar>();
//		for(int i=0; i<10; i++) {
//			Avatar g = new Avatar();
//			g.setId(i);
//			g.setImage("@@@@"+i);
//			g.setSex(0);
//			avatarlist.add(g);
//		}
//		JacksonManager jm = JacksonManager.getInstance();
//		ObjectNode json = jm.createObjectNode();
//		json.putPOJO("data1",new Person(111111,"222222",false));
//		json.putPOJO("list", avatarlist);
//		json.putPOJO("data", avatarlist.get(0));
//		System.out.println(jm.toJson(json));
	//jm.getGson().fromJson(studycardsleeptime, long[].class);
	//getGson().fromJson(studystate, int[].class);
	// getGson().fromJson(fullreduceshopnum, new TypeToken<Map<Integer, Integer>>() {
//}.getType());
	
//	}
}
