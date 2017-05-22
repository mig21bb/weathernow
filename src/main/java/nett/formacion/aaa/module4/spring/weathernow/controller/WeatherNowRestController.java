/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nett.formacion.aaa.module4.spring.weathernow.controller;

import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.adapters.HexBinaryAdapter;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import nett.formacion.aaa.module4.spring.weathernow.model.Ciudad;
import nett.formacion.aaa.module4.spring.weathernow.model.Estadoscielo;
import nett.formacion.aaa.module4.spring.weathernow.model.Pais;
import nett.formacion.aaa.module4.spring.weathernow.model.Registro;
import nett.formacion.aaa.module4.spring.weathernow.model.Usuario;
import nett.formacion.aaa.module4.spring.weathernow.pojos.Escala;
import nett.formacion.aaa.module4.spring.weathernow.pojos.Forecast;
import nett.formacion.aaa.module4.spring.weathernow.pojos.GetSky;
import nett.formacion.aaa.module4.spring.weathernow.pojos.GetTemperature;
import nett.formacion.aaa.module4.spring.weathernow.repo.WeatherNowCitiesRepo;
import nett.formacion.aaa.module4.spring.weathernow.repo.WeatherNowEstadoscieloRepo;
import nett.formacion.aaa.module4.spring.weathernow.repo.WeatherNowRepository;
import nett.formacion.aaa.module4.spring.weathernow.repo.WeatherNowUsuarioRepo;

/**
 *
 * @author Miguel Ángel Buñuales, Verónica Torcal, Juan Nonay, Mª Carmen Chaves
 */

@RestController
public class WeatherNowRestController {

	@Autowired
	private WeatherNowRepository wnRepo;
	@Autowired
	private WeatherNowCitiesRepo wnCityRepo;
	@Autowired
	private WeatherNowEstadoscieloRepo wnEstadosRepo;
	@Autowired
	private WeatherNowUsuarioRepo wnUsuarioRepo;	

	// Objeto que convertirá nuestros objetos en cadenas de texto JSON para
	// devolverlas
	ObjectMapper mapper = new ObjectMapper();

	private static final Logger LOGGER = LogManager.getLogger(WeatherNowRestController.class.getName());
	
	
	/**
	 * Método getSky para consultar la temperatura de hoy de una ciudad en una escala determinada
	 * 
	 * Para realizar por MAMEN
	 */
	@CrossOrigin
	@RequestMapping(path = "/getSky", produces = { "text/plain", "application/json" })
	@ResponseBody
	public String getSky(			
			@RequestParam(value = "ciudad", required = true) String ciudad
			) {	
		
		
		GetSky getSky = new GetSky();
		String response = null;
		
		try{
			//Hay que emlear los repositories para rellenar las propiedades del objeto getTemperature
			
			//Código aquí
			
			
			response = mapper.writeValueAsString(getSky);
			
		}catch(Exception e){
			LOGGER.error(e.getMessage());
			response = e.getMessage();
		}
		
		return response;
	}
	
	/**
	 * Método getTemperature para consultar la temperatura de hoy de una ciudad en una escala determinada
	 * 
	 * Para realizar por VERO
	 */
	@CrossOrigin
	@RequestMapping(path = "/getTemperature", produces = { "text/plain", "application/json" })
	@ResponseBody
	public String getTemperature(
			//@RequestParam(value = "fecha", required = false) String fecha,
			@RequestParam(value = "ciudad", required = true) String ciudad,
			@RequestParam(value = "escala", required = true) String escala
			) {
			     String response = null;
		//Nos aseguramos que la escala solicitada está destro de nuestro ENUM
				if(Escala.contains(escala)){
				
					//Instancio la ciudad
					Ciudad city=new Ciudad();
					
					//Instancio un nuevo registro
					Registro registro=new Registro();
						
					//Instancio el calendario
					Calendar hoy=Calendar.getInstance();
					
					GetTemperature temp = new GetTemperature();
					
					//Objeto para convertir nuestro objeto en cadena de texto JSON para devolverlos
					ObjectMapper mapper=new ObjectMapper();					
					
					
					try{		
					
						//recojo el valor de la ciudad a consultar en el repositorio de Ciudades
						city=wnCityRepo.findByNombreCiuIgnoreCase(ciudad);
						
						//Si encuentra la ciudad
						if(city!=null){
							System.out.println(hoy.getTime());
							System.out.println(city);
							registro=wnRepo.findByFechaRegAndCiudade(hoy.getTime(),city);
							System.out.println(registro);
							
							if(registro!=null){
								temp.setEscala(Escala.valueOf(escala.toUpperCase()));
								
								//indico el valor de la temperatura dependiendo de la escala
								if(escala.toUpperCase().equals("F")){
									temp.setTemperatura((long)celsiusToFahrenheit(registro.getTemperatura()));
								}else if(escala.toUpperCase().equals("K")){
									temp.setTemperatura((long) registro.getTemperatura()+273);
								}else{
									temp.setTemperatura((long) registro.getTemperatura());
								}
								
								
							}
							// devuelvo el valor a mostrar
							response = mapper.writeValueAsString(temp);
						}else{
							//Si no encuentra la ciudad, muestro un mensaje
							response="Esta ciudad no existe en nuestra base de datos.";
						}			
					}catch(Exception e){
						LOGGER.error(e.getMessage());
						response = e.getMessage();
					}
				
				}else{
					return "Escala no válida";
				}
				return response;
	}

	

