package dao;

import util.FabricaConexao;
import java.sql.*;
import model.Usuario;

public class LoginDAO {

    public Usuario autenticar(String email, String senha) {
        Usuario user = buscarEmTabela("professores", email, senha, "PROFESSOR");

        if (user == null) {
            user = buscarEmTabela("alunos", email, senha, "ALUNO");
        }

        return user;
    }

    private Usuario buscarEmTabela(String tabela, String email, String senha, String perfil) {
        String sql = "SELECT id, nome, email FROM " + tabela + " WHERE email = ? AND senha = ?";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, senha);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Usuario u = new Usuario();
                    u.setId(rs.getLong("id"));
                    u.setNome(rs.getString("nome"));
                    u.setEmail(rs.getString("email"));
                    u.setPerfil(perfil);
                    return u;
                }
            }
        } catch (SQLException e) {

            System.err.println("ERRO CRÍTICO NO LOGIN (Tabela " + tabela + "): " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
