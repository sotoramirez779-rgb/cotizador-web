# Cotizador Web – PA2 Programación Orientada a Objetos

**Curso:** Programación Orientada a Objetos (30626) · ISIL · 2026-20
**Evaluación:** PA2 (sesiones 5 a 7: JSP/Tomcat, clase Math, clase String)

## Descripción breve
Mini aplicación web que recibe por formulario los datos de un cliente y de un producto, valida los textos con la clase `String`, calcula la cotización (subtotal, descuento, IGV y total) con la clase `Math` y muestra el resultado en una vista JSP.

**Flujo:** `index.jsp` (entrada) → `resultado.jsp` (procesamiento con `Validador` y `Cotizacion`) → misma vista (salida).

## Integrantes y responsabilidades
| Integrante | Parte del caso que resolvió |
|---|---|
| _Integrante 1_ | Presentación, flujo general y formulario `index.jsp` con estilos Alejandro Vicente Cori Contreras |
| _Integrante 2_ | Clase `Validador` (métodos de `String`) Luigui Alva Sánchez |
| _Integrante 3_ | Clase `Cotizacion` (métodos de `Math`) Natalia Milene Rojas Escudero  |
| _Integrante 4_ | `resultado.jsp` y pruebas Sergio Enrique Vargas Fernández |
| Ronald Yamil Soto Ramirez | Ejecución en Tomcat, repositorio/README y cierre |

## Video de exposición
[Ver video en YouTube](PEGAR_ENLACE_AQUI)

## Métodos usados
- **Math:** `round`, `max`, `min`, `ceil`, `abs`
- **String:** `trim`, `isEmpty`, `length`, `charAt`, `contains`, `indexOf`, `lastIndexOf`, `substring`, `startsWith`, `endsWith`, `toUpperCase`, `toLowerCase`, `replace`, `split`

## Requisitos
- JDK 17 o superior
- Apache Tomcat 9 o 10.1
- Maven (opcional; también se puede importar en Eclipse/NetBeans/IntelliJ como proyecto web)

## Cómo ejecutar
**Con Maven:**
1. `mvn clean package`
2. Copiar `target/cotizador.war` a la carpeta `webapps` de Tomcat.
3. Iniciar Tomcat (`bin/startup.bat` o `bin/startup.sh`).
4. Abrir `http://localhost:8080/cotizador/`

**Con IntelliJ IDEA (Community o Ultimate):**
1. `File > Open` y seleccionar la carpeta del proyecto (o su `pom.xml`) > *Open as Project*. Esperar a que Maven descargue las dependencias.
2. Verificar `File > Project Structure > Project` con SDK 17 o superior.
3. En la barra superior elegir la configuración **Cotizador (Tomcat)** y pulsar *Run*. La primera vez descarga Tomcat 10.1 automáticamente.
4. Abrir `http://localhost:8080/cotizador/`. Para detener el servidor, pulsar *Stop*.

*Alternativa en IntelliJ Ultimate:* `Run > Edit Configurations > + > Tomcat Server > Local`, pestaña *Deployment* > `+` > *Artifact* > `cotizador:war exploded`, y Application context `/cotizador`.

## Pruebas realizadas
| Caso | Entrada | Resultado esperado |
|---|---|---|
| Datos válidos | juan pérez, juan@correo.com, PRD-001, S/ 25.50, 30 und., 10 % | Subtotal 765.00 · Desc. 76.50 · IGV 123.93 · Total 812.43 · 3 cajas |
| Correo inválido | `juan@@correo` | Mensaje de error de correo |
| Código inválido | `PRD-12A` | Mensaje de error de código |
| Nombre inválido | `ANA` | Mensaje de error de nombre |
| Precio no numérico | `abc` | Mensaje de número inválido |
