package com.ezen.biz.location;

public class Location {

	private int id;
	private int aseq;
	private String aname;
	private String address;
	private String aimage;

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

	@Override
	public String toString() {
		return "Location [id=" + id + ", aseq=" + aseq + ", aname=" + aname + ", address=" + address + ", aimage="
				+ aimage + "]";
	}



	
	
	// Constructors, getters, and setters

}