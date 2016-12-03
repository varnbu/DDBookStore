package com.ddbook.biz;

import java.util.List;

import com.ddbook.po.Book;
import com.ddbook.po.Manager;
import com.ddbook.dao.BookDao;
import com.ddbook.dao.ManagerDao;

public class ManagerBizImpl implements ManagerBiz{
	ManagerDao mdao = new ManagerDao();
	BookDao bdao = new BookDao();
	@Override
	public Manager login(Manager m) {
		// TODO Auto-generated method stub
		String sql = "select * from managerinfo where managername = '"+m.getManagername()+"' and "
				+ " password = '"+m.getPassword()+"'";
		return (Manager) mdao.get(sql, Manager.class);
	}
	@Override
	public List<Book> getAll() {
		String sql = "select * from bookinfo";
		return bdao.query(sql, Book.class);
	}
}
