package service.plano;

public class MassagemDecorator extends PlanoDecorator {

    public MassagemDecorator(Plano plano) {
        super(plano);
    }

    @Override
    public double getValor() {
        return super.getValor() + 30.00;
    }
    
    @Override
    public String getDescricao() {
        return super.getDescricao() + " + Cadeira de Massagem";
    }
}
