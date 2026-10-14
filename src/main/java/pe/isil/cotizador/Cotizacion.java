package pe.isil.cotizador;

/**
 * Representa una cotización. Concentra los cálculos con la clase Math.
 */
public class Cotizacion {

    public static final double IGV = 0.18;

    private String producto;
    private double precioUnitario;
    private int cantidad;
    private double descuentoPorcentaje;

    public Cotizacion(String producto, double precioUnitario, int cantidad, double descuentoPorcentaje) {
        this.producto = producto;
        this.precioUnitario = precioUnitario;
        this.cantidad = cantidad;
        this.descuentoPorcentaje = descuentoPorcentaje;
    }

    /** Redondea a 2 decimales usando Math.round. */
    public static double redondear(double valor) {
        return Math.round(valor * 100.0) / 100.0;
    }

    public double getSubtotal() {
        return redondear(precioUnitario * cantidad);
    }

    /** El descuento nunca puede ser negativo ni superar el subtotal (Math.max / Math.min). */
    public double getDescuento() {
        double porcentaje = Math.min(Math.max(descuentoPorcentaje, 0), 100);
        return redondear(getSubtotal() * porcentaje / 100.0);
    }

    public double getBaseImponible() {
        return redondear(getSubtotal() - getDescuento());
    }

    public double getIgv() {
        return redondear(getBaseImponible() * IGV);
    }

    public double getTotal() {
        return redondear(getBaseImponible() + getIgv());
    }

    /** Cantidad de cajas necesarias: Math.ceil redondea siempre hacia arriba. */
    public int getCajasNecesarias(int unidadesPorCaja) {
        return (int) Math.ceil((double) cantidad / unidadesPorCaja);
    }

    /** Diferencia absoluta contra un presupuesto del cliente (Math.abs). */
    public double getDiferenciaPresupuesto(double presupuesto) {
        return redondear(Math.abs(presupuesto - getTotal()));
    }

    public String getProducto() { return producto; }
    public double getPrecioUnitario() { return precioUnitario; }
    public int getCantidad() { return cantidad; }
    public double getDescuentoPorcentaje() { return descuentoPorcentaje; }
}
