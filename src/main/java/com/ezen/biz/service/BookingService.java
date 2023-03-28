package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BookingVO;

public interface BookingService {

	// 예약하기
	void insertBooking(BookingVO vo);

	// 이름, 이메일로 예약내역 조회
	List<BookingVO> listBookByNameEmail(BookingVO vo);

	// 예약번호로 예약내역 조회
	BookingVO selectBookByBseq(int bseq);

	// 예약번호로 예약수정
	void updateBookByBseq(int bseq);

	// 예약번호로 예약취소
	void deleteBookByBseq(int bseq);

}