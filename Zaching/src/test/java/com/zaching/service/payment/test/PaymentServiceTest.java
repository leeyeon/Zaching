package com.zaching.service.payment.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Payment;
import com.zaching.service.payment.PaymentService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class PaymentServiceTest {

	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	//@Test
	public void managePoint() throws Exception {
		
		Payment payment = new Payment();
		payment.setUserId(8);
		payment.setPaymentCode("P03");
		payment.setPoint(20000);
		//payment.setPaymentId(7);
		
		paymentService.managePoint(payment);
		
	}
	
	//@Test
	public void listPoint() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		int userId = 8;
		
		List<Payment> list = (List<Payment>)paymentService.listPoint(search, userId);
		
		for (Payment payment : list) {
			System.out.println(payment);
		}
	}
	
	//@Test
	public void getPayment() throws Exception {
		
		int result = paymentService.getPoint(8);
		int result2 = paymentService.getMileage(8);
		
		System.out.println("total_point : "+result);
		System.out.println("total_mileage : "+result2);
	}
	
	//@Test
	public void listExchargePoint() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		int userId = 8;
		
		List<Payment> list = (List<Payment>)paymentService.listExchargePoint(search);
		
		for (Payment payment : list) {
			System.out.println(payment);
		}
	}
}