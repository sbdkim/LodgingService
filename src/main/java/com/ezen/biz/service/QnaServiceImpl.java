package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.QnaDAO;
import com.ezen.biz.dto.QnaVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
   
	@Autowired
	private QnaDAO qDao;
	
	
	@Override
	public List<QnaVO> getListQna(String email) {
		
		return qDao.getListQna(email);
	}

	@Override
	public QnaVO getQna(int qseq) {
		
		return qDao.getQna(qseq);
	}

	@Override
	public void insertQna(QnaVO vo) {
		
         qDao.insertQna(vo);
	}

	@Override
	public List<QnaVO> getListAllQna() {
		
		return qDao.getListAllQna();
	}

	@Override
	public void updateQna(QnaVO vo) {
		
		qDao.updateQna(vo);

	}

}
