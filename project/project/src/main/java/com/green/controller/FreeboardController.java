package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.entity.FreeBoard;
import com.green.service.freeBoardService;

@Controller
public class FreeboardController {
	
	@Autowired
	private freeBoardService freeboardService;
	
	// 자유게시판 상세보기
	@GetMapping("/freeBoardDetails/{freeBoardNo}")
	public String boardDetails(@PathVariable("freeBoardNo") Long freeBoardNo, Model model) {
		FreeBoard board = freeboardService.getBoardById(freeBoardNo);
		model.addAttribute("board",board);
		return "free/freeBoardDetails";
	}
	
	// 자유게시판 글 등록
	@PostMapping("/freeBoardWrite")
	public String saveBoard(@ModelAttribute FreeBoard freeboard) {
		freeboardService.saveBoard(freeboard);
		return "redirect:/main";
	}

	
}
