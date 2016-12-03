package com.ddbook.biz;

import java.util.List;

import com.ddbook.po.Seller;

public interface SellerBiz {
	//卖家注册
	public boolean addSeller(Seller seller);
	//根据卖家ID查询
	public List<Seller> getSeller(int sid);
	//修改密码
	public boolean upadtePassword(int sid, String password);
	//修改个人信息
	public boolean updateSeller(Seller seller);
}
