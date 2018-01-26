package com.zaching.common.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileDao {
	
	public String addFile(String fileDirectory, MultipartFile uploadFile);

}
