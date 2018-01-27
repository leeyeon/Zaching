package com.zaching.service.voice;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Voice;

public interface VoiceDao {
	public Voice getVoice(int voiceId) throws Exception;
	
	public List<Voice> listVoice(Search search) throws Exception;
	
	public void addVoice(Voice voice) throws Exception;
	
	public void deleteVoice(int voiceId) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public void updateCountUser(int voiceId) throws Exception;
	
	public void updateCountReply(int voiceId) throws Exception;
}
