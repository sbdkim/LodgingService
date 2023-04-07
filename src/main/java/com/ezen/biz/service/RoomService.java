package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.RoomVO;

import utils.Criteria;

public interface RoomService {

	List<RoomVO> getRoomByAcc(BookingVO vo);//selectRoomByAcc
	
	List<RoomVO> getRoomListWithPaging(Criteria criteria, int aseq);//selectRoomByAcc
	
	int countRoomList(int aseq);
	
	RoomVO selectRoomByRseq(RoomVO vo);
	
	RoomVO getRoomByRseq(int rseq);
	
	RoomVO getAccByRseq(int rseq);
	
	void insertRoom(RoomVO vo);
	
	void updateRoom(RoomVO vo);
	
	void deleteRoom(int rseq);
	
	List<RoomVO> hostGetRoomByAcc(int aseq);

}