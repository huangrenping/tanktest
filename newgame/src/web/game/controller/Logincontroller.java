package web.game.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;
import web.game.player.PlayerManager;
import web.game.pojo.WgMain;
import web.game.pojo.WgPlayer;
import web.game.tank.TankManager;
import web.game.user.Wgplayerclient;
import web.game.util.Util;

@Controller
public class Logincontroller{

	//后台欢迎页
	@RequestMapping("/admin/index")
	public String userindex(){
		return "adm/index";	
	}
	
	@RequestMapping("/admin/login")
	public String loginindex(){
		return "adm/login/login";	
	}
	
	@RequestMapping("/admin/loginout")
	public String loginout(HttpSession session){
		session.removeAttribute("username");
		session.removeAttribute("password");
		session.removeAttribute("realname");
		session.removeAttribute("newtoken");
		return "adm/index";	
	}
	
	@RequestMapping("/admin/system")
	public String system(HttpServletRequest request, HttpSession session){
	    Properties props = System.getProperties(); // 系统属性
	    System.out.println("Java的运行环境版本：" + props.getProperty("java.version")); 
	    System.out.println("Java的运行环境供应商：" + props.getProperty("java.vendor")); 
	    System.out.println("Java供应商的URL：" + props.getProperty("java.vendor.url")); 
	    System.out.println("Java的安装路径：" + props.getProperty("java.home")); 
	    System.out.println("Java的虚拟机规范版本：" + props.getProperty("java.vm.specification.version")); 
	    System.out.println("Java的虚拟机规范供应商：" + props.getProperty("java.vm.specification.vendor")); 
	    System.out.println("Java的虚拟机规范名称：" + props.getProperty("java.vm.specification.name")); 
	    System.out.println("Java的虚拟机实现版本：" + props.getProperty("java.vm.version")); 
	    System.out.println("Java的虚拟机实现供应商：" + props.getProperty("java.vm.vendor")); 
	    System.out.println("Java的虚拟机实现名称：" + props.getProperty("java.vm.name")); 
	    System.out.println("Java运行时环境规范版本：" + props.getProperty("java.specification.version")); 
	    System.out.println("Java运行时环境规范供应商：" + props.getProperty("java.specification.vender")); 
	    System.out.println("Java运行时环境规范名称：" + props.getProperty("java.specification.name")); 
	    System.out.println("Java的类格式版本号：" + props.getProperty("java.class.version")); 
	    System.out.println("Java的类路径：" + props.getProperty("java.class.path")); 
	    System.out.println("加载库时搜索的路径列表：" + props.getProperty("java.library.path")); 
	    System.out.println("默认的临时文件路径：" + props.getProperty("java.io.tmpdir")); 
	    System.out.println("一个或多个扩展目录的路径：" + props.getProperty("java.ext.dirs")); 
	    System.out.println("操作系统的名称：" + props.getProperty("os.name")); 
	    System.out.println("操作系统的构架：" + props.getProperty("os.arch")); 
	    System.out.println("操作系统的版本：" + props.getProperty("os.version")); 
	    System.out.println("文件分隔符：" + props.getProperty("file.separator")); // 在 unix 系统中是＂／＂ 
	    System.out.println("路径分隔符：" + props.getProperty("path.separator")); // 在 unix 系统中是＂:＂ 
	    System.out.println("行分隔符：" + props.getProperty("line.separator")); // 在 unix 系统中是＂/n＂ 
	    System.out.println("用户的账户名称：" + props.getProperty("user.name")); 
	    System.out.println("用户的主目录：" + props.getProperty("user.home")); 
	    System.out.println("用户的当前工作目录：" + props.getProperty("user.dir")); 
		return "adm/system";	
	} 
	
