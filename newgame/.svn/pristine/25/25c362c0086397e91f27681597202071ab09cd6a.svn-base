package web.game.user;

import java.util.HashMap;
import java.util.Map;

import web.game.article.Article;
import web.game.article.ArticleManager;
import web.game.common.Commoncost;
import web.game.pojo.WgPlayer;
import web.game.util.Util;

public class Knapsack {
	transient WgPlayer owner;
	public Knapsack(WgPlayer wgPlayerserver) {
		this.owner = wgPlayerserver;
	}
	
	private Map<Integer,Integer> mapknapsack;
	public Map<Integer, Integer> getMapknapsack() {
		if(mapknapsack==null){
			mapknapsack=this.owner.getWgPlayer1().getMapknapsack();
		}
		return mapknapsack;
	}

	public void setMapknapsack(Map<Integer, Integer> mapknapsack) {
		this.owner.getWgPlayer1().setMapknapsack(mapknapsack);
		this.mapknapsack = mapknapsack;
	}
	public int count(int aid){
		Integer num=this.getMapknapsack().get(aid);
		if(num==null){
			return 0;
		}else{
			return num;
		}
	}
	
	public void addknapsackall(Map<Integer,String> mapone){
		for (Integer it : mapone.keySet()) {
			this.addknapsackone(it, mapone.get(it));
		}
	}
	
	public void addknapsackall(String articlea){ //1000002:5,1000002:3;
		String articles[]=articlea.split(",");
		for (String string : articles) {
			String as[]=string.split(":");
			this.addknapsackone(Integer.valueOf(0),as[1]);
		}
	}
	
	public void addknapsackall1(String articlea){// 1000024@5##3000001@1
		String articles[]=articlea.split("##");
		for (String string : articles) {
			String as[]=string.split("@");
			this.addknapsackone(Integer.valueOf(0),as[1]);
		}
	}
	
	
	
	public void addknapsackone(int aid,String num){
		Map<Integer,Integer> articlemap=new HashMap<Integer,Integer>();
		ArticleManager articleManager=ArticleManager.getInstance();
		Article article=articleManager.getArticlemap().get(aid);
		if(article!=null){
			if(article.getArticleType()==8||article.getArticleType()==16){
				String ids=article.getIds();
				String[] ids2=ids.split(",");
				for (int i = 0; i < ids2.length; i++) {
					String[] ids3=ids2[i].split(":");
					Article article2=articleManager.getArticlemap().get(Integer.valueOf(ids3[0]));
					if(article2!=null){
						if(article2.getArticleType()==8){
							String newids=article2.getIds();
							String[] newids2=newids.split(",");
							for (int j = 0; j < newids2.length; j++) {
								String[] newids3=newids2[j].split(":");
								Article article3=articleManager.getArticlemap().get(Integer.valueOf(newids3[0]));
								if(article3.getArticleType()==1 && article3.getSubType()==1){
									Commoncost.playerIncrease(this.owner, 0, Util.UtilBigDecimal(Util.UtilBigDecimal(newids3[1], ids3[1], 2), num, 2), Commoncost.goldtype,Commoncost.knapsack);
								}else{
									if(articlemap.get(Integer.valueOf(newids3[0]))==null){
										articlemap.put(Integer.valueOf(newids3[0]), Integer.valueOf(newids3[1])*Integer.valueOf(ids3[1])*Integer.valueOf(num));
									}else{
										articlemap.put(Integer.valueOf(newids3[0]), articlemap.get(Integer.valueOf(newids3[0]))+Integer.valueOf(newids3[1])*Integer.valueOf(ids3[1])*Integer.valueOf(num));
									}
								}
							}
						}else{
							if(article2.getArticleType()==1 && article2.getSubType()==1){
								Commoncost.playerIncrease(this.owner, 0, Util.UtilBigDecimal(ids3[1], num, 0), Commoncost.goldtype,Commoncost.knapsack);
								//this.owner.addgold(Util.UtilBigDecimal(ids3[1], num, 0));
							}else{
								if(articlemap.get(Integer.valueOf(ids3[0]))==null){
									articlemap.put(Integer.valueOf(ids3[0]), Integer.valueOf(ids3[1])*Integer.valueOf(num));
								}else{
									articlemap.put(Integer.valueOf(ids3[0]), articlemap.get(Integer.valueOf(ids3[0]))+Integer.valueOf(ids3[1])*Integer.valueOf(num));
								}
							}
						}
					}
				}
			}else{
				if(article.getArticleType()==1 && article.getSubType()==1){
					//this.owner.addgold(num);
					Commoncost.playerIncrease(this.owner, 0, num, Commoncost.goldtype,Commoncost.knapsack);
				}else{
					articlemap.put(aid,Integer.valueOf(num));	
				}
				
			}
		}
		
		if(articlemap.size()>0){
			for (Integer it : articlemap.keySet()) {
				Article articlethis=articleManager.getArticlemap().get(it);
				if(articlethis.getArticleType()==1 && articlethis.getSubType()==2){
					this.owner.adddiamond(articlemap.get(it));
					continue;
				}
				
				Integer hasnum=this.getMapknapsack().get(it);
				if(hasnum==null){
					this.getMapknapsack().put(it, articlemap.get(it));
				}else{
					this.getMapknapsack().put(it, this.getMapknapsack().get(it)+articlemap.get(it));
				}
			}
			this.setMapknapsack(this.getMapknapsack());
		}
		
	}

}
