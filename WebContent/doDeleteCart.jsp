<%@page import="dao.*,entity.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String id = request.getParameter("id");
    
    // 验证参数
    if (id == null || id.trim().isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }
    
    // 获取购物车
    HashMap map = (HashMap) session.getAttribute("cart");
    if (map != null && !map.isEmpty()) {
        // 删除指定商品
        Object result = map.remove(id);
        if (result != null) {
            // 更新 Session
            session.setAttribute("cart", map);
        }
    }
    
    // 重定向回购物车页面
    response.sendRedirect("cart.jsp");
%>