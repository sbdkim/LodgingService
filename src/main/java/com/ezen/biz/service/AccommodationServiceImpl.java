package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.AccommodationDAO;
import com.ezen.biz.dto.AccommodationVO;

import utils.Criteria;

@Service("accommodationService")
public class AccommodationServiceImpl implements AccommodationService {

	@Autowired
	private AccommodationDAO aDao;

	@Override
	public List<AccommodationVO> selectAccByAdd(String address) {
		return aDao.selectAccByAdd(address);
	}

	@Override
	public List<AccommodationVO> getListAcc() {
		return aDao.listAcc();
	}

	@Override
	public List<AccommodationVO> getListAccWithPaging(Criteria criteria, String address) {
		return aDao.listAccWithPaging(criteria, address);
	}

	@Override
	public int countAccList(String address) {
		return aDao.countAccList(address);
	}

}