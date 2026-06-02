package dao;

import util.FabricaConexao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Pagamento;

public class PagamentoDAO {

    public void salvar(Pagamento p) {
        String sql = "INSERT INTO pagamentos (aluno_id, valor, data_pagamento, metodo_pagamento, referencia_mes, descricao_plano) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, p.getAlunoId());
            stmt.setDouble(2, p.getValor());
            stmt.setDate(3, p.getDataPagamento());
            stmt.setString(4, p.getMetodoPagamento());
            stmt.setString(5, p.getReferenciaMes());
            stmt.setString(6, p.getDescricaoPlano());
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void excluir(Long id) {
        String sql = "DELETE FROM pagamentos WHERE id = ?";
        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, id);
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao excluir pagamento: " + e.getMessage(), e);
        }
    }

    public List<Pagamento> listarTodos() {
        List<Pagamento> lista = new ArrayList<>();
        String sql = "SELECT p.*, a.nome FROM pagamentos p INNER JOIN alunos a ON p.aluno_id = a.id ORDER BY p.data_pagamento DESC";
        try (Connection conn = FabricaConexao.obterConexao(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Pagamento p = new Pagamento();
                p.setId(rs.getLong("id"));
                p.setValor(rs.getDouble("valor"));
                p.setDataPagamento(rs.getDate("data_pagamento"));
                p.setMetodoPagamento(rs.getString("metodo_pagamento"));
                p.setReferenciaMes(rs.getString("referencia_mes"));
                p.setNomeAluno(rs.getString("nome"));
                p.setDescricaoPlano(rs.getString("descricao_plano"));
                lista.add(p);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }
}
