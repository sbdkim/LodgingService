package com.ezen.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.HostVO;

import utils.Criteria;


@Repository
public class HostDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// Email 존재 여부 확인
	public int confirmEmail(String hemail) {
		String pwd = mybatis.selectOne("HostMapper.confirmEmail", hemail);
		if (pwd != null) {
			return 1;
		} else {
			return 0;
		}
	}
	
	// 로그인
	public int loginHost(HostVO vo) {
		int result = -1;
		String pwd = mybatis.selectOne("HostMapper.confirmEmail", vo);
		if (pwd == null) {// id가 존재하지 않음.
			result = -1;
		} else if (pwd.contentEquals(vo.getPwd())) {// 정상 로그인
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
	
	public HostVO getStatus(String hemail) {
		return mybatis.selectOne("HostMapper.getHost", hemail);
	}
		
	//호스트 회원가입
	public void insertHost(HostVO vo) {
		mybatis.insert("HostMapper.insertHost", vo);
	}

	// 호스트 상세정보 조회
	public HostVO getHost(String hemail) {
		return mybatis.selectOne("HostMapper.getHost", hemail);
	}
	
	// 호스트 정보 변경
	public void updateHost(String hemail) {
		mybatis.update("HostMapper.updateHost", hemail);
	}
	
	// 이름, 번호로 이메일 찾기
	public String selectEmailByNamePhone(HostVO vo) {
		return mybatis.selectOne("HostMapper.selectEmailByNamePhone", vo);
	}
	
	// 이메일, 이름, 번호로 비밀번호 찾기
	public String selectPwdByEmailNamePhone(HostVO vo) {
		return mybatis.selectOne("HostMapper.selectPwdByEmailNamePhone", vo);
	}

	// 비밀번호 변경
	public void changePwd(HostVO vo) {
		mybatis.update("HostMapper.changePwd", vo);
	}
	
	//호스트 조회
	public List<HostVO> listHost(String name){
		return mybatis.selectList("HostMapper.getHostList", name);
	}
	
	public void updateHostStatus(String email) {	
		mybatis.update("HostMapper.approveHost", email);
	}
	
	public void deleteHost(String email) {
		mybatis.delete("HostMapper.deleteHost", email);
	}

	public List<HostVO> listHostWithPaging(Criteria criteria, String name) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("name", name);
		return mybatis.selectList("HostMapper.listHostWithPaging", map);
	}

	public int countHostList(String name) {
		return mybatis.selectOne("HostMapper.countHostList", name);
	}
	
}//HostDAO
