package kh.finalproject.sims.apiTest.dto;

import org.springframework.stereotype.Component;

@Component
public class BankApiDto {
	private int fncoCd;
	private String fncoNm;
	
	public BankApiDto() {
		super();
	}
	
	public BankApiDto(int fncoCd, String fncoNm) {
		super();
		this.fncoCd = fncoCd;
		this.fncoNm = fncoNm;
	}
	@Override
	public String toString() {
		return "BankApiDto [fncoCd=" + fncoCd + ", fncoNm=" + fncoNm + "]";
	}
	public int getFncoCd() {
		return fncoCd;
	}
	public void setFncoCd(int fncoCd) {
		this.fncoCd = fncoCd;
	}
	public String getFncoNm() {
		return fncoNm;
	}
	public void setFncoNm(String fncoNm) {
		this.fncoNm = fncoNm;
	}
	
	
}
