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
	public int adminCheck(AdminVO vo) {
		String pwd_in_db = aDao.adminCheck(vo.getEmail());
		if (pwd_in_db == null) {
			return -1; // 관리자 email이 존재하지 않음
		} else if (pwd_in_db.equals(vo.getPwd())) {
			return 1; // 정상적인 관리자
		} else {
			return 0; // 비밀번호 틀림
		}
	}

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
