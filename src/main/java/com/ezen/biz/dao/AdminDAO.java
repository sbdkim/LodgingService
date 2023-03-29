package com.ezen.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.AdminVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public String adminCheck(String email) {
		return mybatis.selectOne("AdminMapper.adminCheck", email);
	}
	// 회원정보 조회
	public AdminVO getAdmin(String email) {
		return mybatis.selectOne("AdminMapper.getAdmin", email);
	}

	// 회원정보 변경
	public void updateAdmin(AdminVO vo) {
		mybatis.update("AdminMapper.updateAdmin", vo);
	}

	// 이름, 번호로 이메일 찾기
	public String selectEmailByNamePhone(AdminVO vo) {
		return mybatis.selectOne("AdminMapper.selectEmailByNamePhone", vo);
	}

	// 이메일, 이름, 번호로 비밀번호 찾기
	public String selectPwdByEmailNamePhone(AdminVO vo) {
		return mybatis.selectOne("AdminMapper.selectPwdByEmailNamePhone", vo);
	}
}
