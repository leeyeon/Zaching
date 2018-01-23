package com.zaching.service.voice.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Voice;
import com.zaching.service.voice.VoiceDao;

@Repository("voiceDaoImpl")
public class VoiceDaoImpl implements VoiceDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSession sqlsession;
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Override
	public Voice getVoice(int voiceID) throws Exception {
		return (Voice)sqlsession.selectOne("VoiceMapper.getVoice", voiceID);
	}

	@Override
	public List<Voice> listVoice(Search search) throws Exception {
		return sqlsession.selectList("VoiceMapper.getVoiceList", search);
	}

	@Override
	public void addVoice(Voice voice) throws Exception {
		sqlsession.insert("VoiceMapper.addVoice", voice);
		
	}

	@Override
	public void deleteVoice(int voiceID) throws Exception {
		sqlsession.delete("VoiceMapper.deleteVoice", voiceID);
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlsession.selectOne("VoiceMapper.getTotalCount", search);
	}

	@Override
	public void updateCountUser(int voiceID) throws Exception {
		sqlsession.update("VoiceMapper.updateCountUser", voiceID);
	}

	@Override
	public void updateCountReply(int voiceID) throws Exception {
		sqlsession.update("VoiceMapper.updateCountReply", voiceID);
	}
	
	
	
	
}
