package com.kuwon.memo.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@Controller
public class UserController {
	// 회원가입 페이지로 이동
	@GetMapping("/join-view")
	public String inputJoin() {
		return "user/join";
	}
	// 로그인 페이지로 이동
	@GetMapping("/login-view")
	public String login() {
		return "user/login";
	}
	
	// 사용자 로그아웃 (API 아님)
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		// 세션에 저장된 사용자 정보 삭제
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		
		// 로그인 페이지로 리다이렉트
		return "redirect:/user/login-view";
	}
}
