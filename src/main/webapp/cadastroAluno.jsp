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
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Aluno - BorcelleFit</title>
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
                backdrop-filter: blur(5px);
                z-index: -1;
            }

            .logo-fundo {
                position: absolute;
                top: 30px;
                left: 40px;
                color: #fff;
                font-size: 26px;
                font-weight: 900;
                z-index: 10;
                text-shadow: 2px 2px 5px rgba(0,0,0,0.5);
            }

            .form-card {
                background-color: #ffffff;
                border-radius: 40px;
                padding: 30px 40px;
                width: 100%;
                max-width: 500px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.2);
                max-height: 90vh;
                overflow-y: auto;
            }

            .form-card::-webkit-scrollbar {
                display: none;
            }

            .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 25px;
            }

            .btn-voltar {
                color: #000;
                font-size: 20px;
                text-decoration: none;
                transition: transform 0.2s;
            }

            .btn-voltar:hover {
                transform: scale(1.1);
            }

            .titulo-card {
                font-size: 28px;
                font-weight: 600;
                color: #222;
            }

            .icon-destaque {
                font-size: 35px;
                color: #000;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                font-size: 13px;
                font-style: italic;
                color: #333;
                margin-bottom: 5px;
                margin-left: 10px;
            }

            .form-control {
                width: 100%;
                padding: 12px 20px;
                background-color: #d9d9d9;
                border: none;
                border-radius: 25px;
                font-size: 14px;
                color: #333;
                outline: none;
                transition: box-shadow 0.3s;
            }

            .form-control:focus {
                box-shadow: 0 0 0 2px #aaa;
            }

            select.form-control {
                appearance: none;
                cursor: pointer;
            }

            .checkbox-container {
                background-color: #d9d9d9;
                padding: 15px 20px;
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

            .linha-separadora {
                width: 80%;
                height: 1px;
                background-color: #ccc;
                margin: 25px auto;
            }

            .btn-submit {
                width: 100%;
                padding: 15px;
                background-color: #111;
                color: #fff;
                border: none;
                border-radius: 25px;
                font-size: 15px;
                font-weight: bold;
                cursor: pointer;
                transition: background 0.3s;
            }

            .btn-submit:hover {
                background-color: #333;
            }

            .rodape-info {
                text-align: right;
                font-size: 10px;
                color: #666;
                margin-top: 15px;
                font-style: italic;
            }
        </style>
    </head>
    <body>

        <div class="logo-fundo">BorcelleFit.</div>
        <div class="background-container"></div>
        <div class="overlay"></div>

        <div class="form-card">

            <div class="card-header">
                <a href="listaAlunos.jsp" class="btn-voltar"><i class="fas fa-undo"></i></a>
                <h2 class="titulo-card">Cadastro Aluno</h2>
                <i class="fas fa-dumbbell icon-destaque"></i>
            </div>

            <form action="sistema" method="POST">

                <input type="hidden" name="acao" value="salvarAluno">

                <div class="form-group">
                    <label for="nome">Nome</label>
                    <input type="text" id="nome" name="nome" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="cpf">CPF</label>
                    <input type="text" id="cpf" name="cpf" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="telefone">Telefone</label>
                    <input type="text" id="telefone" name="telefone" class="form-control">
                </div>

                <div class="form-group">
                    <label for="peso">Peso (kg)</label>
                    <input type="number" id="peso" name="peso" class="form-control" step="0.01">
                </div>

                <div class="form-group">
                    <label for="altura">Altura (m)</label>
                    <input type="number" id="altura" name="altura" class="form-control" step="0.01">
                </div>

                <div class="form-group">
                    <label for="objetivo">Objetivo</label>
                    <select id="objetivo" name="objetivo" class="form-control">
                        <option value="Hipertrofia">Hipertrofia</option>
                        <option value="Emagrecimento">Emagrecimento</option>
                        <option value="Condicionamento">Condicionamento Físico</option>
                        <option value="Saúde">Manutenção da Saúde</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="tipoPlano">Plano Acadêmico</label>
                    <select id="tipoPlano" name="tipoPlano" class="form-control" required>
                        <option value="basico">Plano Básico — R$ 100,00</option>
                        <option value="premium">Plano Premium — R$ 180,00</option>
                    </select>
                </div>

                <div class="form-group">
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
                </div>

                <div class="linha-separadora"></div>

                <button type="submit" class="btn-submit">Cadastrar Aluno</button>

            </form> 
            <div class="rodape-info">
                Você está logado como: <%= tipoUsuario != null ? tipoUsuario : "Desconhecido"%>
            </div>

        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const checkboxes = document.querySelectorAll('input[name="adicionais"]');
                const selectPlano = document.getElementById('tipoPlano');

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