<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession sessao = request.getSession();
    String usuarioLogado = (String) sessao.getAttribute("usuarioLogado");

    String alunoId = request.getParameter("idAluno");
    if (usuarioLogado == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Ficha de Treinamento - BorcelleFit</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', sans-serif;
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
                background-image: url('img/fundo-aluno.jpg');
                background-size: cover;
                background-position: center;
                z-index: -2;
            }

            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(255, 255, 255, 0.2);
                backdrop-filter: blur(5px);
                z-index: -1;
            }

            .form-card {
                background-color: #ffffff;
                border-radius: 40px;
                padding: 30px 40px;
                width: 100%;
                max-width: 500px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.2);
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
            }

            .titulo-card {
                font-size: 26px;
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
                outline: none;
            }

            .form-row {
                display: flex;
                gap: 15px;
            }

            .form-row .form-group {
                flex: 1;
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
                margin-top: 10px;
            }

            .btn-submit:hover {
                background-color: #333;
            }

            .linha {
                width: 80%;
                height: 1px;
                background-color: #ccc;
                margin: 20px auto;
            }
        </style>
    </head>
    <body>

        <div class="background-container"></div>
        <div class="overlay"></div>

        <div class="form-card">

            <div class="card-header">
                <a href="listaAlunos.jsp" class="btn-voltar"><i class="fas fa-undo"></i></a>
                <h2 class="titulo-card">Ficha de Treino</h2>
                <i class="fas fa-dumbbell icon-destaque"></i>
            </div>

            <form action="SalvarTreinoServlet" method="POST">

                <input type="hidden" name="aluno_id" value="<%= alunoId%>">

                <div class="form-group">
                    <label>Exercício / Descrição</label>
                    <input type="text" name="exercicio" class="form-control" placeholder="Ex: Supino Reto" required>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Séries</label>
                        <input type="number" name="series" class="form-control" placeholder="3">
                    </div>
                    <div class="form-group">
                        <label>Repetições</label>
                        <input type="number" name="repeticoes" class="form-control" placeholder="12">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Carga (kg/placa)</label>
                        <input type="text" name="carga" class="form-control" placeholder="Ex: 20kg">
                    </div>
                    <div class="form-group">
                        <label>Dia da Semana</label>
                        <select name="dia_semana" class="form-control">
                            <option value="Segunda">Segunda</option>
                            <option value="Terça">Terça</option>
                            <option value="Quarta">Quarta</option>
                            <option value="Quinta">Quinta</option>
                            <option value="Sexta">Sexta</option>
                            <option value="Sábado">Sábado</option>
                        </select>
                    </div>
                </div>

                <div class="linha"></div>

                <button type="submit" class="btn-submit">Adicionar Exercício</button>
            </form>

        </div>

    </body>
</html>