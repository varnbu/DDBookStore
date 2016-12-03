package com.ddbook.biz;

import java.util.List;

import com.ddbook.po.Cart;

public interface CartBiz {
	//获取购物车信息
	public List<Cart> getCart(int cid);
	//增加到购物车
	public boolean addCart(Cart cart);
	//移除
	public boolean removeCart(int cid,int bid);
}
