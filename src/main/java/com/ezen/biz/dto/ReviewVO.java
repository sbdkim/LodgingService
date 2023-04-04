package com.ezen.biz.dto;

import java.util.Date;

public class ReviewVO {
	private int reseq;
	private int bseq;
	private String content;
	private double score;
	private Date indate;
	private String reply;
	private String email;
	private int  rseq;
	
	// Getter, Setter 메소드
	public int getReseq() {
		return reseq;
	}

	public void setReseq(int reseq) {
		this.reseq = reseq;
	}

	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}



	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
     
	
	
	public int getRseq() {
		return rseq;
	}

	public void setRseq(int rseq) {
		this.rseq = rseq;
	}

	@Override
	public String toString() {
		return "ReviewVO [reseq=" + reseq + ", bseq=" + bseq + ", content=" + content + ", score=" + score + ", indate="
				+ indate + ", reply=" + reply + ", email=" + email + ", rseq=" + rseq + "]";
	}


	
}
