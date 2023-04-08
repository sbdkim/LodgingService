package com.ezen.biz.dto;

public class MonthlyRevenue {
	
	// Fields
	private String month;
	private int price;
	
	// Getter, Setter 메소드
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	// ToString
	@Override
	public String toString() {
		return "MonthlyRevenue [month=" + month + ", price=" + price + "]";
	}

}//MonthlyRevenue
