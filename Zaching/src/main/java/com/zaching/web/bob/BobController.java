package com.zaching.web.bob;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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

import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Bob;

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
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	public BobController() {
		System.out.println(this.getClass());
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) { 
		System.out.println("ㅇㅅㅇ");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); 
	}
	
	@RequestMapping(value="/addBob", method=RequestMethod.GET)
	public String addBobView(@RequestParam String category, Model model) {
		System.out.println(this.getClass()+"/addBob_ GET");
		
		//System.out.println(category);
		
		String categoryName = B01;
		
		if(category.equals("B02")) {
			categoryName = B02;
		} else if(category.equals("B03")) {
			categoryName = B03;
		}
		
		model.addAttribute("category", category);
		model.addAttribute("categoryName", categoryName);
		
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
		
		String fileName;
		try {
			fileName = commonService.addFile(fileDirectory, bob.getUploadFile());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// limitNum 을 꼭 넣어야 에러가 안남. (필수 입력)
		System.out.println(bob.toString());
		
		return "forward:/bob/getBob.jsp";
	}
	
	@RequestMapping("/getBob")
	public String getBob(Model model) {
		System.out.println(this.getClass()+"/getBob");

		// 우리지금만나
		String category = "B01";
		
		model.addAttribute("category", category);
		
		return "redirect:/bob/getBob.jsp";
	}

	@RequestMapping("/listBob")
	public String listBob() {
		System.out.println(this.getClass()+"/listBob");
		
		return "forward:/bob/listBob.jsp";
	}

	@RequestMapping("/updateBob")
	public String updateBob() {
		System.out.println(this.getClass()+"/updateBob");
		
		return "forward:/bob/updateBob.jsp";
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
    };
}
