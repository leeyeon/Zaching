package com.zaching.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zaching.service.domain.User;
import com.zaching.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public UserRestController() {
		System.out.println(this.getClass());
	}

	/*// �̸��� ����
	@RequestMapping(value = "json/emailAuth", method = RequestMethod.POST )
	public User emailAuth(
			HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("/user/json/emailAuth : POST");

		String email = request.getParameter("email");
		String authNum = "";// ���� ������ȣ

		authNum = RandomNum();

		User getSessionUser = (User) session.getAttribute("user");

		System.out.println("getSessionUser :: " + getSessionUser);

		System.out.println("�޴»�� email ����==>" + email);
		System.out.println("���λ����� ������ȣ==> " + authNum);

		getSessionUser.setAuthNum(authNum);
		

		userService.sendMail(email, authNum);

		System.out.println("DB������ȣ ===> " + getSessionUser.getAuthNum());

		session.setAttribute("user", getSessionUser);

		System.out.println("getSessionUser :: " + getSessionUser);

		return getSessionUser;
	}

	// �����߻� �޼ҵ�
	public String RandomNum() {

		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}*/

	// �н����� ã��

	//

}
