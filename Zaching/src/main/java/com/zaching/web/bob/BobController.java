package com.zaching.web.bob;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Comment;
import com.zaching.service.domain.Friend;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.domain.Participant;
import com.zaching.service.domain.User;
import com.zaching.service.domain.excelView;
import com.zaching.service.friend.FriendService;
import com.zaching.service.newsfeed.NewsfeedService;
import com.zaching.service.user.UserService;

@Controller
@RequestMapping("/bob/*")
public class BobController {
	
	private String fileDirectory = "C:\\Users\\301-6\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\";

	//@Value("#{categoryProperties['B01']}")
	private String B01 = "우리지금만나";

	//@Value("#{categoryProperties['B02']}")
	private String B02 = "당장만나";
	
	//@Value("#{categoryProperties['B03']}")
	private String B03 = "주기적으로만나";
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("bobServiceImpl")
	private BobService bobService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("friendServiceImpl")
	private FriendService friendService;
	
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;	
	
	
	public BobController() {
		System.out.println(this.getClass());
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); 
	}

	@RequestMapping("/mainBob")
	public String mainBob(HttpServletRequest request) throws Exception {
		System.out.println(this.getClass()+"/mainBob");
		
		/* session처리! */
		//request.getSession().setAttribute("user", userService.getUser(8));
		
		// 단순 네비게이션		
		return "forward:/bob/mainBob.jsp";
	}

	
	@SuppressWarnings("unchecked")
	@RequestMapping(value= "/getBob", method=RequestMethod.GET)
	public String getBob(@RequestParam int bobId, 
						@RequestParam String category,
						Model model) throws Exception {
		System.out.println(this.getClass()+"/getBob");
		
		System.out.println("방 ID :: "+bobId);
		//System.out.println(category+"나왔따");
		
		Map<String, Object> bob;
		
		if(category.equals("B03")) {
			bob = bobService.getBob(bobId, category, 0);
			//System.out.println("B03");
		} else {
			bob = bobService.getBob(bobId, category);
			//System.out.println("B01 B02");
		}
		
		System.out.println(bob);
		
		Search search = new Search();
		
		if(search.getCurrentPage() ==0){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setCategory("B00");
		
		Map<String,Object> map = (Map<String,Object>)commonService.listComment(search, "B00", bobId);
		
		List<Newsfeed> review = null;
		int reviewCount = 0;
		
		if(!category.equals("B03")) {
			search.setSearchCondition("N10:"+bobId);
			Map<String, Object> newsfeedMap = newsfeedService.listNewsfeed(search);
			review = (List<Newsfeed>)newsfeedMap.get("list");
			reviewCount = (int)newsfeedMap.get("totalCount");
		}
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
				pageUnit, pageSize);

		model.addAttribute("comments", map.get("list"))
			.addAttribute("commentPage", resultPage)
			.addAttribute("category", category)
			.addAttribute("currentTime", (Calendar.getInstance()).getTime())
			.addAttribute("review", review)
			.addAttribute("reviewCount", reviewCount)
			.addAllAttributes(bob);

		return "forward:/bob/getBob.jsp";
	}

	@RequestMapping("/listBob")
	public String listBob(@ModelAttribute Search search,
						  HttpSession session,
						  Model model) throws Exception {
		System.out.println(this.getClass()+"/listBob?category="+search.getCategory());
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(search.getCategory() == null) {
			search.setCategory("B01");
		} else if(search.getCategory().equals("B03") || search.getCategory().equals("B04")) {
			search.setSearchKeyword(((User)session.getAttribute("user")).getUserId()+"");
		}
		
		//System.out.println("서치");
		
		System.out.println("???" +search);

		Map<String, Object> map = bobService.listBob(search);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), 
				pageUnit, pageSize);
		
		model.addAllAttributes(map)
			 .addAttribute("resultPage", resultPage)
			 .addAttribute("search", search);
		
		return "forward:/bob/listBob.jsp";
	}
	
	
	@RequestMapping(value="/addBob", method=RequestMethod.GET)
	public String addBobView(@RequestParam String category,
							HttpSession session, Model model) {
		System.out.println(this.getClass()+"/addBob_ GET");
		
		Search search = new Search();
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setCategory("B03");
		search.setPageSize(pageSize);
		search.setSearchCondition("2");
		search.setSearchKeyword(((User)session.getAttribute("user")).getUserId()+"");
		
		Map<String, Object> map = null;
		
		try {
			map = friendService.listFriend(search);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("category", category);
		model.addAttribute("categoryName", this.getCategoryName(category));
		model.addAttribute("friend", map);
		
		return "forward:/bob/addBob.jsp";
	}
	
	@RequestMapping(value="/addBob", method=RequestMethod.POST)
	public String addBob(@ModelAttribute Bob bob, @RequestParam(required=false) boolean imageCheck,
						BindingResult result) throws Exception {
		
		// binding Test
		if (result.hasErrors()) {
			System.out.println(result.getTarget());
            return "error";
        }
		
		System.out.println(this.getClass()+"/addBob_ POST");
		
		//System.out.println(imageCheck);
		
		if(bob.getUploadFile() != null) {
			try {
				bob.setImage(commonService.addFile(fileDirectory, bob.getUploadFile()));
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(imageCheck) {
			bob.setImage(null);
		}
		
		/* 시간 */
		System.out.println("약속시간: "+bob.getAppointmentTime().length());
		if(bob.getAppointmentTime().length() != 0) {
			bob.setAppointmentTime(this.getAppointmentTime(bob.getAppointmentTime()));
		}
		
		bobService.addBob(bob);		
		System.out.println(bob);
		
		return "redirect:/bob/getBob?bobId="+bob.getBobId()+"&category="+bob.getCategory();
	}


	@RequestMapping(value="/updateBob", method=RequestMethod.GET)
	public String updateBobView(@RequestParam String category,
								@RequestParam int bobId,
								Model model) throws Exception {
		
		System.out.println(this.getClass()+"/updateBob_GET");
		
		Bob bob = bobService.getBobInfo(bobId, category);
		
		System.out.println(bob);

		model.addAttribute("category", category);
		model.addAttribute("categoryName", this.getCategoryName(category));
		model.addAttribute("bob", bob);
		
		return "forward:/bob/updateBob.jsp";
	}
	
	@RequestMapping(value="/updateBob", method=RequestMethod.POST)
	public String updateBob(@ModelAttribute Bob bob, @RequestParam(required=false) boolean imageCheck) throws Exception{

		System.out.println(this.getClass()+"/updateBob_POST");
		
		System.out.println(imageCheck);
		
		if(bob.getUploadFile() != null) {
			try {
				bob.setImage(commonService.addFile(fileDirectory, bob.getUploadFile()));
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(imageCheck) {
			bob.setImage(null);
		}
		
		/* 시간 */
		bob.setAppointmentTime(getAppointmentTime(bob.getAppointmentTime()));
		
		bobService.updateBob(bob);
		System.out.println("1:: "+bob);
		
		return "redirect:/bob/getBob?bobId="+bob.getBobId()+"&category="+bob.getCategory();
	}
	
	@RequestMapping(value= "/listCommment", method=RequestMethod.GET)
	public String listCommment(@RequestParam int bobId, @RequestParam int currentPage,
						Model model) throws Exception {
		System.out.println(this.getClass()+"/listCommment");
		
		//System.out.println("방 ID :: "+bobId);
		//System.out.println(category+"나왔따");

		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setCategory("comment");
		
		System.out.println(search);
		
		Map<String,Object> map = (Map<String,Object>)commonService.listComment(search, "B00", bobId);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),
				pageUnit, pageSize);
		
		for (Comment comment : (List<Comment>)map.get("list")) {
			System.out.println(comment);
		}

		model.addAttribute("comments", map.get("list"))
			.addAttribute("commentPage", resultPage);
		
		return "forward:/bob/listComment.jsp";
	}
	
	@RequestMapping(value="/listFee", method=RequestMethod.GET)
	public String listFee(@RequestParam int bobId, @RequestParam int monthFee, 
			Model model) throws Exception {
		
		model.addAttribute("participant", bobService.listFeeBob(bobId, monthFee));
		
		return "forward:/bob/listFee.jsp";
	}
	
	/**
	 * excelFee
	 * @data	model
	 * @return	excel
	 * 
	 */
	@RequestMapping(value="/excelFee", method=RequestMethod.POST)
	@ResponseBody
	public Object downloadExcel(HttpServletRequest request, HttpServletResponse response, @RequestParam int bobId,
								Model model) throws Exception {
		
		List<Participant> excelList = (List<Participant>)bobService.listFeeBob(bobId, -1);
		
		model.addAttribute("list", excelList);
		
		return new excelView();
	}
	
    /**
     * pm_sKeyName에 해당하는 프로퍼티 값을 얻는다.
     *
     * @param   pm_sKeyName
     * @return  프로퍼티 값
     */
    public String getValue(String pm_sKeyName){
        String tempValue = "";
        try {
            tempValue  = 
               new String(pm_sKeyName.getBytes("ISO-8859-1"), "euc-kr");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace(); 
        }

        return tempValue;
    }
    
    public String getCategoryName(String category) {
		String categoryName = B01;
		
		if(category.equals("B02")) {
			categoryName = B02;
		} else if(category.equals("B03")) {
			categoryName = B03;
		}
		return categoryName;
    }
    
    public String getAppointmentTime(String date) {
    	
    	int index = date.indexOf("오후");
    	String result = "";
    	
    	System.out.println("예에에에: "+date);
    	
    	if(date.contains("오후")) {
    		result = date.substring(0, index)
    				+(Integer.parseInt(date.substring(index+3 , index+5)) + 12)
    				+date.substring(index+5);
    	} else if(date.contains("오전")) {
    		index = date.indexOf("오전");
    		result = date.substring(0, index)+date.substring(index+3);
    	} else {
    		result = date;
    	}
    	
    	return result;
    }
	
}
