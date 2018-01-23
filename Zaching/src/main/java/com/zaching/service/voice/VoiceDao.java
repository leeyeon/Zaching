package com.zaching.service.voice;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Voice;

public interface VoiceDao {
	public Voice getVoice(int voiceID) throws Exception;
	
	public List<Voice> listVoice(Search search) throws Exception;
	
	public void addVoice(Voice voice) throws Exception;
	
	public void deleteVoice(int voiceID) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public void updateCountUser(int voiceID) throws Exception;
	
	public void updateCountReply(int voiceID) throws Exception;
}
