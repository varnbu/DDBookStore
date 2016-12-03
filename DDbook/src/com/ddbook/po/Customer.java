package com.ddbook.po;

public class Customer {

	private int cid;
	private String username;
	private String realname;
	private String tel;
	private String email;
	private String password;
	private int state;
	
	public Customer(String username, String realname, String password1,
			String tel, String email) {
		super();
		this.username = username;
		this.realname = realname;
		this.password = password1;
		this.tel = tel;
		this.email = email;
	}
	public Customer(){
		
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}

	
}