	@RequestMapping("/admin/welcome")
	public String welcome(HttpServletRequest request, HttpSession session){
		String username = (String) session.getAttribute("username");
		request.setAttribute("welcome", username);
		PlayerManager playerManager=PlayerManager.getInstance();
		WgMain wgmain=playerManager.getWgmain();
		String message1="";
		if(wgmain.getOpen()==1){
			message1="开";
		}else{
			message1="关";
		}
		request.setAttribute("message1", message1);
		return "adm/welcome";	
	}
	
	@RequestMapping("/admin/onlinelist")
	public String useronlinelist(HttpServletRequest request, HttpSession session){ 
		return userlist(request,session,1);
	}
	
	
	@RequestMapping("/admin/allwglist")
	public String userlist(HttpServletRequest request, HttpSession session,Integer type){ 
		String pageNo=request.getParameter("pageNo");
		if(pageNo==null || pageNo.equals("")){
			pageNo="1";
		}
		int page=Integer.valueOf(pageNo);
		//每页最大显示数量
		int size=15;
		PlayerManager  playerManager=PlayerManager.getInstance();
		
		List<WgPlayer> listwgplayers=new ArrayList<WgPlayer>();

 		String username=request.getParameter("username");
 		String playername=request.getParameter("playername");
 		String rolename=request.getParameter("rolename");
 		if(username!=null && !username.equals("")){
 			Long playerid=PlayerManager.getInstance().getNameplayermap().get(username);
 			if(playerid!=null){
 				WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
 				listwgplayers.add(wgplayer);
 			}
 		}else if(playername!=null && !playername.equals("")){
 			Long playerid=PlayerManager.getInstance().getNameplayermap().get(playername);
 			if(playerid!=null){
 				WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
 				listwgplayers.add(wgplayer);
 			}
 		}else if(rolename!=null && !rolename.equals("")){
 			Long playerid=PlayerManager.getInstance().getNameplayermap().get(rolename);
 			if(playerid!=null){
 				WgPlayer wgplayer=PlayerManager.getInstance().getplayer(playerid);
 				listwgplayers.add(wgplayer);
 			}
 		}else{
 			Collection<WgPlayer> wplist=playerManager.getIdplayermap().values();
 			long nowtime=System.currentTimeMillis();
 			if(type!=null && type==1){
 	 			for (WgPlayer wgPlayer : wplist) {
 					if(wgPlayer.isOnline()){
 						listwgplayers.add(wgPlayer);
 					}
 				}
 			}else{
 				listwgplayers.addAll(wplist);	
 			}
 		}
 		int PageCount=0;  //总页数；
		int newsize=listwgplayers.size();
		if(newsize%size==0)
		{
			PageCount=newsize/size;
		}else{
			PageCount=newsize/size+1;
		}
 		//List<WgPlayer> listwgplayers2=new ArrayList<WgPlayer>();
 		List<Wgplayerclient> listwgplayers2=new ArrayList<Wgplayerclient>();
 		
 		int start=(page-1)*size;
 		
 		for (int i = 0; i < size; i++) {
 			if(start+i<newsize){
 				//listwgplayers2.add(listwgplayers.get(start+i));
 				listwgplayers2.add(Wgplayerclient.getWgplayerclient(listwgplayers.get(start+i)));
 			}
		}
 		
 		PageInfo newpage=new PageInfo();
 		newpage.setTotal(newsize);
 		newpage.setPageSize(size);
 		newpage.setPageNum(page);
 		newpage.setPages(PageCount);
		//总条数
		request.setAttribute("newpage", newpage);
/*		request.setAttribute("max", newsize);
		request.setAttribute("size", size);

		request.setAttribute("pageNo", page);
		request.setAttribute("pageCount", PageCount);*/
 		request.setAttribute("list", listwgplayers2);
		//内存中的用户；
		return "adm/wgplayer/allwglist";	
	}
	
