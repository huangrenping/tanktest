package web.game.article;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xml.sax.SAXException;

import com.xuanzhi.tools.configuration.Configuration;
import com.xuanzhi.tools.configuration.ConfigurationException;
import com.xuanzhi.tools.configuration.DefaultConfigurationBuilder;
import com.xuanzhi.tools.watchdog.ConfigFileChangedAdapter;
import com.xuanzhi.tools.watchdog.ConfigFileChangedListener;

import web.game.util.Util;

public class ArticleManager implements ConfigFileChangedListener{
	public static Logger logger = LoggerFactory.getLogger(ArticleManager.class);
	private String xmlfile;
	protected static ArticleManager self;
	
	public static ArticleManager getInstance() {
		return self;
	}	
	
	public String getXmlfile() {
		return xmlfile;
	}

	public void setXmlfile(String xmlfile) {
		this.xmlfile = xmlfile;
	}

	private Map<Integer, Article> articlemap;
	private List<Article> articlelist;
	
	public Map<Integer, Article> getArticlemap() {
		return articlemap;
	}

	public void setArticlemap(Map<Integer, Article> articlemap) {
		this.articlemap = articlemap;
	}

	public List<Article> getArticlelist() {
		return articlelist;
	}

	public void setArticlelist(List<Article> articlelist) {
		this.articlelist = articlelist;
	}

	public void init() {
		self = this;
		long start = System.currentTimeMillis();
		try {
			loadxml();
			System.out.println("[articleManager初始化完成] ["
					+ (System.currentTimeMillis() - start) + "ms]");
		} catch (Exception e) {
			e.printStackTrace();
		}
		ConfigFileChangedAdapter.getInstance().addListener(new File(xmlfile), this);
	}
	
	public synchronized void loadxml() throws SAXException, IOException,ConfigurationException {
		articlemap=new HashMap<Integer,Article>();
		articlelist=new ArrayList<Article>();
		Configuration rootConfig = new DefaultConfigurationBuilder()
				.buildFromFile(xmlfile);
		Configuration nationsConfig[] = rootConfig.getChildren("article");
		for (Configuration nationConfig : nationsConfig) {
			int id = nationConfig.getAttributeAsInteger("id", 0);
			String name = nationConfig.getAttribute("name", "");
			String iconName = nationConfig.getAttribute("iconName", "");
			int articleType = nationConfig.getAttributeAsInteger("articleType", 0);
			int secondid = nationConfig.getAttributeAsInteger("secondid", 0);
			int subType = nationConfig.getAttributeAsInteger("subType",0);
			String description = nationConfig.getAttribute("description","");
			int overlap = nationConfig.getAttributeAsInteger("overlap",0);
			int overLapNum = nationConfig.getAttributeAsInteger("overLapNum",0);
			int articleLevel = nationConfig.getAttributeAsInteger("articleLevel",0);
			int batch = nationConfig.getAttributeAsInteger("batch",0);
			//int add = nationConfig.getAttributeAsInteger("add",0);
			String add = nationConfig.getAttribute("add","0");
			int type = nationConfig.getAttributeAsInteger("type",0);
			int sellnum = nationConfig.getAttributeAsInteger("sellnum",0);
			String ids = nationConfig.getAttribute("ids","");
			String produce= nationConfig.getAttribute("produce","");
			int purchase= nationConfig.getAttributeAsInteger("purchase",0);
			String obtain= nationConfig.getAttribute("obtain","");
			int pinzhi= nationConfig.getAttributeAsInteger("pinzhi",0);
			Article article=new Article();
			article.setAdd(add);
			article.setArticleLevel(articleLevel);
			article.setArticleType(articleType);
			article.setSecondid(secondid);
			article.setOverlap(overlap);
			article.setName(name);
			article.setSubType(subType);
			article.setOverLapNum(overLapNum);
			article.setBatch(batch);
			article.setDescription(description);
			article.setIconName(iconName);
			article.setId(id);
			article.setIds(ids);
			article.setName(name);
			article.setType(type);
			article.setSellnum(sellnum);
			article.setProduce(produce);
			article.setPurchase(purchase);
			article.setObtain(obtain);
			article.setPinzhi(pinzhi);
			articlelist.add(article);
			articlemap.put(id, article);
		}
		System.out.println("article道具表完成更新");
	}
	
	
	/**
	 * @param @luchi
	 * @return固定格式道具 -》1000024@2##1000028@10
	 */
	public static List<Article2> getarticlelist(String articleone) {
		//固定格式；
		ArticleManager articleManager = ArticleManager.getInstance();
		List<Article2> list = new ArrayList<Article2>();
		Article2 article2 = null;
			// 1000024@5##3000001@1
			String[] tastreward2 = articleone.split("##");
			if (tastreward2 != null) {
				// 1000024@5,3000001@1
				for (int j = 0; j < tastreward2.length; j++) {
					String[] tastreward3 = tastreward2[j].split("@");
					if (tastreward3 != null) {
						Article article = articleManager.getArticlemap().get(Integer
								.valueOf(tastreward3[0]));
						if (article != null) {
							article2=ArticleManager.getarticlenew(Integer.valueOf(tastreward3[0]),tastreward3[1]);
							list.add(article2);
						}
					}
				}
			}
		return list;
	}
	
