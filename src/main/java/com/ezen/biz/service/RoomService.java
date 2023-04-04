package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.RoomVO;

import utils.Criteria;

public interface RoomService {

	List<RoomVO> getRoomByAcc(int aseq);//selectRoomByAcc
	
	List<RoomVO> getRoomListWithPaging(Criteria criteria, int aseq);//selectRoomByAcc
	
	int countRoomList(int aseq);
	

	RoomVO getRoomByRseq(int rseq);
	
	RoomVO getAccByRseq(int rseq);

	RoomVO selectRoomByRseq(int rseq);
	
	void insertRoom(RoomVO vo);
	
	void updateRoom(RoomVO vo);

}