package model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Aluno extends Pessoa implements AcessoSistema {

    private Double peso;
    private Double altura;
    private String objetivo;
    private LocalDate dataMatricula;
    private String statusMensalidade;
    private List<Treino> treinos = new ArrayList<>();
    private String servicosAdicionais;
    private String planoAtual;

    public Aluno() {
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public Double getAltura() {
        return altura;
    }

    public void setAltura(Double altura) {
        this.altura = altura;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public LocalDate getDataMatricula() {
        return dataMatricula;
    }

    public void setDataMatricula(LocalDate dataMatricula) {
        this.dataMatricula = dataMatricula;
    }

    public String getStatusMensalidade() {
        return statusMensalidade;
    }

    public void setStatusMensalidade(String statusMensalidade) {
        this.statusMensalidade = statusMensalidade;
    }

    public List<Treino> getTreinos() {
        return treinos;
    }

    public void setTreinos(List<Treino> treinos) {
        this.treinos = treinos;
    }

    public String getPlanoAtual() {
        return planoAtual;
    }

    public void setPlanoAtual(String planoAtual) {
        this.planoAtual = planoAtual;
    }

    public String getServicosAdicionais() {
        return servicosAdicionais;
    }

    public void setServicosAdicionais(String servicosAdicionais) {
        this.servicosAdicionais = servicosAdicionais;
    }

    @Override
    public boolean autenticar(String email, String senha) {
        return this.email.equals(email) && this.senha.equals(senha) && this.statusMensalidade.equals("ATIVO");
    }
}
