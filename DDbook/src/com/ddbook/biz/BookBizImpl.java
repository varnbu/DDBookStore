package com.ddbook.biz;

import java.util.List;

import com.ddbook.dao.BookDao;
import com.ddbook.po.Book;
import com.ddbook.po.Chart;
import com.ddbook.po.PieChart;
import com.ddbook.po.Store;
import com.ddbook.util.CountUtil;
import com.ddbook.util.Page;

public class BookBizImpl implements BookBiz {

	BookDao bdao = new BookDao();

	@Override
	public List<Book> findByPage(Page page) {
		String sql = "select * from bookinfo where state=1 limit " + page.getBeginIndex()
				+ ", " + page.getEveryPage();
		return bdao.query(sql, Book.class);
	}

	@Override
	public int getBookCount() {
		String sql = "select count(*) as count from bookinfo where state=1";
		CountUtil count = (CountUtil) bdao.get(sql, CountUtil.class);
		return count.getCount();
	}

	@Override
	public Book getbookById(int bid) {
		String sql = "select * from bookinfo where bid=" + bid;
		return (Book) bdao.get(sql, Book.class);
	}

	@Override
	public List<Book> getByCondition(String[] condition, Page page) {
		String sql = null;
		if (condition[0].equals("bookname")) {
			sql = "select * from bookinfo where bname like '%" 
					+ condition[1] + "%' limit " + page.getBeginIndex()+ ", " + page.getEveryPage();
		} else if (condition[0].equals("category")) {
			sql = "select * from bookInfo where category like '%" + condition[1]
					+ "%' limit " + page.getBeginIndex()+ ", " + page.getEveryPage();
		} else if (condition[0].equals("author")) {
			sql = "select * from bookinfo where author like '%" + condition[1]
					+ "%' limit " + page.getBeginIndex()+ ", " + page.getEveryPage();
		} else if (condition[0].equals("currentprice")) {
			sql = "select * from bookinfo where currentprice between "
					+ condition[1] + " and " + condition[2] +" limit " + page.getBeginIndex()+ ", " + page.getEveryPage();;
		}

		return bdao.query(sql, Book.class);
	}

	@Override
	public List<Book> getBySellerId(int sid, Page page) {
		String sql = "select b.* from bookinfo as b, storeinfo as s where b.bid=s.bid and s.sellerid="
				+ sid
				+ " limit "
				+ page.getBeginIndex()
				+ ", "
				+ page.getEveryPage();
		System.out.println(sql);
		return bdao.query(sql, Book.class);
	}

	@Override
	public int getBoookCountBySeller(int sid) {
		String sql = "select count(*) as count from storeinfo where state=1 and sellerid="+sid;
		CountUtil count = (CountUtil) bdao.get(sql, CountUtil.class);
		return count.getCount();
	}

	@Override
	public boolean removeBook(int bid) {
		//删除两部分，删除卖家库存表中的信息，删除bookinfo中的信息
		
		String sql = "update bookinfo as b, storeinfo as s set b.state=0,s.state=0 where s.bid=b.bid and b.bid=?";
		Object[] params = {bid};
		return bdao.update(sql, params);
	}

	
	

	@Override
	public boolean updateStore(int bid, int number) {
		String sql = "update bookinfo set store= store-? where bid = ?";
		Object[] params = {number,bid};
		return bdao.update(sql, params);
	}

	@Override
	public Store getStore(int bid) {
		String sql = "select * from storeinfo as s where s.bid="+bid;
		
		return (Store) bdao.get(sql, Store.class);
	}

	@Override
	public List<Book> getBySales() {
		String sql = "select * from bookinfo order by sales desc limit 0,5";
		return bdao.query(sql, Book.class);
	}

	@Override
	public List<Book> getByDate() {
		String sql="select * from bookinfo order by entrytime desc limit 0,5";
		return bdao.query(sql, Book.class);
	}

	@Override
	public List<Book> getNullBook() {
		String sql = "";	
		return bdao.query(sql, Book.class);
	}

	@Override
	public List<Book> getSearch(String bname) {
		String sql = "select * from bookinfo where bname like '%"+bname+"%'";
		return bdao.query(sql, Book.class);
	}
	@Override
	public boolean updateBook(int bid,double currentprice, String category, int store) {
		String sql="update bookinfo set currentprice = ?, category = ?, store = ? where bid="+bid;
		Object[] params = {currentprice,category,store};
		return bdao.update(sql, params);
	}

	@Override
	public boolean addBook(Book book) {
		String sql = "insert into bookinfo(bname,price,ISBN,author,publisher,category,img1,store) values(?,?,?,?,?,?,?,?)";
		Object[] params={book.getBname(),book.getPrice(),book.getISBN(),book.getAuthor(),book.getPublisher(),book.getCategory(),book.getImg1(),book.getStore()};
		return bdao.update(sql, params);
	}
	@Override
	public List<PieChart> getBySlaes() {
		// TODO Auto-generated method stub
		String sql = "select category,sum(sales) as sum from bookinfo group by category";
		return bdao.query(sql, PieChart.class);
	}

	@Override
	public List<Chart> getBySale() {
		String sql = "select entrytime,category,sum(sales) as sum from bookinfo group by category,entrytime order by entrytime ";
		return bdao.query(sql, Chart.class);
	}

	@Override
	public List<Chart> getBySale1() {
		String sql = "select entrytime,category,sum(sales) as sum from bookinfo group by category,substring(entrytime,6,2) order by entrytime ";
		return bdao.query(sql, Chart.class);
	}


}
