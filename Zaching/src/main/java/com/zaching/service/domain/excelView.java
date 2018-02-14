package com.zaching.service.domain;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class excelView extends AbstractExcelView {

	public excelView() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook xlsWb, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<Participant> list = (List<Participant>)model.get("list");
		
		for (Participant participant : list) {
			System.out.println(participant);
		}

        Sheet sheet = xlsWb.createSheet("회비 목록");
 
        // 컬럼 너비 설정
        sheet.setColumnWidth(0, 1000);
        sheet.setColumnWidth(1, 4500);
        sheet.setColumnWidth(2, 4500);
        for (int i=0; i<list.size(); i++) {
			sheet.setColumnWidth(i+3, 3500);
		}

        // *** Style--------------------------------------------------
        CellStyle cellStyle = xlsWb.createCellStyle();

        cellStyle.setAlignment(HorizontalAlignment.CENTER);

        // 줄 바꿈
        // cellStyle.setWrapText(true);
         
        // Cell 색깔, 무늬 채우기
        //cellStyle.setFillForegroundColor(new XSSFColor(Color.decode("#FF0000")).getIndexed());
         
        Row row = null;
        Cell cell = null;
        //----------------------------------------------------------
        
        // 타이틀 설정
        row = sheet.createRow(0);
        
        cell = row.createCell(3);
        cell.setCellValue("이름");
        
        System.out.println(list.size());
        
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 3, list.size()+3));
        cell.setCellStyle(cellStyle);
        
        row = sheet.createRow(1);
         
        cell = row.createCell(1);
        cell.setCellValue("회비달");
        cell.setCellStyle(cellStyle);
        cell = row.createCell(2);
        cell.setCellValue("회비");
        cell.setCellStyle(cellStyle);
        
        /* 회비 달마다 한 줄이므로 HashSet으로 중복 제거 */
        
        List<String> listFeeDate = new ArrayList<String>();
        
        for(int i = 0; i < list.size(); i++) {
        	cell = row.createCell(i+3);
            cell.setCellValue(list.get(i).getParticipantName());

			listFeeDate.add(list.get(i).getFeeDate());
        }
        
        SimpleDateFormat fmt1 = new SimpleDateFormat("yyyyMMdd");
    	SimpleDateFormat fmt2 = new SimpleDateFormat("yyyy-MM-dd");

        List<String> uniqueItems = new ArrayList<String>(new HashSet<String>(listFeeDate));
        for(int i=0; i<uniqueItems.size(); i++) {
        	Calendar calendar = Calendar.getInstance();
        	Date date = calendar.getTime();
        	//System.out.println(fmt1.format(date) +" :: "+ uniqueItems.get(i));
        	String today = fmt1.format(date);
        	String feeDate = fmt1.format(fmt2.parse(uniqueItems.get(i)));
        	if(Integer.parseInt(feeDate) < Integer.parseInt(today)) {
        		calendar.setTime(fmt2.parse(uniqueItems.get(i)));
        		calendar.add(Calendar.MONTH, 1);
        		
        		uniqueItems.add(fmt2.format(calendar.getTime()));
        	}
        }
        
        /* 데이터 */
        for (int i = 0; i < uniqueItems.size(); i++) {
        	row = sheet.createRow(i+2);

            cell = row.createCell(1);
            cell.setCellValue(uniqueItems.get(i));
             
            cell = row.createCell(2);
            cell.setCellValue(list.get(0).getFee());
            
            for(int j = 0; j < list.size(); j++) {
            	cell = row.createCell(j+3);

            	if(list.get(j).getPaidFee() > 0 ) {
            		String paidDate = fmt1.format(fmt2.parse(list.get(j).getPaidDate()));
            		String feeDate = fmt1.format(fmt2.parse(uniqueItems.get(i)));
            		if(Integer.parseInt(paidDate) >= Integer.parseInt(feeDate)) {
            			cell.setCellValue("O("+list.get(j).getPaidDate()+")");
                		//System.out.println(list.get(j).getPaidFee() +" O");
            		} else {
            			cell.setCellValue("-");
                		//System.out.println(list.get(j).getPaidFee() +" X");
            		}
            	} else {
            		cell.setCellValue("-");
            		//System.out.println(list.get(j).getPaidFee() +" X");
            	}
               
            }
		}
        
        String excelName = RandomStringUtils.randomAlphanumeric(15) + ".xls";
        
        try {
        	response.setContentType("Application/Msexcel");
            response.setHeader("Content-Disposition", "attachement; filename=\""
                + java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\"");
          } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
          }

         
    }

}
