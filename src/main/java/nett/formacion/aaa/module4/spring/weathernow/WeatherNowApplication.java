package nett.formacion.aaa.module4.spring.weathernow;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootApplication
public class WeatherNowApplication {
	
	private static final Logger LOGGER = LogManager.getLogger(WeatherNowApplication.class.getName());
	 
	
	public static void main(String[] args) 
	{
		LOGGER.info("Starting Movies application");
		
		SpringApplication.run(WeatherNowApplication.class, args);
	}
	
}
