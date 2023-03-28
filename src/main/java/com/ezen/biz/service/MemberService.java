package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.MemberVO;

public interface MemberService {

	// Email 존재 여부 확인
	int confirmEmail(String email);

	// 로그인
	int loginMember(MemberVO vo);

	// 회원가입
	void insertMember(MemberVO vo);

	// 회원 상세정보 조회
	MemberVO getMember(String email);

	// 회원 정보 변경
	void updateMember(String email);

	// 이름, 번호로 이메일 찾기
	String selectEmailByNamePhone(MemberVO vo);

	// 이메일, 이름, 번호로 비밀번호 찾기
	String selectPwdByEmailNamePhone(MemberVO vo);

	// 전체 회원 정보 조회
	List<MemberVO> getListMember(MemberVO vo);
}