package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.QnaVO;

@Repository
public class QnaDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<QnaVO> getListQna(String email){
		return mybatis.selectList("QnaMapper.getListQna",email);
	}
	
	@Override
	public QnaVO getQna(int qseq) {
		
		return mybatis.selectOne("QnaMapper.getQna",qseq);
	}
	
	@Override
	public void insertQna(QnaVO vo) {
		
		mybatis.insert("QnaMapper.insertQna", vo);
	}
	
	@Override
	public List<QnaVO> getListAllQna() {
		
		return mybatis.selectList("QnaMapper.getListAllQna");
	}
	
	@Override
	public void updateQna(QnaVO vo) {
		
		mybatis.update("QnaMapper.updateQna", vo);
	}
}
