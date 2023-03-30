package com.ezen.biz.service;

import com.ezen.biz.dto.HostVO;

public interface HostService {

	// Email 존재 여부 확인
	int confirmEmail(String email);

	// 로그인
	int loginHost(HostVO vo);

	//호스트 회원가입
	void insertHost(HostVO vo);

	// 호스트 상세정보 조회
	HostVO getHost(String email);

	// 호스트 정보 변경
	void updateHost(String email);

	// 이름, 번호로 이메일 찾기
	String selectEmailByNamePhone(HostVO vo);

	// 이메일, 이름, 번호로 비밀번호 찾기
	String selectPwdByEmailNamePhone(HostVO vo);

	// 비밀번호 변경
	void changePwd(HostVO vo);
}