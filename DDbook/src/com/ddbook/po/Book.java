package com.ddbook.po;

public class Book {
	
	private int bid;
	private String bname;
	private double price;
	private double currentprice;
	private String ISBN;
	private int sales;
	private String publisher;
	private String author;
	private String category;
	private String img1;
	private String img2;
	private int state;
	private int store;
	private String entrytime;

	
	public Book(String bname, String ISBN, String img, int store,
			double price, String author, String publisher, String category) {
		super();
		this.bname = bname;
		this.ISBN = ISBN;
		this.img1 = img;
		this.store = store;
		this.price = price;
		this.author = author;
		this.publisher = publisher;
		this.category = category;
	}
	public Book(){
		
	}
	public int getStore() {
		return store;
	}
	public void setStore(int store) {
		this.store = store;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getCurrentprice() {
		return currentprice;
	}
	public void setCurrentprice(double currentprice) {
		this.currentprice = currentprice;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getEntrytime() {
		return entrytime;
	}
	public void setEntrytime(String entrytime) {
		this.entrytime = entrytime;
	}
	
}



























