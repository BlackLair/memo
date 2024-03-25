package com.kuwon.memo.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kuwon.memo.common.FileManager;
import com.kuwon.memo.post.domain.Post;
import com.kuwon.memo.post.repository.PostRepository;

@Service
public class PostService {
	@Autowired
	PostRepository postRepository;
	
	public int addPost(int userId, String title, String contents, MultipartFile file) {
		// 파일을 특정 위치에 저장
		String imagePath = FileManager.savefile(userId, file);
		
		return postRepository.insertPost(userId, title, contents, imagePath);
	}
	
	public List<Post> getPostList(int userId) {
		return postRepository.selectPostList(userId);
	}
	
	public Post getPost(int id) {
		return postRepository.selectPost(id);
	}
}
