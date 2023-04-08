package com.ezen.biz.dto;

import java.util.Date;

public class QnaVO {
	
	// Fields
	private int qseq;
	private String email;
	private String subject;
	private String content;
	private String reply;
	private Date indate;
	private int rep;

	// Getter, Setter 메소드
	public int getQseq() {
		return qseq;
	}

	public void setQseq(int qseq) {
		this.qseq = qseq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	public int getRep() {
		return rep;
	}

	public void setRep(int rep) {
		this.rep = rep;
	}

	// ToString
	@Override
	public String toString() {
		return "QnaVO [qseq=" + qseq + ", email=" + email + ", subject=" + subject + ", content=" + content + ", reply="
				+ reply + ", indate=" + indate + ", rep=" + rep + "]";
	}
} //QnaVO
