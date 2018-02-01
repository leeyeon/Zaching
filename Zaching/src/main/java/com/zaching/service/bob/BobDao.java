package com.zaching.service.bob;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Participant;

public interface BobDao {

	public int addBob(Bob bob) throws Exception;
	
	public List<Bob> listBob(Search search) throws Exception;
	
	public List<Participant> listParticipant(int bobId) throws Exception;
	
	public List<Participant> listFeeBob(int bobId, int month) throws Exception;
	
	public Bob getBob(int bobId, String category) throws Exception;
	
	public void updateBob(Bob bob) throws Exception;
	
	public int getParticipant(int userId, int bobId) throws Exception;
	
	public int enterBob(int userId, int bobId) throws Exception;
	
	public int cancleBob(int participantId) throws Exception;
	
	public void inviteBob(List<Integer> listUser, int bobId) throws Exception;
	
	public void deleteBob(int bobId) throws Exception;
	
	public void blockBob(int bobId) throws Exception;
	
	public void setFeeBob(int participantId, boolean isAutoFee) throws Exception;
	
	public void payFeeBob(int participantId, int paidFee) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
}
