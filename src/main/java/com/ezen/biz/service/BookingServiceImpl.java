package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.BookingDAO;
import com.ezen.biz.dto.BookingVO;

@Service("bookingService")
public class BookingServiceImpl implements BookingService {

	@Autowired
	private BookingDAO bDao;

	@Override
	public void insertBooking(BookingVO vo) {
		bDao.insertBooking(vo);
	}

	@Override
	public List<BookingVO> listBookByNameEmail(BookingVO vo) {
		return bDao.listBookByNameEmail(vo);
	}

	@Override
	public BookingVO selectBookByBseq(int bseq) {
		return bDao.selectBookByBseq(bseq);
	}

	@Override
	public void updateBookByBseq(int bseq) {
		bDao.updateBookByBseq(bseq);
	}

	@Override
	public void deleteBookByBseq(int bseq) {
		bDao.deleteBookByBseq(bseq);
	}

}
