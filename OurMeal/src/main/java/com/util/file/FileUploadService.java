package com.util.file;

import org.springframework.stereotype.Service;

@Service
public class FileUploadService {

	public String saveFile(String path, FileVo file) {
		 String filePath = file.saveFile(path); 
		return filePath;
	}
	
}
