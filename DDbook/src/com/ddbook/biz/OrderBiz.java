package com.ddbook.biz;

import java.util.List;

import com.ddbook.po.Cart;
import com.ddbook.po.Order;
import com.ddbook.po.OrderItem;

public interface OrderBiz {
	
	//添加订单
	public boolean addorder(int cid,double total,List<Cart> list,int addressid);
	//得到订单商品
	public List<OrderItem> getOrderItemByid(String orderid);
	//设置订单状态
	public boolean setOrderState(String orderid,int state);
	//设置订单商品状态
	public boolean setOrderItemState(String orderid,int orderitemid, int state);
	//根据顾客编号得到订单
	public List<Order> getOrderBycid(int cid);
	//根据订单号得到订单详情
	public List<OrderItem> getOrderBysid(String oid);
	//得到所有订单
	public List<Order> getOrder1();
	public List<Order> getOrder2();
	public List<Order> getOrder3();
}
