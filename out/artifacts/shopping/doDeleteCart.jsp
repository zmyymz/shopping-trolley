<%@page import="dao.*,entity.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String id = request.getParameter("id");
    if (id == null || id.trim().isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }
    
    HashMap map = (HashMap) session.getAttribute("cart");
    if (map != null) {
        map.remove(id);
        session.setAttribute("cart", map);
    }
    response.sendRedirect("cart.jsp");
%>