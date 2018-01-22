package com.zaching.service.voice.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Voice;
import com.zaching.service.voice.VoiceService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class VoiceServiceTest {
	@Autowired
	@Qualifier("voiceServiceImpl")
	private VoiceService voiceService;
	
	//@Test
	public void testAddVoice() throws Exception{
		Voice voice = new Voice();
		voice.setBackgroundImage("jinsu.jpg");
		voice.setCountReply(9);
		voice.setCountUser(10);
		voice.setUserID(6);
		voice.setVoiceCategory("0");
		voice.setVoicelyrics("you~~ 비가오는 거리에~");
		voice.setVoiceName("노래 이어부릅시다~");
		
		System.out.println(voice);
		
		voiceService.addVoice(voice);
		
		voice = voiceService.getVoice(2);
		
		Assert.assertEquals("you~~ 비가오는 거리에~", voice.getVoicelyrics());
	}
	
	//@Test
	public void testUpdateCount() throws Exception{
		voiceService.updateCountReply(1);
		
		Voice voice = voiceService.getVoice(1);
		System.out.println(voice);
		
		Assert.assertEquals(19, voice.getCountReply());
	}
	
	@Test
	public void testVoiceList() throws Exception{
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("2");
	 	search.setSearchKeyword("부릅시다");
	 	Map<String,Object> map = voiceService.listVoice(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("count");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("노래");
	 	map = voiceService.listVoice(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
		//==> console 확인
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	}

	
}