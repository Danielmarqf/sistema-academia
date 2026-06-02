package model;

import java.time.LocalDate;

public class Professor extends Pessoa implements AcessoSistema {

    private String cref;
    private String especialidade;
    private Double salario;
    private String turno;
    private LocalDate dataContratacao;

    public Professor() {
    }

    public String getCref() {
        return cref;
    }

    public void setCref(String cref) {
        this.cref = cref;
    }

    public String getEspecialidade() {
        return especialidade;
    }

    public void setEspecialidade(String especialidade) {
        this.especialidade = especialidade;
    }

    public Double getSalario() {
        return salario;
    }

    public void setSalario(Double salario) {
        this.salario = salario;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public LocalDate getDataContratacao() {
        return dataContratacao;
    }

    public void setDataContratacao(LocalDate dataContratacao) {
        this.dataContratacao = dataContratacao;
    }

    @Override
    public boolean autenticar(String email, String senha) {
        return this.email != null && this.email.equals(email)
                && this.senha != null && this.senha.equals(senha)
                && this.cref != null && !this.cref.isEmpty();
    }
}
