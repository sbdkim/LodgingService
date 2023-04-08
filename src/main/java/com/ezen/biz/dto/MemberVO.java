package com.ezen.biz.dto;

import java.util.Date;

public class MemberVO {
	
	// Fields
	private String email;
	private String pwd;
	private String name;
	private String phone;
	private Date joindate;

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

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	// ToString
	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone + ", joindate="
				+ joindate + ", getEmail()=" + getEmail() + ", getPwd()=" + getPwd() + ", getName()=" + getName()
				+ ", getPhone()=" + getPhone() + ", getJoindate()=" + getJoindate() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}//MemberVO
