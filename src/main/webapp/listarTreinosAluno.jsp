<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty sessionScope.usuarioLogado}">
    <c:redirect url="login.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Minha Ficha de Treino - BorcelleFit</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,600;0,900;1,900&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Montserrat', 'Segoe UI', sans-serif;
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

            .header-aluno {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 2px solid #f39c12;
                padding-bottom: 10px;
            }
            h2 {
                color: #2c3e50;
                margin: 0;
                font-weight: 900;
                font-style: italic;
            }
            .nome-aluno {
                color: #7f8c8d;
                font-style: italic;
                font-size: 16px;
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
                padding: 4px 10px;
                border-radius: 6px;
                font-size: 12px;
                font-weight: bold;
            }

            .botoes-acao {
                margin-top: 25px;
                display: flex;
                justify-content: flex-end;
            }
            .btn-sair {
                background: #e74c3c;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
                transition: background 0.2s;
            }
            .btn-sair:hover {
                background: #c0392b;
            }
        </style>
    </head>
    <body>
        <div class="container">

            <div class="header-aluno">
                <h2>Minha Ficha de Treino</h2>
                <span class="nome-aluno">Aluno(a): ${sessionScope.usuarioLogado}</span>
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
                    <c:choose>
                        <c:when test="${not empty requestScope.listaTreinos}">
                            <c:forEach var="t" items="${requestScope.listaTreinos}">
                                <tr>
                                    <td><strong>${t.exercicio}</strong></td>
                                    <td>${t.series} x ${t.repeticoes}</td>
                                    <td>${t.carga}</td>
                                    <td><span class="badge-dia">${t.diaSemana}</span></td>
                                    <td>${not empty t.instrutorResponsavel ? t.instrutorResponsavel.nome : 'Não atribuído'}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" style="text-align:center; padding: 30px; color: #95a5a6;">
                                    Nenhum exercício cadastrado para você ainda. Fale com seu instrutor!
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

            <div class="botoes-acao">
                <a href="sistema?acao=logout" class="btn-sair"><i class="fas fa-sign-out-alt"></i> Sair do Sistema</a>
            </div>

        </div>
    </body>
</html>