<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <title>login</title>
    <link href="css/semantic.css"
          rel="stylesheet">
</head>
<body>
<!-- <p1>test!</p1> -->
<br>
<br>
<br>
<div class="loginpage">
    <br> <br> <br>
    <h2 align="center">欢迎登录</h2>
    <!--do_login.jsp  -->
    <!-- <form name=loginForm action="<%= request.getContextPath() %>/PostServlet" method=post> -->
    <form name=loginForm action="do_login.jsp" method=post>
        <table align="center">
            <tr>
                <td>用户名：</td>
                <td>
                    <div class="ui input focus">
                        <input type="text" placeholder="" name=username>
                    </div>
                </td>
            </tr>
            <tr>
                <td>密码：</td>
                <td>
                    <div class="ui input focus">
                        <input type="password" placeholder="" name=pwd>
                    </div>
                </td>
            <tr/>
            <br>


        </table>
        <div class="submit-p">
            <div class="submit-button">
                <input type="submit" value="login" class="ui primary button"/>
            </div>
            <div class="reset-button">
                <input type="reset" value="reset" class="ui button"/>
            </div>
        </div>
    </form>

</div>

<style>
    .loginpage {
        /*height: 300px;*/
        /*padding-bottom: 64px;*/
        /*height: 500px;*/
        /*position: relative;*/
        ` height: 400px;
        border: 1px solid #d7d7d7;
        box-shadow: 0 0 20px #d7d7d7;
        background-color: #fff;
        position: absolute;
        width: 382px;
        color: #818181;
        margin: 80px auto;
        position: absolute;
        left: 0;
        right: 0;
    }

    .submit-button {
        display: inline;
    }

    .reset-button {
        display: inline;
    }

    .submit-p {
        margin-left: 120px;
        margin-top: 20px;
    }
</style>
</body>
</html>