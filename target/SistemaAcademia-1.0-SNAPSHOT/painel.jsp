<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession sessao = request.getSession();

    String usuarioLogado = (String) sessao.getAttribute("usuarioLogado");
    String tipoUsuario = (String) sessao.getAttribute("tipoUsuario");
    Integer idUsuario = (Integer) sessao.getAttribute("idUsuario");

    if (usuarioLogado == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String linkDestino = "";

    if ("Instrutor".equals(tipoUsuario)) {
        linkDestino = "menu.jsp";
    } else {
        linkDestino = "sistema?acao=listarTreinosAluno&idAluno=" + idUsuario;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BorcelleFit - Bem-vindo</title>

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Arial', sans-serif;
            }

            body, html {
                height: 100%;
                width: 100%;
                overflow: hidden;
            }

            .splash-container {
                height: 100vh;
                width: 100%;
                background-image: url('img/fundo-treino.jpg');
                background-size: cover;
                background-position: center;
                position: relative;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.45);
                z-index: 1;
            }

            .logo {
                position: absolute;
                top: 40px;
                left: 50px;
                color: #ffffff;
                font-size: 22px;
                font-weight: 900;
                letter-spacing: 1px;
                z-index: 2;
            }

            .content {
                position: relative;
                z-index: 2;
                text-align: center;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .titulo-destaque {
                color: #ffffff;
                font-size: 80px;
                font-weight: 900;
                font-style: italic;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin-bottom: 20px;
                text-shadow: 2px 2px 15px rgba(0,0,0,0.7);
            }

            .subtitulo-usuario {
                color: #ffffff;
                font-size: 24px;
                margin-bottom: 40px;
                font-weight: 300;
            }

            .btn-vamos-la {
                background-color: #fae100;
                color: #000000;
                padding: 18px 50px;
                font-size: 16px;
                font-weight: bold;
                text-decoration: none;
                text-transform: uppercase;
                letter-spacing: 1px;
                border-radius: 2px;
                transition: background-color 0.3s, transform 0.2s;
                box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            }

            .btn-vamos-la:hover {
                background-color: #ffd700;
                transform: scale(1.05);
            }
        </style>
    </head>
    <body>

        <div class="splash-container">
            <div class="overlay"></div>

            <div class="logo">BORCELLEFIT.</div>

            <div class="content">
                <h1 class="titulo-destaque">Dê seu melhor!</h1>

                <p class="subtitulo-usuario">Olá, <%= usuarioLogado%>!</p>

                <a href="<%= linkDestino%>" class="btn-vamos-la">Vamos lá!</a>
            </div>
        </div>

    </body>
</html>