package com.zaching.service.user;

public interface MailService {
	
	  /** ���� ����
     *  @param subject ����
     *  @param text ����
     *  @param from ������ ���� �ּ�
     *  @param to �޴� ���� �ּ�
     *  @param filePath ÷�� ���� ���: ÷������ ������ null **/
    public boolean send(String subject, String text, String from, String to, String filePath);

    
    



}
