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
    
    // 获取用户指定的数量，如果没有则默认为1
    String quantityStr = request.getParameter("quantity");
    int targetQuantity = 1;
    if (quantityStr != null && !quantityStr.trim().isEmpty()) {
        try {
            targetQuantity = Integer.parseInt(quantityStr);
            if (targetQuantity < 1) {
                targetQuantity = 1;
            }
        } catch (NumberFormatException e) {
            targetQuantity = 1;
        }
    }
    
    System.out.println("========================================");
    System.out.println("[doCart.jsp] ===== Add Product to Cart =====");
    System.out.println("[doCart.jsp] Product ID: " + id);
    System.out.println("[doCart.jsp] Product Name: " + p.getName());
    System.out.println("[doCart.jsp] Product Stock: " + p.getNum());
    System.out.println("[doCart.jsp] Target Quantity: " + targetQuantity);
    System.out.println("[doCart.jsp] Current Cart Size: " + map.size());
    
    //3.2 Check if product exists in cart
    CartItem cartItem = map.get(id);
    // 库存校验（覆盖模式：用本次数量直接覆盖山车中已有数量）
    if (targetQuantity > p.getNum()) {
        System.out.println("[doCart.jsp] ERROR: Insufficient stock");
        out.println("<script>alert('\u5e93\u5b58\u4e0d\u8db3\uff01\u5f53\u524d\u5e93\u5b58\uff1a' + " + p.getNum() + ");history.back();</script>");
        return;
    }
    if (p.getNum() <= 0) {
        System.out.println("[doCart.jsp] ERROR: Product sold out");
        out.println("<script>alert('\u5546\u54c1\u5df2\u552e\u7f84\uff01');history.back();</script>");
        return;
    }
    if (cartItem != null) {
        // 商品已在购物车 -> 直接覆盖数量
        int oldSum = cartItem.getSum();
        cartItem.setSum(targetQuantity);
        System.out.println("[doCart.jsp] Product exists, old quantity: " + oldSum + ", overwrite to: " + targetQuantity);
    } else {
        // 新商品 -> 加入购物车
        cartItem = new CartItem();
        cartItem.setP(p);
        cartItem.setSum(targetQuantity);
        System.out.println("[doCart.jsp] SUCCESS: New product added to cart, quantity: " + targetQuantity);
    }
    
    //3.3 Add product to collection
    map.put(id, cartItem);

    //4.Save collection to session scope
    session.setAttribute("cart", map);
    System.out.println("[doCart.jsp] 🛒 Final Cart Status:");
    for (Object key : map.keySet()) {
        CartItem item = (CartItem) map.get(key);
        System.out.println("[doCart.jsp]   - Product ID: " + key + ", Quantity: " + item.getSum());
    }
    System.out.println("========================================");
    response.sendRedirect("cart.jsp");
%>