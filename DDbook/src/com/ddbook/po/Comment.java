package com.ddbook.po;

import java.util.Date;

public class Comment {
	public int commentid;
	public int bid;
	public String orderid;
	public String content;
	public int grade;
	public Date commenttime;
	
	public Date getCommenttime() {
		return commenttime;
	}
	public void setCommenttime(Date commenttime) {
		this.commenttime = commenttime;
	}
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
