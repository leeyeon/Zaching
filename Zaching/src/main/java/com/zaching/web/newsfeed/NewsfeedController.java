package com.zaching.web.newsfeed;

import java.io.File;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.domain.User;
import com.zaching.service.newsfeed.NewsfeedService;
import com.zaching.service.user.UserService;


@Controller
@RequestMapping("/newsfeed/*")
public class NewsfeedController {
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public NewsfeedController() {
		System.out.println(this.getClass());
	}
	
	
	
	@RequestMapping(value="addNewsfeed", method=RequestMethod.POST)
	public String addNewsfeed(@ModelAttribute("newsfeed") Newsfeed newsfeed, Model model) throws Exception{
		System.out.println("addNewsfeed()");
		if(newsfeed.getFile() != null) {
			String fileName = newsfeed.getFile().getOriginalFilename();
			newsfeed.setFileName(fileName);
			
			File file = new File("C:/workspace/Zaching/WebContent/resources/upload_files/images/"+fileName);
			
			newsfeed.getFile().transferTo(file);
		}
		
		newsfeedService.addNewsfeed(newsfeed);
		
		return "forward:/newsfeed/newsfeed.jsp";
	}
	
	@RequestMapping(value="deleteNewsfeed", method=RequestMethod.GET)
	public String deleteNewsfeed(@RequestParam int newsfeedID, Model model) throws Exception{
		System.out.println("deleteNewsfeed()");
		newsfeedService.deleteNewsfeed(newsfeedID);
		return "";
	}
	
	@RequestMapping(value="updateNewsfeed", method=RequestMethod.GET)
	public String updateNewsfeed(@ModelAttribute("newsfeed") Newsfeed newsfeed, Model model) throws Exception{
		System.out.println("updateNewsfeed()");
		newsfeedService.updateNewsfeed(newsfeed);
		return "forward:/newsfeed/getNewsfeed.jsp";
	}
	
	@RequestMapping(value="getNewsfeed")
	public String getNewsfeed(@RequestParam int newsfeedId, @RequestParam int userId, Model model, @RequestParam String category, HttpSession session, @ModelAttribute("search") Search search) throws Exception{
		System.out.println("getNewsfeed()");
		System.out.println(newsfeedId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		session.setAttribute("user", (User)userService.getUser(33));
		
		model.addAttribute("newsfeed", newsfeedService.getNewsfeed(newsfeedId));
		model.addAttribute("roomUser", userService.getUser(userId));
		model.addAttribute("list", (List)(commonService.listComment(search, category,newsfeedId).get("list")));
		
		return "forward:/newsfeed/getNewsfeed.jsp";
		
	}
	@RequestMapping(value="listNewsfeed")
	public String listNewsfeed( @ModelAttribute("search") Search search,  Model model, HttpServletRequest request) throws Exception{
		System.out.println("listNewsfeed");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setCategory("V01");
		search.setPageSize(pageSize);
		Map<String, Object> map = newsfeedService.listNewsfeed(search);
		//List<Newsfeed> list = newsfeedService.listNewsfeeds(search);
		//User user = userService.getUser(userId);
		// Business logic 수행
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		//System.out.println(resultPage);
		
		// Model 과 View 연결
		//model.addAttribute("list", map.get("list"));
		//model.addAttribute("resultPage", resultPage);
		//System.out.println(list);
		model.addAttribute("category", search.getCategory());
		model.addAttribute("search", search);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/newsfeed/newsfeed.jsp";
	}
	
	
	
	

}
