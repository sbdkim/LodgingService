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
	@Autowired
	private BookingService bookingService;

	@Override
	public int selectMaxBseq() {
		
		return bDao.selectMaxBseq();
	}
	
	@Override
	public int insertBooking(BookingVO vo) {
		
		// 1.신규 예약번호 
		int bseq = selectMaxBseq();
		vo.setBseq(bseq);
		
		// 2.신규 예약을 예약 테이블에 저장
		bDao.insertBooking(vo);
		
		List<BookingVO> bookingList = bookingService.getListBookByEmail(vo);
		
		for(BookingVO booking : bookingList) {
			booking.setBseq(bseq);
			booking.setRseq(bseq);
			
			insertBooking(booking);
			
			bookingService.updateBookByBseq(vo);
		}
	
		return bseq;
	}

	@Override
	public List<BookingVO> getListBookByEmail(BookingVO vo) {
		return bDao.listBookByEmail(vo);
	}

	@Override
	public BookingVO SelectBookByBseq(int bseq) {
		return bDao.selectBookByBseq(bseq);
	}

	@Override
	public void updateBookByBseq(BookingVO vo) {
		bDao.updateBookByBseq(vo);
	}

	@Override
	public void deleteBookByBseq(int bseq) {
		bDao.deleteBookByBseq(bseq);
	}

	@Override
	public List<BookingVO> getListBooking() {
		return bDao.getListBooking();
	}

	@Override
	public List<Integer> getSeqBooking(BookingVO vo) {
		
		return bDao.selectSeqBooking(vo);
	}

	@Override
	public List<BookingVO> getListBookingByEmail(BookingVO vo) {
		
		return bDao.listBookingByEmail(vo);
	}

	@Override
	public List<BookingVO> getBookingListByAseq(BookingVO vo) {
	
		return bDao.bookingListByAseq(vo);
	}
	

}
