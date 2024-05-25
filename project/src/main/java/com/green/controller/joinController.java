package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class joinController {
	
	// 회원가입 페이지로 이동
	@GetMapping("/user/joinMember")
	public String getjoinMember() {
		return "user/joinMember";
	} 
	
	// 로그인 페이지로 이동
	@GetMapping("/user/login")
	public String getlogin() {
		return "user/login";
	}

}
