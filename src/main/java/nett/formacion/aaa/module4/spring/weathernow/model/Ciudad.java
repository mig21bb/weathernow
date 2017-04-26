package nett.formacion.aaa.module4.spring.weathernow.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ciudades database table.
 * 
 */
@Entity
@Table(name="ciudades")
@NamedQuery(name="Ciudad.findAll", query="SELECT c FROM Ciudad c")
public class Ciudad implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_ciu")
	private int idCiu;

	@Column(name="nombre_ciu")
	private String nombreCiu;

	//bi-directional many-to-one association to Pais
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_pais")
	private Pais pais;

	//bi-directional many-to-one association to Registro
	/*
	@OneToMany(mappedBy="ciudade")
	private List<Registro> registros;

	public Ciudad() {
	}
*/
	public int getIdCiu() {
		return this.idCiu;
	}

	public void setIdCiu(int idCiu) {
		this.idCiu = idCiu;
	}

	public String getNombreCiu() {
		return this.nombreCiu;
	}

	public void setNombreCiu(String nombreCiu) {
		this.nombreCiu = nombreCiu;
	}

	public Pais getPais() {
		return this.pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}
/*
	public List<Registro> getRegistros() {
		return this.registros;
	}

	public void setRegistros(List<Registro> registros) {
		this.registros = registros;
	}

	public Registro addRegistro(Registro registro) {
		getRegistros().add(registro);
		registro.setCiudade(this);

		return registro;
	}

	public Registro removeRegistro(Registro registro) {
		getRegistros().remove(registro);
		registro.setCiudade(null);

		return registro;
	}
*/
}