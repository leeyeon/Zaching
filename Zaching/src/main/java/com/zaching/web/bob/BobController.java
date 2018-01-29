package com.zaching.web.bob;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
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
import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.common.service.CommonService;
import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Comment;

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

	//@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize = 9;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("bobServiceImpl")
	private BobService bobService;
	
	
	public BobController() {
		System.out.println(this.getClass());
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); 
	}
	
	@RequestMapping(value="/addBob", method=RequestMethod.GET)
	public String addBobView(@RequestParam String category, Model model) {
		System.out.println(this.getClass()+"/addBob_ GET");
		
		//System.out.println(category);
		
		model.addAttribute("category", category);
		model.addAttribute("categoryName", this.getCategoryName(category));
		
		return "forward:/bob/addBob.jsp";
	}
	
	@RequestMapping(value="/addBob", method=RequestMethod.POST)
	public String addBob(@ModelAttribute Bob bob, 
						BindingResult result, 
						Model model) {
		
		// binding Test
		if (result.hasErrors()) {
			System.out.println(result.getTarget());
            return "error";
        }
		
		System.out.println(this.getClass()+"/addBob_ POST");
		
		try {
			bob.setImage(commonService.addFile(fileDirectory, bob.getUploadFile()));
			bobService.addBob(bob);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(bob);
		
		return "redirect:/bob/getBob?bobId="+bob.getBobId()+"&category="+bob.getCategory();
	}
	
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
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		
		model.addAttribute("comments", (List<Comment>)(commonService.listComment(search, "B00", bobId).get("list")));
		model.addAttribute("category", category);
		model.addAllAttributes(bob);
		
		return "forward:/bob/getBob.jsp";
	}

	@RequestMapping("/listBob")
	public String listBob(@ModelAttribute Search search,
						  Model model) throws Exception {
		System.out.println(this.getClass()+"/listBob?category="+search.getCategory());
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		if(search.getCategory() == null) {
			search.setCategory("B01");
		}
		search.setPageSize(pageSize);
		
		//System.out.println(search);
		
		Map<String, Object> map = bobService.listBob(search);
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), 
				pageUnit, pageSize);
		
		model.addAllAttributes(map)
			 .addAttribute("resultPage", resultPage);
		
		return "forward:/bob/listBob.jsp";
	}
	
	@RequestMapping("/mainBob")
	public String mainBob() throws Exception {
		System.out.println(this.getClass()+"/mainBob");
		
		// 단순 네비게이션		
		return "forward:/bob/mainBob.jsp";
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
		
		return "forward:/bob/updateBob.jsp";
	}
	
	@RequestMapping(value="/updateBob", method=RequestMethod.POST)
	public String updateBob(@ModelAttribute Bob bob,
							Model model) {
		System.out.println(this.getClass()+"/updateBob_POST");
		
		
		return "forward:/bob/getBob.jsp?bobId="+bob.getBobId()+"&category="+bob.getCategory();
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
}
