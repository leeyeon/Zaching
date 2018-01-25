package com.zaching.web.newsfeed;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.newsfeed.NewsfeedService;

@Controller
@RequestMapping("/newsfeed/*")
public class NewsfeedController {
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;

	public NewsfeedController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addNewsfeed", method=RequestMethod.POST)
	public String addNewsfeed(@ModelAttribute("newsfeed") Newsfeed newsfeed, Model model) throws Exception{
		System.out.println("addNewsfeed()");
		if(newsfeed.getFile() != null) {
			String fileName = newsfeed.getFile().getOriginalFilename();
			newsfeed.setImgFile(fileName);
			
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
	
	@RequestMapping(value="listNewsfeed")
	public String listNewsfeed( @ModelAttribute("search") Search search,  @RequestParam("menu") String menu, Model model, HttpServletRequest request) throws Exception{
		System.out.println("listNewsfeed");
		String sorting = null;
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = newsfeedService.listNewsfeed(search);
		// Business logic 수행
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("sorting", sorting);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/newsfeed/newsfeed.jsp";
	}
	
	
	
	

}
