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
	@Column(unique=true, nullable=false)
	private int idCiu;

	@Column(length=100)
	private String nombreCiu;

	//bi-directional many-to-one association to Pais
	@ManyToOne
	@JoinColumn(name="idPais", nullable=false)
	private Pais pais;

	//bi-directional many-to-one association to Registro
	//@OneToMany(mappedBy="ciudade",fetch=FetchType.LAZY)
	//private List<Registro> registros;

	public Ciudad() {
	}

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
	
	@Override
    public String toString() {
        return String.format("Ciudad[ nombre='%s', pais='%d']",nombreCiu, pais);
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