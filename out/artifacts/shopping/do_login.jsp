<%@ page language="java" import="dao.*,entity.*,java.util.*,java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String users = request.getParameter("username");
	String pass = request.getParameter("pwd");
	boolean flag = false;
	PreparedStatement sql = null;
	ResultSet rs = null;
	Connection conn = null;
%>

<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/shop";
	String use = "root";
	String password = "password";
	Class.forName(driver);
	conn = DriverManager.getConnection(url, use, password);
	sql = conn.prepareStatement("select * from user where username=? and password=?");
	sql.setString(1, users);
	sql.setString(2, pass);
	rs = sql.executeQuery();
	if (rs.next()) {
		flag = true;
	}
	rs.close();
	sql.close();
	conn.close();
%>
<!-- 判断是否是正确的登录用户,正确则跳转到list.jsp -->
<%
	if (flag == true) {
%>
<jsp:forward page="list.jsp" />
<%
	} else if (flag == false) {
%>
<script>
	alert("用户名或密码错误,请重新输入");
	window.location = "login.jsp";
</script>

<%
	}
%>

