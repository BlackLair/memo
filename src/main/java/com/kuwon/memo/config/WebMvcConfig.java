package com.kuwon.memo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kuwon.memo.common.FileManager;
import com.kuwon.memo.interceptor.PermissionInterceptor;

@Configuration // 서버를 켜는 과정에서 설정을 진행해준다.
public class WebMvcConfig implements WebMvcConfigurer{
	
	// /images/로 시작하는 리소스 요청이 들어올 때 반환해줄 리소스 경로를 등록
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManager.FILE_UPLOAD_PATH + "/");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		PermissionInterceptor interceptor = new PermissionInterceptor();
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**")						// 주어진 형태의 url만 인터셉터를 거치도록 함. /**은 모든 요청에 대해 인터셉터를 거침
		.excludePathPatterns("/user/logout", "/static/**", "/images/**");		// 주어진 형태의 url은 인터셉터를 거치지 않도록 함.
	}
}
