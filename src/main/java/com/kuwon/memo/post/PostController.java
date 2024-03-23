package com.kuwon.memo.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kuwon.memo.post.domain.Post;
import com.kuwon.memo.post.service.PostService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/post")
@Controller
public class PostController {
	@Autowired
	private PostService postService;
	
	@GetMapping("/create-view")
	public String createView() {
		return "post/inputPost";
	}
	
	@GetMapping("/detail-view")
	public String detailView(@RequestParam("id")int id, Model model) {
		// 게시글 정보 조회
		Post post = postService.getPost(id);
		model.addAttribute("post", post);
		return "post/detailPost";
	}
	
	@GetMapping("/list-view")
	public String listView(Model model, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		List<Post> postList = postService.getPostList(userId);
		model.addAttribute("postList", postList);
		return "post/listPost";
	}
}