	/**
	 * Método para introducir un estado del cielo en la BBDD 
	 * Autor:Miguel ÁngeL Buñuales
	 * 
	 * @param fecha   no obligatorio, si no se introduce se supone que es la fecha actual.
	 * @param ciudad Obligatorio
	 * @param sky Obligatorio
	 * @param idUsuario No obligatorio. Si no se envía se usará el usuario con id=1 ¿? - decidir esto entre todos
	 * @param password No obligatorio. Si no se envía se usará el pass del usuario con id=1 ¿? - decidir esto entre todos
	 * @return
	 */
	// Anotación para permitir llamar a la API REST desde orígenes distintos a localhost:7777 (o el puerto que sea)
	@CrossOrigin
	// Anotación para indicar la dirección que ejecutará el método, devuelve
	// texto
	@RequestMapping(path = "/addSky", produces = { "text/plain", "application/json" })
	// Anotación que indica que devolveremos un Objeto, en este caso, un objeto
	// de tipo String.
	@ResponseBody
	public String addSky(
			@RequestParam(value = "fecha", required = false) String fecha,
			@RequestParam(value = "ciudad", required = true) String ciudad,
			@RequestParam(value = "sky", required = true) Integer sky// ,
	// @RequestParam(value = "nombreUsu", required = true) String nombreUsu,
	// @RequestParam(value = "password", required = true) String password
	) {

		System.out.println("Dentro del método addSky de WheatherNowController");

		// Inicializamos una respuesta
		String response = null;
		// Instanciamos una ciudad ( vacía por ahora )
		Ciudad city = new Ciudad();
		// Instanciamos una estado del cielo ( vacío por ahora )
		Estadoscielo estado = new Estadoscielo();
		// Instanciamos un usuario ( vacío por ahora )
		Usuario usuario = new Usuario();
		// Instanciamos un registro ( vacío por ahora )
		Registro registro = new Registro();
		// Pojo getSky
		GetSky getSky = new GetSky();
		// Objeto auxiliar para la codificación MD5
		// MessageDigest md5 = MessageDigest.getInstance("MD5");

		// Bloque try-catch en el que realizaremos todas las tareas de consulta
		// a la BBDD
		try {
			// Buscamos el nombre de usuario y comparamos el password con el del
			// objeto encontrado
			// usuario = wnUsuarioRepo.findByNombreUsuIgnoreCase(nombreUsu);
			// String passwordMD5 = (new
			// HexBinaryAdapter()).marshal(md5.digest(password.getBytes()));
			// if(usuario != null && passwordMD5){

			// }

			// Cargamos la ciudad cuyo nombre coinincida con el parámetro
			// consultando, la BBDD a través del repositorio de Ciudades
			city = wnCityRepo.findByNombreCiuIgnoreCase(ciudad);
			// Si encuentra la ciudad
			if (city != null) {
				System.out.println(city.getNombreCiu());
				// Cargamos El estdo del cielo cuyo id coinincida con el
				// parámetro, consultando la BBDD a través del repositorio de
				// estadoscielo
				estado = wnEstadosRepo.findOne(sky);
				System.out.println(estado.getEstado());
				
				//Buscamos un registro para la fecha y ciudad pasadas como parámetro
				SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");				
				registro = wnRepo.findByFechaRegAndCiudade(formatoFecha.parse(fecha), city);
				if(registro!= null){
					//Si ya existe dicho registro, lo actualizamos
					registro.setEstadoscielo(estado);
				}else{			
				
					// si no existe, lo rellenamos y guardamos
					// Vamos cargando los objetos consultados a la base de datos en
					// el objeto -- registro --
					registro = new Registro();
					registro.setCiudade(city);
					registro.setEstadoscielo(estado);
					//Objeto que formateará el String fecha a una fecha
					System.out.println(fecha);
					
					System.out.println(formatoFecha.parse(fecha).toString());
					registro.setFechaReg(formatoFecha.parse(fecha));
					/* if(idUsuario == null){ */
					Integer idUsuario = 1;
					// }
					usuario = wnUsuarioRepo.findOne(idUsuario);
					registro.setUsuario(usuario);
				}
				// Guardamos el registro
				wnRepo.save(registro);
				// Devolvemos el registro
				// response = mapper.writeValueAsString(registro);

				// Devolvemos un pojo de tipo GetSky
				getSky.setEstadocielo(registro.getEstadoscielo().getEstado());
				response = mapper.writeValueAsString(getSky);
				// Si no encuentra la ciudad no guarda.
			} else {
				response = "Esta ciudad no existe en nuestra base de datos.";
			}

		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			response = e.getMessage();
		}

		return response;
	}

