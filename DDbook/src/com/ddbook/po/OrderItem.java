package com.ddbook.po;

public class OrderItem {
	private int orderitemid;
	private String orderid;
	private int bid;
	private int number;
	private double subtotal;
	private int state;
	private int sellerid;
	private double currentprice;
	private String bname;
	
	public double getCurrentprice() {
		return currentprice;
	}
	public void setCurrentprice(double currentprice) {
		this.currentprice = currentprice;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getSellerid() {
		return sellerid;
	}
	public void setSellerid(int sellerid) {
		this.sellerid = sellerid;
	}
	public int getOrderitemid() {
		return orderitemid;
	}
	public void setOrderitemid(int orderitemid) {
		this.orderitemid = orderitemid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}
