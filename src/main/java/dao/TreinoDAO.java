package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Treino;
import model.Professor;
import util.FabricaConexao;

public class TreinoDAO {

    public void salvar(Treino treino) {
        String sql = "INSERT INTO treinos (aluno_id, professor_id, exercicio, series, repeticoes, carga, dia_semana) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, treino.getAlunoId());
            stmt.setLong(2, treino.getInstrutorResponsavel().getId());
            stmt.setString(3, treino.getExercicio());
            stmt.setInt(4, treino.getSeries());
            stmt.setInt(5, treino.getRepeticoes());
            stmt.setString(6, treino.getCarga());
            stmt.setString(7, treino.getDiaSemana());

            stmt.execute();

        } catch (SQLException e) {
            System.err.println("Erro ao salvar treino: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public List<Treino> listarPorAluno(Long alunoId) {
        List<Treino> lista = new ArrayList<>();

        String sql = "SELECT t.*, p.nome AS nome_professor "
                + "FROM treinos t "
                + "INNER JOIN professores p ON t.professor_id = p.id "
                + "WHERE t.aluno_id = ? "
                + "ORDER BY t.id DESC";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, alunoId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Treino t = new Treino();
                    t.setId(rs.getLong("id"));
                    t.setAlunoId(rs.getLong("aluno_id"));
                    t.setExercicio(rs.getString("exercicio"));
                    t.setSeries(rs.getInt("series"));
                    t.setRepeticoes(rs.getInt("repeticoes"));
                    t.setCarga(rs.getString("carga"));
                    t.setDiaSemana(rs.getString("dia_semana"));

                    Professor prof = new Professor();
                    prof.setId(rs.getLong("professor_id"));
                    prof.setNome(rs.getString("nome_professor"));

                    t.setInstrutorResponsavel(prof);
                    lista.add(t);
                }
            }
        } catch (SQLException e) {
            System.err.println("ERRO NO JOIN DO TREINODAO: " + e.getMessage());
            e.printStackTrace();
        }
        return lista;
    }

    public void excluirPorAluno(Long alunoId) {
        String sql = "DELETE FROM treinos WHERE aluno_id = ?";

        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, alunoId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Erro ao excluir treinos do aluno: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }
}
