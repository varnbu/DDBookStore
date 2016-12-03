package com.ddbook.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbook.biz.BookBiz;
import com.ddbook.biz.BookBizImpl;
import com.ddbook.biz.CommentBiz;
import com.ddbook.biz.CommentBizImpl;
import com.ddbook.biz.OrderBiz;
import com.ddbook.biz.OrderBizImpl;
import com.ddbook.po.Book;
import com.ddbook.po.Comment;
import com.ddbook.po.Store;
import com.ddbook.util.Page;
import com.ddbook.util.PageUtil;

public class BookServlet extends HttpServlet {
	BookBiz bbiz = new BookBizImpl();
	CommentBiz combiz = new CommentBizImpl();
	OrderBiz obiz = new OrderBizImpl();
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
		this.doPost(request,response);
		
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
		if (method.equals("getbysales")) {
			getBySales(request, response);
		}if(method.equals("booklist")){
			getBookList(request,response);
		}if(method.equals("bookinfo")){
			getBookInfo(request,response);
		}if(method.equals("search")){
			getSearch(request,response);
		}if(method.equals("bookcomment")){
			bookcomment(request,response);
		}if(method.equals("addcomment")){
			addcomment(request,response);
		}
		
	}
	private void addcomment(HttpServletRequest request,
			HttpServletResponse response)  throws ServletException, IOException{
		String orderid = request.getParameter("orderid");	
		Comment comment = new Comment();
		comment.setBid(Integer.parseInt(request.getParameter("bookid")));
		comment.setGrade(Integer.parseInt(request.getParameter("grades")));
		comment.setContent(request.getParameter("content"));
		comment.setOrderid(orderid);
		boolean flag = combiz.addComment(comment);
		if(flag){
			
			flag = obiz.setOrderItemState(orderid, comment.getBid(), 4);
			if(flag){
				request.setAttribute("msg", "<script type='text/javascript'>alert('评论成功！')</script>");

			}
		}else{
			request.setAttribute("msg", "<script type='text/javascript'>alert('评论失败！')</script>");
			
		}
		getBookInfo(request,response);
	}

	private void bookcomment(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		request.setAttribute("comment", "comment");
		getBookInfo(request,response);
	}

	private void getSearch(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String bname = request.getParameter("search_content");
		List<Book> list = bbiz.getSearch(bname);
		request.setAttribute("list", list);
		// 转发到
		request.getRequestDispatcher("front/search.jsp").forward(request,
				response);
	}

	private void getBookInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String bookid =   request.getParameter("bookid");
		String orderid = request.getParameter("orderid");
		request.setAttribute("orderid", orderid);
//		System.out.println(orderid.toString());
		if(bookid!=null){
			int bid = Integer.parseInt(bookid);
			Book book = bbiz.getbookById(bid);
			Store store = bbiz.getStore(bid);
			List<Comment> comm = combiz.getComment(bid);
			request.setAttribute("store", store);
			request.setAttribute("comm", comm);
			request.setAttribute("book", book);
			request.getRequestDispatcher("/front/goods.jsp").forward(request, response);
		}		
	}

	private void getBookList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		int everyPage = 8;
		int totalCount = bbiz.getBookCount();
		String scurrentPage = request.getParameter("currentPage");
		int currentPage = 1;
		String c1 = request.getParameter("category");
		String[] conditions = {"category",c1};
		request.setAttribute("category", c1);
		if(scurrentPage==null){
			currentPage=1;
		}else{
			currentPage = Integer.parseInt(scurrentPage);
		}
		Page page = PageUtil.createPage(everyPage, totalCount, currentPage);
		List<Book> blist = bbiz.getByCondition(conditions, page);
		request.setAttribute("page", page);
		request.setAttribute("blist",blist);
		request.getRequestDispatcher("/front/list.jsp").forward(request, response);	
	}

	private void getBySales(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		List<Book> list = bbiz.getBySales();
		List<Book> list2 = bbiz.getByDate();
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		
		request.getRequestDispatcher("front/index.jsp").forward(
				request, response);
	}

}
