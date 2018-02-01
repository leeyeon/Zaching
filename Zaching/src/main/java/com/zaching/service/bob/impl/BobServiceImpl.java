package com.zaching.service.bob.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.service.bob.BobDao;
import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Participant;

/*
 * �ۼ��� : �̿���
 * */

@Service("bobServiceImpl")
public class BobServiceImpl implements BobService {

	@Autowired
	@Qualifier("bobDaoImpl")
	private BobDao bobDao;
	
	public void setBobDao(BobDao bobDao) {
		this.bobDao = bobDao;
	}
	
	public BobServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addBob(Bob bob) throws Exception {
		bobDao.addBob(bob);
		System.out.println(bob.getBobId());
		/* ��ID ���� ������ ���嵵 ������ ���̺� �߰���Ű�� */
		bobDao.enterBob(bob.getWrittenUserId(), bob.getBobId());
	}

	@Override
	public Map<String, Object> listBob(Search search) throws Exception {

		List<Bob> list = bobDao.listBob(search);
		int totalCount = bobDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (Bob bob : list) {
			bob.setParticipantList(bobDao.listParticipant(bob.getBobId()));
		}
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	
	/* month 0: ����� 1: ������ 2: 2�� ��
		 paid_date ������ �̹��� ȸ�� �ȳ�����
	*/
	@Override
	public Map<String, Object> getBob(int bobId, String category, int monthFee) throws Exception {
		
		List<Participant> feeList = bobDao.listFeeBob(bobId, monthFee);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bob", bobDao.getBob(bobId, category));
		map.put("participant", feeList);
		return map;
	}
	
	@Override
	public Map<String, Object> getBob(int bobId, String category) throws Exception {
		
		List<Participant> list = bobDao.listParticipant(bobId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bob", bobDao.getBob(bobId, category));
		map.put("participant", list);
		return map;
	}
	
	@Override
	public Bob getBobInfo(int bobId, String category) throws Exception {
		return bobDao.getBob(bobId, category);
	}

	@Override
	public void updateBob(Bob bob) throws Exception {
		bobDao.updateBob(bob);
	}

	@Override
	public boolean enterBob(int userId, int bobId) throws Exception {
		
		int participantId = bobDao.getParticipant(userId, bobId);
		//System.out.println("���� ������ id : "+participantId);
		
		int result = 0;
		
		/* ���� ���� �ƴҶ� */
		if(participantId == 0) {
			result = bobDao.enterBob(userId, bobId);
		} else {
			result = bobDao.cancleBob(participantId);
		}
		
		if(result==1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void inviteBob(List<Integer> listUser, int bobId) throws Exception {
		bobDao.inviteBob(listUser, bobId);
	}

	@Override
	public void deleteBob(int bobId) throws Exception {
		bobDao.deleteBob(bobId);
	}

	@Override
	public void setFeeBob(int participantId, boolean isAutoFee) throws Exception {
		bobDao.setFeeBob(participantId, isAutoFee);
	}

	@Override
	public void payFeeBob(int participantId, int paidFee) throws Exception {
		bobDao.payFeeBob(participantId, paidFee);
	}

}
