<%@page import="model.Professor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Instrutores - BorcelleFit</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }
            body {
                background: url('img/fundo-academia.jpg') no-repeat center center fixed;
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(255,255,255,0.3);
                backdrop-filter: blur(5px);
                z-index: -1;
            }

            .card {
                background: white;
                width: 90%;
                max-width: 900px;
                border-radius: 40px;
                padding: 40px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.2);
                position: relative;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
            }
            .btn-voltar {
                color: #000;
                font-size: 24px;
                text-decoration: none;
            }
            .titulo {
                font-size: 32px;
                font-weight: 500;
            }
            .logo-pequena {
                position: absolute;
                top: 40px;
                left: 40px;
                font-weight: bold;
                font-size: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            th {
                background: #d9d9d9;
                padding: 12px;
                font-style: italic;
                font-weight: normal;
                font-size: 14px;
                text-align: left;
            }
            td {
                padding: 15px;
                border: 1px solid #ccc;
                text-align: left;
            }

            .col-destaque {
                background-color: #f8d7c4;
                width: 40px;
            }
            .col-acoes {
                background-color: #f8d7c4;
                width: 100px;
                text-align: center;
            }

            .btn-acao {
                color: #000;
                margin: 0 5px;
                text-decoration: none;
            }

            .footer-card {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
            }
            .btn-novo {
                background: #111;
                color: white;
                padding: 12px 25px;
                border-radius: 25px;
                text-decoration: none;
                font-size: 14px;
                font-weight: bold;
            }
            .usuario-logado {
                font-size: 10px;
                color: #666;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <div class="overlay"></div>
        <div class="card">
            <div class="header">
                <a href="menu.jsp" class="btn-voltar"><i class="fas fa-undo"></i></a>
                <h2 class="titulo">Instrutor Cadastrados <i class="fas fa-dumbbell"></i></h2>
            </div>

            <table>
                <thead>
                    <tr>
                        <th class="col-destaque">ID</th>
                        <th>Nome</th>
                        <th>Turno</th>
                        <th>CREF</th>
                        <th class="col-acoes">Editar</th>
                        <th class="col-acoes">Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Professor> lista = (List<Professor>) request.getAttribute("listaProfessores");
                        if (lista != null) {
                            for (Professor p : lista) {
                    %>
                    <tr>
                        <td class="col-destaque"><%= p.getId()%></td>
                        <td><%= p.getNome()%></td>
                        <td><%= p.getTurno()%></td>
                        <td><%= p.getCref()%></td>
                        <td class="col-acoes">
                            <a href="sistema?acao=editarProfessor&idProfessor=<%= p.getId()%>" class="btn-acao"><i class="fas fa-pencil-alt"></i></a>
                        </td>
                        <td class="col-acoes">
                            <a href="sistema?acao=excluirProfessor&idProfessor=<%= p.getId()%>" class="btn-acao" onclick="return confirm('Excluir este instrutor?')"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                    <% }
                        }%>
                </tbody>
            </table>

            <div class="footer-card">
                <a href="sistema?acao=prepararProfessor" class="btn-novo">+ Cadastrar novo Instrutor</a>
                <span class="usuario-logado">Você está logado como: Instrutor</span>
            </div>
        </div>
    </body>
</html>