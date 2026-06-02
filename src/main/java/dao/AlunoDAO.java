package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Aluno;
import util.FabricaConexao;

public class AlunoDAO {

    public void salvar(Aluno aluno) {
        String sql = "INSERT INTO alunos (nome, cpf, email, senha, peso, altura, objetivo, dataMatricula, statusMensalidade, plano_atual, servicos_adicionais) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getCpf());
            stmt.setString(3, aluno.getEmail());

            String senhaFinal = (aluno.getSenha() != null && !aluno.getSenha().isEmpty()) ? aluno.getSenha() : "123";
            stmt.setString(4, senhaFinal);

            if (aluno.getPeso() != null) {
                stmt.setDouble(5, aluno.getPeso());
            } else {
                stmt.setNull(5, java.sql.Types.DOUBLE);
            }

            if (aluno.getAltura() != null) {
                stmt.setDouble(6, aluno.getAltura());
            } else {
                stmt.setNull(6, java.sql.Types.DOUBLE);
            }

            stmt.setString(7, aluno.getObjetivo());
            stmt.setDate(8, Date.valueOf(aluno.getDataMatricula()));
            stmt.setString(9, "ATIVO");
            stmt.setString(10, aluno.getPlanoAtual());
            stmt.setString(11, aluno.getServicosAdicionais());

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao salvar aluno no banco: " + e.getMessage(), e);
        }
    }

    public List<Aluno> listarTodos() {
        List<Aluno> lista = new ArrayList<>();
        String sql = "SELECT * FROM alunos ORDER BY nome";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Aluno a = new Aluno();
                a.setId(rs.getLong("id"));
                a.setNome(rs.getString("nome"));
                a.setCpf(rs.getString("cpf"));
                a.setEmail(rs.getString("email"));
                a.setPeso(rs.getDouble("peso"));
                a.setAltura(rs.getDouble("altura"));
                a.setObjetivo(rs.getString("objetivo"));
                a.setDataMatricula(rs.getDate("dataMatricula").toLocalDate());
                a.setPlanoAtual(rs.getString("plano_atual"));
                a.setServicosAdicionais(rs.getString("servicos_adicionais"));
                lista.add(a);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar alunos: " + e.getMessage(), e);
        }
        return lista;
    }

    public void excluir(Long id) {
        String sqlTreinos = "DELETE FROM treinos WHERE aluno_id = ?";
        String sqlPagamentos = "DELETE FROM pagamentos WHERE aluno_id = ?";
        String sqlAluno = "DELETE FROM alunos WHERE id = ?";

        try (Connection conn = FabricaConexao.obterConexao()) {
            conn.setAutoCommit(false);

            try {
                try (PreparedStatement stmtT = conn.prepareStatement(sqlTreinos)) {
                    stmtT.setLong(1, id);
                    stmtT.executeUpdate();
                }

                try (PreparedStatement stmtP = conn.prepareStatement(sqlPagamentos)) {
                    stmtP.setLong(1, id);
                    stmtP.executeUpdate();
                }

                try (PreparedStatement stmtA = conn.prepareStatement(sqlAluno)) {
                    stmtA.setLong(1, id);
                    stmtA.executeUpdate();
                }

                conn.commit();

            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro crítico ao excluir aluno e seus dados vinculados: " + e.getMessage(), e);
        }
    }

    public Aluno buscarPorId(Long id) {
        String sql = "SELECT * FROM alunos WHERE id = ?";
        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Aluno a = new Aluno();
                    a.setId(rs.getLong("id"));
                    a.setNome(rs.getString("nome"));
                    a.setCpf(rs.getString("cpf"));
                    a.setEmail(rs.getString("email"));
                    a.setPeso(rs.getDouble("peso"));
                    a.setAltura(rs.getDouble("altura"));
                    a.setObjetivo(rs.getString("objetivo"));
                    a.setDataMatricula(rs.getDate("dataMatricula").toLocalDate());
                    a.setPlanoAtual(rs.getString("plano_atual"));
                    a.setServicosAdicionais(rs.getString("servicos_adicionais"));
                    return a;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar aluno: " + e.getMessage(), e);
        }
        return null;
    }

    public void atualizar(Aluno aluno) {
        String sql = "UPDATE alunos SET nome=?, cpf=?, email=?, peso=?, altura=?, objetivo=?, plano_atual=?, servicos_adicionais=? WHERE id=?";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getCpf());
            stmt.setString(3, aluno.getEmail());

            if (aluno.getPeso() != null) {
                stmt.setDouble(4, aluno.getPeso());
            } else {
                stmt.setNull(4, java.sql.Types.DOUBLE);
            }

            if (aluno.getAltura() != null) {
                stmt.setDouble(5, aluno.getAltura());
            } else {
                stmt.setNull(5, java.sql.Types.DOUBLE);
            }

            stmt.setString(6, aluno.getObjetivo());
            stmt.setString(7, aluno.getPlanoAtual());
            stmt.setString(8, aluno.getServicosAdicionais());
            stmt.setLong(9, aluno.getId());

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar aluno no banco: " + e.getMessage(), e);
        }
    }
}
