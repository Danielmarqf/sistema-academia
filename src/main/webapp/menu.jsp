<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession sessao = request.getSession();

    String usuarioLogado = (String) sessao.getAttribute("usuarioLogado");
    String tipoUsuario = (String) sessao.getAttribute("tipoUsuario");

    if (usuarioLogado == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu Gestão - BorcelleFit</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body, html {
                height: 100%;
                width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .background-container {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('img/menu.jpg');
                background-size: cover;
                background-position: center;
                z-index: 0;
            }

            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(255, 255, 255, 0.3);
                backdrop-filter: blur(5px);
                z-index: -1;
            }

            .logo {
                position: absolute;
                top: 30px;
                left: 40px;
                color: #ffffff;
                font-size: 24px;
                font-weight: 900;
                z-index: 10;
                text-shadow: 1px 1px 5px rgba(0,0,0,0.5);
            }

            .menu-card {
                width: 450px;
                background-color: #ffffff;
                border-radius: 40px;
                box-shadow: 0 15px 40px rgba(0,0,0,0.2);
                padding: 40px 50px;
                display: flex;
                flex-direction: column;
                align-items: center;
                z-index: 1;
            }

            .card-header {
                text-align: center;
                margin-bottom: 30px;
            }

            .card-header h2 {
                font-size: 28px;
                font-weight: 600;
                color: #222;
                line-height: 1.2;
                margin-bottom: 15px;
            }

            .icon-destaque {
                font-size: 40px;
                color: #000;
            }

            .menu-btn {
                width: 100%;
                padding: 15px 20px;
                border-radius: 20px;
                font-size: 14px;
                font-weight: 600;
                color: #333;
                text-decoration: none;
                display: flex;
                align-items: center;
                margin-bottom: 15px;
                transition: transform 0.2s;
            }

            .menu-btn:hover {
                transform: scale(1.02);
            }

            .menu-btn i {
                margin-right: 15px;
                font-size: 16px;
            }

            .btn-verde {
                background-color: #c8ebd6;
            }
            .btn-azul {
                background-color: #cddcf4;
            }
            .btn-laranja {
                background-color: #fce2d0;
            }

            .linha {
                width: 100%;
                height: 1px;
                background-color: #ccc;
                margin: 20px 0;
            }

            .info-usuario {
                width: 100%;
                text-align: left;
                margin-bottom: 20px;
            }

            .info-usuario p {
                font-size: 14px;
                font-style: italic;
                color: #333;
                margin-bottom: 10px;
            }

            .btn-sair {
                width: 100%;
                padding: 15px;
                background-color: #111;
                color: #fff;
                border-radius: 25px;
                text-align: center;
                text-decoration: none;
                font-size: 14px;
                font-weight: bold;
                transition: background 0.3s;
            }

            .btn-sair:hover {
                background-color: #333;
            }
        </style>
    </head>
    <body>

        <div class="logo">BorcelleFit.</div>

        <div class="background-container"></div>
        <div class="overlay"></div>

        <div class="menu-card">

            <div class="card-header">
                <h2>Painel de Gestão<br><%= tipoUsuario != null ? tipoUsuario : ""%></h2>
                <i class="fas fa-dumbbell icon-destaque"></i>
            </div>

            <a href="sistema?acao=listarAlunos" class="menu-btn btn-verde">
                <i class="fas fa-user"></i> Gerenciamento de alunos
            </a>

            <a href="sistema?acao=listarProfessores" class="menu-btn btn-azul">
                <i class="fas fa-clipboard-list"></i> Instrutores cadastrados
            </a>

            <a href="sistema?acao=listarPagamentos" class="menu-btn btn-laranja">
                <i class="fas fa-hand-holding-usd"></i> Financeiro
            </a>

            <div class="linha"></div>

            <div class="info-usuario">
                <p>Bem vindo, <strong><<%= usuarioLogado%>></strong>!</p>
                <p>Você está logado como: <%= tipoUsuario%></p>
            </div>

            <div class="linha"></div>

            <a href="login.jsp" class="btn-sair">Sair</a>

        </div>

    </body>
</html>