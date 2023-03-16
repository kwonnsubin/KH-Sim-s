package kh.finalproject.sims.apiTest;
	
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.BufferedReader;

@Controller
public class FeeApiController {
	
	@Value("#{apikey['apikey.feedata']}")
	private String feeData;
	
	@RequestMapping("/feeapitest")
	public ModelAndView feeApi(ModelAndView mv) {
    	String apiurl = "http://api.smartchoice.or.kr/api/openAPI.xml";
    	String authkey = feeData;
    	
    	try {
	        StringBuilder urlBuilder = new StringBuilder(apiurl); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("authkey", "UTF-8") + "=" + authkey);
	        urlBuilder.append("&" + URLEncoder.encode("voice","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("data","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("sms","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("age","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("dis","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8"));
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        
	        System.out.println("Response code: " + conn.getResponseCode());
	        
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line + "\n");
	            
	            JSONParser jsonParser = new JSONParser();
	            JSONObject jsonObject = (JSONObject)jsonParser.parse(rd.readLine());
	            JSONObject items = (JSONObject)jsonObject.get("items");
	            JSONArray item = (JSONArray)items.get("item");
	            
	            for(int i = 0; i < item.size(); i++) {
	            	JSONObject v = (JSONObject)item.get(i);
	            	System.out.println(v.get("v_tel"));
	            	System.out.println(v.get("v_plan_price"));
	            	System.out.println(v.get("v_dis_price"));
	            	System.out.println(v.get("v_plan_over"));
	            	System.out.println(v.get("v_add_name"));
	            	System.out.println(v.get("v_plan_name"));
	            	System.out.println(v.get("v_plan_display_voice"));
	            	System.out.println(v.get("v_plan_display_data"));
	            	System.out.println(v.get("v_plan_display_sms"));
	            	System.out.println(v.get("rn"));
	            }
	        }
	        
	        rd.close();
	        conn.disconnect();
	        
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
        
        mv.setViewName("apitest/feedata");
		return mv;
    }
}