package com.green.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import com.green.entity.FreeBoard;

public interface freeBoardRepository extends JpaRepository<FreeBoard, Long> {
	
	// 자유게시판 조회 내림차순
	List<FreeBoard> findAll(Sort sort);

}
