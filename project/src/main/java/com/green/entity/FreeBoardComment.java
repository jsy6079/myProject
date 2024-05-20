package com.green.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="freeBoardComment")
@Setter
@Getter
public class FreeBoardComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "freeBoardComment_SEQ")
	@SequenceGenerator(name = "freeBoardComment_SEQ", sequenceName = "freeBoardComment_SEQ", allocationSize = 1)
	@Column(name="freeBoardCommentNo")
	private Long freeBoardCommentNo;
	
	@Column(name="CommentId", nullable = false)
	private String CommentId;
	
	@Column(name="CommnetContent",nullable = false, length = 300)
	private String CommnetContent;
	
	@Column(name="CommnetDate",nullable = false)
	private Date CommnetDate;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "freeBoardNo", referencedColumnName = "freeBoardNo")
	private FreeBoard freeBoard;

}
