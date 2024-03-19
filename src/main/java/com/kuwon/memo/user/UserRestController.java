package com.kuwon.memo.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kuwon.memo.user.service.UserService;

@RequestMapping("/user")
@RestController // @Controller + @ResponseBody
public class UserRestController {
	@Autowired
	UserService userService;
	
	// 회원가입 요청
	@PostMapping("/join")
	public Map<String, String> join(
			@RequestParam("loginId")String loginId
			,@RequestParam("password") String password
			,@RequestParam("name") String name
			,@RequestParam("email") String email){
		int count = userService.addUser(loginId, password, name, email);
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {  	// 회원가입 성공 시
			resultMap.put("result", "success");
		}else {				// 회원가입 실패 시
			resultMap.put("result", "failure");
		}
		return resultMap;
	}
}
