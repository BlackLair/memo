package com.kuwon.memo.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {
	
	public final static String FILE_UPLOAD_PATH = "C:\\Users\\JW K\\Desktop\\megaIT\\springProject\\upload\\memo";
	
	// 파일 객체를 전달받고
	// 특정 위치에 파일을 저장하고
	// 클라이언트가 접근할 수 있는 url 문자열 리턴`
	public static String savefile(int userId, MultipartFile file){
		// 같은 이름의 파일 처리
		// 디렉토리(폴더)를 만들어서 파일 저장
		// 로그인한 사용자 userId를 디렉토리 이름에 추가
		// 현재시간 정보를 디렉토리 이름에 추가
		// UNIX TIME : 1970년 1월 1일부터 흐른 시간을 milli second로 표현한 시간
		// ex) 3_523975832
		
		if(file == null)
			return null;
		
		// 디렉토리 생성
		String directoryName = "/" + userId + "_" + System.currentTimeMillis();
		String directoryPath = FILE_UPLOAD_PATH + directoryName;	
		File directory = new File(directoryPath);
		if(!directory.mkdir()){
			// 디렉토리 생성 실패
			return null;
		}
		
		// 파일 저장
		String filePath = directoryPath + "/" + file.getOriginalFilename();
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
			directory.delete(); // 생성했던 디렉토리 삭제
			// 파일 저장 실패
			return null;
		}
		
		// 저장된 파일을 클라이언트에서 접근할 수 있는 url 문자열 리턴
		// url 규칙 : /images/3_23195209/test.png
		return "/images" + directoryName + "/" + file.getOriginalFilename();
	}
	
	// 파일 삭제
	public static boolean removeFile(String filePath){
		if(filePath == null) {
			return false;
		}
		String fullFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		
		Path path = Paths.get(fullFilePath);
		
		// 파일 존재 여부 확인
		if(Files.exists(path)) {
			try {
				Files.delete(path); // 파일 삭제
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
			
		}
		Path dirPath = path.getParent(); // 파일의 디렉터리 경로 얻음
		if(Files.exists(dirPath)) {
			try {
				Files.delete(dirPath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		
		return true;
	}
}
