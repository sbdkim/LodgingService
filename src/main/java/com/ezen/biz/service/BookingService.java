package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.AccommodationVO;
import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.SalesQuantity;

public interface BookingService {
	
	int selectMaxBseq();

	// 예약하기
	int insertBooking(BookingVO vo);

	//이메일로 예약내역 조회
	List<BookingVO> getListBookByEmail(BookingVO vo);
	
	List<BookingVO> getListBookByEmailAseq(BookingVO vo);

	// 예약번호로 예약내역 조회
	BookingVO SelectBookByBseq(int bseq);

	List<Integer> getSeqBooking(BookingVO vo);
	
	// 예약번호로 예약수정
	void updateBookByBseq(BookingVO vo);

	// 예약번호로 예약취소
	void deleteBookByBseq(int bseq);

	// 전체 예약 내역 조회
	List<BookingVO> getListBooking();
	
	 List<BookingVO> getListBookingByEmail(BookingVO vo);

	 List<BookingVO> getBookingListByAseq(BookingVO vo);
	 
	 List<SalesQuantity> getListBookingSales(AccommodationVO vo);
}