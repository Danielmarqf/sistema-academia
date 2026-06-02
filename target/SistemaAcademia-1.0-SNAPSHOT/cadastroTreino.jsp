<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Professor, java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Novo Exercício - BorcelleFit</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background: #f4f7f6;
                display: flex;
                justify-content: center;
                padding: 20px;
            }
            .card {
                background: white;
                padding: 30px;
                border-radius: 12px;
                width: 400px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            h2 {
                color: #2c3e50;
                margin-bottom: 20px;
                border-bottom: 2px solid #f39c12;
                padding-bottom: 10px;
            }
            label {
                display: block;
                margin-top: 10px;
                font-weight: bold;
                color: #555;
            }
            input, select {
                width: 100%;
                padding: 10px;
                margin: 5px 0 15px 0;
                border: 1px solid #ddd;
                border-radius: 6px;
                box-sizing: border-box;
            }
            button {
                width: 100%;
                padding: 12px;
                background: #f39c12;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-weight: bold;
                font-size: 16px;
                transition: 0.3s;
            }
            button:hover {
                background: #d68910;
            }
        </style>
    </head>
    <body>
        <div class="card">
            <h2>Adicionar Exercício</h2>
            <form action="sistema?acao=salvarTreino" method="POST">

                <input type="hidden" name="idAluno" value="<%= request.getAttribute("idAluno")%>">

                <label>Exercício:</label>
                <input type="text" name="exercicio" placeholder="Ex: Supino Reto" required>

                <div style="display: flex; gap: 10px;">
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