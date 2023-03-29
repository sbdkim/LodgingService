package com.ezen.biz.service;

import com.ezen.biz.dto.AdminVO;

public interface AdminService {

	// 회원정보 조회
	AdminVO getAdmin(String email);

	// 회원정보 변경
	void updateAdmin(AdminVO vo);

	// 이름, 번호로 이메일 찾기
	String selectEmailByNamePhone(AdminVO vo);

	// 이메일, 이름, 번호로 비밀번호 찾기
	String selectPwdByEmailNamePhone(AdminVO vo);

}