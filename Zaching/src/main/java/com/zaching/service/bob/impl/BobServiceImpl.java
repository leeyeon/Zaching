package com.zaching.service.bob.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.service.bob.BobDao;
import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Participant;

/*
 * �ۼ��� : �̿���
 * */

@Service("bobServiceImpl")
public class BobServiceImpl implements BobService {

	@Autowired
	@Qualifier("bobDaoImpl")
	private BobDao bobDao;
	
	public void setBobDao(BobDao bobDao) {
		this.bobDao = bobDao;
	}
	
	public BobServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addBob(Bob bob) throws Exception {
		bobDao.addBob(bob);
		System.out.println(bob.getBobId());
		/* ��ID ���� ������ ���嵵 ������ ���̺� �߰���Ű�� */
		bobDao.enterBob(bob.getWrittenUserId(), bob.getBobId());
	}

	@Override
	public Map<String, Object> listBob(Search search) throws Exception {

		List<Bob> list = bobDao.listBob(search);
		int totalCount = bobDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (Bob bob : list) {
			bob.setParticipantList(bobDao.listParticipant(bob.getBobId()));
		}
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	
	/* month 0: ����� 1: ������ 2: 2�� ��
		 paid_date ������ �̹��� ȸ�� �ȳ�����
	*/
	@Override
	public Map<String, Object> getBob(int bobId, String category, int monthFee) throws Exception {
		
		List<Participant> feeList = bobDao.listFeeBob(bobId, monthFee);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bob", bobDao.getBob(bobId, category));
		map.put("participant", feeList);
		return map;
	}
	
	@Override
	public Map<String, Object> getBob(int bobId, String category) throws Exception {
		
		List<Participant> list = bobDao.listParticipant(bobId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bob", bobDao.getBob(bobId, category));
		map.put("participant", list);
		return map;
	}
	
	@Override
	public Bob getBobInfo(int bobId, String category) throws Exception {
		return bobDao.getBob(bobId, category);
	}

	@Override
	public void updateBob(Bob bob) throws Exception {
		bobDao.updateBob(bob);
	}

	@Override
	public boolean enterBob(int userId, int bobId) throws Exception {
		
		int participantId = bobDao.getParticipant(userId, bobId);
		//System.out.println("���� ������ id : "+participantId);
		
		int result = 0;
		
		/* ���� ���� �ƴҶ� */
		if(participantId == 0) {
			result = bobDao.enterBob(userId, bobId);
		} else {
			result = bobDao.cancleBob(participantId);
		}
		
		if(result==1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void inviteBob(List<Integer> listUser, int bobId) throws Exception {
		bobDao.inviteBob(listUser, bobId);
	}

	@Override
	public void deleteBob(int bobId) throws Exception {
		bobDao.deleteBob(bobId);
	}
	
	@Override
	public void blockBob(int bobId) throws Exception {
		bobDao.blockBob(bobId);
	}

	@Override
	public void setFeeBob(int participantId, boolean isAutoFee) throws Exception {
		bobDao.setFeeBob(participantId, isAutoFee);
	}

	@Override
	public void payFeeBob(int participantId, int paidFee) throws Exception {
		bobDao.payFeeBob(participantId, paidFee);
	}
	
	@Override
	public void excel(int bobId) throws Exception {
		
		List<Participant> list = bobDao.listFeeBob(bobId, -1);
		
		for (Participant participant : list) {
			System.out.println(participant);
		}

        // Workbook ����
        Workbook xlsWb = new HSSFWorkbook(); // Excel 2007 ���� ����
 
        // *** Sheet-------------------------------------------------
        // Sheet ����
        Sheet sheet = xlsWb.createSheet("firstSheet");
 
        // �÷� �ʺ� ����
        sheet.setColumnWidth(0, 1000);
        sheet.setColumnWidth(1, 4500);
        sheet.setColumnWidth(2, 4500);
        sheet.setColumnWidth(3, 3000);
        // ----------------------------------------------------------
         
        // *** Style--------------------------------------------------
        // Cell ��Ÿ�� ����
        CellStyle cellStyle = xlsWb.createCellStyle();

        cellStyle.setAlignment(HorizontalAlignment.CENTER);

        // �� �ٲ�
        // cellStyle.setWrapText(true);
         
        // Cell ����, ���� ä���
        //cellStyle.setFillForegroundColor(new XSSFColor(Color.decode("#FF0000")).getIndexed());
         
        Row row = null;
        Cell cell = null;
        //----------------------------------------------------------
        
        
        
        // ù ��° ��
        row = sheet.createRow(0);
        
        cell = row.createCell(4);
        cell.setCellValue("�̸�");
        
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 4, list.size()+3));
        cell.setCellStyle(cellStyle);
        
        row = sheet.createRow(1);
         
        cell = row.createCell(1);
        cell.setCellValue("ȸ���");
        cell.setCellStyle(cellStyle);
        cell = row.createCell(2);
        cell.setCellValue("�� ��¥");
        cell.setCellStyle(cellStyle);
        cell = row.createCell(3);
        cell.setCellValue("ȸ��");
        cell.setCellStyle(cellStyle);
        
        for(int i = 0; i < list.size(); i++) {
        	cell = row.createCell(i+4);
            cell.setCellValue(list.get(i).getParticipantName());
        }
        
        //---------------------------------
        // �� ��° ��
        for (int i = 2; i < 10; i++) {
        	row = sheet.createRow(i);

            cell = row.createCell(1);
            cell.setCellValue("2018.02.04");
            
            cell = row.createCell(2);
            cell.setCellValue("2018.02.01");
             
            cell = row.createCell(3);
            cell.setCellValue(list.get(0).getFee());
            
            for(int j = 0; j < list.size(); j++) {
            	cell = row.createCell(j+4);
                cell.setCellValue("O");
            }
		}
 
        // excel ���� ����
        try {
            File xlsFile = new File("D:/testExcel.xls");
            FileOutputStream fileOut = new FileOutputStream(xlsFile);
            xlsWb.write(fileOut);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
         
    }

}