	@RequestMapping("/admin/allwglist1")
	public String userlista(HttpServletRequest request, HttpSession session){ 
		
		PlayerManager playerManager=PlayerManager.getInstance();
		String username=request.getParameter("username");
		String playername=request.getParameter("playername");
		String rolename=request.getParameter("rolename");
		String pageNo=request.getParameter("pageNo");
		if(pageNo==null || pageNo.equals("")){
			pageNo="1";
		}
		int page=Integer.valueOf(pageNo);
		int size=15;//长度；
		PageHelper.startPage(page, size);
		
		Example example=new Example(WgPlayer.class);
		example.setOrderByClause("serialtime desc");
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("sid", playerManager.getServerid());
		if(username!=null && !"".equals(username)){
			criteria.andEqualTo("username", username);
		}
		if(playername!=null && !"".equals(playername)){
			criteria.andEqualTo("playername", playername);
		}
		if(rolename!=null && !"".equals(rolename)){
			criteria.andEqualTo("rolename", rolename);
		}
		
		List<WgPlayer> listwgplayers=playerManager.wgPlayerMapper.selectByExample(example);
		
		List<Wgplayerclient> listwgplayers2=new ArrayList<Wgplayerclient>();
		for (WgPlayer wgPlayer : listwgplayers) {
			listwgplayers2.add(Wgplayerclient.getWgplayerclient(wgPlayer));
		}
		
		PageInfo<WgPlayer> newpage=new PageInfo<WgPlayer>(listwgplayers);
		//PageInfo{pageNum=2, pageSize=4, size=4, startRow=5, endRow=8, total=9, pages=3, list=Page{count=true, pageNum=2, pageSize=4, startRow=4, endRow=8, total=9, pages=3, reasonable=false, pageSizeZero=false}, prePage=1, nextPage=3, isFirstPage=false, isLastPage=false, hasPreviousPage=true, hasNextPage=true, navigatePages=8, navigateFirstPage1, navigateLastPage3, navigatepageNums=[1, 2, 3]}
		request.setAttribute("newpage", newpage);
		//总条数
/*		request.setAttribute("max", newpage.getTotal());//总数量
		request.setAttribute("size", newpage.getPageSize()); //每页的数量
		request.setAttribute("pageNo", newpage.getPageNum());  //当前页；
		request.setAttribute("pageCount", newpage.getPages()); //总页数
*/ 		request.setAttribute("list", listwgplayers2);
		//内存中的用户；
		return "adm/wgplayer/allwglist1";	
		//return "adm/welcome";	
	}
	
	//用户信息；
	@RequestMapping("/admin/userone")
	public String userone(HttpServletRequest request, HttpSession session){
		String suid=request.getParameter("serveruid");
		String type=request.getParameter("type");
		PlayerManager playerManager=PlayerManager.getInstance();
		long uid=Long.valueOf(suid);
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(uid);
		if(wgplayer==null){
			WgPlayer wgplayer1=new WgPlayer();
			wgplayer1.setServeruid(uid);
			wgplayer=PlayerManager.getInstance().wgPlayerMapper.selectOne(wgplayer1);
			playerManager.addtonamemap(wgplayer);
			playerManager.addToIDMap(wgplayer.getServeruid(), wgplayer);
		}
		request.setAttribute("wg", wgplayer);
		//内存中的用户；
		if(type!=null && "1".equals(type)){
			int levels[]=TankManager.getInstance().tanklevel(wgplayer.getBattletanks());
			request.setAttribute("tanklevel",Util.Join(levels, ","));
			return "adm/wgplayer/wgupdate";	
		}if(type!=null && "2".equals(type)){
			wgplayer.resetData(System.currentTimeMillis(), 0);
			return "adm/wgplayer/operation";	
		}else{
			//操作列表；
			return "adm/wgplayer/operation";
		}
			
	}
	
