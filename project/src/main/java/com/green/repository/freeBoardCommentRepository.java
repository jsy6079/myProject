package com.green.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.entity.FreeBoardComment;

public interface freeBoardCommentRepository extends JpaRepository<FreeBoardComment, Long> {
	
	// 해당 자유게시판의 아이디에 해당하는 댓글 목록 불러오기

	List<FreeBoardComment> findByFreeBoard_freeBoardNoOrderByCommentDateAsc(Long freeBoardNo);


	

}
