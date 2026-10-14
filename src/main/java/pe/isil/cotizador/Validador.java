package pe.isil.cotizador;

/**
 * Validaciones y transformaciones de texto con métodos de la clase String.
 */
public class Validador {

    /** Nombre: no vacío, mínimo 3 caracteres y solo letras o espacios. */
    public static boolean esNombreValido(String nombre) {
        if (nombre == null) return false;
        String limpio = nombre.trim();
        if (limpio.isEmpty() || limpio.length() < 3) return false;
        for (int i = 0; i < limpio.length(); i++) {
            char c = limpio.charAt(i);
            if (!Character.isLetter(c) && c != ' ') return false;
        }
        return true;
    }

    /** Correo: un solo '@', texto antes, y un punto después del '@'. */
    public static boolean esCorreoValido(String correo) {
        if (correo == null) return false;
        String c = correo.trim();
        if (c.contains(" ")) return false;
        int arroba = c.indexOf("@");
        if (arroba <= 0 || arroba != c.lastIndexOf("@")) return false;
        String dominio = c.substring(arroba + 1);
        return dominio.contains(".") && !dominio.startsWith(".") && !dominio.endsWith(".");
    }

    /** Código de producto con formato PRD-123 (3 dígitos). */
    public static boolean esCodigoValido(String codigo) {
        if (codigo == null) return false;
        String c = codigo.trim().toUpperCase();
        if (!c.startsWith("PRD-") || c.length() != 7) return false;
        String numeros = c.substring(4);
        for (int i = 0; i < numeros.length(); i++) {
            if (!Character.isDigit(numeros.charAt(i))) return false;
        }
        return true;
    }

    /** "juan   pérez" -> "Juan Pérez" (trim, split, substring, toUpperCase, toLowerCase). */
    public static String formatearNombre(String nombre) {
        String[] palabras = nombre.trim().split("\\s+");
        String resultado = "";
        for (String p : palabras) {
            if (!resultado.isEmpty()) resultado = resultado + " ";
            resultado = resultado + p.substring(0, 1).toUpperCase() + p.substring(1).toLowerCase();
        }
        return resultado;
    }

    /** "juan@correo.com" -> "j***@correo.com" (indexOf, substring, replace). */
    public static String ocultarCorreo(String correo) {
        String c = correo.trim().toLowerCase();
        int arroba = c.indexOf("@");
        return c.substring(0, 1) + "***" + c.substring(arroba);
    }

    public static String normalizarCodigo(String codigo) {
        return codigo.trim().toUpperCase().replace(" ", "");
    }
}
