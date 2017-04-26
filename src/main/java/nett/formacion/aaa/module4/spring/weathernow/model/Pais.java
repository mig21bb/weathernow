package nett.formacion.aaa.module4.spring.weathernow.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the paises database table.
 * 
 */
@Entity
@Table(name="paises")
@NamedQuery(name="Pais.findAll", query="SELECT p FROM Pais p")
public class Pais implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_pais")
	private int idPais;

	@Column(name="codigo_pais")
	private String codigoPais;

	@Column(name="nombre_pais")
	private String nombrePais;
/*
	//bi-directional many-to-one association to Ciudad
	@OneToMany(mappedBy="pais")
	private List<Ciudad> ciudades;
*/
	public Pais() {
	}

	public int getIdPais() {
		return this.idPais;
	}

	public void setIdPais(int idPais) {
		this.idPais = idPais;
	}

	public String getCodigoPais() {
		return this.codigoPais;
	}

	public void setCodigoPais(String codigoPais) {
		this.codigoPais = codigoPais;
	}

	public String getNombrePais() {
		return this.nombrePais;
	}

	public void setNombrePais(String nombrePais) {
		this.nombrePais = nombrePais;
	}
/*
	public List<Ciudad> getCiudades() {
		return this.ciudades;
	}

	public void setCiudades(List<Ciudad> ciudades) {
		this.ciudades = ciudades;
	}

	public Ciudad addCiudade(Ciudad ciudade) {
		getCiudades().add(ciudade);
		ciudade.setPais(this);

		return ciudade;
	}

	public Ciudad removeCiudade(Ciudad ciudade) {
		getCiudades().remove(ciudade);
		ciudade.setPais(null);

		return ciudade;
	}
*/
}