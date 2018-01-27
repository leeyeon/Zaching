package com.zaching.service.bob.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.bob.BobDao;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Fee;
import com.zaching.service.domain.Participant;

/*
 * 작성자 : 이연희
 * */

@Repository("bobDaoImpl")
public class BobDaoImpl implements BobDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public BobDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int addBob(Bob bob) throws Exception {
		return sqlSession.insert("BobMapper.addBob", bob);		
	}

	@Override
	public List<Bob> listBob(Search search) throws Exception {
		return sqlSession.selectList("BobMapper.listBob", search);
	}

	@Override
	public List<Participant> listParticipant(int bobId) throws Exception {
		return sqlSession.selectList("BobMapper.listParticipant", bobId);
	}

	@Override
	public List<Fee> listFeeBob(int bobId, int month) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bobId", bobId);
		map.put("month", month);
		return sqlSession.selectList("BobMapper.listFeeBob", map);
	}

	@Override
	public Bob getBob(int bobId, String category) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bobId", bobId);
		map.put("category", category);
		//System.out.println(bobId+"?????"+category);
		return sqlSession.selectOne("BobMapper.getBob", map);
	}

	@Override
	public void updateBob(Bob bob) throws Exception {
		sqlSession.update("BobMapper.updateBob", bob);
	}

	/* PARTICIPANT */
	@Override
	public int getParticipant(int userId, int bobId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bobId", bobId);
		map.put("userId", userId);
		
		Object result = sqlSession.selectOne("BobMapper.getParticipant", map);
		if(result != null) {
			return Integer.parseInt(result.toString());
		} else {
			return 0;
		}

	}
	
	@Override
	public void enterBob(int userId, int bobId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bobId", bobId);
		map.put("userId", userId);
		sqlSession.insert("BobMapper.enterBob", map);
	}
	
	@Override
	public void cancleBob(int participantId) throws Exception {
		sqlSession.delete("BobMapper.cancleParticipant", participantId);
	}

	@Override
	public void inviteBob(List<Integer> listUser, int bobId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", listUser);
		map.put("bobId", bobId);
		
		for (Integer integer : listUser) {
		}

		
		sqlSession.insert("BobMapper.inviteBob", map);
	}

	@Override
	public void deleteBob(int bobId) throws Exception {
		/* status update로 삭제된 방 구별 */
		sqlSession.update("BobMapper.deleteBob", bobId);
	}

	@Override
	public void setFeeBob(int participantId, boolean isAutoFee) throws Exception {
		
		String settingFee = "N";
		if(isAutoFee) {
			settingFee = "Y";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("participantId", participantId);
		map.put("settingFee", settingFee);
		
		sqlSession.update("BobMapper.setFeeBob",map);
	}

	@Override
	public void payFeeBob(Fee fee) throws Exception {
		sqlSession.insert("BobMapper.payFeeBob", fee);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("BobMapper.getTotalCount", search);
	}
	

}
