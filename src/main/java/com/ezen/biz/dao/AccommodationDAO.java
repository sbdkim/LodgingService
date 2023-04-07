package com.ezen.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.AccommodationVO;

import utils.Criteria;

@Repository
public class AccommodationDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// aseq로 숙소 검색
	public AccommodationVO getAccommodaiton(AccommodationVO vo) {
		return mybatis.selectOne("AccommodationMapper.getAccommodaiton", vo);
	}
	
	// 주소로 숙소 검색
	public List<AccommodationVO> selectAccByAdd(String address) {
		return mybatis.selectList("AccommodationMapper.selectAccByAdd", address);
	}

	// 전체 숙소 조회
	public List<AccommodationVO> listAcc() {
		return mybatis.selectList("AccommodationMapper.listAcc");
	}

	// 전체 숙소 갯수 조회
	public int countAccList(String address) {
		return mybatis.selectOne("AccommodationMapper.countAccList", address);
	}

	public int countHostAccList(String hemail) {
		
		return mybatis.selectOne("AccommodationMapper.countHostAccList",hemail);
	}
	// 페이지별 숙소 조회
	public List<AccommodationVO> listAccWithPaging(Criteria criteria, String address) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("address", address);
		return mybatis.selectList("AccommodationMapper.listAccWithPaging", map);
	}
	
	//host별 숙소 조회
	public List<AccommodationVO> listHostAccWithPaging(Criteria criteria, String hemail) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("email", hemail);
		return mybatis.selectList("AccommodationMapper.listHostAccWithPaging", map);
	}
	
	public String getNameByAseq(int aseq) {
		return mybatis.selectOne("AccommodationMapper.selectAccByName", aseq);
	}
	
	public void insertAccommodation(AccommodationVO vo) {
		mybatis.insert("AccommodationMapper.insertAccommodation", vo);
	}
	
	public void updateAccommodation(AccommodationVO vo) {
		mybatis.update("AccommodationMapper.updateAccommodation", vo);
	}
	
	public List<AccommodationVO> listHostAccommodation(AccommodationVO vo){
		
		return mybatis.selectList("AccommodationMapper.listHostAccommodation",vo);
	}
	
	public List<AccommodationVO> getAccByRegion(String address){
		return mybatis.selectList("AccommodationMapper.listAccomByRegion", address);
	}
	
	
	
	
	public void deleteAccommodation(int aseq) {
		mybatis.delete("AccommodationMapper.deleteAccommodation",aseq);
	}

}
