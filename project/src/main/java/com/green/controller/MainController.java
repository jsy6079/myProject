package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.entity.FreeBoard;
import com.green.service.freeBoardService;

@Controller
public class MainController {
	
	@Autowired
	private freeBoardService boardService;
	
	// 메인 이동 + 게시판 전체 조회
	@GetMapping("/main")
	public String main(Model model) {
		List<FreeBoard> boards = boardService.getAllBoard();
		model.addAttribute("boards",boards);
		
		return "main";
	}
	
	
	

}
