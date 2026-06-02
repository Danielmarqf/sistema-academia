<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BorcelleFit - Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background-color: #e9ecef;
                overflow: hidden;
            }

            .background-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: linear-gradient(rgba(0,0,0,0.02) 1px, transparent 1px),
                    linear-gradient(90deg, rgba(0,0,0,0.02) 1px, transparent 1px);
                background-size: 60px 60px;
                z-index: -1;
            }

            .main-container {
                display: flex;
                width: 1050px;
                height: 600px;
                gap: 40px;
            }

            .left-panel {
                flex: 1.2;
                position: relative;
                padding: 40px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                border-radius: 40px;
                box-shadow: 0 15px 40px rgba(0,0,0,0.15);
                overflow: hidden;
                color: white;
            }

            .left-panel-img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
                z-index: 0;
                filter: brightness(0.6);
            }

            .top-logo, .welcome-text {
                position: relative;
                z-index: 1;
            }
            .top-logo {
                font-size: 28px;
                font-weight: bold;
            }
            .welcome-text {
                font-size: 42px;
                font-weight: bold;
            }

            .right-panel {
                flex: 1;
                background-color: white;
                padding: 60px 50px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                border-radius: 40px;
                box-shadow: 0 15px 40px rgba(0,0,0,0.10);
            }

            .login-header {
                display: flex;
                align-items: center;
                margin-bottom: 30px;
            }
            .login-header h2 {
                font-size: 34px;
                color: #222;
            }

            .erro-msg {
                width: 100%;
                max-width: 360px;
                padding: 12px;
                border-radius: 8px;
                margin-bottom: 20px;
                text-align: center;
                font-size: 14px;
                font-weight: bold;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                background-color: #fdf2f2;
                color: #d9534f;
                border: 1px solid #f5c6c6;
            }

            form {
                width: 100%;
                max-width: 360px;
            }
            .input-group {
                position: relative;
                margin-bottom: 20px;
            }
            .input-group input {
                width: 100%;
                padding: 15px 15px 15px 45px;
                background-color: #f4f6f8;
                border: 1px solid #e1e5ea;
                border-radius: 10px;
                font-size: 16px;
            }
            .input-group .field-icon {
                position: absolute;
                left: 16px;
                top: 50%;
                transform: translateY(-50%);
                color: #999;
            }

            .login-btn {
                width: 100%;
                padding: 16px;
                background-color: #1a1a1a;
                color: white;
                border: none;
                border-radius: 10px;
                font-size: 18px;
                font-weight: bold;
                cursor: pointer;
            }
            .login-btn:hover {
                background-color: #333;
            }
        </style>
    </head>
    <body>
        <div class="background-overlay"></div>
        <div class="main-container">

            <div class="left-panel">
                <img src="img/login.jpg" alt="Login Background" class="left-panel-img">

                <div class="top-logo">BorcelleFit.</div>
                <div></div> <div class="welcome-text">Bem vindo!</div>
            </div>

            <div class="right-panel">
                <div class="login-header">
                    <h2>Login</h2>
                    <i class="fas fa-dumbbell" style="font-size: 28px; margin-left: 15px;"></i>
                </div>

                <%
                    String erro = request.getParameter("erro");
                    if ("1".equals(erro)) {
                %>
                <div class="erro-msg">
                    <i class="fas fa-exclamation-circle"></i> E-mail ou senha incorretos!
                </div>
                <% }%>

                <form action="sistema" method="post">
                    <input type="hidden" name="acao" value="logar">
                    <div class="input-group">
                        <i class="fas fa-envelope field-icon"></i>
                        <input type="text" name="username" placeholder="E-mail" required>
                    </div>
                    <div class="input-group">
                        <i class="fas fa-lock field-icon"></i>
                        <input type="password" name="password" placeholder="Senha" required>
                    </div>
                    <button type="submit" class="login-btn">Entrar</button>
                </form>
            </div>
        </div>
    </body>
</html>