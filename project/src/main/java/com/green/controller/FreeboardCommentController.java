package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.entity.FreeBoardComment;
import com.green.service.freeBoardCommentService;

@RestController
public class FreeboardCommentController {
	
	@Autowired
	private freeBoardCommentService freeboardcommentservice;
	
	
	// 댓글 조회
	@GetMapping("/comment/{freeBoardNo}")
	  public List<FreeBoardComment> getCommentsByPostId(@PathVariable Long freeBoardNo) {
	        return freeboardcommentservice.getAllCommnet(freeBoardNo);
	    }
	
	// 댓글 등록
	@PostMapping("/comment")
	public FreeBoardComment addComment(@RequestBody FreeBoardComment freeboardcomment) {
	    return freeboardcommentservice.getCommnet(freeboardcomment);
	}

}
