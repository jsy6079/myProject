package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.entity.FreeBoardComment;
import com.green.repository.freeBoardCommentRepository;

@Service
public class freeBoardCommentService {
	
	@Autowired
	private freeBoardCommentRepository freeboardcommentrepository;
	
	// 해당 자유게시판 댓글 전체 조회
	public List<FreeBoardComment> getAllCommnet(Long freeBoardNo){
		return freeboardcommentrepository.findByFreeBoard_freeBoardNo(freeBoardNo);
	}
	
	
	// 해당 자유게시판 댓글 등록
	public FreeBoardComment getCommnet(FreeBoardComment freeboardcommnet) {
		return freeboardcommentrepository.save(freeboardcommnet);
	}
	
	// 해당 자유게시판 댓글 수정
	
	
	// 해당 자유게시판 댓글 삭제

}
