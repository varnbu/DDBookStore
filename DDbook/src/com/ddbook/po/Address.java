package com.ddbook.po;

public class Address {
	////
	private int id;
	private int cid;
	private String address;
	private int state;
	private String people;
	private String tel;
	public Address(int cid, String sadd, String sname, String tel) {
		super();
		this.cid = cid;
		this.address = sadd;
		this.people = sname;
		this.tel = tel;
	}
	public Address(){
		
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	

}
