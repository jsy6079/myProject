package com.green.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.entity.FreeBoard;
import com.green.entity.FreeBoardComment;
import com.green.service.freeBoardCommentService;
import com.green.service.freeBoardService;
import com.green.vo.FreeBoardCommentDTO;

@RestController
public class FreeboardCommentController {
	
	@Autowired
	private freeBoardCommentService freeboardcommentservice;
	
	@Autowired
	private freeBoardService freeboardservice;
	
	// 댓글 조회
	@GetMapping("/api/comment/freeboard/{freeBoardNo}")
	public List<FreeBoardCommentDTO> getCommentsByPostId(@PathVariable Long freeBoardNo) {
		List<FreeBoardComment> comments = freeboardcommentservice.getAllCommnet(freeBoardNo);
		return comments.stream()
			.map(FreeBoardCommentDTO::new)
			.collect(Collectors.toList());
	}
	
	// 댓글 등록
	@PostMapping("/api/comment/freeboard/{freeBoardNo}")
	public ResponseEntity<FreeBoardComment> addComment(@PathVariable Long freeBoardNo, @RequestBody FreeBoardComment freeboardcomment) {
		FreeBoard board = freeboardservice.getBoardById(freeBoardNo);
		if (board != null) {
			freeboardcomment.setFreeBoard(board);
			FreeBoardComment createdComment = freeboardcommentservice.getCommnet(freeboardcomment);
			return ResponseEntity.ok(createdComment);
		}
		return ResponseEntity.notFound().build();
	}
	
	
	// 댓글 삭제

    @DeleteMapping("/api/comment/freeboard/{freeBoardCommentNo}")
    public ResponseEntity<FreeBoardComment> deleteComment(@PathVariable Long freeBoardCommentNo) {
    	System.out.println("11 : "+freeBoardCommentNo);
    	freeboardcommentservice.deleteCommentById(freeBoardCommentNo);
        return ResponseEntity.ok().build();
        
    }

	


}
