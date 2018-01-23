package com.zaching.service.voice;

import java.util.Map;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Voice;

public interface VoiceService {
	public String getSong() throws Exception;
	
	public Voice getVoice(int voiceID) throws Exception;
	
	public Map<String, Object>listVoice(Search search) throws Exception;
	
	public void addVoice(Voice voice) throws Exception;
	
	public void deleteVoice(int voiceID) throws Exception;
	
	public void updateCountUser(int voiceID) throws Exception;
	
	public void updateCountReply(int voiceID) throws Exception;
}
