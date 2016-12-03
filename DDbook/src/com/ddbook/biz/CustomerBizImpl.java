package com.ddbook.biz;

import java.util.List;

import com.ddbook.dao.CustomerDao;
import com.ddbook.po.Address;
import com.ddbook.po.Customer;

public class CustomerBizImpl implements CustomerBiz {
	CustomerDao cdao = new CustomerDao();

	@Override
	public boolean addCustomer(Customer c) {
		String sql = "insert into customerinfo(username,realname,tel,email,password) values(?,?,?,?,?)";
		Object[] params = {c.getUsername(),c.getRealname(),c.getTel(),c.getEmail(),c.getPassword()};		
		return cdao.update(sql, params);
	}

	@Override
	public Customer getCustomer(int cid) {
		String sql = "select * from customerinfo where cid="+cid+" order by commenttime desc";		
		return (Customer) cdao.get(sql, Customer.class);
	}

	@Override
	public boolean updateCustomer(Customer c) {
		String sql = " update customerinfo set username=?,realnamem=?,tel=?,email=? where cid = ?";
		Object[] params = {c.getUsername(),c.getRealname(),c.getTel(),c.getEmail(),c.getCid()};		
		return cdao.update(sql, params);
	}

	@Override
	public boolean updatePassword(int cid,String password) {
		String sql = " update customerinfo set password = ? where cid = ?";
		Object[] params = {password,cid};	
		System.out.println(cid+"/////"+password);
		return cdao.update(sql, params);	
	}

	@Override
	public List<Address> getAddress(int cid) {
		String sql = "select * from addressinfo where state = 1 and cid = "+cid;		
		return cdao.query(sql, Address.class);
	}

	@Override
	public boolean addAddress(Address a) {
		String sql = "insert into addressinfo(cid,address,people,tel) values(?,?,?,?)";
		Object[] params = {a.getCid(),a.getAddress(),a.getPeople(),a.getTel()};
		return cdao.update(sql, params);
	}

	@Override
	public boolean removeAddress(int addressid) {
		String sql = "delete from addressinfo where id = ?";
		Object[] params = {addressid};
		return cdao.update(sql, params);
	}

	@Override
	public boolean updateAddress(Address a) {
		String sql = "update addressinfo set address = ? where id = ?";
		Object[] params = {a.getAddress(),a.getId()};
		return cdao.update(sql, params);
	}

	@Override
	public Customer login(Customer c) {
		String sql = "select * from customerinfo where username ='"+c.getUsername()+"' and "
				+ " password = '"+c.getPassword()+"'";
		return (Customer) cdao.get(sql, Customer.class);

	}

	@Override
	public List<Customer> getAll() {
		String sql = "select * from customerinfo";		
		return cdao.query(sql, Customer.class);
	}

}
