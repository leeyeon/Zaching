package com.zaching.service.bob.test;

import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.zaching.common.domain.Search;
import com.zaching.service.bob.BobService;
import com.zaching.service.domain.Bob;
import com.zaching.service.domain.Participant;

/*
 * 작성자 : 이연희
 * */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class BobServiceTest {

	@Autowired
	@Qualifier("bobServiceImpl")
	private BobService bobService;
	
	/* 방장 */
	private int userId = 6;
	/* 참여자1 */
	private int part1 = 5;
	/* 참여자2 */
	private int part2 = 7;
	/* default 우리지금만나 */
	private String category = "B01";
	/* 방 ID */
	private int bobId = 4;
	
	//@Test
	public void addBobB01() throws Exception {
		Bob bob = new Bob();
		bob.setCategory(category);
		bob.setTitle("참여자등록됬는지 확인하는 방");
		bob.setContent("우오오오왕");
		bob.setWrittenUserId(userId);
		
		bobService.addBob(bob);
	}
	
	//@Test
	public void addBobB03() throws Exception {

		Calendar calendar = Calendar.getInstance();
		Date abc = calendar.getTime();
		calendar.set(calendar.DATE, 4);
		Date date = calendar.getTime();
		
		Bob bob = new Bob();
		bob.setCategory("B03");
		bob.setTitle("계모임방입니다");
		bob.setContent("환영합니당");
		bob.setWrittenUserId(userId);
		bob.setFee(20000);
		//bob.setFeeDate(date);
		
		System.out.println(bob);
		
		bobService.addBob(bob);
	}
	
	//@Test
	public void listBob() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		search.setCategory("B01");
		
		Map<String, Object> map = bobService.listBob(search);
		List<Bob> list = (List<Bob>)map.get("list");
		
		for (Bob bob : list) {
			System.out.println(bob);
		}
		
		int totalCount = (int)map.get("totalCount");
		
		System.out.println("list Size :: "+list.size()+" &totalCount::"+totalCount);
	}
	
	//@Test
	public void getBob() throws Exception {
		Map<String, Object> map = bobService.getBob(11, "B03", 0);
		System.out.println(map.get("bob").toString());
		
		List<Participant> list = (List<Participant>)map.get("participant");
		for (Participant participant : list) {
			System.out.println(participant);
		}
		
		/*
		List<Fee> feeList = (List<Fee>)map.get("fee");
		for (Fee fee : feeList) {
			System.out.println(fee);
		}
		*/
	}
	
	//@Test
	public void updateBob() throws Exception {
		Bob bob = new Bob();
		bob.setCategory(category);
		bob.setTitle("밥친구방()");
		bob.setContent("안녕하세요");
		bob.setWrittenUserId(userId);
		bob.setBobId(bobId);
		bob.setLocationName("아차산역");
		bob.setLatitude("37.552121");
		bob.setLongitude("127.089627");
		
		bobService.updateBob(bob);
	}
	
	//@Test
	public void enterBob() throws Exception {
		//bobService.enterBob(part1, bobId);
		bobService.enterBob(part1, 11);
	}

	//@Test
	public void inviteBob() throws Exception {
		
		List<Integer> listUser = new ArrayList<Integer>();
		listUser.add(123);
		
		bobService.inviteBob(listUser, bobId);
	}
	
	//@Test
	public void deleteBob() throws Exception {
		bobService.deleteBob(bobId);
	}

	//@Test
	public void setFeeBob() throws Exception {
		bobService.setFeeBob(7, true);
	}
	
	//@Test
	public void payFeeBob() throws Exception {
		/*
		Fee fee = new Fee();
		fee.setPaidFee(20000);
		fee.setParticipantId(15);
		
		bobService.payFeeBob(fee);
		*/
	}
	
	//@Test
	public void test() throws Exception {
		Calendar calendar = Calendar.getInstance();
		
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		String monthStr = "";
		
		System.out.println(calendar.get(Calendar.MONTH));
		
		if(month < 10) {
			monthStr = "0"+month;
		} else {
			monthStr = ""+month;
		}
		
		System.out.println(monthStr);
		
	}
	
	@Test
	public void excel() {
         
        // Workbook 생성
        Workbook xlsWb = new HSSFWorkbook(); // Excel 2007 이전 버전
 
        // *** Sheet-------------------------------------------------
        // Sheet 생성
        Sheet sheet = xlsWb.createSheet("firstSheet");
 
        // 컬럼 너비 설정
        sheet.setColumnWidth(0, 1000);
        sheet.setColumnWidth(9, 1000);
        // ----------------------------------------------------------
         
        // *** Style--------------------------------------------------
        // Cell 스타일 생성
        CellStyle cellStyle = xlsWb.createCellStyle();
         
        // 줄 바꿈
        cellStyle.setWrapText(true);
         
        // Cell 색깔, 무늬 채우기
        cellStyle.setFillForegroundColor(new XSSFColor(Color.decode("#FF0000")).getIndexed());
         
        Row row = null;
        Cell cell = null;
        //----------------------------------------------------------
         
        // 첫 번째 줄
        row = sheet.createRow(0);
         
        cell = row.createCell(1);
        cell.setCellValue("이름");
         
        cell = row.createCell(2);
        cell.setCellValue("회비달");
        //cell.setCellStyle(cellStyle); // 셀 스타일 적용
        
        cell = row.createCell(3);
        cell.setCellValue("회비");
        
        cell = row.createCell(4);
        cell.setCellValue("회비유무");
        
        //---------------------------------
         
        // 두 번째 줄
        row = sheet.createRow(1);
         
        // 두 번째 줄에 Cell 설정하기-------------
        cell = row.createCell(0);
        cell.setCellValue("2-1");
         
        cell = row.createCell(1);
        cell.setCellValue("2-2");
         
        cell = row.createCell(2);
        cell.setCellValue("2-3");
        cell.setCellStyle(cellStyle); // 셀 스타일 적용
        //---------------------------------
 
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
	
	//@Test
	public void testDate() {
		String date = "2018-02-15 오후 03:25";
		
		if(date.indexOf("오후") == -1) {
			System.out.println(date.substring(date.indexOf("오전")));
		} else {
			int index = date.indexOf("오후");
			System.out.println("ㅇㅅㅇ ::"+
					date.substring(0, index)+date.substring(index+3));
			
			System.out.println(date.substring(index+3 , index+5));
			
			int result = Integer.parseInt(date.substring(index+3 , index+5)) + 12;
			System.out.println(result);
			
			System.out.println(date.substring(0, index)+result+date.substring(index+5));
		}
		
		
		
	}
}