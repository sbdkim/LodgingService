package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BookingVO;

public interface BookingService {
	
	int selectMaxBseq();
//
//	// 예약하기
//	int insertBooking(BookingVO vo);

	// 이름, 이메일로 예약내역 조회
	List<BookingVO> getListBookByNameEmail(BookingVO vo);

	// 예약번호로 예약내역 조회
	BookingVO SelectBookByBseq(int bseq);

	List<Integer> getSeqBooking(BookingVO vo);
	
	// 예약번호로 예약수정
	void updateBookByBseq(BookingVO vo);

	// 예약번호로 예약취소
	void deleteBookByBseq(int bseq);

	// 전체 예약 내역 조회
	List<BookingVO> getListBooking();
}