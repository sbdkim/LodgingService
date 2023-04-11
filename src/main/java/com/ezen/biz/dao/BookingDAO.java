package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.AccommodationVO;
import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.SalesQuantity;

@Repository
public class BookingDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 예약하기
	public void insertBooking(BookingVO vo) {
		mybatis.insert("BookingMapper.insertBooking", vo);
	}

	// 자신의 예약내역 조회
	public List<BookingVO> listBookByEmail(BookingVO vo) {
		return mybatis.selectList("BookingMapper.listBookByEmail", vo);
	}

	
	public List<BookingVO> listBookByAseq(BookingVO vo){
		return mybatis.selectList("BookingMapper.listBookByAseq12",vo);
	}

	// 예약번호로 예약내역 조회
	public BookingVO selectBookByBseq(BookingVO vo) {
		return mybatis.selectOne("BookingMapper.selectBookByBseq", vo);
	}
	
	public BookingVO selectBookByBseq(int  resq) {
		return mybatis.selectOne("BookingMapper.selectBookByBseq", resq);
	}
	
	public List<Integer> selectSeqBooking(BookingVO vo) {

		return mybatis.selectList("BookingMapper.selectSeqBooking", vo);
	}

	// 예약번호로 예약수정
	public void updateBookByBseq(BookingVO vo) {
		mybatis.update("BookingMapper.updateBookByBseq", vo);
	}

	// 예약번호로 예약취소
	public void deleteBookByBseq(int bseq) {
		mybatis.delete("BookingMapper.deleteBookByBseq", bseq);
	}

	// 전체 예약 내역 조회
	public List<BookingVO> getListBooking() {
		return mybatis.selectList("BookingMapper.getListBooking");
	}

	public List<BookingVO> listBookingByEmail(BookingVO vo) {
		return mybatis.selectList("BookingMapper.listBookingByEmail");
	}

	// aseq로 해당 예약내역 조회
	public List<BookingVO> bookingListByAseq(BookingVO vo) {
		return mybatis.selectList("BookingMapper.bookingListByAseq", vo);
	}


	public List<SalesQuantity> getListBookingSales() {
		return mybatis.selectList("BookingMapper.getListBookingSales");
	}
	
	public List<BookingVO> listBestAccom() {
		return mybatis.selectList("BookingMapper.listBestAccom");
	}
	
	public List<BookingVO> getMonthlyRevenue(){
		return mybatis.selectList("BookingMapper.listMonthlyRevenue");
	}
	
}//BookingDAO