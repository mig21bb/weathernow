package nett.formacion.aaa.module4.spring.weathernow.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the estadoscielo database table.
 * 
 */
@Entity
@NamedQuery(name="Estadoscielo.findAll", query="SELECT e FROM Estadoscielo e")
public class Estadoscielo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_est")
	private int idEst;

	private String estado;

	//bi-directional many-to-one association to Registro
	/*
	@OneToMany(mappedBy="estadoscielo")
	private List<Registro> registros;

	public Estadoscielo() {
	}
*/
	public int getIdEst() {
		return this.idEst;
	}

	public void setIdEst(int idEst) {
		this.idEst = idEst;
	}

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
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
		registro.setEstadoscielo(this);

		return registro;
	}

	public Registro removeRegistro(Registro registro) {
		getRegistros().remove(registro);
		registro.setEstadoscielo(null);

		return registro;
	}
*/
}