package com.ddbook.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbook.biz.BookBiz;
import com.ddbook.biz.BookBizImpl;
import com.ddbook.biz.CustomerBiz;
import com.ddbook.biz.CustomerBizImpl;
import com.ddbook.biz.ManagerBiz;
import com.ddbook.biz.ManagerBizImpl;
import com.ddbook.biz.OrderBiz;
import com.ddbook.biz.OrderBizImpl;
import com.ddbook.po.Book;
import com.ddbook.po.Chart;
import com.ddbook.po.Customer;
import com.ddbook.po.Order;
import com.ddbook.po.OrderItem;
import com.ddbook.util.CreateChartXLS;
import com.ddbook.util.MailSenderInfo;
import com.ddbook.util.Page;
import com.ddbook.util.PageUtil;
import com.ddbook.util.SimpleMailSender;


public class ManagerServlet extends HttpServlet {
	ManagerBiz mbiz = new ManagerBizImpl();
	BookBiz bbiz = new BookBizImpl();
	OrderBiz obiz = new OrderBizImpl();
	CustomerBiz cbiz = new CustomerBizImpl();
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		if (method.equals("getall")){
			getAll(request,response);
		}if (method.equals("deleteone")){
			deleteone(request,response);
		}if(method.equals("delete")){
			delete(request,response);
		}if(method.equals("show")){
			show(request,response);
		}if(method.equals("update")){
			update(request,response);
		}if(method.equals("addbook")){
			addbook(request,response);
		}if(method.equals("showorder1")){
			showorder1(request,response);
		}if(method.equals("showitem1")){
			showitem1(request,response);
		}if(method.equals("showorder2")){
			showorder2(request,response);
		}if(method.equals("showitem2")){
			showitem2(request,response);
		}if(method.equals("fahuo")){
			fahuo(request,response);
		}if(method.equals("showorder3")){
			showorder3(request,response);
		}if(method.equals("showitem3")){
			showitem3(request,response);
		}if(method.equals("excel")){
			createXLS(request,response);
		}if(method.equals("mail")){
			sendmail(request,response);
		}
	}

	private void sendmail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		//这个类主要是设置邮件  
	      MailSenderInfo mailInfo = new MailSenderInfo();   
	      List<Customer> list = cbiz.getAll();
	      mailInfo.setMailServerHost("smtp.126.com");  // 服务器 
	      mailInfo.setMailServerPort("25");   // 端口
	      mailInfo.setValidate(true);   
	      mailInfo.setUserName("username");   
	      mailInfo.setPassword("*******");//您的邮箱的客户端授权码
	      mailInfo.setFromAddress("user@email.com");   
	      String text = request.getParameter("text");
	      System.out.println("%%%%%%%%%%%%%%%%%%");
	      System.out.println(text);
	      System.out.println("&&&&&&&&&&&&&&&&&&&&");
		for(int i = 0;i < list.size();i++){
			  System.out.println(list.get(i).getEmail());
		      mailInfo.setToAddress(list.get(i).getEmail());   
		      mailInfo.setSubject("叮叮书城");   
		      mailInfo.setContent(text);   
		         //这个类主要来发送邮件  		
		      SimpleMailSender sms = new SimpleMailSender();
		      //sms.sendTextMail(mailInfo);//发送文体格式   
		      sms.sendHtmlMail(mailInfo);//发送html格式  
		}

	}

	private void createXLS(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		 //获得项目服务器根路径
		  String path = request.getSession().getServletContext().getRealPath("");
		      //把所有的路径的单斜杠替换成双斜杠 
		  path = path.replace("\\","//");
		  //设置execl在服务器上的保存位置（项目根目录），可以修改路径
		  CreateChartXLS xls = new CreateChartXLS(path);
		  //查询所有用户信息
		  List<Chart> list = bbiz.getBySale1();
		  //传递给集合-excel转换类
		  Boolean flag =  xls.CreateExcel(list); 
		  
		  OutputStream o = response.getOutputStream();
		  byte b[] = new byte[1024000];
		  // the file to download.
		File fileLoad = new File(path,"chart.xls");
		// the dialogbox of download file.
		//指定弹出文件保存对话框信息
		response.setHeader("Content-disposition", "attachment;filename="+ "chart.xls");
		// set the MIME type.
		response.setContentType("application/vnd.ms-excel");
		// get the file length.
		long fileLength = fileLoad.length();
		String length = String.valueOf(fileLength);
		response.setHeader("Content_Length", length);
		// download the file.
		FileInputStream in = new FileInputStream(fileLoad);
		int n = 0;
		while ((n = in.read(b)) != -1) {
		o.write(b, 0, n);
		}

	}

	private void showitem3(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String oid = request.getParameter("oid");
		List<OrderItem> item = obiz.getOrderBysid(oid);
		List<Order> list = obiz.getOrder3();
		request.setAttribute("list", list);
		request.setAttribute("item", item);
		request.getRequestDispatcher("back/order_3.jsp").forward(
				request, response);
	}

	private void showorder3(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		List<Order> list = obiz.getOrder3();
		request.setAttribute("list", list);
		request.getRequestDispatcher("back/order_3.jsp").forward(
				request, response);
	}

	private void fahuo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String oid = request.getParameter("oid");
		boolean flag = obiz.setOrderState(oid, 3);
		if(flag){
			List<OrderItem> oitem = obiz.getOrderItemByid(oid);
			for (OrderItem o : oitem) {
				flag = bbiz.updateStore(o.getBid(), o.getNumber());
			}

			List<Order> list = obiz.getOrder2();
			request.setAttribute("list", list);
			request.getRequestDispatcher("back/order_3.jsp").forward(
					request, response);
		}
		
	}

	private void showitem2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String oid = request.getParameter("oid");
		List<OrderItem> item = obiz.getOrderBysid(oid);
		List<Order> list = obiz.getOrder2();
		request.setAttribute("list", list);
		request.setAttribute("item", item);
		request.getRequestDispatcher("back/order_2.jsp").forward(
				request, response);
		
	}

	private void showorder2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		List<Order> list = obiz.getOrder2();
		request.setAttribute("list", list);
		request.getRequestDispatcher("back/order_2.jsp").forward(
				request, response);
	}

	private void showitem1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String oid = request.getParameter("oid");
		List<OrderItem> item = obiz.getOrderBysid(oid);
		List<Order> list = obiz.getOrder1();
		request.setAttribute("list", list);
		request.setAttribute("item", item);
		request.getRequestDispatcher("back/order_1.jsp").forward(
				request, response);
		
		
	}

	private void showorder1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		List<Order> list = obiz.getOrder1();
		request.setAttribute("list", list);
		request.getRequestDispatcher("back/order_1.jsp").forward(
				request, response);
	}

	private void addbook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String bname = request.getParameter("bname");
		String ISBN = request.getParameter("ISBN");
		String img = request.getParameter("img");
		int store = Integer.parseInt(request.getParameter("store"));
		double price = Double.parseDouble(request.getParameter("price"));
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String category = request.getParameter("category");
		Book book = new Book(bname,ISBN,img,store,price,author,publisher,category);
		boolean flag = bbiz.addBook(book);
		getAll(request,response);
		if(flag){
			request.getRequestDispatcher("back/goods_list.jsp").forward(
					request, response);
		}
	}

	private void update(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("bookid"));
		double cprice = Double.parseDouble(request.getParameter("currentprice"));
		String category = request.getParameter("category");
		int store = Integer.parseInt(request.getParameter("store"));
		boolean flag = bbiz.updateBook(id, cprice, category, store);
		getAll(request,response);
		if(flag){
			request.getRequestDispatcher("back/goods_list.jsp").forward(
					request, response);
		}
		
	}

	private void show(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("bookid"));
		Book book1 = bbiz.getbookById(id);
		request.setAttribute("book1", book1);
		request.getRequestDispatcher("back/goods_listalter.jsp").forward(
				request, response);
	}

	private void delete(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException{
		String[] cstring = request.getParameterValues("box");
		boolean flag = false;
		for (String s : cstring) {
			System.out.println(s);
			flag = bbiz.removeBook(Integer.parseInt(s));
		}
		getAll(request,response);
	}

	private void deleteone(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String id = request.getParameter("bookid");
		boolean flag = bbiz.removeBook(Integer.parseInt(id));
		getAll(request,response);
		
	}

	private void getAll(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		
		int everyPage = 5;//每页记录数
		int totalCount = bbiz.getBookCount();//获取总记录数
		//点击链接重新获取当前页
		String scurrentPage = request.getParameter("currentPage");
		int currentPage = 1; //当前页，默认1
		if(scurrentPage == null){
			currentPage = 1;//从第一页开始访问
		}else{		
			currentPage = Integer.parseInt(scurrentPage);
		}
		//分页信息
		Page page = PageUtil.createPage(everyPage, totalCount, currentPage);
	    //分页数据信息
		List<Book> list = bbiz.findByPage(page);
		
		request.setAttribute("page", page);
		request.setAttribute("list", list);
	
		request.setAttribute("list", list);
		request.getRequestDispatcher("back/goods_list.jsp").forward(
				request, response);
	}

}
