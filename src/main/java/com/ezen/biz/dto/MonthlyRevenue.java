package com.ezen.biz.dto;

public class MonthlyRevenue {

	private String month;
	private int price;
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
	@Override
	public String toString() {
		return "MonthlyRevenue [month=" + month + ", price=" + price + "]";
	}
	
	
	

}
