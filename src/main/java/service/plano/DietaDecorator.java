package service.plano;

public class DietaDecorator extends PlanoDecorator {

    public DietaDecorator(Plano plano) {
        super(plano);
    }

    @Override
    public double getValor() {
        return super.getValor() + 30.00;
    }
    
    @Override
    public String getDescricao() {
        return super.getDescricao() + " + Dieta";
    }
}
