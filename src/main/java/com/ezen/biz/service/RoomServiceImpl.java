package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.RoomDAO;
import com.ezen.biz.dto.RoomVO;

import utils.Criteria;

@Service("roomService")
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDAO rDao;
	
	@Override
	public List<RoomVO> getRoomByAcc(int aseq) {
		return rDao.selectRoomByAcc(aseq);
	}

	@Override
	public List<RoomVO> getRoomListWithPaging(Criteria criteria, int aseq) {
		
		return rDao.listRoomWithPaging(criteria, aseq);
	}

	@Override
	public int countRoomList(int aseq) {
		return rDao.countRoomList(aseq);
	}

	@Override
	public RoomVO getRoomByRseq(int rseq) {
		return rDao.selectRoomByRseq(rseq);
	}

	@Override
	public RoomVO getAccByRseq(int rseq) {
		return rDao.selectAccByRseq(rseq);

	public void insertRoom(RoomVO vo) {
		
		rDao.insertRoom(vo);
	}

	@Override
	public void updateRoom(RoomVO vo) {
		
		rDao.updateRoom(vo);
	}
	
	
	
	
	
	

}
