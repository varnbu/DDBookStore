package com.ddbook.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.ddbook.dao.OrderDao;
import com.ddbook.po.Cart;
import com.ddbook.po.Order;
import com.ddbook.po.OrderItem;
import com.ddbook.util.DBConnection;
import com.ddbook.util.StringUtil;

public class OrderBizImpl implements OrderBiz {

	OrderDao odao = new OrderDao();

	@Override
	public boolean addorder(int cid, double total, List<Cart> list,
			int addressid) {
		Connection conn = DBConnection.getConncetions();
		boolean flag = false;
		String orderid = StringUtil.getOrderId();
		try {
			conn.setAutoCommit(false);
			odao.setConn(conn);
			String sql = "insert into ddbook.order(orderid,cid,total,addressid) values(?,?,?,?)";
			Object[] params = { orderid, cid, total, addressid };
			flag = odao.update(sql, params);
			for (Cart cart : list) {
				String sql2 = "insert into ddbook.orderitem(orderid,bid,number,subtotal,sellerid,currentprice,bname) values(?,?,?,?,?,?,?)";
				Object[] params2 = { orderid, cart.getBid(), cart.getNumber(),
						cart.getSubtotal(), cart.getSellerid(),
						cart.getCurrentprice(), cart.getBname() };
				flag = odao.update(sql2, params2);
				String sql3 = "update cart set cart.state=0 where cid=? and cart.bid =?";
				Object[] params3 = { cid, cart.getBid() };
				flag = odao.update(sql3, params3);
			}
			conn.commit();
		} catch (SQLException e) {
			flag = false;
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			odao.closeConn(conn);
		}
		return flag;
	}

	@Override
	public List<OrderItem> getOrderItemByid(String orderid) {
		Connection conn = DBConnection.getConncetions();
		odao.setConn(conn);
		String sql = "select * from ddbook.orderitem where orderid ='"
				+ orderid + "'";
		List<OrderItem> list = odao.query(sql, OrderItem.class);
		odao.closeConn(conn);
		return list;
	}

	@Override
	public boolean setOrderState(String orderid, int state) {
		Connection conn = DBConnection.getConncetions();
		boolean flag = false;
		try {
			conn.setAutoCommit(false);
			odao.setConn(conn);
			String sql = "update ddbook.order set state = ? where orderid = ?";
			Object[] params = { state, orderid };
			flag = odao.update(sql, params);
		    System.out.println(sql);
			System.out.println(state+"////"+orderid);
			if (flag) {
				String sql2 = "update ddbook.orderitem set state = ? where orderid = ?";
				Object[] params2 = { state, orderid };
				flag = odao.update(sql2, params2);
			}
			
			conn.commit();
		} catch (SQLException e) {
			flag = false;
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();

		} finally {
			odao.closeConn(conn);
		}
		return flag;

	}

	@Override
	public boolean setOrderItemState(String orderid, int oitemid, int state) {
		Connection conn = DBConnection.getConncetions();
		odao.setConn(conn);
		boolean flag = true;
		String sql = "update ddbook.orderitem set state = ? where orderid = ? and orderitemid = ?";
		Object[] params = { state, orderid, oitemid };
		try {
			flag = odao.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			odao.closeConn(conn);
		}
		return flag;
	}

	@Override
	public List<Order> getOrderBycid(int cid) {
		Connection conn = DBConnection.getConncetions();
		odao.setConn(conn);
		// boolean flag = true;
		List<Order> list;
		String sql = "select * from ddbook.order where cid = " + cid
				+ " order by ordertime desc";
		list = odao.query(sql, Order.class);
		odao.closeConn(conn);
		return list;
	}

	@Override
	public List<OrderItem> getOrderBysid(String oid) {
		Connection conn = DBConnection.getConncetions();
		odao.setConn(conn);
		String sql = "select * from orderitem where orderid = " + oid
				+ " order by orderid desc";
		List<OrderItem> list;
		list = odao.query(sql, OrderItem.class);
		odao.closeConn(conn);
		return list;
	}

	@Override
	public List<Order> getOrder1() {
		Connection conn = DBConnection.getConncetions();
		odao.setConn(conn);
		String sql = "select * from DDbook.order where state = 1";
		List<Order> list = odao.query(sql, Order.class);
		odao.closeConn(conn);
		return list;
	}

	@Override
	public List<Order> getOrder2() {
		Connection conn = DBConnection.getConncetions();
		odao.setConn(conn);
		String sql = "select * from DDbook.order where state = 2";
		List<Order> list = odao.query(sql, Order.class);
		odao.closeConn(conn);
		return list;
	}

	@Override
	public List<Order> getOrder3() {
		Connection conn = DBConnection.getConncetions();
		odao.setConn(conn);
		String sql = "select * from DDbook.order where state = 3";
		List<Order> list = odao.query(sql, Order.class);
		odao.closeConn(conn);
		return list;
	}



}
