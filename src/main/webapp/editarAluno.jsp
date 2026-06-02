<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Aluno" %>
<%
    Aluno a = (Aluno) request.getAttribute("aluno");
    if (a == null) {
        response.sendRedirect("sistema?acao=listarAlunos");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Editar Aluno - BorcelleFit</title>
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
                overflow-x: hidden;
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
                max-width: 600px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.15);
                position: relative;
            }

            .header-tela {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 25px;
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

            label {
                display: block;
                margin-top: 14px;
                margin-bottom: 5px;
                margin-left: 8px;
                font-size: 13px;
                font-style: italic;
                color: #333;
                font-weight: 500;
            }

            input[type="text"],
            input[type="email"],
            input[type="number"],
            select {
                width: 100%;
                padding: 14px 20px;
                background-color: #e0e0e0;
                border: none;
                border-radius: 25px;
                font-size: 14px;
                color: #222;
                outline: none;
                transition: background-color 0.2s;
            }

            input:focus, select:focus {
                background-color: #d5d5d5;
            }

            .row {
                display: flex;
                gap: 15px;
            }

            .row div {
                flex: 1;
            }

            .checkbox-container {
                background: #f5f5f5;
                padding: 18px;
                border-radius: 20px;
                margin-top: 6px;
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
                margin-right: 12px;
                transform: scale(1.2);
                cursor: pointer;
            }

            .checkbox-row label {
                margin: 0;
                font-style: normal;
                font-size: 14px;
                color: #333;
                cursor: pointer;
                display: inline;
                font-weight: normal;
            }

            .btn-salvar {
                width: 100%;
                background-color: #111;
                color: #fff;
                padding: 16px;
                border: none;
                border-radius: 25px;
                font-size: 16px;
                font-weight: bold;
                margin-top: 30px;
                cursor: pointer;
                transition: background 0.3s;
            }

            .btn-salvar:hover {
                background-color: #333;
            }

            .btn-cancelar {
                display: block;
                text-align: center;
                margin-top: 15px;
                color: #666;
                text-decoration: none;
                font-size: 14px;
                transition: color 0.2s;
            }

            .btn-cancelar:hover {
                color: #000;
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
                <a href="sistema?acao=listarAlunos" class="btn-voltar"><i class="fas fa-undo"></i></a>
                <h1 class="titulo-tela">Editar Aluno</h1>
                <i class="fas fa-dumbbell icon-destaque"></i>
            </div>

            <form action="sistema?acao=atualizarAluno" method="POST">
                <input type="hidden" name="idAluno" value="<%= a.getId()%>">

                <label>Nome</label>
                <input type="text" name="nome" value="<%= a.getNome()%>" required>

                <div class="row">
                    <div>
                        <label>CPF</label>
                        <input type="text" name="cpf" value="<%= a.getCpf() != null ? a.getCpf() : ""%>" required>
                    </div>
                    <div>
                        <label>E-mail</label>
                        <input type="email" name="email" value="<%= a.getEmail() != null ? a.getEmail() : ""%>">
                    </div>
                </div>

                <div class="row">
                    <div>
                        <label>Peso (kg)</label>
                        <input type="number" step="0.1" name="peso" value="<%= a.getPeso() != 0.0 ? a.getPeso() : ""%>">
                    </div>
                    <div>
                        <label>Altura (m)</label>
                        <input type="number" step="0.01" name="altura" value="<%= a.getAltura() != 0.0 ? a.getAltura() : ""%>">
                    </div>
                </div>

                <label>Objetivo</label>
                <input type="text" name="objetivo" value="<%= a.getObjetivo() != null ? a.getObjetivo() : ""%>">

                <label for="tipoPlano">Plano Acadêmico</label>
                <select id="tipoPlano" name="tipoPlano" required>
                    <option value="basico" <%= "basico".equalsIgnoreCase(a.getPlanoAtual()) ? "selected" : ""%>>Plano Básico — R$ 100,00</option>
                    <option value="premium" <%= "premium".equalsIgnoreCase(a.getPlanoAtual()) ? "selected" : ""%>>Plano Premium — R$ 180,00</option>
                </select>

                <label>Serviços Adicionais (Apenas para Plano Básico)</label>
                <div class="checkbox-container">
                    <%
                        String servicosSalvos = (a.getServicosAdicionais() != null) ? a.getServicosAdicionais().toLowerCase() : "";
                    %>

                    <div class="checkbox-row">
                        <input type="checkbox" name="adicionais" value="pilates" id="pilates"
                               <%= servicosSalvos.contains("pilates") ? "checked" : ""%>>
                        <label for="pilates">Pilates (+ R$ 50,00)</label>
                    </div>
                    <div class="checkbox-row">
                        <input type="checkbox" name="adicionais" value="dieta" id="dieta"
                               <%= servicosSalvos.contains("dieta") ? "checked" : ""%>>
                        <label for="dieta">Dieta (+ R$ 30,00)</label>
                    </div>
                    <div class="checkbox-row">
                        <input type="checkbox" name="adicionais" value="massagem" id="massagem"
                               <%= (servicosSalvos.contains("massagem") || servicosSalvos.contains("cadeira")) ? "checked" : ""%>>
                        <label for="massagem">Cadeira de Massagem (+ R$ 30,00)</label>
                    </div>
                </div>

                <button type="submit" class="btn-salvar">Confirmar Alterações</button>
                <a href="sistema?acao=listarAlunos" class="btn-cancelar">Cancelar</a>
            </form>
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