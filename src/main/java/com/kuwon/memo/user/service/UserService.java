package com.kuwon.memo.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kuwon.memo.common.EncryptUtils;
import com.kuwon.memo.user.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	// 신규 회원가입 요청
	public int addUser(String loginId, String password, String name, String email) {
		String encryptPassword = EncryptUtils.md5(password);
		return userRepository.insertUser(loginId, encryptPassword, name, email);
	}
}
