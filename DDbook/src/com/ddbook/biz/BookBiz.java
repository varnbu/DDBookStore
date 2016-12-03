package com.ddbook.biz;

import java.util.List;

import com.ddbook.po.Book;
import com.ddbook.po.Chart;
import com.ddbook.po.PieChart;
import com.ddbook.po.Store;
import com.ddbook.util.Page;

public interface BookBiz {
	//得到book
	public List<Book> findByPage(Page page);
	//得到总数
	public int getBookCount();
	//得到单个商品详细信息
	public Book getbookById(int bid);
	//根据条件查询商品, 条件是指book的类别，书名，作者，价格区间等等
	public List<Book> getByCondition(String[] condition, Page page);
	
	//得到该卖家的所有book
	public List<Book> getBySellerId(int sid,Page page);
	//得到该商家book总数
	public int getBoookCountBySeller(int sid);
	//删除book
	public boolean removeBook(int bid);
	//修改book信息
	public boolean updateBook(int bid,double currentprice,String category,int store);
	//更改库存
	public boolean updateStore(int bid,int number);
	//得到库存
	public Store getStore(int bid);
	//按销量查询
	public List<Book> getBySales();
	//按日期查询
	public List<Book> getByDate();
	//得到空的List
	public List<Book> getNullBook();
	//搜索
	public List<Book> getSearch(String bname);
	//添加图书
	public boolean addBook(Book book);

	// 按类别查询
	public List<PieChart> getBySlaes();//饼图查询
	
	public List<Chart> getBySale();//柱状图、折线图查询
	public List<Chart> getBySale1();
}

