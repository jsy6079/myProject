package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.entity.User;
import com.green.service.UserService;
import com.green.service.freeBoardService;

@Controller
public class joinController {
	
	@Autowired
	private UserService userservice;
	
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
	
	// 회원가입 전송
	@PostMapping("/signin")
	public String signin(@ModelAttribute User user) {
		userservice.getsignin(user);
		return "user/login";
	}

}
