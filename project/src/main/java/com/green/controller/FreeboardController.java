package com.green.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	// 자유게시판 글 수정 폼 데이터 가져오기
	@GetMapping("/free/freeBoardEdit/{freeBoardNo}")
	public String showEditFreeBoard(@PathVariable("freeBoardNo") Long freeBoardNo, Model model) {
		FreeBoard freeboard = freeboardService.getEditBoardById(freeBoardNo);
		model.addAttribute("board",freeboard);
		return "free/freeBoardEdit";
	}
	
    // 자유게시판 수정 처리
    @PostMapping("/free/freeBoardEditSubmit/{freeBoardNo}")
    public String freeBoardEditForm(
            @PathVariable Long freeBoardNo,
            @RequestParam("freeBoardTitle") String freeBoardTitle,
            @RequestParam("freeBoardContent") String freeBoardContent,
            @RequestParam("freeBoardWriter") String freeBoardWriter,
            @RequestParam("freeBoardView") Long freeBoardView,
            @RequestParam("freeBoardDate") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date freeBoardDate,
            Model model) {
    	
    	// 이전 조회수를 가져옴
        FreeBoard existingFreeBoard = freeboardService.getBoardById(freeBoardNo);
        Long previousViewCount = existingFreeBoard.getFreeBoardView();

        FreeBoard freeBoard = new FreeBoard();
        freeBoard.setFreeBoardNo(freeBoardNo);
        freeBoard.setFreeBoardTitle(freeBoardTitle);
        freeBoard.setFreeBoardContent(freeBoardContent);
        freeBoard.setFreeBoardWriter(freeBoardWriter);
        freeBoard.setFreeBoardView(freeBoardView);
        freeBoard.setFreeBoardDate(freeBoardDate);

        freeboardService.updateFreeBoards(freeBoard);
        
        // 수정 전의 조회수와 현재 조회수를 비교하여 차이를 계산하고, 차이만큼 조회수 감소
        Long viewCountDifference = previousViewCount - freeBoardView;
        if (viewCountDifference > 0) {
            freeboardService.decreaseViewCount(freeBoardNo, viewCountDifference);
        }

        return "redirect:/freeBoardDetails/"+freeBoardNo;
    }
	
	
	// 자유게시판 글 삭제
	@GetMapping("/free/freeBoardDelete/{freeBoardNo}")
	public String freeBoardDelete(@PathVariable("freeBoardNo") Long freeBoardNo) {
		freeboardService.deleteFreeBoards(freeBoardNo);
		return "redirect:/main";
	}
	
}
