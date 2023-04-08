package com.ezen.biz.dto;

public class Location {

	// Fields
	private int id;
	private int aseq;
	private String aname;
	private String address;
	private String aimage;

	// Getter, Setter 메소드
	public int getAseq() {
		return aseq;
	}

	public String getAimage() {
		return aimage;
	}

	public void setAimage(String aimage) {
		this.aimage = aimage;
	}

	public void setAseq(int aseq) {
		this.aseq = aseq;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String name) {
		this.aname = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	// ToString
	@Override
	public String toString() {
		return "Location [id=" + id + ", aseq=" + aseq + ", aname=" + aname + ", address=" + address + ", aimage="
				+ aimage + "]";
	}

}//Location