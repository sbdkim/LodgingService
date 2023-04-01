package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.RoomDAO;
import com.ezen.biz.dto.RoomVO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDAO rDao;
	
	@Override
	public List<RoomVO> selectRoomByAcc(String aseq) {
		return rDao.selectRoomByAcc(aseq);
	}

}
