<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Cadastro Instrutor - BorcelleFit</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
                margin: 0;
            }
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(255,255,255,0.05);
                backdrop-filter: blur(5px);
                z-index: -1;
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
            .btn-voltar {
                color: #000;
                font-size: 20px;
                text-decoration: none;
                transition: transform 0.2s;
            }
            .btn-voltar:hover {
                transform: scale(1.1);
            }
            .titulo {
                font-size: 24px;
                font-weight: 600;
                color: #222;
            }

            .form-group {
                margin-bottom: 12px;
            }
            label {
                font-size: 12px;
                font-style: italic;
                margin-left: 15px;
                display: block;
                margin-bottom: 4px;
                color: #444;
            }

            .form-control {
                width: 100%;
                padding: 12px 20px;
                background: #d9d9d9;
                border: none;
                border-radius: 25px;
                font-size: 14px;
                outline: none;
                transition: background 0.3s;
            }

            .form-control:focus {
                background: #cecece;
                box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);
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
                font-size: 14px;
                transition: background 0.3s;
            }

            .btn-submit:hover {
                background: #333;
            }

            .usuario-footer {
                text-align: right;
                font-size: 9px;
                color: #666;
                margin-top: 10px;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <div class="overlay"></div>
        <div class="form-card">
            <div class="header">
                <a href="sistema?acao=listarProfessores" class="btn-voltar"><i class="fas fa-undo"></i></a>
                <h2 class="titulo">Cadastro Instrutor <i class="fas fa-dumbbell"></i></h2>
            </div>

            <form action="sistema" method="POST">
                <input type="hidden" name="acao" value="salvarProfessor">

                <div class="form-group">
                    <label>Nome</label>
                    <input type="text" name="nome" class="form-control" required placeholder="Nome completo">
                </div>

                <div class="form-group">
                    <label>CPF</label>
                    <input type="text" name="cpf" class="form-control" required placeholder="000.000.000-00">
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" placeholder="email@exemplo.com">
                </div>

                <div class="form-group">
                    <label>Senha de Acesso</label>
                    <input type="password" name="senha" class="form-control" required placeholder="Crie uma senha forte">
                </div>

                <div class="form-group">
                    <label>Salário</label>
                    <input type="text" name="salario" class="form-control" placeholder="Ex: 2500.00">
                </div>

                <div class="form-group">
                    <label>Turno</label>
                    <select name="turno" class="form-control">
                        <option value="Manhã">Manhã</option>
                        <option value="Tarde">Tarde</option>
                        <option value="Noite">Noite</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>CREF</label>
                    <input type="text" name="cref" class="form-control" required placeholder="Registro Profissional">
                </div>

                <button type="submit" class="btn-submit">Cadastrar Instrutor</button>
            </form>
            <p class="usuario-footer">Você está logado como: instrutor</p>
        </div>
    </body>
</html>
