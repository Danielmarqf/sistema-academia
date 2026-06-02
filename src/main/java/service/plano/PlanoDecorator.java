package service.plano;

public abstract class PlanoDecorator implements Plano {

    protected Plano plano;

    public PlanoDecorator(Plano plano) {
        this.plano = plano;
    }

    @Override
    public double getValor() {
        return plano.getValor();
    }

    @Override
    public String getDescricao() {
        return plano.getDescricao();
    }
}
