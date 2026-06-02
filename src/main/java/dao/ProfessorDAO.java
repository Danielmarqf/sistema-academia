package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Professor;
import util.FabricaConexao;
import builder.ProfessorBuilder;

public class ProfessorDAO {

    public void salvar(Professor p) {
        String sql = "INSERT INTO professores (nome, cpf, email, senha, salario, turno, cref) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, p.getNome());
            stmt.setString(2, p.getCpf());
            stmt.setString(3, p.getEmail());
            stmt.setString(4, p.getSenha());
            stmt.setObject(5, p.getSalario());
            stmt.setString(6, p.getTurno());
            stmt.setString(7, p.getCref());

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao salvar professor: " + e.getMessage(), e);
        }
    }

    public List<Professor> listarTodos() {
        List<Professor> lista = new ArrayList<>();
        String sql = "SELECT * FROM professores ORDER BY nome";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Professor p = new ProfessorBuilder()
                        .id(rs.getLong("id"))
                        .nome(rs.getString("nome"))
                        .cpf(rs.getString("cpf"))
                        .email(rs.getString("email"))
                        .senha(rs.getString("senha"))
                        .cref(rs.getString("cref"))
                        .turno(rs.getString("turno"))
                        .salario(rs.getDouble("salario"))
                        .build();
                lista.add(p);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar professores: " + e.getMessage(), e);
        }
        return lista;
    }

    public Professor buscarPorId(Long id) {
        String sql = "SELECT * FROM professores WHERE id = ?";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new ProfessorBuilder()
                            .id(rs.getLong("id"))
                            .nome(rs.getString("nome"))
                            .cpf(rs.getString("cpf"))
                            .email(rs.getString("email"))
                            .senha(rs.getString("senha"))
                            .cref(rs.getString("cref"))
                            .turno(rs.getString("turno"))
                            .salario(rs.getDouble("salario"))
                            .build();
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar professor: " + e.getMessage(), e);
        }
        return null;
    }

    public void atualizar(Professor p) {
        String sql = "UPDATE professores SET nome=?, cpf=?, email=?, senha=?, salario=?, turno=?, cref=? WHERE id=?";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, p.getNome());
            stmt.setString(2, p.getCpf());
            stmt.setString(3, p.getEmail());
            stmt.setString(4, p.getSenha());
            stmt.setObject(5, p.getSalario());
            stmt.setString(6, p.getTurno());
            stmt.setString(7, p.getCref());
            stmt.setLong(8, p.getId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar: " + e.getMessage(), e);
        }
    }

    public void excluir(Long id) {
        String sql = "DELETE FROM professores WHERE id = ?";
        try (Connection conn = util.FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao excluir professor: " + e.getMessage(), e);
        }
    }
}