	/**
	 * Método para introducir una temperatura relativa a una ciudad en la BBDD
	 * Autor:Juan 
	 * 
	 * @param fecha   no obligatorio, si no se introduce se supone que es la fecha actual.
	 * @param ciudad Obligatorio
	 * @param sky Obligatorio
	 * @param idUsuario Obligatorio.
	 * @return
	 */
	// Anotación para permitir llamar a la API REST desde orígenes distintos a localhost:7777 (o el puerto que sea)
	@CrossOrigin
	// Anotación para indicar la dirección que ejecutará el método, devuelve
	// texto
	@RequestMapping(path = "/addTemperature", produces = { "text/plain", "application/json" })
	// Anotación que indica que devolveremos un Objeto, en este caso, un objeto
	// de tipo String.
	@ResponseBody
	public String addTemperature(
			@RequestParam(value = "fecha", required = false) String fecha,
			@RequestParam(value = "ciudad", required = true) String ciudad,
			// @RequestParam(value = "usuario", required = true) Integer usuario,			
			// @RequestParam(value = "password", required = true) String password,			
			@RequestParam(value = "temperatura", required = true) Float temperatura,
			@RequestParam(value = "escala", required = true) String escala) {

		System.out.println("Dentro del método addTemperature de WheatherNowController");
		// Inicializamos una respuesta
		String response = null;
		// Nos aseguramos que la escala solicitada está dentro de nuestro ENUM
		if (Escala.contains(escala)) {

			// Instanciamos una ciudad ( vacía por ahora )
			Ciudad city = new Ciudad();
			// Instanciamos un usuario ( vacío por ahora )
			Usuario usuario = new Usuario();
			// Instanciamos un registro ( vacío por ahora )
			Registro registro = new Registro();
			// Objeto que convertirá nuestros objetos en cadenas de texto JSON
			// para
			// devolverlas
			ObjectMapper mapper = new ObjectMapper();

			// Bloque try-catch en el que realizaremos todas las tareas de
			// consulta
			// a la BBDD
			try {
				// Cargamos la ciudad cuyo nombre coinincida con el parámetro
				// consultando, la BBDD a través del repositorio de Ciudades
				city = wnCityRepo.findByNombreCiuIgnoreCase(ciudad);
				// Si encuentra la ciudad
				if (city != null) {
					
					/*
					 * Aquí hay que meter el código.
					 */

				} else {
					response = "Esta ciudad no existe en nuestra base de datos.";
				}

			} catch (Exception e) {
				LOGGER.error(e.getMessage());
				response = e.getMessage();
			}
		} else {
			response = "Wrong temperature Scale";
		}

		return response;
	}

