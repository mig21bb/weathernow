package nett.formacion.aaa.module4.spring.weathernow.pojos;

public enum Escala {
	
	C, F, K;
	
	/**
	 * Devuelve true si test está contenido en en el Enum
	 * @param test
	 * @return
	 */
	public static boolean contains(String test) {

	    for (Escala e : Escala.values()) {
	        if (e.name().equals(test.toUpperCase())) {
	            return true;
	        }
	    }

	    return false;
	}

}
