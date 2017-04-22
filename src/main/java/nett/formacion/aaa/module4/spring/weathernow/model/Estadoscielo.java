package nett.formacion.aaa.module4.spring.weathernow.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the estadoscielo database table.
 * 
 */
@Entity
@Table(name="estadoscielo")
@NamedQuery(name="Estadoscielo.findAll", query="SELECT e FROM Estadoscielo e")
public class Estadoscielo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private int idEst;

	@Column(nullable=false, length=100)
	private String est;

	//bi-directional many-to-one association to Registro
	//@OneToMany(mappedBy="estadoscielo",fetch=FetchType.LAZY)
	//private List<Registro> registros;

	public Estadoscielo() {
	}

	public int getIdEst() {
		return this.idEst;
	}

	public void setIdEst(int idEst) {
		this.idEst = idEst;
	}

	public String getEst() {
		return this.est;
	}

	public void setEst(String est) {
		this.est = est;
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