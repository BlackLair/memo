package com.kuwon.memo.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kuwon.memo.post.service.PostService;

import jakarta.servlet.http.HttpSession;

@RestController
public class PostRestController {
	@Autowired
	PostService postService;
	
	// 메모 입력
	@PostMapping("/post/create")
	public Map<String, String> createMemo(
			@RequestParam("title") String title
			,@RequestParam("contents") String contents
			, @RequestParam(value="imageFile", required=false) MultipartFile file
			, HttpSession session){
		// 세션에 저장된 userId 값을 얻어온다.
		//  -> 로그인한 사용자의 primary key를 얻기 위함
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postService.addPost(userId, title, contents, file);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "failure");
		}
	
		return resultMap;
	}
}