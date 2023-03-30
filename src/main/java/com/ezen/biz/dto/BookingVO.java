package com.ezen.biz.dto;

import java.util.Date;

public class BookingVO {
	private int bseq;
	private int rseq;
	private String email;
	private String ckindate;
	private String ckoutdate;
	private int price;
	private int payment;
	private int status;
	private Date bookdate;
	private String aname;
	private String rname;

	// Getter, Setter 메소드
	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

	public int getRseq() {
		return rseq;
	}

	public void setRseq(int rseq) {
		this.rseq = rseq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCkindate() {
		return ckindate;
	}

	public void setCkindate(String ckindate) {
		this.ckindate = ckindate;
	}

	public String getCkoutdate() {
		return ckoutdate;
	}

	public void setCkoutdate(String ckoutdate) {
		this.ckoutdate = ckoutdate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getBookdate() {
		return bookdate;
	}

	public void setBookdate(Date bookdate) {
		this.bookdate = bookdate;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	@Override
	public String toString() {
		return "BookingVO [bseq=" + bseq + ", rseq=" + rseq + ", email=" + email + ", ckindate=" + ckindate
				+ ", ckoutdate=" + ckoutdate + ", price=" + price + ", payment=" + payment + ", status=" + status
				+ ", bookdate=" + bookdate + ", aname=" + aname + ", rname=" + rname + "]";
	}

	
	
	
	

}
