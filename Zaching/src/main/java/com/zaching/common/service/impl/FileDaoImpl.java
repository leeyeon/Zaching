package com.zaching.common.service.impl;

import java.io.File;
import java.util.Calendar;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.zaching.common.service.FileDao;

@Repository("fileDaoImpl")
public class FileDaoImpl implements FileDao {

	public FileDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	
	/*
	 * fileDirectory : file이 들어갈 경로 맨 뒤에 \\ 필수 입력.
	 * (ex) C:\\Users\\301-6\\git\\Zaching\\Zaching\\WebContent\\resources\\upload_files\\images\\
	 * */

	@Override
	public String addFile(String fileDirectory, MultipartFile uploadFile) {
		
		Calendar calendar = Calendar.getInstance();
		
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		String monthStr = "";
		
		if(month < 10) {
			monthStr = "0"+month;
		} else {
			monthStr = ""+month;
		}
		
		// 파일경로+현재날짜
		String url = fileDirectory+year+monthStr;
		// 
		String realFileName;
		
		try {
			//MultipartFile uploadFile = bob.getUploadFile();
			//System.out.println("uploadFile :: "+bob.getUploadFile());
			if(uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				//System.out.println("fileName :: " +fileName);
				String fileNameExt = fileName.substring(fileName.indexOf(".")+1);
				
				if(!"".equals(fileName)) {
					
					File loc = new File(url);
					
					if(!loc.exists()) {
						loc.mkdirs();
					}
			        
			        realFileName = String.format("%s.%s", RandomStringUtils.randomAlphanumeric(8), fileNameExt);
					
					File file = new File(url, realFileName);
					//System.out.println("RandomStringUtils... :: "+realFileName);
					
					//bob.setImage(realFileName);
					uploadFile.transferTo(file);
					
					return year+monthStr+"\\"+realFileName;
				}
			}	
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
