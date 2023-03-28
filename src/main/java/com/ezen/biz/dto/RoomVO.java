package com.ezen.biz.dto;

public class RoomVO {
	private int rseq;
	private int aseq;
	private String name;
	private int price;
	private int maxcap;
	private String ckintime;
	private String ckouttime;
	private String rooms;
	private String bathroom;
	private String bed;
	private int wifi;
	private int kitchen;
	private int pool;
	private int ac;
	private int tv;
	private int coffeemachine;
	private int fridge;
	private int bathtub;
	private int parking;
	private int heater;
	private int microwave;
	private int plug;
	private int washer;
	private int bbq;
	private int hairdrier;
	private int amenity;
	private int towel;
	private int elevator;
	private int breakfast;
	private int smoking;
	private int gym;
	private int roomservice;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;

	// Getter, Setter 메소드
	public int getRseq() {
		return rseq;
	}

	public void setRseq(int rseq) {
		this.rseq = rseq;
	}

	public int getAseq() {
		return aseq;
	}

	public void setAseq(int aseq) {
		this.aseq = aseq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMaxcap() {
		return maxcap;
	}

	public void setMaxcap(int maxcap) {
		this.maxcap = maxcap;
	}

	public String getCkintime() {
		return ckintime;
	}

	public void setCkintime(String ckintime) {
		this.ckintime = ckintime;
	}

	public String getCkouttime() {
		return ckouttime;
	}

	public void setCkouttime(String ckouttime) {
		this.ckouttime = ckouttime;
	}

	public String getRooms() {
		return rooms;
	}

	public void setRooms(String rooms) {
		this.rooms = rooms;
	}

	public String getBathroom() {
		return bathroom;
	}

	public void setBathroom(String bathroom) {
		this.bathroom = bathroom;
	}

	public String getBed() {
		return bed;
	}

	public void setBed(String bed) {
		this.bed = bed;
	}

	public int getWifi() {
		return wifi;
	}

	public void setWifi(int wifi) {
		this.wifi = wifi;
	}

	public int getKitchen() {
		return kitchen;
	}

	public void setKitchen(int kitchen) {
		this.kitchen = kitchen;
	}

	public int getPool() {
		return pool;
	}

	public void setPool(int pool) {
		this.pool = pool;
	}

	public int getAc() {
		return ac;
	}

	public void setAc(int ac) {
		this.ac = ac;
	}

	public int getTv() {
		return tv;
	}

	public void setTv(int tv) {
		this.tv = tv;
	}

	public int getCoffeemachine() {
		return coffeemachine;
	}

	public void setCoffeemachine(int coffeemachine) {
		this.coffeemachine = coffeemachine;
	}

	public int getFridge() {
		return fridge;
	}

	public void setFridge(int fridge) {
		this.fridge = fridge;
	}

	public int getBathtub() {
		return bathtub;
	}

	public void setBathtub(int bathtub) {
		this.bathtub = bathtub;
	}

	public int getParking() {
		return parking;
	}

	public void setParking(int parking) {
		this.parking = parking;
	}

	public int getHeater() {
		return heater;
	}

	public void setHeater(int heater) {
		this.heater = heater;
	}

	public int getMicrowave() {
		return microwave;
	}

	public void setMicrowave(int microwave) {
		this.microwave = microwave;
	}

	public int getPlug() {
		return plug;
	}

	public void setPlug(int plug) {
		this.plug = plug;
	}

	public int getWasher() {
		return washer;
	}

	public void setWasher(int washer) {
		this.washer = washer;
	}

	public int getBbq() {
		return bbq;
	}

	public void setBbq(int bbq) {
		this.bbq = bbq;
	}

	public int getHairdrier() {
		return hairdrier;
	}

	public void setHairdrier(int hairdrier) {
		this.hairdrier = hairdrier;
	}

	public int getAmenity() {
		return amenity;
	}

	public void setAmenity(int amenity) {
		this.amenity = amenity;
	}

	public int getTowel() {
		return towel;
	}

	public void setTowel(int towel) {
		this.towel = towel;
	}

	public int getElevator() {
		return elevator;
	}

	public void setElevator(int elevator) {
		this.elevator = elevator;
	}

	public int getBreakfast() {
		return breakfast;
	}

	public void setBreakfast(int breakfast) {
		this.breakfast = breakfast;
	}

	public int getSmoking() {
		return smoking;
	}

	public void setSmoking(int smoking) {
		this.smoking = smoking;
	}

	public int getGym() {
		return gym;
	}

	public void setGym(int gym) {
		this.gym = gym;
	}

	public int getRoomservice() {
		return roomservice;
	}

	public void setRoomservice(int roomservice) {
		this.roomservice = roomservice;
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
		return "RoomVO [rseq=" + rseq + ", aseq=" + aseq + ", name=" + name + ", price=" + price + ", maxcap=" + maxcap
				+ ", ckintime=" + ckintime + ", ckouttime=" + ckouttime + ", rooms=" + rooms + ", bathroom=" + bathroom
				+ ", bed=" + bed + ", wifi=" + wifi + ", kitchen=" + kitchen + ", pool=" + pool + ", ac=" + ac + ", tv="
				+ tv + ", coffeemachine=" + coffeemachine + ", fridge=" + fridge + ", bathtub=" + bathtub + ", parking="
				+ parking + ", heater=" + heater + ", microwave=" + microwave + ", plug=" + plug + ", washer=" + washer
				+ ", bbq=" + bbq + ", hairdrier=" + hairdrier + ", amenity=" + amenity + ", towel=" + towel
				+ ", elevator=" + elevator + ", breakfast=" + breakfast + ", smoking=" + smoking + ", gym=" + gym
				+ ", roomservice=" + roomservice + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3
				+ ", image4=" + image4 + ", image5=" + image5 + "]";
	}
}
