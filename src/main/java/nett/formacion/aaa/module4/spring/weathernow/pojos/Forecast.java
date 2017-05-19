package nett.formacion.aaa.module4.spring.weathernow.pojos;


public class Forecast {
	
	private GetSky sky;
	private GetTemperature temperature;
	private String day;
	
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
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	
	
}
