package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.Page;

import com.green.entity.FreeBoard;
import com.green.service.freeBoardService;

@Controller
public class MainController {
	
	@Autowired
	private freeBoardService freeBoardService;
	
	// 메인 이동 + 게시판 전체 조회 (페이징 적용)
	@GetMapping("/main")
	public String main(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "0") int size,  Model model) {
		
		if(size < 1) {
			size = 10;
		}
		
		Page<FreeBoard> freeBoardPage = freeBoardService.getFreeBoards(page, size);
		model.addAttribute("freeBoardPage", freeBoardPage);
		
		return "main";
	}
	
	// 글 쓰기 페이지 이동
	@GetMapping("/free/freeBoardWrite")
	public String freeBoardWrite() {
		return "free/freeBoardWrite";
	}
	
	
	

}
