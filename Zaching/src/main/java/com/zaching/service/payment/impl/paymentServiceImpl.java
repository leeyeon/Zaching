package com.zaching.service.payment.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
	public List<Payment> listPoint(Search search, int userId) throws Exception {
		return paymentDao.listPoint(search, userId);
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
	
	// ���ϸ��� ����/���
	@Override
	public void manageMileage(Payment payment) throws Exception {
		
		String code = payment.getPaymentCode();
		
		if("M01".equals(code) || "M02".equals(code)) {
			paymentDao.managePayment(payment);
			paymentDao.updateUserPayment(payment);
		}
		
	}

	@Override
	public void presentPoint(Payment payment) throws Exception {
		// point column insert
		paymentDao.managePayment(payment);
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

}
