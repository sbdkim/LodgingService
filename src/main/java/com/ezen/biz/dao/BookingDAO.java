package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.BookingVO;

@Repository
public class BookingDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 예약하기
	public void insertBooking(BookingVO vo) {
		mybatis.insert("BookingMapper.insertBooking", vo);
	}

	// 이름, 이메일로 예약내역 조회
	public List<BookingVO> listBookByNameEmail(BookingVO vo) {
		return mybatis.selectList("BookingMapper.listBookByNameEmail", vo);
	}

	// 예약번호로 예약내역 조회
	public BookingVO selectBookByBseq(int bseq) {
		return mybatis.selectOne("BookingMapper.selectBookByBseq", bseq);
	}

	// 예약번호로 예약수정
	public void updateBookByBseq(int bseq) {
		mybatis.update("Booking.updateBookByBseq", bseq);
	}

	// 예약번호로 예약취소
	public void deleteBookByBseq(int bseq) {
		mybatis.delete("Booking.deleteBookByBseq", bseq);
	}
}