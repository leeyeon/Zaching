package com.zaching.service.domain;

import java.util.Date;

public class Comment {
	
	private int commentId;
	private int roomId;
	/* �����ǵ�/��ģ��/���̽����� ���� */
	private String category;
	private int userId;
	private String content;
	private Date createdDate;
	/* ��ȸ ����/ ��ȸ �Ұ��� (���� ����) */
	private String status;

	public Comment() {
		// TODO Auto-generated constructor stub
	}

}
