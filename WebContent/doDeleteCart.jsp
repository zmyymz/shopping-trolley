<%@page import="dao.*,entity.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String id = request.getParameter("id");
    HashMap map = (HashMap) session.getAttribute("cart");
    //System.out.println(map.size() + "---之前---" + map.keySet());
    map.remove(id);
    //System.out.println(id+"a");类型不匹配导致无法删除
    //System.out.println(map.size() + "---之后---" + map.keySet());

    session.setAttribute("cart", map);
    response.sendRedirect("cart.jsp");
%>