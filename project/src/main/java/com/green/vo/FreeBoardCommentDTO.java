package com.green.vo;

import java.util.Date;

import com.green.entity.FreeBoardComment;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FreeBoardCommentDTO {
	
    private Long freeBoardCommentNo;
    private String commentId;
    private String commentContent;
    private Date commentDate;
    
    public FreeBoardCommentDTO(FreeBoardComment comment) {
        this.freeBoardCommentNo = comment.getFreeBoardCommentNo();
        this.commentId = comment.getCommentId();
        this.commentContent = comment.getCommentContent(); // 수정된 부분
        this.commentDate = comment.getCommentDate(); // 수정된 부분
    }

}
