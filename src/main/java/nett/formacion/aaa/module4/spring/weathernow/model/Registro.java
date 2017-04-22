package nett.formacion.aaa.module4.spring.weathernow.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the registros database table.
 * 
 */
@Entity
@Table(name="registros")
@NamedQuery(name="Registro.findAll", query="SELECT r FROM Registro r")
public class Registro implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	private int idReg;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	private Date fechaReg;

	@Column
	private int temperatura;

	//bi-directional many-to-one association to Ciudad
	@ManyToOne
	@JoinColumn(name="idCiu", nullable=false)
	private Ciudad ciudade;

	//bi-directional many-to-one association to Estadoscielo
	@ManyToOne
	@JoinColumn(name="idEst")
	private Estadoscielo estadoscielo;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="idUsu", nullable=false)
	private Usuario usuario;

	public Registro() {
	}

	public int getIdReg() {
		return this.idReg;
	}

	public void setIdReg(int idReg) {
		this.idReg = idReg;
	}

	public Date getFechaReg() {
		return this.fechaReg;
	}

	public void setFechaReg(Date fechaReg) {
		this.fechaReg = fechaReg;
	}

	public int getTemperatura() {
		return this.temperatura;
	}

	public void setTemperatura(int temperatura) {
		this.temperatura = temperatura;
	}

	public Ciudad getCiudade() {
		return this.ciudade;
	}

	public void setCiudade(Ciudad ciudade) {
		this.ciudade = ciudade;
	}

	public Estadoscielo getEstadoscielo() {
		return this.estadoscielo;
	}

	public void setEstadoscielo(Estadoscielo estadoscielo) {
		this.estadoscielo = estadoscielo;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	
    public String toStringSky() {
        return String.format("Registro[ ciudad='%s', sky='%s']",ciudade.getNombreCiu(),estadoscielo.getEst());
    }

}