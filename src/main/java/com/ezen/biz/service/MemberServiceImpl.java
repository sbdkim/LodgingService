package com.ezen.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.MemberDAO;
import com.ezen.biz.dto.MemberVO;

@Service("memebrService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDao;

	@Override
	public int confirmEmail(String email) {
		return mDao.confirmEmail(email);
	}

	@Override
	public int loginMember(MemberVO vo) {
		return mDao.loginMember(vo);
	}

	@Override
	public void insertMember(MemberVO vo) {
		mDao.insertMember(vo);
	}

	@Override
	public MemberVO getMember(String email) {
		return mDao.getMember(email);
	}

	@Override
	public void updateMember(String email) {
		mDao.updateMember(email);
	}

	@Override
	public String selectEmailByNamePhone(MemberVO vo) {
		return mDao.selectEmailByNamePhone(vo);
	}

	@Override
	public String selectPwdByEmailNamePhone(MemberVO vo) {
		return mDao.selectPwdByEmailNamePhone(vo);
	}

}
