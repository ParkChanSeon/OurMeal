package com.util.file;

import org.springframework.stereotype.Service;

@Service
public class FileUploadService {

	public boolean saveFile(String path, FileVo file) {
		boolean flag = file.saveFile(path);
		return flag;
	}
	
}
