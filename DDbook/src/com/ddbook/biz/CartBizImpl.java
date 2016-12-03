package com.ddbook.biz;

import java.util.List;

import com.ddbook.dao.CartDao;
import com.ddbook.po.Cart;

public class CartBizImpl implements CartBiz {
	CartDao cdao = new CartDao();
	@Override
	public List<Cart> getCart(int cid) {
		String sql="select bookinfo.bname,cart.* from cart ,bookinfo where cid="+cid+" and bookinfo.bid=cart.bid and cart.state=1";
		return cdao.query(sql, Cart.class);
	}

	@Override
	public boolean addCart(Cart cart) {
		String sql ="insert into cart(cid,bid,sellerid,number,subtotal)values(?,?,?,?,?)";
		Object[] params = {cart.getCid(),cart.getBid(),cart.getSellerid(),cart.getNumber(),cart.getSubtotal()};
		return cdao.update(sql, params);
	}

	@Override
	public boolean removeCart(int cid,int bid) {
		String sql="delete  from cart where cid=? and bid =?";
		Object[] params = {cid,bid};
		return cdao.update(sql, params);
		
	}
	
}
