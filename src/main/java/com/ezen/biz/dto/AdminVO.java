package com.ezen.biz.dto;

public class AdminVO {
	private String email;
	private String pwd;
	private String name;
	private String phone;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	// ToString
	@Override
	public String toString() {
		return "AdminVO [email=" + email + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone + "]";
	}
}
