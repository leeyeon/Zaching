package com.zaching.service.bob;

import java.util.List;
import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Bob;

public interface BobService {

	public void addBob(Bob bob) throws Exception;
	
	public Map<String, Object> listBob(Search search) throws Exception;
	
	public Bob getBob(int bobId) throws Exception;
	
	public void updateBob(Bob bob) throws Exception;
	
	public void enterBob(int userId, int bobId) throws Exception;
	
	public void inviteBob(List<Integer> userId, int bobId) throws Exception;
	
	public void deleteBob(int bobId) throws Exception;
	
	public void setFeeBob(int userId, String setting_fee) throws Exception;
	
	public Map<String, Object> listFeeBob(int bobId) throws Exception;
	
	public void payFeeBob(int userId, int bobId) throws Exception;
	
}
