package com.ddbook.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddbook.biz.BookBiz;
import com.ddbook.biz.BookBizImpl;
import com.ddbook.biz.CartBiz;
import com.ddbook.biz.CartBizImpl;
import com.ddbook.biz.CustomerBiz;
import com.ddbook.biz.CustomerBizImpl;
import com.ddbook.biz.OrderBiz;
import com.ddbook.biz.OrderBizImpl;
import com.ddbook.po.Address;
import com.ddbook.po.Book;
import com.ddbook.po.Cart;
import com.ddbook.po.Customer;
import com.ddbook.po.Order;
import com.ddbook.po.OrderItem;

public class CustomerServlet extends HttpServlet {

	CustomerBiz cbiz = new CustomerBizImpl();
	BookBiz bbiz = new BookBizImpl();
	CartBiz cartbiz = new CartBizImpl();
	OrderBiz obiz = new OrderBizImpl();

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		if (method.equals("updatePwd")) {
			updatePwd(request, response);
		}
		if (method.equals("address")) {
			getAddress(request, response);
		}
		if (method.equals("deleteadd")) {
			deleteAddress(request, response);
		}
		if (method.equals("addaddress")) {
			addAddress(request, response);
		}
		if (method.equals("regist")) {
			addCustomer(request, response);
		}
		if (method.equals("getcartbook")) {
			getCartBook(request, response);
		}
		if (method.equals("deletebook")) {
			deletecartbook(request, response);
		}
		if (method.equals("addcart")) {
			addCart(request, response);
		}
		if (method.equals("setorder")) {
			setOrder(request, response);
		}
		if (method.equals("setaddress")) {
			setAddress(request, response);
		}
		if (method.equals("getCustomerOrder")) {
			getCustomerOrder(request, response);
		}
		if (method.equals("pay")) {
			payOrder(request, response);
		}
		if (method.equals("payorderitem")) {
			payorderitem(request, response);
		}
	}

	private void payorderitem(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("orderid");
		String orderitems = request.getParameter("orderitemid");
		int orderitemid = Integer.parseInt(orderitems);
		boolean flag = obiz.setOrderItemState(orderid, orderitemid, 2);
		if (flag) {
			request.setAttribute("msg",
					"<script type='text/javascript'> alert('支付成功，马上发货') ;</script>");
		} else {
			request.setAttribute("msg",
					"<script type='text/javascript'> alert('支付失败，请重新支付') ;</script>");

		}
		getCustomerOrder(request, response);
	}

	private void payOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("orderid");
		System.out.println(orderid.toString());
		boolean flag = obiz.setOrderState(orderid, 2);
		if (flag) {
			request.setAttribute("orderid", orderid);
			request.setAttribute("msg",
					"<script type='text/javascript'> alert('支付成功，马上发货') ;</script>");

		} else {
			request.setAttribute("orderid", orderid);
			request.setAttribute("msg",
					"<script type='text/javascript'> alert('支付失败，请重新支付') ;</script>");
		}
		getCustomerOrder(request, response);
	}

	private void getCustomerOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer!=null){
		System.out.println(customer.getCid() + "买家编号");
		List<Order> orderlist = obiz.getOrderBycid(customer.getCid());
		List<OrderItem> itemlist = new ArrayList<>();
		for (Order order : orderlist) {
			List<OrderItem> orit = obiz.getOrderItemByid(order.getOrderid());
			for (OrderItem orderItem : orit) {
				itemlist.add(orderItem);
			}
		}
		request.setAttribute("itemlist", itemlist);
		request.getRequestDispatcher("front/order.jsp").forward(request,
				response);
		}else{
			response.sendRedirect("/DDbook/front/login.jsp");
		}
	}

	private void setAddress(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		List<Address> list = cbiz.getAddress(customer.getCid());
		request.setAttribute("alist", list);
		// 转发到
		request.getRequestDispatcher("front/flow2.jsp").forward(request,
				response);

	}

	private void setOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		List<Cart> cartlist = (List<Cart>) session.getAttribute("cartbooklist");
		String address = request.getParameter("address");
		int addressid = Integer.parseInt(address);
		double total = 0;
		for (Cart c : cartlist) {
			total = total + c.getSubtotal();
		}
		boolean flag = obiz.addorder(customer.getCid(), total, cartlist,
				addressid);
		if (flag) {
			System.out.println("订单创建成功");
			// 查询该账号的订单号，并根据订单号查出orderitem,转发到买家订单处理页面
			//偷懒啊，妹的，不带这么玩的，偷懒的后果就是找了两天的bug
			//查找该顾客的所有订单，按照时间排序后取第一个，然后操作
			List<Order> orderlist = obiz.getOrderBycid(customer.getCid());
			Order o2 = new Order();
			for (Order o1 : orderlist) {
				o2.setCid(o1.getCid());
				o2.setOrderid(o1.getOrderid());
				o2.setOrdertime(o1.getOrdertime());
				o2.setState(o1.getState());
				o2.setTotal(o1.getTotal());
				break;
			}
			cartlist = cartbiz.getCart(customer.getCid());
			session.setAttribute("cartlist", cartlist);
			request.setAttribute("neworder", o2);
			request.getRequestDispatcher("front/order-success.jsp").forward(
					request, response);
		} else {
			getCustomerOrder(request, response);
		}

	}

	private void addCustomer(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String realname = request.getParameter("realname");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		Customer customer = new Customer(username, realname, password1, tel,
				email);
		boolean flag = cbiz.addCustomer(customer);
		if (!password1.equals(password2)) {
			request.setAttribute("msg",
					"<script type='text/javascript'> alert('密码不一致') ;</script>");
			flag = false;
		}
		if (flag) {

			request.setAttribute("msg",
					"<script type='text/javascript'> alert('注册成功，请登录') ;</script>");
			request.getRequestDispatcher("front/login.jsp").forward(request,
					response);
		} else {
			request.setAttribute("msg",
					"<script type='text/javascript'> alert('注册失败，请认真填写') ;</script>");
			request.getRequestDispatcher("front/register.jsp").forward(request,
					response);
		}
	}

	private void addCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer != null) {
			String numbers = request.getParameter("goodsnumber");
			String price = request.getParameter("price");
			String bids = request.getParameter("bid");
			int bid = Integer.parseInt(bids);
			double currentprice = Double.parseDouble(price);
			int number = Integer.parseInt(numbers);
			Cart cart = new Cart();
			cart.setBid(bid);
			cart.setCid(customer.getCid());
			cart.setNumber(number);
			cart.setSubtotal(number * currentprice);
			cart.setCid(customer.getCid());
			cart.setCurrentprice(currentprice);
			boolean flag = cartbiz.addCart(cart);
			if (flag) {
				List<Cart> cartlist = cartbiz.getCart(customer.getCid());
				session.setAttribute("cartlist", cartlist);
				request.setAttribute("msg",
						"<script type='text/javascript'>alert('添加成功！')</script>");
				getCartBook(request, response);
			} else {
				request.setAttribute("msg",
						"<script type='text/javascript'>alert('添加失败！')</script>");
				response.sendRedirect("index.jsp");
			}
		}else{
			request.setAttribute("msg", 	"<script type='text/javascript'>alert('请先登录')</script>");
			response.sendRedirect("/DDbook/front/login.jsp");
		}
	}

	private void addAddress(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		int cid = customer.getCid();
		String sname = request.getParameter("sname");
		String sadd = request.getParameter("sadd");
		String tel = request.getParameter("tel");
		Address add = new Address(cid, sadd, sname, tel);
		boolean flag = cbiz.addAddress(add);
		List<Address> list = cbiz.getAddress(customer.getCid());
		request.setAttribute("list", list);
		if (flag) {
			request.getRequestDispatcher("front/address.jsp").forward(request,
					response);
		}
	}

	private void deletecartbook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String cid = request.getParameter("cid");
		String bid = request.getParameter("bid");
		boolean flag = cartbiz.removeCart(Integer.parseInt(cid),
				Integer.parseInt(bid));
		if (flag) {
			List<Cart> cartlist = cartbiz.getCart(Integer.parseInt(cid));
			HttpSession session = request.getSession();
			session.setAttribute("cartlist", cartlist);
		} else {
			request.setAttribute("msg",
					"<script type='text/javascript'>alert('删除失败')</script>");
		}
		getCartBook(request, response);

	}

	private void getCartBook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		List<Cart> cartlist = cartbiz.getCart(customer.getCid());
		List<Cart> cartbooklist = new ArrayList();
		for (Cart c : cartlist) {
			Book b = bbiz.getbookById(c.getBid());
			c.setBname(b.getBname());
			c.setImg1(b.getImg1());
			c.setCurrentprice(b.getCurrentprice());
			cartbooklist.add(c);
		}
		session.setAttribute("cartlist", cartlist);
		session.setAttribute("cartbooklist", cartbooklist);
		response.sendRedirect("/DDbook/front/flow.jsp");
	}

	private void deleteAddress(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		String id = request.getParameter("addressid");
		boolean flag = cbiz.removeAddress(Integer.parseInt(id));
		List<Address> list = cbiz.getAddress(customer.getCid());
		request.setAttribute("list", list);
		if (flag) {
			request.getRequestDispatcher("front/address.jsp").forward(request,
					response);
		}
	}

	private void getAddress(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		List<Address> list = cbiz.getAddress(customer.getCid());
		request.setAttribute("list", list);
		// 转发到
		request.getRequestDispatcher("front/address.jsp").forward(request,
				response);

	}

	private void updatePwd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String password3 = request.getParameter("password3");
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		boolean flag = true;
		if (password1.equals(customer.getPassword())) {

			if (password1.equals(password2)) {
				flag = false;
				request.setAttribute("msg",
						"<script type='text/javascript'> alert('新密码不能与原密码一致') ;</script>");
			} else {
				if (password2.equals(password3)) {
					flag = cbiz.updatePassword(customer.getCid(), password3);
				} else {
					flag = false;
					request.setAttribute("msg",
							"<script type='text/javascript'> alert('密码不一致') ;</script>");
				}
			}

		} else {
			request.setAttribute("msg",
					"<script type='text/javascript'> alert('密码错误') ;</script>");
		}
		if (flag) {
			request.setAttribute("msg",
					"<script type='text/javascript'> alert('修改成功') ;</script>");
			request.getRequestDispatcher("/front/member_info.jsp").forward(
					request, response);
		} else {
			request.getRequestDispatcher("/front/password_eidt.jsp").forward(
					request, response);
		}
	}

}
