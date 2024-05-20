package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.green.entity.FreeBoard;
import com.green.repository.freeBoardRepository;

@Service
public class freeBoardService {
	
	@Autowired
	private freeBoardRepository freeboardrepository;
	
	// 자유 게시판 전체 조회
	public List<FreeBoard> getAllBoard(){
		return freeboardrepository.findAll(Sort.by(Sort.Direction.DESC, "freeBoardNo"));
	}
	
	// 자유 게시판 상세 조회
    @Transactional
    public FreeBoard getBoardById(Long freeBoardNo) {
        FreeBoard board = freeboardrepository.findById(freeBoardNo).orElse(null);
        if (board != null) {
            board.setFreeBoardView(board.getFreeBoardView() + 1);
            freeboardrepository.save(board);
        }
        return board;
    }
    
    // 자유 게시판 글 쓰기
    @Transactional
    public FreeBoard saveBoard(FreeBoard freeboard) {
    	return freeboardrepository.save(freeboard);
    }
    
    
    // 자유 게시판 페이징
    public Page<FreeBoard> getFreeBoards(int page, int size){
    	Pageable pageable = PageRequest.of(page, size, Sort.by("freeBoardNo").descending());
    	return freeboardrepository.findAll(pageable);
    }
	
}
