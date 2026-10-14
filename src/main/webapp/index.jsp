<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Cotizador Web</title>
  <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
  <main class="tarjeta">
    <h1>Cotizador de productos</h1>
    <p class="sub">Completa los datos y obtén tu cotización con IGV.</p>

    <form action="resultado.jsp" method="post">
      <label>Nombre completo
        <input type="text" name="nombre" placeholder="Ej: juan pérez" required>
      </label>
      <label>Correo electrónico
        <input type="text" name="correo" placeholder="Ej: juan@correo.com" required>
      </label>
      <label>Código de producto
        <input type="text" name="codigo" placeholder="Formato PRD-123" required>
      </label>
      <div class="fila">
        <label>Precio unitario (S/)
          <input type="number" name="precio" step="0.01" min="0.01" required>
        </label>
        <label>Cantidad
          <input type="number" name="cantidad" min="1" required>
        </label>
      </div>
      <div class="fila">
        <label>Descuento (%)
          <input type="number" name="descuento" step="0.1" min="0" max="100" value="0">
        </label>
        <label>Unidades por caja
          <input type="number" name="porCaja" min="1" value="12">
        </label>
      </div>
      <button type="submit">Calcular cotización</button>
    </form>
  </main>
</body>
</html>
