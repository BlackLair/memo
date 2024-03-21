package com.kuwon.memo.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@GetMapping("/create-view")
	public String createView() {
		return "post/inputPost";
	}
	
	@GetMapping("/detail-view")
	public String detailView(@RequestParam("id")int id) {
		// 게시글 정보 조회
		
		return "post/detailPost";
	}
	
	@GetMapping("/list-view")
	public String listView() {
		return "post/listPost";
	}
}
