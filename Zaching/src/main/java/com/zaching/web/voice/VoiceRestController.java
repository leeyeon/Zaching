package com.zaching.web.voice;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;

import java.sql.Blob;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;

import com.zaching.common.service.CommonService;
import com.zaching.service.domain.Comment;
import com.zaching.service.domain.Voice;
import com.zaching.service.voice.VoiceService;


@RestController
@RequestMapping("/voice/*")
public class VoiceRestController {
	final static int bufferSize = 1024;
	@Autowired
	@Qualifier("voiceServiceImpl")
	private VoiceService voiceService;
	
	@Autowired
	@Qualifier("commonServiceImpl")
	private CommonService commonService;
	
	public VoiceRestController() {
		System.out.println(this.getClass());
	}
	

	// 여기에서부터
	@RequestMapping(value="json/testUpload")
	public String testUpload(HttpServletRequest request) throws Exception{
		//System.out.println(link);
		
		byte[] buffer = new byte[1024 * 1024];
		
		InputStream input = request.getInputStream();
		OutputStream output = new FileOutputStream("C:\\Users\\jiwon\\Documents\\costam0.wav");
		int bytesRead;
		while((bytesRead = input.read(buffer)) != -1) {
			System.out.println(bytesRead);
			output.write(buffer, 0, bytesRead);
		}
		output.close();
		input.close();
		/*URL url = new URL((String)link.get("link")); 
		System.out.println("dd");
		String tDir = System.getProperty("java.io.tmpdir"); 
		System.out.println(tDir);
		String path = tDir + "tmp" + ".pdf"; 
		System.out.println("dd2");
		File file = new File(path); 
		file.deleteOnExit(); 
		FileUtils.copyURLToFile(url, file);*/
		//File file = (File)link.get("file");
		//String hlink = (String)link.get("link");
		//String fileName = (String)link.get("fileName");
		//Blob blob = (Blob)link.get("blob");
		
		/*InputStream is = blob.getBinaryStream();
		FileOutputStream fos = new FileOutputStream("C:\\" + fileName);
		int b = 0;
		while ((b = is.read()) != -1)
		{
		    fos.write(b); 
		}
		boolean result = false;
		System.out.println(hlink);
		System.out.println(fileName);
		/*File sourceFile = new File(hlink);
		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		FileChannel fcin = null;
		FileChannel fcout = null;
		
		inputStream = new FileInputStream(sourceFile);
		outputStream = new FileOutputStream("C:\\Users\\jiwon\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\audio"+fileName);
		
		fcin = inputStream.getChannel();
		fcout = outputStream.getChannel();
		
		long size = fcin.size();
		
		fcin.transferTo(0, size, fcout);
		
		fcout.close();
		fcin.close();
		outputStream.close();
		inputStream.close();
		result = true;
		
		File file = new File(hlink);
		if(file.delete()) {
			result = true;
		}*/
		/*
		FileInputStream fis = null;
		   ByteArrayOutputStream baos = new ByteArrayOutputStream();
		   fis= new FileInputStream((String)link.get("link"));
		   int len = 0;
		   byte[] buf =new byte[1024] ;
		   byte[] file_data = null;
		     while ((len=fis.read(buf))!=-1){
				  baos.write(buf, 0, len);
		     }
			file_data = baos.toByteArray();
			fis.close();
			baos.close();
			String size = String.valueOf(((String)link.get("link")).length());//파일 크기
			int a = Integer.parseInt(size);*/
			
		
		return "ㅎㅇ";
	}
	
	//여기까지
	
	@RequestMapping(value="json/replyVoice", method=RequestMethod.GET)
	public Comment replyVoice(@RequestBody Comment comment) throws Exception {
		System.out.println("voice/json/replyComment");
		
		return null;
	}
	
	@RequestMapping(value="rest/searchVoice", method=RequestMethod.POST)
	public String searchVoice(@RequestBody Map<String, Object> map , HttpSession session) throws Exception {
		System.out.println("voice/json/searchVoice");
		
		String addr = "http://apis.skplanetx.com/melon/songs"+"?appKey=";
		String serviceKey = "f28a60d4-8447-3157-b8af-12487d8b8a1a";
		String parameter = "";
		
		String searchKeyword = URLEncoder.encode(((String)map.get("keyword")), "UTF-8");
		
		
		parameter = parameter + "&" +"count=100";
		parameter = parameter + "&" +"page=1";
		parameter = parameter + "&" +"version=1";
		parameter = parameter + "&" + "searchKeyword="+ searchKeyword;
		parameter = parameter + "&" +"format=json";
		
		
		addr = addr + serviceKey + parameter;
			URL url = new URL(addr);
		
		InputStream is = null;
		InputStreamReader isr = null; 
		
		is = new URL(addr).openStream();
		isr = new InputStreamReader(is, "utf-8");
		
		StringBuffer sb = new StringBuffer();
		int c;
	
		while ((c = isr.read()) != -1) {
			sb.append((char) c);
		}

			System.out.println(sb.append((char) c).delete(sb.append((char) c).length()-2, sb.append((char) c).length()).toString());
		return sb.append((char) c).delete(sb.append((char) c).length()-2, sb.append((char) c).length()).toString();
	}

	@RequestMapping(value="json/listVoice", method=RequestMethod.POST)
	public List<Voice> listVoice(@RequestBody Search search) throws Exception{
		System.out.println("json/listVoice/listVoice()");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		System.out.println("search :: "+search);
		
		Map<String, Object> map = voiceService.listVoice(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), 9, search.getPageSize());
		System.out.println("resultPage :: "+resultPage);
		System.out.println("list :: "+ map.get("list"));
		System.out.println("listSize :: "+((List)map.get("list")).size());
		return (List)map.get("list");
	}

}
