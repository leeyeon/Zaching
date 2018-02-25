			
package com.zaching.web.user;


import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;

import java.util.Date;
import java.util.List;

import java.util.Map;

import javax.imageio.ImageIO;
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

import com.zaching.service.domain.Friend;
import com.zaching.service.domain.Newsfeed;
import com.zaching.service.domain.User;
import com.zaching.service.friend.FriendService;
import com.zaching.service.newsfeed.NewsfeedService;
import com.zaching.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	/// Field
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("newsfeedServiceImpl")
	private NewsfeedService newsfeedService;

	@Autowired
	@Qualifier("friendServiceImpl")
	private FriendService friendService;
	// setter Method ���� ����

	public UserController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//private String fileDirectory = "C:\\Users\\bitcamp\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\";
	private String fileDirectory = "C:\\Users\\소현태\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\";



	@RequestMapping(value = "findPassword", method = RequestMethod.GET)
	public String findPassword() throws Exception {

		System.out.println("/user/findPassword : GET");

		return "redirect:/user/findPassword.jsp";
	}
	@RequestMapping(value ="findPassword", method=RequestMethod.POST)
	public String findPassword(@RequestParam("email")String email)throws Exception{
		
		System.out.println("/user/findPassword : POST");
		
		userService.findPassword(email);
		return"";
	}

	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(@RequestParam("userId") int userId, Model model) throws Exception {

		System.out.println("/user/getUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}

	@RequestMapping(value = "getTimeLine", method = RequestMethod.GET)
	public String getTimeLine(@RequestParam("userId") int userId, @ModelAttribute("userId") int userId2, Model model, HttpServletRequest request,HttpSession session) throws Exception {


		System.out.println("/user/getTimeLine : GET");
		// Business Logic
		User user = userService.getUser(userId);
		List<Newsfeed> list = newsfeedService.timeline(userId2);
		
		System.out.println("내 게시물===>"+newsfeedService.timeline(userId));
		System.out.println("뀨규뀨===>"+userId);
		// Model �� View ����
		
		int id = ((User)session.getAttribute("user")).getUserId();
		int count = friendService.checkFriend(id, userId, 0);
		int count2 = friendService.checkFriend(userId, id, 0);
		int count3 = friendService.checkFollow(id, userId, 1);
		
		int code=0;
		
		if(count != 0) {
			if(count2 != 0) {
				code = 2;
			}
			else
				code = 1;
		} 
		if(count2 != 0) {
			if(count == 0) {
				code = 3;
			}
		}
		
		if(count3 != 0) {
			count3 = 1;
		}
		// 아무상태도 아님 : 0, 친구신청중 : 1, 친구상태 : 2, 친구신청 온 상태 : 3
		System.out.println("code :: "+code);
		model.addAttribute("followCode", count3);
		model.addAttribute("code", code);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		
		System.out.println(list);
		

		return "forward:/user/getTimeLine.jsp";
		
	}
	@RequestMapping(value = "listUser")
	public String listUser(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/user/listUser : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic ����
		Map<String, Object> map = userService.listUser(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/user/listUser.jsp";
	}

	@RequestMapping(value="updateUser", method = RequestMethod.GET)
	public String updateUser(@RequestParam("userId") int userId, Model model) throws Exception {

		System.out.println("/user/updateUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);

		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping(value="updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute User user, 
						
			Model model, HttpSession session,HttpServletRequest request) throws Exception {

		System.out.println("/user/updateUser : POST");
		if(user.getUploadFile() != null) {
			try {System.out.println("여기?");
				user.setProfileImage(commonService.addFile(fileDirectory, user.getUploadFile()));
				System.out.println("여기");
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		}else {
			System.out.println("뭐여");
			user.setProfileImage("profile_default.png");
		}
		user.setRole("2");
		userService.updateUser(user);
		
		System.out.println("update user ====>"+user);
		model.addAttribute("user", user);
		
		return "redirect:/user/getUser?userId=" + user.getUserId();
	}

	

	@RequestMapping(value="memoryMap", method= RequestMethod.GET)
	public String memoryMap(HttpSession session)throws Exception{

		System.out.println("/user/memoryMap : GET");
		
		
	return "forward:/user/memoryMap.jsp";
	}
	
	@RequestMapping(value="deleteUser", method=RequestMethod.GET)
	public String deleteUser(@RequestParam("userId") int userId, 
			Model model)throws Exception{
		
		System.out.println("/user/deleteUser : GET");
		
		User user=userService.getUser(userId);
		
		model.addAttribute("user", user);
		
		return"forward:/user/deleteUser.jsp";
	}
	
	
	@RequestMapping(value="/fileupload",method=RequestMethod.POST)
	public String ProfileUpload(@ModelAttribute("user") User user, Model model, HttpSession session)throws Exception{
		
		
		System.out.println("/user/fileupload : GET");
		
		String path = "";
		System.out.println(user);
		
		if(user.getUploadFile() != null) {
			try {
				path = commonService.addFile(fileDirectory, user.getUploadFile());
			} catch(Exception e) {
				e.printStackTrace();
			}
		}

		if(path != null) {
			user.setProfileImage(path.substring(path.indexOf("\\")+1));
			((User)session.getAttribute("user")).setProfileImage(user.getProfileImage());
			File in = new File(fileDirectory+path);
	        BufferedImage inputImage = ImageIO.read(in);
	 
	        int width = 200;
	        int height = 200;
	 
	            BufferedImage outputImage = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
	            Graphics2D g = outputImage.createGraphics();
	            g.drawImage(inputImage, 0, 0, width, height, null);

	            File out = new File("C:\\Users\\소현태\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\"+user.getProfileImage());
	            FileOutputStream fos = new FileOutputStream(out);	            
	            ImageIO.write(outputImage, user.getProfileImage().substring(user.getProfileImage().indexOf(".")+1), fos);
		}

		userService.updateUserProfile(user);
		
		return "forward:/user/getTimeLine.jsp";
	}
	
}
