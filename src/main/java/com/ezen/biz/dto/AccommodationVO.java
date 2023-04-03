package com.ezen.biz.dto;

public class AccommodationVO {
	private int aseq;
	private String email;
	private String aname;
	private String rname;
	private int category;
	private String address;
	private String tel;
	private String bestyn;
	private String aimage;
	private String rimage;


	// Getter, Setter 메소드
	public int getAseq() {
		return aseq;
	}

	public void setAseq(int aseq) {
		this.aseq = aseq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAimage() {
		return aimage;
	}

	public void setAimage(String aimage) {
		this.aimage = aimage;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBestyn() {
		return bestyn;
	}

	public void setBestyn(String bestyn) {
		this.bestyn = bestyn;
	}

	
	public String getRimage() {
		return rimage;
	}

	public void setRimage(String rimage) {
		this.rimage = rimage;
	}

	// ToString
	@Override
	public String toString() {
		return "AccommodationVO [aseq=" + aseq + ", email=" + email + ", aname=" + aname + ", rname=" + rname
				+ ", category=" + category + ", address=" + address + ", tel=" + tel + ", bestyn=" + bestyn
				+ ", aimage=" + aimage + ", rimage=" + rimage + "]";
	}

}
