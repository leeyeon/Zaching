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
	private SqlSession sqlsession;
	
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Override
	public Voice getVoice(int voiceId) throws Exception {
		return (Voice)sqlsession.selectOne("VoiceMapper.getVoice", voiceId);
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
	public void deleteVoice(int voiceId) throws Exception {
		sqlsession.delete("VoiceMapper.deleteVoice", voiceId);
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlsession.selectOne("VoiceMapper.getTotalCount", search);
	}

	@Override
	public void updateCountUser(int voiceId) throws Exception {
		sqlsession.update("VoiceMapper.updateCountUser", voiceId);
	}

	@Override
	public void updateCountReply(int voiceId) throws Exception {
		sqlsession.update("VoiceMapper.updateCountReply", voiceId);
	}
	
	
	
	
}
