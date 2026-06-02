<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Professor, java.util.List"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Novo Exercício - BorcelleFit</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }
            body {
                background-color: #1a1a1a;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                padding: 20px;
            }
            .card {
                background: white;
                padding: 40px;
                border-radius: 40px;
                width: 420px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            }
            h2 {
                color: #222;
                margin-bottom: 25px;
                font-size: 24px;
                font-weight: 600;
                text-align: center;
            }
            label {
                display: block;
                font-size: 12px;
                font-style: italic;
                color: #444;
                margin-top: 15px;
                margin-left: 10px;
            }
            input, select {
                width: 100%;
                padding: 12px 20px;
                margin-top: 5px;
                background-color: #d9d9d9;
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
                cursor: pointer;
            }
            button {
                width: 100%;
                padding: 15px;
                background: #111;
                color: white;
                border: none;
                border-radius: 25px;
                cursor: pointer;
                font-weight: bold;
                font-size: 15px;
                margin-top: 30px;
                transition: background 0.3s;
            }
            button:hover {
                background: #333;
            }
        </style>
    </head>
    <body>
        <div class="card">
            <h2>Adicionar Exercício</h2>

            <form action="sistema" method="POST">
                <input type="hidden" name="acao" value="salvarTreino">
                <input type="hidden" name="idAluno" value="<%= request.getAttribute("idAluno")%>">

                <label>Exercício:</label>
                <input type="text" name="exercicio" placeholder="Ex: Supino Reto" required>

                <div style="display: flex; gap: 15px;">
                    <div style="flex: 1;">
                        <label>Séries:</label>
                        <input type="number" name="series" placeholder="3" required>
                    </div>
                    <div style="flex: 1;">
                        <label>Reps:</label>
                        <input type="number" name="repeticoes" placeholder="12" required>
                    </div>
                </div>

                <label>Carga:</label>
                <input type="text" name="carga" placeholder="Ex: 50kg">

                <label>Dia da Semana:</label>
                <select name="diaSemana">
                    <option value="Segunda">Segunda</option>
                    <option value="Terça">Terça</option>
                    <option value="Quarta">Quarta</option>
                    <option value="Quinta">Quinta</option>
                    <option value="Sexta">Sexta</option>
                    <option value="Sábado">Sábado</option>
                    <option value="Domingo">Domingo</option>
                </select>

                <label>Professor Responsável:</label>
                <select name="professorId" required>
                    <option value="">-- Selecione o Instrutor --</option>
                    <%
                        List<Professor> profs = (List<Professor>) request.getAttribute("listaProfessores");
                        if (profs != null) {
                            for (Professor p : profs) {
                    %>
                    <option value="<%= p.getId()%>"><%= p.getNome()%></option>
                    <%
                            }
                        }
                    %>
                </select>

                <button type="submit">Salvar na Ficha</button>
            </form>
        </div>
    </body>
</html>
