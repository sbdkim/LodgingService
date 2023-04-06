package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.HostVO;

public interface HostService {

	// Email 존재 여부 확인
	int confirmEmail(String hemail);

	// 로그인
	int loginHost(HostVO vo);

	//호스트 회원가입
	void insertHost(HostVO vo);

	// 호스트 상세정보 조회
	HostVO getHost(String hemail);

	// 호스트 정보 변경
	void updateHost(String hemail);

	// 이름, 번호로 이메일 찾기
	String selectEmailByNamePhone(HostVO vo);

	// 이메일, 이름, 번호로 비밀번호 찾기
	String selectPwdByEmailNamePhone(HostVO vo);

	// 비밀번호 변경
	void changePwd(HostVO vo);
	
	//호스트 list 조회
	public List<HostVO> getListHost(String name);
	
	public void updateHostStatus(String email);
	
	
}