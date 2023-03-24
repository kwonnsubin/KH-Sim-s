package kh.finalproject.sims.biz.model.vo;

import org.springframework.stereotype.Component;

@Component
public class bizInfoMngServiceVo {
	private int netNo;
	private String bizNetService;
	
	
	public bizInfoMngServiceVo() {
	}
	
	public bizInfoMngServiceVo(int netNo, String bizNetService) {
		this.netNo = netNo;
		this.bizNetService = bizNetService;
	}
	@Override
	public String toString() {
		return "bizInfoMngServiceVo [netNo=" + netNo + ", bizNetService=" + bizNetService + "]";
	}
	public int getNetNo() {
		return netNo;
	}
	public void setNetNo(int netNo) {
		this.netNo = netNo;
	}
	public String getBizNetService() {
		return bizNetService;
	}
	public void setBizNetService(String bizNetService) {
		this.bizNetService = bizNetService;
	}
	
}
