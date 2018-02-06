package com.zaching.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class URLConnection {
	
	public static final String HTTPMETHOD_GET = "GET";
	public static final String HTTPMETHOD_POST = "POST";

	public URLConnection() {
		
	}

	// contentType 없으면 null 로 표시
	// parameter / contentType / property
	public static JSONObject getJSON_PARAM(String requestMethod, String requestURL, String param, String contentType,
							String propertyName, String propertyValue) throws Exception {
		
		if(requestMethod.equals("GET")) {
			requestURL += "?" + param;
		}
		
		HttpURLConnection con = (HttpURLConnection)new URL(requestURL).openConnection();
		 
		con.setRequestMethod(requestMethod);
        con.setDoOutput(true);
        con.setDoInput(true);
        con.setRequestProperty(propertyName, propertyValue);
        
        if(contentType != null) {
        	con.setRequestProperty("Content-Type", contentType);
        }
        
        if(requestMethod.equals("POST")) {
	        OutputStream os = con.getOutputStream();
	        
	        // parameter 한글 인코딩 문제 해결!!!
	        os.write(param.getBytes("UTF-8"));
	        os.flush();
	        os.close();
        }
        
        BufferedReader br = null;
        
        if(con.getResponseCode() == 200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
        }
        
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        System.out.println(response.toString());
        
        JSONParser parser = new JSONParser();
        return (JSONObject)parser.parse(response.toString());
        
	}
	
	// parameter / contentType
	public static JSONObject getJSON_PARAM(String requestMethod, String requestURL, String param, String contentType) throws Exception {
		
		if(requestMethod.equals("GET")) {
			requestURL += "?" + param;
		}
		
		HttpURLConnection con = (HttpURLConnection)new URL(requestURL).openConnection();
		
		con.setRequestMethod(requestMethod);
		con.setDoOutput(true);
		con.setDoInput(true);
		if(contentType != null) {
			con.setRequestProperty("Content-Type", contentType);
		}
		
		if(requestMethod.equals("POST")) {
			OutputStream os = con.getOutputStream();
			
			os.write(param.getBytes("UTF-8"));
			os.flush();
			os.close();
		}
		
		BufferedReader br = null;
		
		if(con.getResponseCode() == 200) { 
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		}
		
		String jsonData = "";
		StringBuffer response = new StringBuffer();
		
		while ((jsonData = br.readLine()) != null) {
			response.append(jsonData);
		}
		
		br.close();
		
		System.out.println(response.toString());
		
		JSONParser parser = new JSONParser();
		return (JSONObject)parser.parse(response.toString());
	}
	
	// no param
	public static JSONObject getJSON(String requestMethod, String requestURL, String contentType, String propertyName, String propertyValue) throws Exception {
		
		HttpURLConnection con = (HttpURLConnection)new URL(requestURL).openConnection();
		 
		con.setRequestMethod(requestMethod);
		con.setRequestProperty(propertyName, propertyValue);
		if(contentType != null) {
        	con.setRequestProperty("Content-Type", contentType);
        }
        
        BufferedReader br = null;
        
        if(con.getResponseCode() == 200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
        }
        
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        System.out.println(response.toString());
        
        JSONParser parser = new JSONParser();
        return (JSONObject)parser.parse(response.toString());
	}

}
