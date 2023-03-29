package com.ezen.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.AdminDAO;
import com.ezen.biz.dto.AdminVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO aDao;

	@Override
	public AdminVO getAdmin(String email) {
		return aDao.getAdmin(email);
	}

	@Override
	public void updateAdmin(AdminVO vo) {
		aDao.updateAdmin(vo);
	}

	@Override
	public String selectEmailByNamePhone(AdminVO vo) {
		return aDao.selectEmailByNamePhone(vo);
	}

	@Override
	public String selectPwdByEmailNamePhone(AdminVO vo) {
		return aDao.selectPwdByEmailNamePhone(vo);
	}

}
