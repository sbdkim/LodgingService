package com.ezen.biz.dto;

public class AccommodationVO {
	private int aseq;
	private String email;
	private String name;
	private int category;
	private String address;
	private String tel;
	private String bestyn;
	private String image;


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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}


	// ToString
	@Override
	public String toString() {
		return "AccommodationVO [aseq=" + aseq + ", email=" + email + ", name=" + name + ", category=" + category
				+ ", address=" + address + ", tel=" + tel + ", bestyn=" + bestyn + ", image=" + image + "]";
	}
}
