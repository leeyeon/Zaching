package com.zaching.service.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Payment;
import com.zaching.service.payment.PaymentDao;

@Repository("paymentDaoImpl")
public class PaymentDaoImpl implements PaymentDao {
	
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
			System.out.println("ㅇㅅㅇ");
		}
		return sqlSession.selectOne("PaymentMapper.getPayment", map);
	}

}
