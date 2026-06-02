<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="model.Aluno"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
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
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Alunos Cadastrados - BorcelleFit</title>
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
                overflow: hidden;
            }

            .background-container {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: #1a1a1a;
                z-index: -2;
            }

            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(255, 255, 255, 0.05);
                backdrop-filter: blur(4px);
                z-index: -1;
            }

            .card-container {
                background: #ffffff;
                border-radius: 40px;
                padding: 40px;
                width: 90%;
                max-width: 950px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.15);
                position: relative;
            }

            .header-tela {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
            }

            .btn-voltar {
                text-decoration: none;
                color: #000;
                font-size: 24px;
                font-weight: bold;
                transition: transform 0.2s;
            }

            .btn-voltar:hover {
                transform: scale(1.1);
            }

            .titulo-tela {
                font-size: 32px;
                font-weight: 600;
                margin: 0;
                color: #222;
            }

            .icon-destaque {
                font-size: 40px;
                color: #000;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 25px;
                text-align: left;
            }

            th, td {
                padding: 15px;
                border-bottom: 1px solid #ddd;
                border-right: 1px solid #ddd;
            }

            th:last-child, td:last-child {
                border-right: none;
            }

            th {
                background-color: #d1d1d1;
                color: #333;
                font-size: 14px;
                font-style: italic;
            }

            .col-destaque {
                background-color: #fce4d6;
                text-align: center;
                font-weight: bold;
            }

            .col-id {
                width: 50px;
                font-weight: bold;
            }

            .col-acoes {
                width: 100px;
            }

            .acao-icon {
                text-decoration: none;
                color: #555;
                font-size: 18px;
                display: inline-block;
                transition: color 0.2s;
            }

            .acao-icon:hover {
                color: #000;
            }

            .btn-cadastrar {
                background-color: #111;
                color: #fff;
                padding: 12px 24px;
                border-radius: 20px;
                text-decoration: none;
                font-size: 14px;
                display: inline-block;
                transition: background 0.3s;
            }

            .btn-cadastrar:hover {
                background-color: #333;
            }

            .rodape-info {
                text-align: right;
                font-size: 11px;
                color: #666;
                margin-top: -20px;
                font-style: italic;
            }
        </style>
    </head>
    <body>

        <div style="position: absolute; top: 30px; left: 40px; color: #fff; font-size: 24px; font-weight: 900; z-index: 10; text-shadow: 2px 2px 5px rgba(0,0,0,0.5);">
            BorcelleFit.
        </div>

        <div class="background-container"></div>
        <div class="overlay"></div>

        <div class="card-container">

            <div class="header-tela">
                <a href="menu.jsp" class="btn-voltar"><i class="fas fa-undo"></i></a>
                <h1 class="titulo-tela">Alunos Cadastrados</h1>
                <i class="fas fa-dumbbell icon-destaque"></i>
            </div>

            <table>
                <thead>
                    <tr>
                        <th class="col-id">ID</th>
                        <th>Nome</th>
                        <th>Objetivo</th>
                        <th>Plano Atual</th>
                        <th class="col-acoes" style="text-align: center;">Ficha de Treino</th>
                        <th class="col-acoes" style="text-align: center;">Editar</th>
                        <th class="col-acoes" style="text-align: center;">Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Aluno> lista = (List<Aluno>) request.getAttribute("listaAlunos");

                        if (lista != null && !lista.isEmpty()) {
                            for (Aluno a : lista) {
                                String nome = (a.getNome() != null && !a.getNome().isEmpty()) ? a.getNome() : "Não informado";
                                String objetivo = (a.getObjetivo() != null && !a.getObjetivo().isEmpty()) ? a.getObjetivo() : "Sem objetivo";

                                String planoBanco = (a.getPlanoAtual() != null) ? a.getPlanoAtual() : "";

                                String servicosBanco = "";

                                String planoParaExibir = "";

                                if (!planoBanco.isEmpty() && !servicosBanco.isEmpty()) {
                                    planoParaExibir = planoBanco + " (+ " + servicosBanco + ")";
                                } else if (!planoBanco.isEmpty()) {
                                    planoParaExibir = planoBanco;
                                } else if (!servicosBanco.isEmpty()) {
                                    planoParaExibir = servicosBanco;
                                } else {
                                    planoParaExibir = "Não definido";
                                }
                    %>
                    <tr>
                        <td class="col-destaque col-id"><%= a.getId()%></td>
                        <td><%= nome%></td>
                        <td><%= objetivo%></td>
                        <td><strong><%= planoParaExibir%></strong></td>

                        <td class="col-destaque">
                            <a href="sistema?acao=listarTreinos&idAluno=<%= a.getId()%>" class="acao-icon" title="Ver Ficha">
                                <i class="fas fa-file-signature"></i>
                            </a>
                        </td>
                        <td class="col-destaque">
                            <a href="sistema?acao=editarAluno&idAluno=<%= a.getId()%>" class="acao-icon" title="Editar">
                                <i class="fas fa-pencil-alt"></i>
                            </a>
                        </td>
                        <td class="col-destaque">
                            <a href="sistema?acao=excluirAluno&idAluno=<%= a.getId()%>" class="acao-icon" title="Excluir">
                                <i class="fas fa-trash-alt"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" style="text-align: center; padding: 30px;">Nenhum aluno cadastrado ainda.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <a href="cadastroAluno.jsp" class="btn-cadastrar">+ Cadastrar novo aluno</a>

            <div class="rodape-info">
                Você está logado como: <%= tipoUsuario != null ? tipoUsuario : "Desconhecido"%>
            </div>

        </div>

    </body>
</html>
