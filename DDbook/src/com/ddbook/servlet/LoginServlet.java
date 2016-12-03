package com.ddbook.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddbook.biz.CartBiz;
import com.ddbook.biz.CartBizImpl;
import com.ddbook.biz.CustomerBiz;
import com.ddbook.biz.CustomerBizImpl;
import com.ddbook.biz.ManagerBiz;
import com.ddbook.biz.ManagerBizImpl;
import com.ddbook.po.Cart;
import com.ddbook.po.Customer;
import com.ddbook.po.Manager;

public class LoginServlet extends HttpServlet {
	CustomerBiz cbiz = new CustomerBizImpl();
	CartBiz cartbiz = new CartBizImpl();
	ManagerBiz mbiz = new ManagerBizImpl();

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
		if (method.equals("customer")) {
			customerLogin(request, response);
		}
		if(method.equals("manager")){
			managerLogin(request,response);
		}if(method.equals("logout")){
			customerlogout(request,response);
		}
	}

	private void customerlogout(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("customer");
		response.sendRedirect("/DDbook/index.jsp");
		
	}

	private void managerLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("managername");
		String pwd = request.getParameter("password");
		//String mid = request.getParameter("managerid");
		Manager m = new Manager();
		m.setManagername(name);
		m.setPassword(pwd);
		Manager manager = new Manager();
		manager = mbiz.login(m);
		if (manager != null) {
			HttpSession session = request.getSession();	
			session.setAttribute("manager", manager);
			response.sendRedirect("/DDbook/back/index.jsp");
		}else{
			request.setAttribute("msg", "<script type='text/javascript'> alert('用户名或密码错误') ;</script>");
			request.getRequestDispatcher("back/login.jsp").forward(
					request, response);
		}
		
	}

	private void customerLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession  hs = request.getSession(); 
		String checkcode = (String)hs.getAttribute("validationCode");
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		Customer t = new Customer();
		t.setUsername(name);
		t.setPassword(password);
		Customer customer = new Customer();
		customer = cbiz.login(t);
		if (customer != null) {
			if(code.equals(checkcode)){
				List<Cart> cartlist = cartbiz.getCart(customer.getCid());
				HttpSession session = request.getSession();
				session.setAttribute("cartlist", cartlist);
				session.setAttribute("customer", customer);
				response.sendRedirect("/DDbook/index.jsp");
			}else{
				if(code.equals("") || code == null){
					request.setAttribute("msg", "<script type='text/javascript'> alert('验证码不能为空') ;</script>");
					request.getRequestDispatcher("front/login.jsp").forward(
							request, response);
				}else{
					request.setAttribute("msg", "<script type='text/javascript'> alert('验证码错误') ;</script>");
					request.getRequestDispatcher("front/login.jsp").forward(
							request, response);
				}
			}
		}else{
			request.setAttribute("msg", "<script type='text/javascript'> alert('用户名或密码错误') ;</script>");
			request.getRequestDispatcher("front/login.jsp").forward(
					request, response);
		}
	}

}
