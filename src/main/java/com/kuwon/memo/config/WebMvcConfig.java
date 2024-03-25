package com.kuwon.memo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kuwon.memo.common.FileManager;

@Configuration // 서버를 켜는 과정에서 설정을 진행해준다.
public class WebMvcConfig implements WebMvcConfigurer{
	
	// /images/로 시작하는 리소스 요청이 들어올 때 반환해줄 리소스 경로를 등록
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManager.FILE_UPLOAD_PATH + "/");
	}
}
