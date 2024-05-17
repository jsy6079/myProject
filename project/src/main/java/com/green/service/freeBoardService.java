package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.entity.FreeBoard;
import com.green.repository.freeBoardRepository;

@Service
public class freeBoardService {
	
	@Autowired
	private freeBoardRepository freeboardrepository;
	
	// 모든 게시글 조회
	public List<FreeBoard> getAllBoard(){
		return freeboardrepository.findAll(Sort.by(Sort.Direction.DESC, "freeBoardNo"));
	}
	
	// 상세보기 조회
    @Transactional
    public FreeBoard getBoardById(Long freeBoardNo) {
        FreeBoard board = freeboardrepository.findById(freeBoardNo).orElse(null);
        if (board != null) {
            board.setFreeBoardView(board.getFreeBoardView() + 1);
            freeboardrepository.save(board);
        }
        return board;
    }
//	public FreeBoard getBoardById(Long freeBoardNo) {
//		return freeboardrepository.findById(freeBoardNo).orElse(null);
//
//    }
	
}
