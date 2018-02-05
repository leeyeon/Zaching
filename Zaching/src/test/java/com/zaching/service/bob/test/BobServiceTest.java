package com.zaching.service.bob.test;

import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import javafx.scene.layout.Region;

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
	
	//@Test
	public void excel() throws Exception {
		
		//bobService.excel(26);
         
    }
	
	//@Test
	public void date() throws Exception {
		
		String date_s = " 2018-02-01 15:18"; 
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		Date date = dt.parse(date_s);
		SimpleDateFormat dt1 = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(dt1.format(date));
		
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
	
	@Test
	// 서울 역삼역, 선른역 두 지점의 거리를 계산 
	public void testDate2() {
	
		 double distanceMile = 
		            distance(37.504198, 127.047967, 37.501025, 127.037701, "");
		         
		        // 미터(Meter) 단위
		        double distanceMeter = 
		            distance(37.504198, 127.047967, 37.501025, 127.037701, "meter");
		         
		        // 킬로미터(Kilo Meter) 단위
		        double distanceKiloMeter = 
		            distance(37.504198, 127.047967, 37.501025, 127.037701, "kilometer");
		         
		        System.out.println(distanceMile + " mile") ;
		        System.out.println(distanceMeter + " meter") ;
		        System.out.println(distanceKiloMeter + " kilometer") ;
		
		
	}

	 private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
		double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        } 
 
        return (dist);
    }
     
 
    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }
 
}