package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.QnaVO;

public interface QnaService {

	List<QnaVO> getListQna(String email);

	QnaVO getQna(int qseq);

	void insertQna(QnaVO vo);

	List<QnaVO> getListAllQna();

	void updateQna(QnaVO vo);

	List<QnaVO> getListByHost(QnaVO vo);
}