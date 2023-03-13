package kh.finalproject.sims.apiTest;
	
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

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
    	String apiurl = "http://openapi.epost.go.kr/postal/retrieveAlddlChargeService/retrieveAlddlChargeService/getAlddlChargeList";
    	String serviceKey = feeData;
    	
    	try {
	        StringBuilder urlBuilder = new StringBuilder(apiurl); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	        System.out.println(feeData);
	        
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
	        }
	        rd.close();
	        conn.disconnect();
	        mv.addObject("feedata", sb.toString());
	        
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
        
        mv.setViewName("apitest/feedata");
		return mv;
    }
}