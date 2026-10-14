<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="pe.isil.cotizador.Cotizacion, pe.isil.cotizador.Validador" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 1. ENTRADA: datos del formulario
    String nombre    = request.getParameter("nombre");
    String correo    = request.getParameter("correo");
    String codigo    = request.getParameter("codigo");
    String sPrecio   = request.getParameter("precio");
    String sCantidad = request.getParameter("cantidad");
    String sDescuento= request.getParameter("descuento");
    String sPorCaja  = request.getParameter("porCaja");

    // 2. PROCESAMIENTO: validaciones con String
    String errores = "";
    if (!Validador.esNombreValido(nombre))  errores += "<li>" + "El nombre debe tener al menos 3 letras y solo letras o espacios." + "</li>";
    if (!Validador.esCorreoValido(correo))  errores += "<li>" + "El correo no es válido (ejemplo: usuario@dominio.com)." + "</li>";
    if (!Validador.esCodigoValido(codigo))  errores += "<li>" + "El código debe tener el formato PRD-123." + "</li>";

    double precio = 0, descuento = 0;
    int cantidad = 0, porCaja = 12;
    try {
        precio = Double.parseDouble(sPrecio);
        cantidad = Integer.parseInt(sCantidad);
        descuento = (sDescuento == null || sDescuento.trim().isEmpty()) ? 0 : Double.parseDouble(sDescuento);
        porCaja = (sPorCaja == null || sPorCaja.trim().isEmpty()) ? 12 : Integer.parseInt(sPorCaja);
        if (precio <= 0)    errores += "<li>" + "El precio debe ser mayor que 0." + "</li>";
        if (cantidad <= 0)  errores += "<li>" + "La cantidad debe ser mayor que 0." + "</li>";
        if (descuento < 0 || descuento > 100) errores += "<li>" + "El descuento debe estar entre 0 y 100." + "</li>";
        if (porCaja <= 0)   errores += "<li>" + "Las unidades por caja deben ser mayores que 0." + "</li>";
    } catch (NumberFormatException e) {
        errores += "<li>" + "Precio, cantidad, descuento y unidades por caja deben ser números válidos." + "</li>";
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Resultado de la cotización</title>
  <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<main class="tarjeta">
<% if (!errores.isEmpty()) { %>
  <h1>Revisa los datos</h1>
  <div class="errores"><ul>
    <%= errores %>
  </ul></div>
  <a class="boton" href="index.jsp">Volver al formulario</a>
<% } else {
    // Cálculos con Math (dentro de la clase Cotizacion)
    String nombreFmt = Validador.formatearNombre(nombre);
    String codigoFmt = Validador.normalizarCodigo(codigo);
    Cotizacion c = new Cotizacion(codigoFmt, precio, cantidad, descuento);
%>
  <!-- 3. SALIDA -->
  <h1>Cotización <%= codigoFmt %></h1>
  <p class="dato">Cliente: <strong><%= nombreFmt %></strong><br>
     Correo: <%= Validador.ocultarCorreo(correo) %></p>
  <table>
    <tr><td>Precio unitario</td><td>S/ <%= String.format("%.2f", c.getPrecioUnitario()) %></td></tr>
    <tr><td>Cantidad</td><td><%= c.getCantidad() %></td></tr>
    <tr><td>Subtotal</td><td>S/ <%= String.format("%.2f", c.getSubtotal()) %></td></tr>
    <tr><td>Descuento (<%= c.getDescuentoPorcentaje() %>%)</td><td>- S/ <%= String.format("%.2f", c.getDescuento()) %></td></tr>
    <tr><td>Base imponible</td><td>S/ <%= String.format("%.2f", c.getBaseImponible()) %></td></tr>
    <tr><td>IGV (18%)</td><td>S/ <%= String.format("%.2f", c.getIgv()) %></td></tr>
    <tr class="total"><td>Total</td><td>S/ <%= String.format("%.2f", c.getTotal()) %></td></tr>
  </table>
  <p class="dato">Cajas necesarias (<%= porCaja %> und. por caja): <strong><%= c.getCajasNecesarias(porCaja) %></strong></p>
  <a class="boton" href="index.jsp">Nueva cotización</a>
<% } %>
</main>
</body>
</html>