	//用户信息；
	@RequestMapping("/admin/wgupdate")
	public String wgupdate(HttpServletRequest request, HttpSession session,WgPlayer wgplayerget){
		PlayerManager playerManager=PlayerManager.getInstance();
		//System.out.println(wgplayerget.toString());
		String suid=request.getParameter("serveruid");
		long uid=Long.valueOf(suid);
		WgPlayer wgplayer=PlayerManager.getInstance().getplayer(uid);
		if(wgplayer==null){
			WgPlayer wgplayer1=new WgPlayer();
			wgplayer1.setServeruid(uid);
			wgplayer1.setSid(playerManager.getServerid());
			wgplayer=PlayerManager.getInstance().wgPlayerMapper.selectOne(wgplayer1);
			playerManager.addtonamemap(wgplayer);
			playerManager.addToIDMap(wgplayer.getServeruid(), wgplayer);
		}
		
		String battletanklevel=request.getParameter("battletanklevel");
		String getlevels[]=battletanklevel.split(",");
		int newbattletanks[]=new int[wgplayer.getBattletanks().length];
		int max=0;
		int tankid=0;
		if(getlevels.length==1){
			for (int i = 0; i < newbattletanks.length; i++) {
				int id=TankManager.getInstance().getMaplevel().get(Integer.valueOf(getlevels[0]));
				if(id>tankid){
					tankid=id;
					max=TankManager.getInstance().getMaptank().get(id).getArticleid();
				}
				newbattletanks[i]=id;
			}
		}else{
			for (int i = 0; i < newbattletanks.length; i++) {
				int id=TankManager.getInstance().getMaplevel().get(Integer.valueOf(getlevels[i]));
				if(id>tankid){
					tankid=id;
					max=TankManager.getInstance().getMaptank().get(id).getArticleid();
				}
				newbattletanks[i]=id;
			}
		}
		
		
		
		
		
	

		wgplayer.setBattletanks(newbattletanks);
		wgplayer.setNowtankid(max);
		
		
		
		wgplayer.setDiamond(wgplayerget.getDiamond());
		wgplayer.setGold(wgplayerget.getGold());
		wgplayer.setSerial(wgplayerget.getSerial()+100);
		wgplayer.setMissionlevel(wgplayerget.getMissionlevel());
		
		//出战坦克等级；
		int levels[]=TankManager.getInstance().tanklevel(wgplayer.getBattletanks());
		request.setAttribute("tanklevel",Util.Join(levels, ","));
		request.setAttribute("wg", wgplayer);
		//内存中的用户；
		return "adm/wgplayer/wgupdate";	
	}
	
	
	//admin/systeminfo
	@RequestMapping("/admin/systeminfo")
	public String systeminfo(HttpServletRequest request, HttpSession session){
		PlayerManager playerManager=PlayerManager.getInstance();
		WgMain wgmain=playerManager.getWgmain();
		String did=request.getParameter("id");
		if(did!=null && !"".equals(did)){
			int id=Integer.valueOf(did);
			if(id==0){
				id=1;
			}else{
				id=0;
			}
			wgmain.setOpen(id);
			wgmain.setDirty(true);
			playerManager.updatewgmain(wgmain);
		}
		
		String time=request.getParameter("time");
		if(time!=null && !"".equals(time)){
			long longtime=Util.getLongTime(time, 1);
			wgmain.setTime(longtime);
			wgmain.setDirty(true);
			playerManager.updatewgmain(wgmain);
		}
		
		request.setAttribute("isopen", wgmain.getOpen());
		String message="";
		String message1="";
		if(wgmain.getOpen()==1){
			message1="开";
			message="禁止玩家登入";
		}else{
			message1="关";
			message="允许玩家登入";
		}
		request.setAttribute("message1", message1);
		request.setAttribute("message",message);
		
		request.setAttribute("time", Util.getDate(wgmain.getTime(), 1));
		//内存中的用户；
		return "adm/systeminfo/index";	
	}
	
	@RequestMapping("/admin/articlelist")
	public String articlelist(HttpServletRequest request){
		return "adm/article/index";	
	}
	@RequestMapping("/admin/articlesend")
	public String articlesend(HttpServletRequest request){
		return "adm/article/send";	
	}
	
	
	
	
	
	
}
