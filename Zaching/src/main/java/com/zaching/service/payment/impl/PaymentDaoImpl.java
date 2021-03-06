package com.zaching.service.payment.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.URLConnection;
import com.zaching.common.domain.Search;
import com.zaching.service.domain.Payment;
import com.zaching.service.payment.PaymentDao;

@Repository("paymentDaoImpl")
public class PaymentDaoImpl implements PaymentDao {
	
	
	private final static String CLIENT_ID = "l7xx9cd7e927676141669b16e83b062087a2";
	private final static String CLIENT_SECRET = "c4975689d0174c6c9f6dfd5f11c60e3a";
	
	private final static String REDIRECT_URI = "http://127.0.0.1:8080/payment/oauthAccount";
	private final static String GET_TOKEN_API_URI = "https://testapi.open-platform.or.kr/oauth/2.0/token";
	private final static String REAL_NAME_URI = "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name";
	private final static String USER_ME_URI = "https://testapi.open-platform.or.kr/user/me";
	
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public PaymentDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<Payment> listPoint(Search search, int userId) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("search", search);
		map.put("userId", userId);
		
		return sqlSession.selectList("PaymentMapper.listPoint", map);
	}
	
	//회원id, 은행, 계좌번호, 실명, 포인트, flag?status?(처리유무)
	
	@Override
	public List<Payment> listExchargePoint(Search search) throws Exception {
		return sqlSession.selectList("PaymentMapper.listExchargePoint", search);
	}

	@Override
	public void exchargePoint(Payment payment) throws Exception {
		sqlSession.update("PaymentMapper.exchargePoint", payment);
	}

	@Override
	public void managePayment(Payment payment) throws Exception {
		sqlSession.insert("PaymentMapper.managepayment", payment);
	}

	@Override
	public void presentUserPayment(Payment payment) throws Exception {
		sqlSession.update("PaymentMapper.presentUserPayment", payment);
	}

	@Override
	public void updateUserPayment(Payment payment) throws Exception {
		sqlSession.update("PaymentMapper.updateUserPayment", payment);
	}

	@Override
	public int getPayment(int userId, boolean isPoint) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		if(isPoint) {
			map.put("point", "point");
			//System.out.println("ㅇㅅㅇ");
		}
		return sqlSession.selectOne("PaymentMapper.getPayment", map);
	}
	
	
	@Override
	public void presentPoint(Payment payment) throws Exception {
		sqlSession.insert("PaymentMapper.presentPoint", payment);
	}
	
	/* getAuthorizationUrl  */
	@Override
	public String getAuthorizationUrl(int authType) {
		
		// auth_type : 0이면 최초인증 (계좌없을때)
		// 1이면 재인증
		// 2인증생략
		
		String url = "redirect:https://testapi.open-platform.or.kr/oauth/2.0/authorize2?response_type=code&client_id="+CLIENT_ID
				+"&redirect_uri="+REDIRECT_URI+"&scope=login inquiry oop&client_info=zaching&auth_type="+authType;

		System.out.println(url);
		
		return url;
	}
	
	
	
	@Override
	public String getAccessToken2() throws Exception {
		
		String param = "client_id="+CLIENT_ID+"&client_secret="+CLIENT_SECRET+"&scope=oob&grant_type=client_credentials";
		
		JSONObject obj = URLConnection.getJSON_PARAM("POST", "https://testapi.open-platform.or.kr/oauth/2.0/token", param, 
				"application/x-www-form-urlencoded;charset=UTF-8");
		
		return obj.get("access_token").toString();
	}
	
	@Override
	public JSONObject getAccessToken(String code) throws Exception {
		
		System.out.println("getAccessToken()");
		
		String param = "code="+code+"&client_id="+CLIENT_ID+"&client_secret="+CLIENT_SECRET
				+"&redirect_uri="+REDIRECT_URI+"&grant_type=authorization_code";
		
		System.out.println(GET_TOKEN_API_URI+"?"+param);
		
		JSONObject obj = URLConnection.getJSON_PARAM("POST", GET_TOKEN_API_URI, param, 
				"application/x-www-form-urlencoded;charset=UTF-8");
		
		String access_token = obj.get("access_token").toString();
		String user_seq_no = obj.get("user_seq_no").toString();
		
		System.out.println("인증토큰 :: "+access_token);
		
		// seq_no DB에 저장
		System.out.println("사용자번호 :: "+user_seq_no);
		
		return obj;
	}
	
	@Override
	public Map<String, Object> getAccount(String accessToken, String accountNum, int accountHolderinfo, String bankCode) throws Exception {
		
		System.out.println("getAccessToken()");
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String dtime = fmt.format(cal.getTime());
		
		//String param = "bank_code_std=null&account_num="+accountNum+"&account_holder_info="+accountHolderinfo+"&tran_dtime="+dtime;
		
		JSONObject param = new JSONObject();
		param.put("bank_code_std", bankCode);
		param.put("account_num", accountNum);
		param.put("account_holder_info", accountHolderinfo);
		param.put("tran_dtime", dtime);
		
		System.out.println(REAL_NAME_URI+"?"+param);

		JSONObject obj = URLConnection.getJSON_PARAM("POST", REAL_NAME_URI, param.toString(), 
				"application/json; charset=UTF-8", "Authorization", "Bearer "+accessToken);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("realName", obj.get("account_holder_name").toString());
		map.put("accountNum", obj.get("account_num").toString());
		map.put("bankName", obj.get("bank_name").toString());
		
		return map;
	}

	
	// DB에 저장
	@Override
	public String getUserCI(String accessToken, String userSeqNo) throws Exception {
		
		System.out.println("getUserMe()");
		
		String param = "user_seq_no="+userSeqNo;
		
		JSONObject obj = URLConnection.getJSON_PARAM("GET", USER_ME_URI, param, 
				"application/x-www-form-urlencoded; charset=UTF-8", "Authorization", "Bearer "+accessToken);
		
		JSONObject obj2 = (JSONObject)obj.get("res_list");
		
		return obj.get("user_ci").toString();
	}
	
	public int getTotalCount(Search search, int userId) throws Exception {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("search", search);
		map.put("userId", userId);
		
		return sqlSession.selectOne("PaymentMapper.getTotalCount", map);
	}

}
