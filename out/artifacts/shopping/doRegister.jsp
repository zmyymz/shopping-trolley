<%@ page language="java" import="dao.*,entity.*,java.util.*,java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String users = request.getParameter("username");
		String pass = request.getParameter("pwd");
	%>
	<%
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/shop";
		String use = "root";
		String password = "password";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, use, password);
		PreparedStatement sql = conn.prepareStatement("insert into user(username,password)values(?,?)");
		sql.setString(1, users);
		sql.setString(2, pass);
		int rtn = sql.executeUpdate();
		sql.close();
		conn.close();
	%>
	<script>
		alert("注册成功");
		window.location = "login.jsp";
	</script>
</body>
</html>