package com.ezen.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.HostDAO;
import com.ezen.biz.dto.HostVO;

@Service("hostService")
public class HostServiceImpl implements HostService {
	
	@Autowired
	private HostDAO hDao;

	@Override
	public int confirmEmail(String hemail) {
		return hDao.confirmEmail(hemail);
	}

	@Override
	public int loginHost(HostVO vo) {
		return hDao.loginHost(vo);
	}

	@Override
	public void insertHost(HostVO vo) {
		hDao.insertHost(vo);

	}

	@Override
	public HostVO getHost(String hemail) {
		return hDao.getHost(hemail);
	}

	@Override
	public void updateHost(String hemail) {
		hDao.updateHost(hemail);

	}

	@Override
	public String selectEmailByNamePhone(HostVO vo) {
		return hDao.selectEmailByNamePhone(vo);
	}

	@Override
	public String selectPwdByEmailNamePhone(HostVO vo) {	
		return hDao.selectPwdByEmailNamePhone(vo);
	}

	@Override
	public void changePwd(HostVO vo) {
		hDao.changePwd(vo);
	}

}
