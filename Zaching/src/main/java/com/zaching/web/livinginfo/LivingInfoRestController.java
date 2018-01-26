package com.zaching.web.livinginfo;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.apache.cxf.io.CachedOutputStreamCallback;
import org.apache.cxf.message.Message;
import org.json.simple.JSONObject;


@RestController
@RequestMapping("/livingInfo/*")
public class LivingInfoRestController {
	

	public LivingInfoRestController() {
		System.out.println("/livingInfo/rest/");
		


	}
	
	@RequestMapping( value="rest/movieInfo", method=RequestMethod.GET )
	public StringBuffer movieInfo(HttpSession session ) throws Exception{
		System.out.println("뀨뀨꺄꺄");
		String addr = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"+"?key=";
		String serviceKey = "d588b030d0e9864bc913e7e8deabaa3d";
		String parameter = "";
		
		 parameter = parameter + "&" + "targetDt="+20180124;
			 
		addr = addr + serviceKey + parameter;
	
		URL url = new URL(addr);
		
		InputStream is = null;
		InputStreamReader isr = null; 
		
		is = new URL(addr).openStream();
		isr = new InputStreamReader(is, "utf-8");
		
		StringBuffer sb = new StringBuffer();
		int c;

		while ((c = isr.read()) != -1) {
			sb.append((char) c);
		}
		
		return sb.append((char) c);
		
	}
	
		
	
	@RequestMapping( value="rest/rentcharge/{location}", method=RequestMethod.GET )
	public String rentcharge(	@PathVariable String location, HttpSession session ) throws Exception{

		System.out.println("/livingInfo/rest/rentcharge: get");
		
		BufferedReader br = null;
		String locationCode = null;
		
		File file = new File("C:\\Users\\bitcamp\\git\\Zaching\\Zaching\\src\\main\\resources\\config\\rentcharge.txt");
		
		br = new BufferedReader(new FileReader(file));
		
		location = location.split(" ")[1];
		
		while(br.readLine() != null) {
			if(br.readLine().indexOf(location) != -1) {
				locationCode = br.readLine().substring(0, 5);
				break;
			}	
		}

		System.out.println(locationCode);
		
		String addr = "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcSHRent"+"?serviceKey=";
		String serviceKey = "UQrLvBzmIEGlEYA9kX%2FLntAGtGodzdBYhr5GXJqVkG5tw8MlBZTZh3b7V8jd4Ew6LJ3kAlE3r2qi%2B1K6j95gFw%3D%3D";
		String parameter = "";
		
		 parameter = parameter + "&" + "LAWD_CD="+locationCode;
		 parameter = parameter + "&" + "DEAL_YMD=201612";
		 
		addr = addr + serviceKey + parameter;
	
		URL url = new URL(addr);
		
		InputStream is = null;
		InputStreamReader isr = null; 
		
		is = new URL(addr).openStream();
		isr = new InputStreamReader(is, "utf-8");
		
		StringBuffer sb = new StringBuffer();
		int c;

		while ((c = isr.read()) != -1) {
			sb.append((char) c);
		}
		
		
		isr.close(); is.close();
	
		
		String locationinfo = sb.append((char) c).toString();
		
		String[] aa = locationinfo.split("</item>");
		
		int mMoney = 0;
		int dMoney = 0;
		int yMoney = 0;
		int count1 = 0;
		int count2 = 0;
		
		for(int i=0; i<locationinfo.split("</item>").length-1; i++ ) {
			
			int start1 = aa[i].indexOf("<보증금액>");
			int end1 = aa[i].indexOf("</보증금액>");
			
			int start2 = aa[i].indexOf("<월세금액>");
			int end2 = aa[i].indexOf("</월세금액>");
			
			String money1 = aa[i].substring(start1 + 10 , start1+end1- start1).trim().replaceAll(",", "");
			String money2 = aa[i].substring(start2 + 10 , start2+end2- start2).trim().replaceAll(",", "");
			
	
			if(!money2.equals("0")){
				
				mMoney = mMoney + Integer.parseInt(money2);	
				dMoney = dMoney + Integer.parseInt(money1);
				count1++;
				
				

			}
			else {
				
				yMoney = yMoney + Integer.parseInt(money1);
				count2++;
				

			}
			
			
		}
		
		System.out.println("전세"+count2);
		System.out.println("월세"+count1);
		mMoney = (mMoney/count1);
		dMoney = (dMoney/count1);
		yMoney = (yMoney/count2);
		

		
		
		return mMoney+" "+dMoney+" "+yMoney+" ";
		
	}

}
