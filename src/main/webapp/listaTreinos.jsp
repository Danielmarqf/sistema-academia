<%@page import="model.Treino"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuarioLogado = (String) session.getAttribute("usuarioLogado");
    if (usuarioLogado == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gerenciar Treinos - BorcelleFit</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f4f7f6;
                padding: 30px;
            }
            .container {
                max-width: 900px;
                margin: auto;
                background: white;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }

            .header-flex {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 2px solid #f39c12;
                padding-bottom: 10px;
            }
            h2 {
                color: #2c3e50;
                margin: 0;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th {
                background-color: #34495e;
                color: white;
                padding: 12px;
                text-align: left;
            }
            td {
                padding: 12px;
                border-bottom: 1px solid #eee;
            }

            .badge-dia {
                background: #f39c12;
                color: white;
                padding: 3px 8px;
                border-radius: 4px;
                font-size: 12px;
            }

            .btn-novo {
                display: inline-block;
                background: #f39c12;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
                margin-top: 20px;
                transition: 0.3s;
            }
            .btn-novo:hover {
                background: #d68910;
            }

            .btn-voltar {
                color: #7f8c8d;
                text-decoration: none;
                margin-left: 20px;
                font-weight: 500;
            }
            .btn-sair {
                background: #e74c3c;
                color: white;
                padding: 8px 15px;
                text-decoration: none;
                border-radius: 5px;
                font-size: 14px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header-flex">
                <h2>Gerenciar Ficha de Treino</h2>
                <a href="sistema?acao=logout" class="btn-sair"><i class="fas fa-sign-out-alt"></i> SAIR</a>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Exercício</th>
                        <th>Séries x Reps</th>
                        <th>Carga</th>
                        <th>Dia</th>
                        <th>Instrutor</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Treino> treinos = (List<Treino>) request.getAttribute("listaTreinos");
                        if (treinos != null && !treinos.isEmpty()) {
                            for (Treino t : treinos) {
                    %>
                    <tr>
                        <td><strong><%= t.getExercicio()%></strong></td>
                        <td><%= t.getSeries()%> x <%= t.getRepeticoes()%></td>
                        <td><%= t.getCarga()%></td>
                        <td><span class="badge-dia"><%= t.getDiaSemana()%></span></td>
                        <td><%= (t.getInstrutorResponsavel() != null) ? t.getInstrutorResponsavel().getNome() : "---"%></td>
                    </tr>
                    <%      }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" style="text-align:center; padding: 30px; color: #95a5a6;">
                            Nenhum exercício cadastrado para este aluno.
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>

            <div style="margin-top: 20px;">
                <a href="sistema?acao=prepararTreino&idAluno=<%= request.getParameter("idAluno")%>" class="btn-novo">
                    <i class="fas fa-plus"></i> Adicionar Exercício
                </a>

                <a href="sistema?acao=listarAlunos" class="btn-voltar">
                    <i class="fas fa-arrow-left"></i> Voltar para Alunos
                </a>
            </div>
        </div>
    </body>
</html>