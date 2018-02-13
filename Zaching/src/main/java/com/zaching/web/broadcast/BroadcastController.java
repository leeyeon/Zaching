package com.zaching.web.broadcast;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.broadcast.BroadcastService;
import com.zaching.service.domain.Broadcast;
import com.zaching.service.domain.User;

@Controller
@RequestMapping("/broadcast/*")
public class BroadcastController {
	
	///Field
	@Autowired
	@Qualifier("broadcastServiceImpl")
	private BroadcastService broadcastService;
		
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public BroadcastController(){
		System.out.println(this.getClass());
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
		
		broadcast.setUserId(user.getUserId());
		broadcast.setUserName(user.getName());
		broadcast.setProfileImage(user.getProfileImage());
		
		String fileDirectory = "C:\\Users\\소현태\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\";
		String fileName = commonService.addFile(fileDirectory, broadcast.getImage());
		//System.out.println("broadcast end ==>"+ broadcast);
		broadcast.setFileName(fileName);
		broadcastService.addBroadcast(broadcast);
		
		model.addAttribute("broadcast",broadcast);
		
		//System.out.println("잘한다 :"+broadcast);
		
		return "redirect:http://localhost:3000/broadcast?broadcaster="+broadcast.getUserId();
		//return "forward:/chat/broadcast.jsp";
	}
	
	@RequestMapping(value = "listBroadcast")
	public String listBroadcast( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
 
		System.out.println("/broadast/listBroadcast : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = broadcastService.listBroadcast(search);
		//System.out.println("맵~"+map);
		//System.out.println("search :: "+ search);

		Page resultPage = new Page( search.getCurrentPage(),(Integer)map.get("totalCount"), pageUnit, pageSize);
	
		model.addAttribute("list",map.get("list"));
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("search", search);
		 
//		// Model 과 View 연결
		//model.addAttribute("list", list2);		
		
		return "forward:/broadcast/listBroadcast.jsp";
	}	
}

