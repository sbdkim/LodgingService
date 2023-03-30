package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.location.Location;

@Repository
public class MapDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Location> getAllLocation(){
		return mybatis.selectList("LocationMapper.selectAccomodation");
	}
	
	
}//MapDAO
