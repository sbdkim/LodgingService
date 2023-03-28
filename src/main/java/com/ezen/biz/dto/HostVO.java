package com.ezen.biz.dto;

public class HostVO {
	private String email;
	private String pwd;
	private String phone;
	private String address;

	// Getter, Setter 메소드
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
		return "HostVO [email=" + email + ", pwd=" + pwd + ", phone=" + phone + ", address=" + address + "]";
	}
}