	public static List<Article2> getarticlelist1(String articleone) {
		//固定格式；
		ArticleManager articleManager = ArticleManager.getInstance();
		List<Article2> list = new ArrayList<Article2>();
		Article2 article2 = null;
			// 1000024@5##3000001@1
			String[] tastreward2 = articleone.split(",");
			if (tastreward2 != null) {
				// 1000024@5,3000001@1
				for (int j = 0; j < tastreward2.length; j++) {
					String[] tastreward3 = tastreward2[j].split(":");
					if (tastreward3 != null) {
						Article article = articleManager.getArticlemap().get(Integer
								.valueOf(tastreward3[0]));
						if (article != null) {
							article2=ArticleManager.getarticlenew(Integer.valueOf(tastreward3[0]),tastreward3[1]);
							list.add(article2);
						}
					}
				}
			}
		return list;
	}
	
	
	
	public static List<Article2> getarticlelist(int id,String num){
		List<Article2> list=new ArrayList<Article2>();
		Article article3=ArticleManager.getInstance().getArticlemap().get(id);
		Article2 article2 = null;
		if(article3!=null){
			if(article3.getArticleType()==8||article3.getArticleType()==16){
				//礼包
			    String articleone=article3.getIds();
				String[] tastreward2 = articleone.split(",");
				if (tastreward2 != null) {
					for (int j = 0; j < tastreward2.length; j++) {
						String[] tastreward3 = tastreward2[j].split(":");
						if (tastreward3 != null) {
//							Article a=ArticleManager.getInstance().getArticlemap().get(Integer.valueOf(tastreward3[0]));
//							if(a!=null && a.getArticleType()==1 && a.getSubType()==1){
//								article2=ArticleManager.getarticlenew(Integer.valueOf(tastreward3[0]),Util.UtilBigDecimal(tastreward3[1], num, 2));
//							}else{
//								article2=ArticleManager.getarticlenew(Integer.valueOf(tastreward3[0]), String.valueOf(Integer.valueOf(tastreward3[1])*Integer.valueOf(num)));
//							}
							article2=ArticleManager.getarticlenew(Integer.valueOf(tastreward3[0]),Util.UtilBigDecimal(tastreward3[1], num, 2));
							list.add(article2);	
						}
					}
				}
			}else{
				//普通道具
				article2=ArticleManager.getarticlenew(article3.getId(), num);
				list.add(article2);
			}	
		}
		return list;
	}
	/**
	
	
	
	
	
	/**
	 * @param id
	 * @param num
	 * @return 二级礼包 
	 */
	public List<Article2> getarticlelist1(int id,String num){
		List<Article2> list=new ArrayList<Article2>();
		Article article=this.getArticlemap().get(id);
		Map<Integer,String> articlemap=new HashMap<Integer,String>();
		if(article!=null){
			if(article.getArticleType()==8){
				String ids=article.getIds();
				if(ids!=null && !ids.equals("")){
					String[] ids2=ids.split(",");
					for (int i = 0; i < ids2.length; i++) {
						String[] ids3=ids2[i].split(":");
						Article article2=this.getArticlemap().get(Integer.valueOf(ids3[0]));
						if(article2!=null){
							if(article2.getArticleType()==8){
								String newids=article2.getIds();
								if(newids!=null && !newids.equals("")){
									String[] newids2=newids.split(",");
									for (int j = 0; j < newids2.length; j++) {
										String[] newids3=newids2[j].split(":");
										Article a=ArticleManager.getInstance().getArticlemap().get(Integer.valueOf(newids3[0]));
/*										if(a!=null && a.getArticleType()==1 && a.getSubType()==1){
											if(articlemap.get(Integer.valueOf(newids3[0]))==null){
												articlemap.put(Integer.valueOf(newids3[0]), newids3[1]);
											}else{
												articlemap.put(Integer.valueOf(newids3[0]),Util.UtilBigDecimal(articlemap.get(Integer.valueOf(newids3[0])), newids3[1], 0));
											}
										}else{
											if(articlemap.get(Integer.valueOf(newids3[0]))==null){
												articlemap.put(Integer.valueOf(newids3[0]),newids3[1]);
											}else{
												int sa=Integer.valueOf(articlemap.get(Integer.valueOf(newids3[0])));
												int sb=Integer.valueOf(newids3[1]);
												articlemap.put(Integer.valueOf(newids3[0]), String.valueOf(sa+sb));
											}
										}*/
										if(articlemap.get(Integer.valueOf(newids3[0]))==null){
											articlemap.put(Integer.valueOf(newids3[0]), newids3[1]);
										}else{
											articlemap.put(Integer.valueOf(newids3[0]),Util.UtilBigDecimal(articlemap.get(Integer.valueOf(newids3[0])), newids3[1], 0));
										}
									}
								}
							}else{
/*								Article a=ArticleManager.getInstance().getArticlemap().get(article2.getId());
								if(a!=null && a.getArticleType()==1 && a.getSubType()==1){
									if(articlemap.get(article2.getId())==null){
										articlemap.put(article2.getId(), ids3[1]);
									}else{
										articlemap.put(article2.getId(),Util.UtilBigDecimal(articlemap.get(article2.getId()),ids3[1], 0));
									}
								}else{
									if(articlemap.get(article2.getId())==null){
										articlemap.put(article2.getId(), ids3[1]);
									}else{
										int sa=Integer.valueOf(articlemap.get(article2.getId()));
										int sb=Integer.valueOf(ids3[1]);
										articlemap.put(article2.getId(), String.valueOf(sa+sb));
									}
								}*/
								if(articlemap.get(article2.getId())==null){
									articlemap.put(article2.getId(), ids3[1]);
								}else{
									articlemap.put(article2.getId(),Util.UtilBigDecimal(articlemap.get(article2.getId()),ids3[1], 0));
								}
							}
						}
					}
				}
			}else{
				if(articlemap.get(article.getId())==null){
					articlemap.put(article.getId(), String.valueOf(1));
				}else{
					int sa= Integer.valueOf(articlemap.get(article.getId()));
					int sb= Integer.valueOf(1);
					articlemap.put(article.getId(), String.valueOf(sa+sb));
				}
			}
			if(articlemap.size()>0){
				for (Integer in : articlemap.keySet()) {
					Article2 article2=null;
/*					Article a=ArticleManager.getInstance().getArticlemap().get(in);
					if(a!=null && a.getArticleType()==1 && a.getSubType()==1){
						article2=ArticleManager.getarticlenew(in,Util.UtilBigDecimal(articlemap.get(in), num, 2));
					}else{
						article2=ArticleManager.getarticlenew(in,String.valueOf(Integer.valueOf(articlemap.get(in))*Integer.valueOf(num)));
					}*/
					article2=ArticleManager.getarticlenew(in,Util.UtilBigDecimal(articlemap.get(in), num, 2));
					list.add(article2);
				}
			}
		}
		return list;
	}
	
	/**
	 * @param id
	 * @param num
	 * @author luchi
	 * @return单个道具
	 */
	public static Article2 getarticlenew(int id,String num){
		Article2 article2 =new Article2();
		Article article3=ArticleManager.getInstance().getArticlemap().get(id);
		if(article3!=null){
			article2.setId(article3.getId());
			article2.setDescription(article3.getDescription().replace("@@", num));
			article2.setIconName(article3.getIconName());
			article2.setName(article3.getName());
			article2.setNum(num);
			article2.setArticleType(article3.getArticleType());
			article2.setSubType(article3.getSubType());
			article2.setPinzhi(article3.getPinzhi());
			article2.setSecondid(article3.getSecondid());
		}
		return article2;
	}
	
	@Override
	public void fileChanged(File arg0) {
		try {
			loadxml();
			System.out.println("article更新");
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void destroy(){
		
	}

}
