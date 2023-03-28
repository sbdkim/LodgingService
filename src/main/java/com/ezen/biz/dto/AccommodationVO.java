package com.ezen.biz.dto;

public class AccommodationVO {
	private int aseq;
	private String email;
	private String name;
	private int category;
	private String address;
	private String tel;
	private String bestyn;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;

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

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	// ToString
	@Override
	public String toString() {
		return "AccommodationVO [aseq=" + aseq + ", email=" + email + ", name=" + name + ", category=" + category
				+ ", address=" + address + ", tel=" + tel + ", bestyn=" + bestyn + ", image1=" + image1 + ", image2="
				+ image2 + ", image3=" + image3 + ", image4=" + image4 + ", image5=" + image5 + "]";
	}
}
