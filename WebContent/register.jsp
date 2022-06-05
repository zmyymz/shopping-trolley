<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>用户注册 - 购物车系统</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Microsoft YaHei', Arial, sans-serif;
        background: #f5f5f5;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .register-container {
        width: 420px;
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        overflow: hidden;
        animation: slideUp 0.5s ease-out;
    }

    @keyframes slideUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .register-header {
        background: linear-gradient(135deg, #ff9000 0%, #ff5000 100%);
        padding: 40px 30px;
        text-align: center;
        color: white;
    }

    .register-header h2 {
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 8px;
    }

    .register-header p {
        font-size: 14px;
        opacity: 0.9;
    }

    .register-form {
        padding: 40px 30px;
    }

    .form-group {
        margin-bottom: 24px;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        color: #333;
        font-weight: 500;
        font-size: 14px;
    }

    .input-wrapper {
        position: relative;
    }

    .input-wrapper input {
        width: 100%;
        padding: 14px 16px;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        font-size: 15px;
        transition: all 0.3s ease;
        outline: none;
    }

    .input-wrapper input:focus {
        border-color: #ff5000;
        box-shadow: 0 0 0 3px rgba(255, 80, 0, 0.1);
    }

    .input-wrapper input::placeholder {
        color: #aaa;
    }

    .button-group {
        display: flex;
        gap: 12px;
        margin-top: 30px;
    }

    .btn {
        flex: 1;
        padding: 14px 24px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .btn-primary {
        background: linear-gradient(135deg, #ff9000 0%, #ff5000 100%);
        color: white;
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(255, 80, 0, 0.4);
    }

    .btn-primary:active {
        transform: translateY(0);
    }

    .btn-secondary {
        background: #f5f5f5;
        color: #666;
    }

    .btn-secondary:hover {
        background: #e8e8e8;
    }

    .register-footer {
        text-align: center;
        padding: 20px 30px 30px;
        color: #999;
        font-size: 14px;
    }

    .register-footer a {
        color: #ff5000;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s ease;
    }

    .register-footer a:hover {
        color: #ff9000;
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <h2>用户注册</h2>
            <p>Create Your Account</p>
        </div>

        <form name="loginForm" action="doRegister.jsp" method="post" class="register-form">
            <div class="form-group">
                <label for="username">用户名</label>
                <div class="input-wrapper">
                    <input type="text" id="username" name="username" placeholder="请输入用户名" required autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="password">密码</label>
                <div class="input-wrapper">
                    <input type="password" id="password" name="pwd" placeholder="请输入密码" required>
                </div>
            </div>

            <div class="button-group">
                <button type="submit" class="btn btn-primary">注 册</button>
                <button type="reset" class="btn btn-secondary">重 置</button>
            </div>
        </form>

        <div class="register-footer">
            已有账号？<a href="login.jsp">立即登录</a>
        </div>
    </div>
</body>
</html>
