package com.zaching.service.bob.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.service.bob.BobDao;
import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;

@Service("bobServiceImpl")
public class BobServiceImpl implements BobService {

	@Autowired
	@Qualifier("bobDaoImpl")
	private BobDao bobDao;
	
	public void setBobDao(BobDao bobDao) {
		this.bobDao = bobDao;
	}
	
	public BobServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addBob(Bob bob) throws Exception {
		bobDao.addBob(bob);
	}

	@Override
	public Map<String, Object> listBob(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Bob getBob(int bobId) throws Exception {
		// TODO Auto-generated method stub
		return null;
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
	public void inviteBob(List<Integer> userId, int bobId) throws Exception {
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

}
