package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ReviewDAO;
import com.ezen.biz.dto.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO rDao;

	@Override
	public void insertReview(ReviewVO vo) {
		rDao.insertReview(vo);
	}

	@Override
	public List<ReviewVO> selectReviewByRseq(int rseq) {
		return rDao.selectReviewByRseq(rseq);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		rDao.updateReview(vo);
	}

	@Override
	public void deleteReview(int reseq) {
		rDao.deleteReview(reseq);
	}

	@Override
	public List<ReviewVO> getListReview() {
		return rDao.getListReview();
	}

	@Override
	public void insertReply(ReviewVO vo) {
		rDao.insertReply(vo);
	}

}
