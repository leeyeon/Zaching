package com.zaching.service.bob;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Fee;

public interface BobDao {

	public void addBob(Bob bob) throws Exception;
	
	public List<Bob> listBob(Search search) throws Exception;
	
	public Bob getBob(int bobId) throws Exception;
	
	public void updateBob(Bob bob) throws Exception;
	
	public void enterBob(int userId, int bobId) throws Exception;
	
	public void inviteBob(int userId, int bobId) throws Exception;
	
	public void deleteBob(int bobId) throws Exception;
	
	public void setFeeBob(int userId, String setting_fee) throws Exception;
	
	public List<Fee> listFeeBob(int bobId) throws Exception;
	
	public void payFeeBob(int userId, int bobId) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
}
