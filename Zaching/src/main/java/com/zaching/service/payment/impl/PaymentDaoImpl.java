package com.zaching.service.payment.impl;

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
	
	/* getAuthorizationUrl  */
	@Override
	public String getAuthorizationUrl(int authType) {
		
		// auth_type : 0이면 최초인증 (계좌없을때)
		// 1이면 재인증
		// 2인증생략
		
		String url = "redirect:https://testapi.open-platform.or.kr/oauth/2.0/authorize2?response_type=code&client_id="+CLIENT_ID
				+"&redirect_uri="+REDIRECT_URI+"&scope=login inquiry&client_info=zaching&auth_type="+authType;

		System.out.println(url);
		
		return url;
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
	
	// DB에 저장
	@Override
	public String getUserCI(String accessToken, String userSeqNo) throws Exception {
		
		System.out.println("getUserMe()");
		
		String param = "user_seq_no="+userSeqNo;
		
		JSONObject obj = URLConnection.getJSON_PARAM("GET", USER_ME_URI, param, 
				"application/x-www-form-urlencoded; charset=UTF-8", "Authorization", "Bearer "+accessToken);
		
		return obj.get("user_ci").toString();
	}
	
	public int getTotalCount(Search search, int userId) throws Exception {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("search", search);
		map.put("userId", userId);
		
		return sqlSession.selectOne("PaymentMapper.getTotalCount", map);
	}

}
