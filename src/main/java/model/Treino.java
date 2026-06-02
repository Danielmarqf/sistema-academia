package model;

public class Treino {

    private Long id;
    private Long alunoId;
    private String exercicio;
    private int series;
    private int repeticoes;
    private String carga;
    private String diaSemana;
    private Professor instrutorResponsavel;

    public Treino() {
    }

    public Treino(Long id, Long alunoId, String exercicio, int series, int repeticoes, String carga, String diaSemana, Professor instrutorResponsavel) {
        this.id = id;
        this.alunoId = alunoId;
        this.exercicio = exercicio;
        this.series = series;
        this.repeticoes = repeticoes;
        this.carga = carga;
        this.diaSemana = diaSemana;
        this.instrutorResponsavel = instrutorResponsavel;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAlunoId() {
        return alunoId;
    }

    public void setAlunoId(Long alunoId) {
        this.alunoId = alunoId;
    }

    public String getExercicio() {
        return exercicio;
    }

    public void setExercicio(String exercicio) {
        this.exercicio = exercicio;
    }

    public int getSeries() {
        return series;
    }

    public void setSeries(int series) {
        this.series = series;
    }

    public int getRepeticoes() {
        return repeticoes;
    }

    public void setRepeticoes(int repeticoes) {
        this.repeticoes = repeticoes;
    }

    public String getCarga() {
        return carga;
    }

    public void setCarga(String carga) {
        this.carga = carga;
    }

    public String getDiaSemana() {
        return diaSemana;
    }

    public void setDiaSemana(String diaSemana) {
        this.diaSemana = diaSemana;
    }

    public Professor getInstrutorResponsavel() {
        return instrutorResponsavel;
    }

    public void setInstrutorResponsavel(Professor instrutorResponsavel) {
        this.instrutorResponsavel = instrutorResponsavel;
    }
}
