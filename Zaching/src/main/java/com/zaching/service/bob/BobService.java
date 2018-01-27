package com.zaching.service.bob;

import java.util.List;
import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Fee;

public interface BobService {

	public void addBob(Bob bob) throws Exception;
	
	public Map<String, Object> listBob(Search search) throws Exception;
	
	//public Map<String, Object> listFeeBob(int bobId) throws Exception;
	
	public Map<String, Object> getBob(int bobId, String category, int monthFee) throws Exception;
	
	public Map<String, Object> getBob(int bobId, String category) throws Exception;
	
	public Bob getBobInfo(int bobId, String category) throws Exception;
	
	public void updateBob(Bob bob) throws Exception;
	
	// 참석중이면 삭제되고 참석 중이 아니면 추가시킴
	public void enterBob(int userId, int bobId) throws Exception;
	
	public void inviteBob(List<Integer> listUser, int bobId) throws Exception;
	
	public void deleteBob(int bobId) throws Exception;
	
	public void setFeeBob(int participantId, boolean isAutoFee) throws Exception;
	
	public void payFeeBob(Fee fee) throws Exception;
	
}
