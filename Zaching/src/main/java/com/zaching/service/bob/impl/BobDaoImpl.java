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
	public void addBob(Bob bob) throws Exception {
		sqlSession.insert("BobMapper.addBob", bob);		
	}

	@Override
	public List<Bob> listBob(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Participant> listParticipant() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Fee> listFeeBob(int bobId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Bob getBob(int bobId, String category) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bobId", bobId);
		map.put("category", category);
		return sqlSession.selectOne("BobMapper.getBob", map);
	}

	@Override
	public void updateBob(Bob bob) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void enterBob(int userId, int bobId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void inviteBob(int userId, int bobId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBob(int bobId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setFeeBob(int userId, String setting_fee) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void payFeeBob(int userId, int bobId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
