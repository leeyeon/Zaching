package com.zaching.web.broadcast;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.WriteConcern;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.broadcast.BroadcastDao;
import com.zaching.service.domain.Broadcast;
import com.zaching.service.domain.User;

@Controller
@RequestMapping("/broadcast/*")
public class BroadcastController {
	
	///Field
	@Autowired
	@Qualifier("broadcastDaoImpl")
	private BroadcastDao broadcastDao;
		
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	public BroadcastController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	
	//@Value("#{commonProperties['pageSize']}")
	int pageSize = 9;
	
	@RequestMapping(value = "addBcpoint", method=RequestMethod.GET)
	public String addBcpoint() throws Exception {
		
		//Business Logic
		
		System.out.println("/broadcast/addBroadcast : GET");
		
		
		return "redirect:/broadcast/addBroadcast.jsp";
	}
	
	
	@RequestMapping(value = "addBroadcast", method=RequestMethod.GET)
	public String addBroadcast() throws Exception {
		
		//Business Logic
		
		System.out.println("/broadcast/addBroadcast : GET");
		
		
		return "redirect:/broadcast/addBroadcast.jsp";
	}
	
	@RequestMapping(value = "addBroadcast", method=RequestMethod.POST)
	public String addBroadcast(@ModelAttribute("broadcast") Broadcast broadcast, HttpSession session, Model model) throws Exception {
		
		//Business Logic
		
		System.out.println("/broadcast/addBroadcast : POST");
		System.out.println(broadcast);
		
		User user = (User)session.getAttribute("user");
		
		//broadcast.setBroadcaster(user);
		//System.out.println("user 정보 : "+user);
		broadcast.setBroadcaster(user);
		String fileDirectory = "C:\\Users\\소현태\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files";
		String fileName = commonService.addFile(fileDirectory, broadcast.getImage());
		//System.out.println("broadcast end ==>"+ broadcast);
		broadcast.setFileName(fileName);
		broadcastDao.addBroadcast(broadcast);
		
		model.addAttribute("broadcast",broadcast);
		
		System.out.println("이름 :"+broadcast.getBroadcaster().getUserId());
		
		//http://127.0.0.1:9001/send?id=값&...
		
		return "redirect:http://localhost:3000/broadcast?broadcaster="+broadcast.getBroadcaster().getUserId();
		//return "forward:/chat/broadcast.jsp";
	}
	
	@RequestMapping(value = "listBroadcast")
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
 
		System.out.println("/broadast/listBroadcast : GET / POST");
//		List<Broadcast> list = broadcastDao.getBroadcastList(search);
//		request.setAttribute("list", list);
		
		List<String> list = new ArrayList<String>();
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		List<JSONObject> list2 = new ArrayList<JSONObject>();
		
		try {
			
			MongoClientURI uri  = new MongoClientURI("mongodb://localhost:27017/broadcast"); 
	        MongoClient mongoClient = new MongoClient(uri);
	        DB db = mongoClient.getDB(uri.getDatabase());
			System.out.println("MONGODB SUCCESS");
			
			DBCollection dbcoll = db.getCollection("broads");
			
			//쓰기권한 부여 
			WriteConcern w = new WriteConcern(1,2000);//쓰게 락 갯수, 연결 시간 2000 //쓰레드 쓰게되면 2개 동시에 쓸 경우도 생기니까
	        mongoClient.setWriteConcern(w);
	        
	        DBCursor cursor = dbcoll.find();	
	        while(cursor.hasNext()){
	            //커서의 이름 내용 전체 출력 
	        	
	            //System.out.println(cursor.next());   
	            list.add(""+cursor.next());
	        }
	        
	        JSONParser parser = new JSONParser();
	        JSONObject obj = new JSONObject();
	        
	        
	        
	        for(String str:list) {
		        obj = (JSONObject)parser.parse(str);
		        
		        System.out.println(obj);
		        System.out.println(((JSONObject)obj.get("date")).get("$date"));
		        list2.add(obj);
	        }
	        
		}catch(Exception e) {
			e.printStackTrace();
		}

//		// Model 과 View 연결
		model.addAttribute("list", list2);		
		
		return "forward:/broadcast/listBroadcast.jsp";
	}	
}

