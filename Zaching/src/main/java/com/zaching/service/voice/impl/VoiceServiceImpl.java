package com.zaching.service.voice.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Voice;
import com.zaching.service.voice.VoiceDao;
import com.zaching.service.voice.VoiceService;

@Repository("voiceServiceImpl")
public class VoiceServiceImpl implements VoiceService{
	@Autowired
	@Qualifier("voiceDaoImpl")
	VoiceDao voiceDao;
	public void setVoiceDao(VoiceDao voiceDao) {
		this.voiceDao = voiceDao;
	}

	@Override
	public String getSong() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Voice getVoice(int voiceID) throws Exception {
		return voiceDao.getVoice(voiceID);
	}

	@Override
	public Map<String, Object> listVoice(Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Voice> list = voiceDao.listVoice(search);
		int count = voiceDao.getTotalCount(search);
		map.put("voiceList", list);
		map.put("totalCount", count);
		return map;
	}

	@Override
	public void addVoice(Voice voice) throws Exception {
		voiceDao.addVoice(voice);
		
	}

	@Override
	public void deleteVoice(int voiceID) throws Exception {
		voiceDao.deleteVoice(voiceID);
		
	}

	@Override
	public void updateCountUser(int voiceID) throws Exception {
		voiceDao.updateCountUser(voiceID);	
	}

	@Override
	public void updateCountReply(int voiceID) throws Exception {
		voiceDao.updateCountReply(voiceID);
	}

}
