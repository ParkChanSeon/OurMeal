package com.util.file;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

public class FileVo {
	
	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;		
	}
	
	public String saveFile(String path) {
		boolean flag = true;
		
		File dir = new File(path);
		
		if( !dir.exists() )
			dir.mkdirs();
		
		Random random = new Random();
		
		String originFileName = file.getOriginalFilename();
		String fileName = "image_" + random.nextLong() + originFileName.substring(originFileName.indexOf("."));

		
		
		File f = new File(dir, fileName);
		
		System.out.println(file.getOriginalFilename());
		
		try {
			file.transferTo(f);
		} catch (Exception e) {	
			flag = false;
			e.printStackTrace();
		}
		
		return fileName;
	}
}








