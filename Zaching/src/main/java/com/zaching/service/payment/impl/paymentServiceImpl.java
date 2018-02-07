package com.zaching.service.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Payment;
import com.zaching.service.domain.User;
import com.zaching.service.payment.PaymentDao;
import com.zaching.service.payment.PaymentService;

@Service("paymentServiceImpl")
public class paymentServiceImpl implements PaymentService {
	
	@Autowired
	@Qualifier("paymentDaoImpl")
	private PaymentDao paymentDao;

	public paymentServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> listPoint(Search search, int userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", paymentDao.listPoint(search, userId));
		map.put("totalCount", paymentDao.getTotalCount(search, userId));
		
		return map;
	}
	
	@Override
	public List<Payment> listExchargePoint(Search search) throws Exception {
		return paymentDao.listExchargePoint(search);
	}

	// 포인트 신청/사용/반환신청/반환완료/반환신청취소 /사용취소(P06)
	// 반환시에 필요한 데이터: payment_id , payment_code , point 
	@Override
	public void managePoint(Payment payment) throws Exception {
		
		String code = payment.getPaymentCode();
		
		if("P01".equals(code) || "P02".equals(code) || "P03".equals(code)) {
			paymentDao.managePayment(payment);
			paymentDao.updateUserPayment(payment);
		} else if("P04".equals(code)) {
			paymentDao.exchargePoint(payment);
		} else if("P05".equals(code)) {
			paymentDao.exchargePoint(payment);
			paymentDao.updateUserPayment(payment);
		} else if("P06".equals(code)) {
			paymentDao.managePayment(payment);
			paymentDao.updateUserPayment(payment);
		}
		
	}
	
	// 마일리지 적립/사용/적립취소 (M01/M02/M03)
	@Override
	public void manageMileage(Payment payment) throws Exception {
		
		String code = payment.getPaymentCode();
		
		paymentDao.managePayment(payment);
		paymentDao.updateUserPayment(payment);
		
	}

	@Override
	public void presentPoint(Payment payment) throws Exception {
		// point column insert
		paymentDao.managePayment(payment);
		// 보내는 사람 포인트 차감
		paymentDao.updateUserPayment(payment);
		// 받는 사람 포인트 증가
		paymentDao.presentUserPayment(payment);
	}
	
	@Override
	public int getMileage(int userId) throws Exception {
		return paymentDao.getPayment(userId, false);
	}
	
	@Override
	public int getPoint(int userId) throws Exception {
		return paymentDao.getPayment(userId, true);
	}

	
	@Override
	public String getAuthorizationUrl(int authType) throws Exception {
		return paymentDao.getAuthorizationUrl(authType);
	}

	@Override
	public JSONObject getAccessToken(String code) throws Exception {
		return paymentDao.getAccessToken(code);
	}

	@Override
	public String getUserCI(String accessToken, String userSeqNo) throws Exception {
		return paymentDao.getUserCI(accessToken, userSeqNo);
	}

	//@Scheduled(fixedDelay=1000)
	@Scheduled(cron="0 0 12 * * *")
	public void doSomething() {
		System.out.println("회비 출금하는 시간 매일 12시");
	}

}
