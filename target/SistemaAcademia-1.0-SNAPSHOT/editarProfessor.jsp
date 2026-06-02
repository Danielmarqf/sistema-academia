<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Professor"%>
<%
    Professor p = (Professor) request.getAttribute("professor");

    if (p == null) {
        response.sendRedirect("sistema?acao=listarProfessores");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Editar Instrutor - BorcelleFit</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }
            body {
                background: #f4f7f6;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
            .form-card {
                background: white;
                width: 100%;
                max-width: 450px;
                border-radius: 40px;
                padding: 30px 40px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            }
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .titulo {
                font-size: 26px;
                font-weight: 600;
            }
            .form-group {
                margin-bottom: 12px;
            }
            label {
                font-size: 11px;
                font-style: italic;
                margin-left: 15px;
                display: block;
                margin-bottom: 4px;
                color: #555;
            }
            .form-control {
                width: 100%;
                padding: 12px 20px;
                background: #d9d9d9;
                border: none;
                border-radius: 25px;
                font-size: 14px;
                outline: none;
            }
            .btn-submit {
                width: 100%;
                padding: 15px;
                background: #111;
                color: white;
                border: none;
                border-radius: 25px;
                font-weight: bold;
                cursor: pointer;
                margin-top: 15px;
                transition: background 0.3s;
            }
            .btn-submit:hover {
                background: #333;
            }
        </style>
    </head>
    <body>
        <div class="form-card">
            <div class="header">
                <h2 class="titulo">Editar Instrutor <i class="fas fa-user-edit"></i></h2>
            </div>

            <form action="sistema?acao=atualizarProfessor" method="POST">
                <input type="hidden" name="idProfessor" value="<%= p.getId()%>">

                <div class="form-group">
                    <label>Nome Completo</label>
                    <input type="text" name="nome" class="form-control" value="<%= p.getNome()%>" required>
                </div>

                <div class="form-group">
                    <label>CPF (Não pode ser vazio)</label>
                    <input type="text" name="cpf" class="form-control" value="<%= p.getCpf() != null ? p.getCpf() : ""%>" required>
                </div>

                <div class="form-group">
                    <label>E-mail</label>
                    <input type="email" name="email" class="form-control" value="<%= p.getEmail() != null ? p.getEmail() : ""%>">
                </div>

                <div class="form-group">
                    <label>Senha de Acesso</label>
                    <input type="password" name="senha" class="form-control" value="<%= p.getSenha() != null ? p.getSenha() : ""%>" required>
                </div>

                <div class="form-group">
                    <label>Salário</label>
                    <input type="text" name="salario" class="form-control" value="<%= p.getSalario() != null ? p.getSalario() : ""%>">
                </div>

                <div class="form-group">
                    <label>Turno</label>
                    <select name="turno" class="form-control">
                        <option value="Manhã" <%= "Manhã".equals(p.getTurno()) ? "selected" : ""%>>Manhã</option>
                        <option value="Tarde" <%= "Tarde".equals(p.getTurno()) ? "selected" : ""%>>Tarde</option>
                        <option value="Noite" <%= "Noite".equals(p.getTurno()) ? "selected" : ""%>>Noite</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>CREF</label>
                    <input type="text" name="cref" class="form-control" value="<%= p.getCref()%>" required>
                </div>

                <button type="submit" class="btn-submit">Salvar Alterações</button>
                <a href="sistema?acao=listarProfessores" style="display:block; text-align:center; margin-top:15px; color:#666; text-decoration:none; font-size:12px;">Cancelar</a>
            </form>
        </div>
    </body>
</html>