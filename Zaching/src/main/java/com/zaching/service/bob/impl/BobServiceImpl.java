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
 * 작성자 : 이연희
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
		/* 방ID 리턴 값으로 방장도 참여자 테이블에 추가시키기 */
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

	
	/* month 0: 현재달 1: 지난달 2: 2달 전
		 paid_date 없으면 이번달 회비 안낸거임
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
		//System.out.println("참가 시퀀스 id : "+participantId);
		
		int result = 0;
		
		/* 참가 중이 아닐때 */
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

        // Workbook 생성
        Workbook xlsWb = new HSSFWorkbook(); // Excel 2007 이전 버전
 
        // *** Sheet-------------------------------------------------
        // Sheet 생성
        Sheet sheet = xlsWb.createSheet("firstSheet");
 
        // 컬럼 너비 설정
        sheet.setColumnWidth(0, 1000);
        sheet.setColumnWidth(1, 4500);
        sheet.setColumnWidth(2, 4500);
        sheet.setColumnWidth(3, 3000);
        // ----------------------------------------------------------
         
        // *** Style--------------------------------------------------
        // Cell 스타일 생성
        CellStyle cellStyle = xlsWb.createCellStyle();

        cellStyle.setAlignment(HorizontalAlignment.CENTER);

        // 줄 바꿈
        // cellStyle.setWrapText(true);
         
        // Cell 색깔, 무늬 채우기
        //cellStyle.setFillForegroundColor(new XSSFColor(Color.decode("#FF0000")).getIndexed());
         
        Row row = null;
        Cell cell = null;
        //----------------------------------------------------------
        
        
        
        // 첫 번째 줄
        row = sheet.createRow(0);
        
        cell = row.createCell(4);
        cell.setCellValue("이름");
        
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 4, list.size()+3));
        cell.setCellStyle(cellStyle);
        
        row = sheet.createRow(1);
         
        cell = row.createCell(1);
        cell.setCellValue("회비달");
        cell.setCellStyle(cellStyle);
        cell = row.createCell(2);
        cell.setCellValue("낸 날짜");
        cell.setCellStyle(cellStyle);
        cell = row.createCell(3);
        cell.setCellValue("회비");
        cell.setCellStyle(cellStyle);
        
        for(int i = 0; i < list.size(); i++) {
        	cell = row.createCell(i+4);
            cell.setCellValue(list.get(i).getParticipantName());
        }
        
        //---------------------------------
        // 두 번째 줄
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
 
        // excel 파일 저장
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
