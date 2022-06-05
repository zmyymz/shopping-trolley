package servlet;

import dao.ProductDaoImp;
import entity.CartItem;
import entity.Product;

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
 * Servlet implementation class UpdateCartServlet
 * 用于更新购物车中商品数量
 */
@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
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
		// 设置控制台输出编码
		System.setProperty("file.encoding", "UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		HashMap<String, CartItem> cart = (HashMap<String, CartItem>) session.getAttribute("cart");
		
		String idStr = request.getParameter("id");
		String quantityStr = request.getParameter("quantity");
		
		if (idStr == null || quantityStr == null || cart == null) {
			out.print("error");
			out.flush();
			out.close();
			return;
		}
		
		try {
			int id = Integer.parseInt(idStr);
			int quantity = Integer.parseInt(quantityStr);

			if (quantity < 1) {
				System.out.println("[UpdateCartServlet] ERROR: Quantity less than 1, update rejected");
				out.print("error");
				out.flush();
				out.close();
				return;
			}
			
			// 验证库存
			ProductDaoImp dao = new ProductDaoImp();
			Product p = dao.findById(id);
			
			if (p == null) {
				System.out.println("[UpdateCartServlet] ERROR: Product not found");
				out.print("product_not_exist");
				out.flush();
				out.close();
				return;
			}
			
			if (quantity > p.getNum()) {
				System.out.println("[UpdateCartServlet] ERROR: Insufficient stock, available: " + p.getNum());
				out.print("insufficient_stock");
				out.flush();
				out.close();
				return;
			}
			
			// 更新购物车中的商品数量
			CartItem cartItem = cart.get(idStr);
			if (cartItem != null) {
				int oldQuantity = cartItem.getSum();
				System.out.println("[UpdateCartServlet] Quantity before update: " + oldQuantity);
				System.out.println("[UpdateCartServlet] Quantity after update: " + quantity);
				cartItem.setSum(quantity);
				session.setAttribute("cart", cart);
				System.out.println("[UpdateCartServlet] SUCCESS: Update completed, session refreshed");
				System.out.println("========================================");
				out.print("success");
			} else {
				System.out.println("[UpdateCartServlet] ERROR: Item not found in cart");
				out.print("item_not_found");
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println("[UpdateCartServlet] ERROR: Invalid parameter format");
			out.print("error");
		} finally {
			out.flush();
			out.close();
		}
	}
}
