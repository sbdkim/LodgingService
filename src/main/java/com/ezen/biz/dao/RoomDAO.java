package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.RoomVO;

@Repository
public class RoomDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public List<RoomVO> selectRoomByAcc(String aseq){
		return mybatis.selectList("RoomMapper.selectRoomByAcc", aseq);
	}//selectRoomByAcc
	
	
}//RoomDAO
