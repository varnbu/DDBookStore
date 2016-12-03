package com.ddbook.biz;

import java.util.List;

import com.ddbook.po.Book;
import com.ddbook.po.Manager;

public interface ManagerBiz {
	//管理员登录
	public Manager login(Manager m);
	//获取图书列表
	public List<Book> getAll();
}
