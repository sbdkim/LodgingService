package com.ezen.biz.dto;


import lombok.Setter;
import lombok.ToString;


public class SalesQuantity {
	  
	  private String aname;
	  private int bprice;
	  public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	
}
