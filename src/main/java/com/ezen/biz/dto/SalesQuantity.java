package com.ezen.biz.dto;


import lombok.Setter;
import lombok.ToString;


public class SalesQuantity {
	  
	  private String aname;
	  public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public int getRevenue() {
		return revenue;
	}
	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}
	private int revenue;
  
}
