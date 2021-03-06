package com.zaching.web.livinginfo;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.zaching.common.domain.Page;
import com.zaching.common.domain.Search;
import com.zaching.service.domain.Notice;
import com.zaching.service.domain.User;
import com.zaching.service.user.UserService;

import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.apache.cxf.io.CachedOutputStreamCallback;
import org.apache.cxf.message.Message;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


@RestController
@RequestMapping("/livingInfo/*")
public class LivingInfoRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	

	public LivingInfoRestController() {
		System.out.println("/livingInfo/rest/");
		


	}
	
	@RequestMapping(value = "rest/getBestBook", method = RequestMethod.GET)
	public String getBestBook(Model model) throws Exception {

		System.out.println("/getBestBook");
		
		String addr = "http://www.aladin.co.kr/ttb/api/ItemList.aspx"+"?ttbkey=";
		String serviceKey = "ttbdeabang4211057001";
		String parameter = "";


		addr = addr + serviceKey + "&QueryType=Bestseller&MaxResults=50&start=1&SearchTarget=Book&output=js&Version=20131101";
		
			
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
		
		return sb.append((char) c).delete(sb.append((char) c).length()-2, sb.append((char) c).length()).toString();
	}
	
	
	@RequestMapping( value="rest/movieInfo/{movieinfo}", method=RequestMethod.GET )
	public String moviecode(@PathVariable String movieinfo, HttpSession session ) throws Exception{
		
		String addr = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"+"?key=";
		String serviceKey = "d588b030d0e9864bc913e7e8deabaa3d";
		String parameter = "";
		
			
		 parameter = parameter + "&" + "movieCd="+movieinfo;
			 
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
		
				return sb.append((char) c).delete(sb.append((char) c).length()-2, sb.append((char) c).length()).toString();

		
	}
	
	@RequestMapping( value="rest/getMusicChart", method=RequestMethod.GET )
	public String music(HttpSession session ) throws Exception{
		
		String addr = "http://apis.skplanetx.com/melon/charts/realtime"+"?appKey=";
		String serviceKey = "f28a60d4-8447-3157-b8af-12487d8b8a1a";
		String parameter = "";
		//http://apis.skplanetx.com/melon/charts/realtime?appKey=f28a60d4-8447-3157-b8af-12487d8b8a1a&count=10&page=5&version=1&format=json
			
		parameter = parameter + "&" + "count=10";
		parameter = parameter + "&" + "page=1";
		 parameter = parameter + "&" + "version=1";
	
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
		
		System.out.println(sb.append((char) c).delete(sb.append((char) c).length()-2, sb.append((char) c).length()).toString());
		return sb.append((char) c).delete(sb.append((char) c).length()-2, sb.append((char) c).length()).toString();
		
	}
	
	
	@RequestMapping( value="rest/movieImg/{movieImg}", method=RequestMethod.GET )
	public String movieImg(@PathVariable String movieImg, HttpSession session ) throws Exception{
		
		String clientId = "gVDmQkx91BgYSzY0iCZw";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "ZYh3yjIlSQ";//애플리케이션 클라이언트 시크릿값";
        
        
       
            String text = URLEncoder.encode(movieImg+" 영화 포스터", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/image?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            
            return response.toString();
  
		
	}
	
	@RequestMapping( value="rest/movieInfo", method=RequestMethod.GET )
	public String movieInfo(HttpSession session ) throws Exception{
		
		String addr = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"+"?key=";
		String serviceKey = "d588b030d0e9864bc913e7e8deabaa3d";
		String parameter = "";
		
		 Calendar cal = Calendar.getInstance();
	        
	        // value 취득    get
	        String year = Integer.toString(cal.get(Calendar.YEAR));
	        String month = Integer.toString(cal.get(Calendar.MONTH) + 1);
	        String day = Integer.toString(cal.get(Calendar.DATE));
	        if(Integer.parseInt(month) < 10) {
	        	month = "0" + month;
	        }
	        if(Integer.parseInt(day) < 10) {
	        	day = "0" + day;
	        }
	   
	        
	        String ymd = year+month+day;
	        DateFormat df = new SimpleDateFormat("yyyyMMdd");
	        long chStart = 0;
	        chStart = df.parse(ymd).getTime();           
	        chStart -= 86400000;    //24*60*60*1000 하루치의 숫자를 빼준다
	        
	       
	        
	        Date aa = new Date(chStart); 
	        
	       
		 parameter = parameter + "&" + "targetDt="+df.format(aa);
			 
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
		
		return sb.append((char) c).delete(sb.append((char) c).length()-2, sb.append((char) c).length()).toString();
		
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
		
		
		mMoney = (mMoney/count1);
		dMoney = (dMoney/count1);
		yMoney = (yMoney/count2);
		

		
		
		return mMoney+" "+dMoney+" "+yMoney+" ";
		
	}
	
	@RequestMapping(value="rest/useraddress", method=RequestMethod.POST)
	public String useraddress(@RequestBody Map<String, Object> map,  @ModelAttribute("user") User user) throws Exception {

		
		String userId = ((String)map.get("useraddress"));		
		user = userService.getUser(Integer.parseInt(userId));
		System.out.println(user);
		String getLatitude = user.getLatitude();
		String getLongitude = user.getLongitude();
		
		return getLongitude+","+getLatitude;

	}

}
