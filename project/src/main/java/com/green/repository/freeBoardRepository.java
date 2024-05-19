package com.green.repository;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.green.entity.FreeBoard;

public interface freeBoardRepository extends JpaRepository<FreeBoard, Long> {
	
//	// 자유게시판 조회 내림차순
//	List<FreeBoard> findAll(Sort sort);
	
	// 자유게시판 페이징
	Page<FreeBoard> findAll(Pageable pageable);

}
