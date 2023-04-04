package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.AccommodationVO;

import utils.Criteria;

public interface AccommodationService {

	// 주소로 숙소 검색
	List<AccommodationVO> selectAccByAdd(String address);

	// 전체 숙소 조회
	List<AccommodationVO> getListAcc();

	// 페이지별 숙소 조회
	List<AccommodationVO> getListAccWithPaging(Criteria criteria, String address);
	
	//host별 숙소 조회 페이징
	List<AccommodationVO> getlistHostAccWithPaging(Criteria criteria, String email);
	
	// 전체 숙소 갯수 조회
	 int countAccList(String address);
	 
	 public String getNameByAseq(int aseq);
	 
	 void insertAccommodation(AccommodationVO vo);
	 
	 void updateAccommodation(AccommodationVO vo);

}