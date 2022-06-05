<%@ page language="java" import="dao.*,entity.*,java.util.*"
         contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //1.获得购物车Map
    HashMap<String, CartItem> map = (HashMap<String, CartItem>) session.getAttribute("cart");

    //2.判断购物车Map是否存在,不存在则创建
    if (map == null) {
        map = new HashMap<String, CartItem>();
    }

    //3. 把产品添加到购物车
    //3.1 根据id获得添加购物的产品
    String id = request.getParameter("id");
    if (id == null || id.trim().isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    int productId = 0;
    try {
        productId = Integer.parseInt(id);
    } catch (NumberFormatException e) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    ProductDaoImp dao = new ProductDaoImp();
    Product p = dao.findById(productId);
    
    // 验证商品是否存在
    if (p == null || p.getId() == 0) {
        out.println("<script>alert('商品不存在！');history.back();</script>");
        return;
    }
    
    //3.2 判断Map中是否由此商品
    CartItem cartItem = map.get(id);
    if (cartItem != null) {
        //有--> 检查库存后把数量+1
        int newSum = cartItem.getSum() + 1;
        if (newSum > p.getNum()) {
            out.println("<script>alert('库存不足！当前库存：' + " + p.getNum() + ");history.back();</script>");
            return;
        }
        cartItem.setSum(newSum);
    } else {
        //无--> 检查库存后把商品放入购物车
        if (p.getNum() <= 0) {
            out.println("<script>alert('商品已售罄！');history.back();</script>");
            return;
        }
        cartItem = new CartItem();
        cartItem.setP(p);
        cartItem.setSum(1);
    }
    
    //3.3 产品加入集合
    map.put(id, cartItem);

    //4.把集合存储到session作用域
    session.setAttribute("cart", map);
    response.sendRedirect("cart.jsp");
%>