package web.game.dynamicdatasource;



import org.springframework.beans.factory.annotation.Autowired;

public class DataSourcetest {
	public static DataSourcetest self;
	public static DataSourcetest getInstance(){
		return self;
	}
	
	//@Autowired
	//public CheshiMapper cheshiMapper;
	public void init(){
		self=this;
		//test();
	}
	
	/*
	public void setCheshiMapper(CheshiMapper cheshiMapper) {
		this.cheshiMapper = cheshiMapper;
	}
	
	

	public CheshiMapper getCheshiMapper() {
		return cheshiMapper;
	}*/



	public void test() {
//		CustomerContextHolder.setCustomerType(CustomerContextHolder.DATA_SOURCE_MSSQL);
//		Cheshi cheshi=new Cheshi();
//		cheshi.setId(1);
//		cheshi.setNum(2);
//		System.out.println(cheshiMapper.toString());
//		cheshiMapper.updateByPrimaryKeySelective(cheshi);
//		CustomerContextHolder.setCustomerType(CustomerContextHolder.DATA_SOURCE_MYSQL);
	}
}
