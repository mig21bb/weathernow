package nett.formacion.aaa.module4.spring.weathernow;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WeatherNowApplication {
	
	private static final Logger LOGGER = LogManager.getLogger(WeatherNowApplication.class.getName());
	 
	
	public static void main(String[] args) 
	{
		LOGGER.info("Starting Movies application");
		
		SpringApplication.run(WeatherNowApplication.class, args);
	}
}
