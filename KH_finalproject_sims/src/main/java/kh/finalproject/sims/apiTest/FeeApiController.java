package kh.finalproject.sims.apiTest;
	
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.finalproject.sims.apiTest.dao.FeeApiDao;
import kh.finalproject.sims.apiTest.dto.ChargeDto;

import java.io.BufferedReader;
import java.io.FileInputStream;

@Controller
public class FeeApiController {
	
	@Autowired
	private FeeApiDao feeApiDao;
	
	@Value("#{apikey['apikey.feedata']}")
	private String feeData;
	
	@RequestMapping("/feeapitest")
	public ModelAndView feeApi(ModelAndView mv) {
    	String apiurl = "http://openapi.epost.go.kr/postal/retrieveAlddlChargeService/retrieveAlddlChargeService/getAlddlChargeList";
    	String servicekey = "";
    	
    	try {
	        StringBuilder urlBuilder = new StringBuilder(apiurl); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + servicekey);
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        
	        System.out.println("Response code: " + conn.getResponseCode());
	        
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
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
	        
	        Gson gson = new Gson();
//	        AlddlChargeResponseDto dto = gson.fromJson(sb.toString(), AlddlChargeResponseDto.class);
//	        System.out.println("######");
//	        System.out.println(dto);
	        
	        ChargeDto chargeDto = new ChargeDto();
	        Map<String, Object> apiMap = new HashMap<String, Object>();
	        
	        apiMap = (Map)gson.fromJson(sb.toString(), apiMap.getClass());
	        System.out.println(apiMap.get("AlddlChargeResponse"));
	        
	        Map<String, Object> alddlMap = (Map<String, Object>)apiMap.get("AlddlChargeResponse");
	        System.out.println(alddlMap.get("alddlCharge"));
	        
	        ArrayList<Object> alddlList = (ArrayList<Object>)alddlMap.get("alddlCharge");
	        System.out.println(alddlList.size());
	        
	        int cnt = 0;
	        for(int i = 0; i < alddlList.size(); i++) {
	        	Map<String, Object> alddlResult = (Map<String, Object>)alddlList.get(i);
	        	feeApiDao.insert(alddlResult);
	        	cnt++;
	        	System.out.println(cnt);
	        }
	        
	        
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
        
        mv.setViewName("apitest/feedata");
		return mv;
    }
}