	/**
	 * Método para obtener un pronóstico de los próximos (fDays) días
	 * Autor:Miguel Ángel Buñuales
	 * 
	 * @param ciudad Obligatorio
	 * @param escala Obligatorio
	 * @return
	 */	
	// Anotación para permitir llamar a la API REST desde orígenes distintos a localhost:7777 (o el puerto que sea)
	@CrossOrigin
	@RequestMapping(path = "/getForecast", produces = { "text/plain", "application/json" })	
	@ResponseBody
	public String getForecast(@RequestParam(value = "ciudad", required = true) String ciudad,
						 	  @RequestParam(value = "escala", required = true) String escala) {

		System.out.println("Dentro del método getForecast de WheatherNowController");

		// Inicializamos una respuesta
		String response = null;
		// Dias de pronóstico
		int fDays = 7;
		// Nos aseguramos que la escala solicitada está dentro de nuestro ENUM
		if (Escala.contains(escala.toUpperCase())) {
			// Instanciamos una ciudad ( vacía por ahora )
			Ciudad city = new Ciudad();
			// Instanciamos un registro ( vacío por ahora )
			Registro registro = new Registro();
			// Pojos para la respuesta
			GetSky cielo = new GetSky();
			GetTemperature temp = new GetTemperature();
			List<Forecast> forecastArray = new ArrayList<>();
			// Objeto que convertirá nuestros objetos en cadenas de texto JSON
			// para devolverlas
			ObjectMapper mapper = new ObjectMapper();
			// Instanciamos el calendario
			Calendar hoy = Calendar.getInstance();
			// Bloque try-catch en el que realizaremos todas las tareas de
			// consulta a la BBDD
			try {

				// Cargamos la ciudad cuyo nombre coinincida con el parámetro
				// consultando, la BBDD a través del repositorio de Ciudades
				city = wnCityRepo.findByNombreCiuIgnoreCase(ciudad);
				// Si encuentra la ciudad
				if (city != null) {
					
					for(int i=0;i<fDays;i++){
						Forecast f = new Forecast();	
						registro = new Registro();
						System.out.println("fecha de forecast" + hoy.getTime());
						System.out.println(city.getNombreCiu());
						registro = wnRepo.findByFechaRegAndCiudade(hoy.getTime(), city);
						System.out.println(registro.getEstadoscielo().getEstado());
						if(registro!=null){						
							cielo = new GetSky();
							temp = new GetTemperature();
							cielo.setEstadocielo(registro.getEstadoscielo().getEstado());
							temp.setEscala(Escala.valueOf(escala));
							if(escala.toUpperCase().equals("F")){
								temp.setTemperatura((long) celsiusToFahrenheit(registro.getTemperatura()));
							}else if(escala.toUpperCase().equals("K")){
								temp.setTemperatura((long) registro.getTemperatura()+273);
							}else{
								temp.setTemperatura((long) registro.getTemperatura());
							}
							SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
							f.setDay(formatoFecha.format(hoy.getTime()));
							f.setSky(cielo);
							f.setTemperature(temp);
							
							forecastArray.add(f);
						}else{
							forecastArray.add(f);
						}
						hoy.add(Calendar.DATE, 1);
					}
					
					response=mapper.writeValueAsString(forecastArray);
					

				} else {
					response = "Esta ciudad no existe en nuestra base de datos.";
				}

			} catch (Exception e) {
				LOGGER.error(e.getMessage());
				e.printStackTrace();
				response = e.getMessage();
			}
		} else {
			response = "Wrong temperature Scale";
		}

		return response;
	}
	/**
	 * Método para convertir una temperatura expresada en grados celsius 
	 * en una temperatura expresada en grados fahrenheit
	 * @param celsius
	 * @return
	 */
	public static double celsiusToFahrenheit(double celsius){
		return (9.0/5)*celsius+32;
	}
	
	/**
	 * Método para convertir una temperatura expresada en grados  fahrenheit
	 * en una temperatura expresada en grados celsius
	 * @param fahrenheit
	 * @return
	 */
	public static double fahrenheitToCelsius(double fahrenheit){
		return fahrenheit - 32 * (5 / 9.0);
	}


}
