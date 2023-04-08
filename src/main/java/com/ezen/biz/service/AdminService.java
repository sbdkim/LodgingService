package com.ezen.biz.service;

import com.ezen.biz.dto.AdminVO;
import com.ezen.biz.dto.HostVO;

public interface AdminService {

	int adminCheck(AdminVO vo);

	// 회원정보 조회
	AdminVO getAdmin(String email);

	// admin login
	int loginAdmin(HostVO vo);

	// 회원정보 변경
	void updateAdmin(AdminVO vo);

	// 이름, 번호로 이메일 찾기
	String selectEmailByNamePhone(AdminVO vo);

	// 이메일, 이름, 번호로 비밀번호 찾기
	String selectPwdByEmailNamePhone(AdminVO vo);

}