package com.green.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="freeBoard")
@Setter
@Getter
public class FreeBoard {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "freeBoard_SEQ")
	@SequenceGenerator(name = "freeBoard_SEQ", sequenceName = "freeBoard_SEQ", allocationSize = 1)
	@Column(name="freeBoardNo")
	private Long freeBoardNo;
	
	@Column(name="freeBoardTitle",nullable = false)
	private String freeBoardTitle;
	
	@Column(name="freeBoardContent", nullable = false)
	private String freeBoardContent;
	
	@Column(name="freeBoardWriter", nullable = false)
	private String freeBoardWriter;
	
	@Column(name="freeBoardDate", nullable = false)
	private Date freeBoardDate;
	
	@Column(name="freeBoardView", nullable = false)
	private Long freeBoardView;
	
}
