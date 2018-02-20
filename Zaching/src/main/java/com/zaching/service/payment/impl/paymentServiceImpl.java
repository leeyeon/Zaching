package com.zaching.service.payment.impl;

import java.util.ArrayList;
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

	// ����Ʈ ��û/���/��ȯ��û/��ȯ�Ϸ�/��ȯ��û��� /������(P06)
	// ��ȯ�ÿ� �ʿ��� ������: payment_id , payment_code , point 
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
	
	// ���ϸ��� ����/���/������� (M01/M02/M03)
	@Override
	public void manageMileage(Payment payment) throws Exception {
		
		String code = payment.getPaymentCode();
		
		paymentDao.managePayment(payment);
		paymentDao.updateUserPayment(payment);
		
	}

	// P07
	@Override
	public void presentPoint(Payment payment) throws Exception {
		// point column insert
		paymentDao.presentPoint(payment);
		// ������ ��� ����Ʈ ����
		paymentDao.updateUserPayment(payment);
		// �޴� ��� ����Ʈ ����
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
	public String getAccessToken2() throws Exception {
		return paymentDao.getAccessToken2();
	}

	@Override
	public JSONObject getAccessToken(String code) throws Exception {
		return paymentDao.getAccessToken(code);
	}

	@Override
	public String getUserCI(String accessToken, String userSeqNo) throws Exception {
		return paymentDao.getUserCI(accessToken, userSeqNo);
	}
	
	@Override
	public Map<String, Object> getAccountRealName(String accessToken, String accountNum, int accountHolderinfo, String bankCode) throws Exception {
		return paymentDao.getAccount(accessToken, accountNum, accountHolderinfo, bankCode);
	}
	
	@Override
	public List<String> listBackCode() throws Exception {
		List<String> list = new ArrayList<String>();
		list.add("002=�������");
		list.add("003=�������");
		list.add("004=��������");
		list.add("007=�����߾�ȸ");
		list.add("011=�����߾�ȸ");
		list.add("020=�츮����");
		list.add("023=SC��������");
		list.add("027=��Ƽ����");
		list.add("031=�뱸����");
		list.add("032=�λ�����");
		list.add("034=��������");
		list.add("035=��������");
		list.add("037=��������");
		list.add("039=�泲����");
		list.add("081=�ϳ�����");
		list.add("088=��������");
		list.add("097=��������");
		
		
		return list;
	}

	//@Scheduled(fixedDelay=1000)
	@Scheduled(cron="0 0 12 * * *")
	public void doSomething() {
		System.out.println("ȸ�� ����ϴ� �ð� ���� 12��");
	}

}
