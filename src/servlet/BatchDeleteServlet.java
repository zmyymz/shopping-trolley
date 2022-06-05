package servlet;

import entity.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

/**
 * Servlet implementation class BatchDeleteServlet
 * 用于批量删除购物车中的商品
 */
@WebServlet("/BatchDeleteServlet")
public class BatchDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BatchDeleteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		HashMap<String, CartItem> cart = (HashMap<String, CartItem>) session.getAttribute("cart");
		
		String idsStr = request.getParameter("ids");
		
		if (idsStr == null || idsStr.trim().isEmpty() || cart == null) {
			out.print("no_items_selected");
			out.flush();
			out.close();
			return;
		}
		
		try {
			// 分割商品 ID 字符串
			String[] ids = idsStr.split(",");
			int deletedCount = 0;
			
			for (String id : ids) {
				id = id.trim();
				if (!id.isEmpty() && cart.containsKey(id)) {
					cart.remove(id);
					deletedCount++;
				}
			}
			
			// 更新 Session
			session.setAttribute("cart", cart);
			
			out.print("success:" + deletedCount);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("error");
		} finally {
			out.flush();
			out.close();
		}
	}
}
