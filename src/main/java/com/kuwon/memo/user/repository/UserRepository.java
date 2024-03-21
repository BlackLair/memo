package com.kuwon.memo.user.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kuwon.memo.user.domain.User;

@Mapper
public interface UserRepository {
	
	// 신규 회원 추가
	public int insertUser(
			@Param("loginId") String loginId
			,@Param("password") String password
			,@Param("name") String name
			,@Param("email") String email);
	
	public User selectUserByLoginIdAndPassword(@Param("loginId") String loginId
								, @Param("password")String password);
}
