<%@page import="model.Pagamento, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>BorcelleFit - Pagamentos</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background: #eef1f5;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                padding: 20px;
            }
            .logo-top-left {
                position: absolute;
                top: 40px;
                left: 60px;
                color: black;
                font-weight: bold;
                font-size: 24px;
            }
            .container {
                width: 900px;
                background: white;
                padding: 40px;
                border-radius: 40px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.05);
                position: relative;
            }
            .header-table {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .btn-voltar {
                text-decoration: none;
                color: black;
                font-size: 24px;
            }
            h2 {
                font-size: 36px;
                margin: 0;
                font-weight: 500;
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
            }
            .btn-novo {
                background: #11141a;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 20px;
                font-size: 13px;
                font-weight: bold;
                margin-left: auto;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
                border-radius: 15px;
                overflow: hidden;
                border: 1px solid #ccc;
            }
            th {
                background: #cccccc;
                color: #333;
                font-style: italic;
                font-weight: normal;
                padding: 15px;
                text-align: left;
                font-size: 14px;
                border-bottom: 1px solid #bbb;
            }
            td {
                padding: 15px;
                border-bottom: 1px solid #ddd;
                border-right: 1px solid #ddd;
                font-size: 14px;
                background: white;
                vertical-align: middle;
            }
            td:last-child {
                border-right: none;
            }
            td:first-child, td:nth-last-child(2) {
                background: #f7ddcf;
                font-weight: 500;
            }
            .footer-text {
                text-align: right;
                font-size: 10px;
                color: #666;
                margin-top: 20px;
                font-style: italic;
            }
            .btn-excluir {
                color: #e74c3c;
                text-decoration: none;
                font-size: 18px;
                display: block;
                text-align: center;
                transition: transform 0.2s;
            }
            .btn-excluir:hover {
                transform: scale(1.2);
            }
        </style>
    </head>
    <body>
        <div class="logo-top-left">BorcelleFit.</div>

        <div class="container">
            <div class="header-table">
                <a href="menu.jsp" class="btn-voltar">➔</a>
                <h2>Pagamentos</h2>
                <a href="sistema?acao=prepararPagamento" class="btn-novo">+ Cadastrar novo pagamento</a>
            </div>

            <table>
                <thead>
                    <tr>
                        <th style="width: 10%;">Data</th>
                        <th style="width: 35%;">Nome Aluno</th>
                        <th style="width: 15%;">Mês Pag.</th>
                        <th style="width: 15%;">Método</th>
                        <th style="width: 15%;">Valor</th>
                        <th style="width: 10%; text-align: center;">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Pagamento> lista = (List<Pagamento>) request.getAttribute("listaPagamentos");
                        if (lista != null && !lista.isEmpty()) {
                            for (Pagamento p : lista) {
                    %>
                    <tr>
                        <td><%= p.getDataPagamento()%></td>
                        <td><%= p.getNomeAluno()%></td>
                        <td><%= p.getReferenciaMes()%></td>
                        <td><%= p.getMetodoPagamento()%></td>
                        <td>R$ <%= String.format("%.2f", p.getValor())%></td>
                        <td>
                            <a href="sistema?acao=excluirPagamento&id=<%= p.getId()%>" class="btn-excluir" title="Excluir Pagamento" onclick="return confirm('Tem certeza que deseja excluir o pagamento deste aluno?');">
                                🗑️
                            </a>
                        </td>
                    </tr>
                    <%      }
                    } else {
                    %>
                    <tr>
                        <td colspan="6" style="text-align: center; color: #999; padding: 30px;">
                            Nenhum pagamento registrado no sistema.
                        </td>
                    </tr>
                    <%  }%>
                </tbody>
            </table>

            <div class="footer-text">Você está logado como: Instrutor</div>
        </div>
    </body>
</html>