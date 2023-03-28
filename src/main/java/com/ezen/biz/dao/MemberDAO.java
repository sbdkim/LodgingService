package com.ezen.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// Email 존재 여부 확인
	public int confirmEmail(String email) {
		String pwd = mybatis.selectOne("MemberMapper.confirmEmail", email);
		if (pwd != null) {
			return 1;
		} else {
			return 0;
		}
	}

	// 로그인
	public int loginMember(MemberVO vo) {
		int result = -1;
		String pwd = mybatis.selectOne("MemberMapper.confirmEmail", vo);
		if (pwd == null) {// id가 존재하지 않음.
			result = -1;
		} else if (pwd.contentEquals(vo.getPwd())) {// 정상 로그인
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	// 회원가입
	public void insertMember(MemberVO vo) {
		mybatis.insert("MemberMapper.insertMember", vo);
	}

	// 회원 상세정보 조회
	public MemberVO getMember(String email) {
		return mybatis.selectOne("MemberMapper.getMember", email);
	}

	// 회원 정보 변경
	public void updateMember(String email) {
		mybatis.update("MemberMapper.updateMember", email);
	}

	// 이름, 번호로 이메일 찾기
	public String selectEmailByNamePhone(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectEmailByNamePhone", vo);
	}

	// 이메일, 이름, 번호로 비밀번호 찾기
	public String selectPwdByEmailNamePhone(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectPwdByEmailNamePhone", vo);
	}
}
