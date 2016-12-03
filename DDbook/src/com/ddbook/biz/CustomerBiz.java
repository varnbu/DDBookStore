package com.ddbook.biz;

import java.util.List;

import com.ddbook.po.Address;
import com.ddbook.po.Customer;

//顾客
public interface CustomerBiz {
	//买家注册
	public boolean addCustomer(Customer c);
	//根据用户的id查询
	public Customer getCustomer(int cid);
	//修改
	public boolean updateCustomer(Customer c);
	//修改密码
	public boolean updatePassword(int cid,String password);
	//得到地址列表
	public List<Address> getAddress(int cid);
	//添加新地址
	public boolean addAddress(Address a);
	//删除地址
	public boolean removeAddress(int addressid);
	//修改地址
	public boolean updateAddress(Address a);
	//买家登录
	public Customer login(Customer c);
	//得到所有用户信息
	public List<Customer> getAll();
}
