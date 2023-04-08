package com.ezen.biz.dto;

public class SalesQuantity {
	
	// Fields
	private String aname;
	private int bprice;
	
	// Getter, Setter 메소드
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
	
	// ToString
	@Override
	public String toString() {
		return "SalesQuantity [aname=" + aname + ", bprice=" + bprice + "]";
	}

}//SalesQuantity
