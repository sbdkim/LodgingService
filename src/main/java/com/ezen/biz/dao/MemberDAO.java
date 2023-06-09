package com.ezen.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.MemberVO;

import utils.Criteria;

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
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberMapper.updateMember", vo);
	}

	// 이름, 번호로 이메일 찾기
	public String selectEmailByNamePhone(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectEmailByNamePhone", vo);
	}

	// 이메일, 이름, 번호로 비밀번호 찾기
	public String selectPwdByEmailNamePhone(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectPwdByEmailNamePhone", vo);
	}

	// 전체 회원 정보 조회
	public List<MemberVO> listMember() {
		return mybatis.selectList("MemberMapper.listMember");
	}

	// 비밀번호 변경
	public void changePwd(MemberVO vo) {
		mybatis.update("MemberMapper.changePwd", vo);
	}
	
	public List<MemberVO> getMemberList(String name) {
		return mybatis.selectList("MemberMapper.memberList", name);
	}

	public void deleteMember(String email) {
		mybatis.delete("MemberMapper.deleteMember", email);
	}

	public List<MemberVO> getListMemberWithPaging(Criteria criteria, String name) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("name", name);
		return mybatis.selectList("MemberMapper.listMemberWithPaging", map);
	}

	public int countMemberList(String name) {
		return mybatis.selectOne("MemberMapper.countMemberList", name);
	}

}//MemberDAO
