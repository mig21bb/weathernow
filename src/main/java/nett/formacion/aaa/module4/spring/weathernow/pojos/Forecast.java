package nett.formacion.aaa.module4.spring.weathernow.pojos;

import java.util.Date;

public class Forecast {
	
	private GetSky sky;
	private GetTemperature temperature;
	private Date day;
	
	public GetSky getSky() {
		return sky;
	}
	public void setSky(GetSky sky) {
		this.sky = sky;
	}
	public GetTemperature getTemperature() {
		return temperature;
	}
	public void setTemperature(GetTemperature temperature) {
		this.temperature = temperature;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	
	
	
}
