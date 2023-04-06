package com.ezen.biz.dto;

public class HostVO {
	private String hemail;
	private String pwd;
	private String phone;
	private String name;
	private int status;

	// Getter, Setter 메소드
	public String getHemail() {
		return hemail;
	}

	public void setHemail(String hemail) {
		this.hemail = hemail;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	// ToString
	@Override
	public String toString() {
		return "HostVO [hemail=" + hemail + ", pwd=" + pwd + ", phone=" + phone + ", name=" + name + ", status="
				+ status + "]";
	}
}
