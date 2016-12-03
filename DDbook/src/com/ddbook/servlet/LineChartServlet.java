package com.ddbook.servlet;
import java.awt.Font;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

import com.ddbook.biz.BookBiz;
import com.ddbook.biz.BookBizImpl;
import com.ddbook.po.Chart;


public class LineChartServlet extends HttpServlet {
	BookBiz bbiz = new BookBizImpl();
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

		doPost(request, response);
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

		// 创建主题样式
				StandardChartTheme standardChartTheme = new StandardChartTheme("CN");
				// 设置标题字体
				standardChartTheme.setExtraLargeFont(new Font("隶书", Font.BOLD, 20));
				// 设置图例的字体
				standardChartTheme.setRegularFont(new Font("宋书", Font.PLAIN, 15));
				// 设置轴向的字体
				standardChartTheme.setLargeFont(new Font("宋书", Font.PLAIN, 15));
				// 应用主题样式
				ChartFactory.setChartTheme(standardChartTheme);

				// 返回图片
				response.setContentType("image/jpeg");
				
				//调用数据库数据

				// 创建数据
				DefaultCategoryDataset dataset = new DefaultCategoryDataset();
				
				// 调用数据库数据
				List<Chart> list = bbiz.getBySale();
				for(Chart c:list){
					dataset.setValue(c.getSum(), c.getCategory(), c.getEntrytime().substring(6, 7));
				}
				
//				dataset.setValue(100, "教育", "10年");
//				dataset.setValue(100, "教育", "11年");
//				dataset.setValue(100, "教育", "12年");
//				dataset.setValue(100, "教育", "13年");
//				dataset.setValue(100, "教育", "14年");
//
//				dataset.setValue(200, "文艺小说", "10年");
//				dataset.setValue(200, "文艺小说", "11年");
//				dataset.setValue(200, "文艺小说", "12年");
//				dataset.setValue(200, "文艺小说", "13年");
//				dataset.setValue(200, "文艺小说", "14年");
				
				// 创建图表
				JFreeChart chart = ChartFactory.createLineChart3D("图书销量折线图", "月份", "销量", 
						dataset, PlotOrientation.VERTICAL, true, false, false);
				
				// 生成图片
				ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 1.0f,
						chart, 600, 300, null);
	}

}
