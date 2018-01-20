package com.zaching.service.domain;

import java.util.Date;

public class Comment {
	
	private int commentId;
	private int roomId;
	/* 뉴스피드/밥친구/보이스리플 구분 */
	private String category;
	private int userId;
	private String content;
	private Date createdDate;
	/* 조회 가능/ 조회 불가능 (삭제 유무) */
	private String status;

	public Comment() {
		// TODO Auto-generated constructor stub
	}

}
