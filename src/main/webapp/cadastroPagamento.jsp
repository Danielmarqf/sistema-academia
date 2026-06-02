<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Aluno, java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <title>BorcelleFit - Pagamento</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #1a1a1a;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
            }
            .logo-top-left {
                position: absolute;
                top: 40px;
                left: 40px;
                color: white;
                font-weight: bold;
                font-size: 24px;
                text-shadow: 2px 2px 5px rgba(0,0,0,0.5);
            }
            .card {
                background: white;
                padding: 40px;
                border-radius: 40px;
                width: 420px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.3);
                position: relative;
            }
            .header-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .btn-voltar {
                text-decoration: none;
                color: black;
                font-size: 24px;
                font-weight: bold;
                transition: transform 0.2s;
            }
            .btn-voltar:hover {
                transform: scale(1.1);
            }
            h2 {
                color: black;
                font-size: 32px;
                margin: 0;
                font-weight: 500;
            }
            .icon-musculo {
                width: 40px;
                height: 40px;
            }
            label {
                font-size: 12px;
                font-style: italic;
                color: #555;
                display: block;
                margin-top: 15px;
                margin-left: 5px;
            }
            input, select {
                width: 100%;
                padding: 15px;
                margin-top: 5px;
                background-color: #cccccc;
                border: none;
                border-radius: 25px;
                box-sizing: border-box;
                font-size: 14px;
                color: #333;
                outline: none;
                transition: box-shadow 0.3s;
            }
            input:focus, select:focus {
                box-shadow: 0 0 0 2px #aaa;
            }
            select {
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                cursor: pointer;
            }

            .checkbox-container {
                background-color: #cccccc;
                padding: 15px;
                border-radius: 25px;
                margin-top: 5px;
                box-sizing: border-box;
            }
            .checkbox-row {
                display: flex;
                align-items: center;
                margin-bottom: 12px;
            }
            .checkbox-row:last-child {
                margin-bottom: 0;
            }
            .checkbox-row input[type="checkbox"] {
                width: auto;
                margin: 0 12px 0 5px;
                transform: scale(1.2);
                cursor: pointer;
            }
            .checkbox-row label {
                font-size: 14px;
                font-style: normal;
                color: #333;
                margin: 0;
                display: inline;
                cursor: pointer;
            }

            .btn-confirmar {
                width: 100%;
                padding: 15px;
                background: #11141a;
                color: white;
                border: none;
                border-radius: 25px;
                cursor: pointer;
                font-weight: bold;
                font-size: 14px;
                margin-top: 40px;
                transition: background 0.3s;
            }
            .btn-confirmar:hover {
                background: #2c313c;
            }
            .footer-text {
                text-align: center;
                font-size: 10px;
                color: #666;
                margin-top: 15px;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <div class="logo-top-left">BorcelleFit.</div>

        <div class="card">
            <div class="header-container">
                <a href="sistema?acao=listarPagamentos" class="btn-voltar">➔</a>
                <h2>Pagamento</h2>
                <svg class="icon-musculo" viewBox="0 0 24 24" fill="black">
                <path d="M7.5 5.6c-.8 0-1.5.7-1.5 1.5s.7 1.5 1.5 1.5 1.5-.7 1.5-1.5-.7-1.5-1.5-1.5zm11 0c-.8 0-1.5.7-1.5 1.5s.7 1.5 1.5 1.5 1.5-.7 1.5-1.5-.7-1.5-1.5-1.5zM22 11h-2v2h2v-2zm-4 0h-2v2h2v-2zM6 11H4v2h2v-2zm4 0H8v2h2v-2zm3-4c-2.2 0-4 1.8-4 4v2c0 .6.4 1 1 1h6c.6 0 1-.4 1-1v-2c0-2.2-1.8-4-4-4z"/>
                </svg>
            </div>

            <form action="sistema?acao=salvarPagamento" method="POST">
                <label>Nome do Aluno</label>
                <select name="alunoId" required>
                    <option value="">-- Selecione o Aluno --</option>
                    <%
                        List<Aluno> alunos = (List<Aluno>) request.getAttribute("listaAlunos");
                        if (alunos != null) {
                            for (Aluno a : alunos) {
                    %>
                    <option value="<%= a.getId()%>"><%= a.getNome()%></option>
                    <%      }
                        }
                    %>
                </select>

                <label>Tipo do Plano Base</label>
                <select name="tipoPlano" required>
                    <option value="basico">Plano Básico (Musculação) — R$ 100,00</option>
                    <option value="premium">Plano Premium (Tudo Incluso) — R$ 180,00</option>
                </select>

                <label>Serviços Adicionais (Apenas para Plano Básico)</label>
                <div class="checkbox-container">
                    <div class="checkbox-row">
                        <input type="checkbox" name="adicionais" value="pilates" id="pilates">
                        <label for="pilates">Pilates (+ R$ 50,00)</label>
                    </div>
                    <div class="checkbox-row">
                        <input type="checkbox" name="adicionais" value="dieta" id="dieta">
                        <label for="dieta">Dieta (+ R$ 30,00)</label>
                    </div>
                    <div class="checkbox-row">
                        <input type="checkbox" name="adicionais" value="massagem" id="massagem">
                        <label for="massagem">Cadeira de Massagem (+ R$ 30,00)</label>
                    </div>
                </div>

                <label>Referente ao Mês</label>
                <select name="referenciaMes">
                    <option value="Janeiro">Janeiro</option>
                    <option value="Fevereiro">Fevereiro</option>
                    <option value="Março">Março</option>
                    <option value="Abril">Abril</option>
                    <option value="Maio">Maio</option>
                    <option value="Junho">Junho</option>
                    <option value="Julho">Julho</option>
                    <option value="Agosto">Agosto</option>
                    <option value="Setembro">Setembro</option>
                    <option value="Outubro">Outubro</option>
                    <option value="Novembro">Novembro</option>
                    <option value="Dezembro">Dezembro</option>
                </select>

                <label>Método</label>
                <select name="metodoPagamento">
                    <option value="Pix">Pix</option>
                    <option value="Cartão de Crédito">Cartão de Crédito</option>
                    <option value="Cartão de Débito">Cartão de Débito</option>
                    <option value="Dinheiro">Dinheiro</option>
                </select>

                <button type="submit" class="btn-confirmar">Confirmar Pagamento</button>

                <%
                    String tipoUsuario = (String) request.getSession().getAttribute("tipoUsuario");
                %>
                <div class="footer-text">
                    Você está logado como: <%= tipoUsuario != null ? tipoUsuario : "Instrutor"%>
                </div>
            </form>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const checkboxes = document.querySelectorAll('input[name="adicionais"]');
                const selectPlano = document.querySelector('select[name="tipoPlano"]');

                checkboxes.forEach(function (checkbox) {
                    checkbox.addEventListener('change', function () {
                        const totalCheckboxes = checkboxes.length;
                        const marcados = document.querySelectorAll('input[name="adicionais"]:checked').length;

                        if (marcados === totalCheckboxes) {
                            selectPlano.value = 'premium';
                        }
                    });
                });

                selectPlano.addEventListener('change', function () {
                    if (this.value === 'premium') {
                        checkboxes.forEach(function (checkbox) {
                            checkbox.checked = false;
                        });
                    }
                });
            });
        </script>
    </body>
</html>