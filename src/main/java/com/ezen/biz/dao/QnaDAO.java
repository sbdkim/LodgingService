package com.ezen.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.QnaVO;

import utils.Criteria;

@Repository
public class QnaDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public List<QnaVO> getListQna(String email) {
		return mybatis.selectList("QnaMapper.getListQna", email);
	}

	public QnaVO getQna(int qseq) {
		return mybatis.selectOne("QnaMapper.getQna", qseq);
	}

	public void insertQna(QnaVO vo) {
		mybatis.insert("QnaMapper.insertQna", vo);
	}

	public List<QnaVO> getListAllQna() {
		return mybatis.selectList("QnaMapper.getListAllQna");
	}

	public void updateQna(QnaVO vo) {
		mybatis.update("QnaMapper.updateQna", vo);
	}

	public List<QnaVO> listQnaWithPaging(Criteria criteria) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		return mybatis.selectList("QnaMapper.listQnaWithPaging", map);
	}
	
	public int countQna() {
		return mybatis.selectOne("QnaMapper.countQna");
	}

}// QnaDAO
