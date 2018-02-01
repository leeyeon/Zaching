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
 * 작성자 : 이연희
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
		/* 방ID 리턴 값으로 방장도 참여자 테이블에 추가시키기 */
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

	
	/* month 0: 현재달 1: 지난달 2: 2달 전
		 paid_date 없으면 이번달 회비 안낸거임
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
		//System.out.println("참가 시퀀스 id : "+participantId);
		
		int result = 0;
		
		/* 참가 중이 아닐때 */
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
