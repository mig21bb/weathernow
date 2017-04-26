/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nett.formacion.aaa.module4.spring.weathernow.controller;

import java.security.MessageDigest;
import java.util.Date;

import javax.xml.bind.annotation.adapters.HexBinaryAdapter;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
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
import nett.formacion.aaa.module4.spring.weathernow.repo.WeatherNowCitiesRepo;
import nett.formacion.aaa.module4.spring.weathernow.repo.WeatherNowEstadoscieloRepo;
import nett.formacion.aaa.module4.spring.weathernow.repo.WeatherNowRepository;
import nett.formacion.aaa.module4.spring.weathernow.repo.WeatherNowUsuarioRepo;

/**
 *
 * @author Miguel Ángel Buñuales, Verónica Torcal, Juan Nonay, Mª Carmen Chaves
 */
@RestController
public class WeatherNowController {
    
    @Autowired
    private WeatherNowRepository wnRepo;
    @Autowired
    private WeatherNowCitiesRepo wnCityRepo;
    @Autowired
    private WeatherNowEstadoscieloRepo wnEstadosRepo;
    @Autowired
    private WeatherNowUsuarioRepo wnUsuarioRepo;
    
    private static final Logger LOGGER = LogManager.getLogger(WeatherNowController.class.getName());   
    
 /**
  * Método para introducir un estado del cielo en la BBDD
  * Autor:Miguel Ángel Buñuales
  * @param ciudad  Obligatorio
  * @param sky     Obligatorio
  * @param idUsuario   No obligatorio. Si no se envía se usará el usuario con id=1
  * @return
  */
    @RequestMapping(path="/addSky", produces = {"text/plain", "application/*"} ) // Anotación para indicar la dirección que ejecutará el método, devuelve texto
    @ResponseBody                                                                // Anotación que indica que devolveremos un Objeto, en este caso, un objeto de tipo String.
    public String addSky(
    		@RequestParam(value = "ciudad", required = true) String ciudad,
    		@RequestParam(value = "sky", required = true) Integer sky//,
    		//@RequestParam(value = "nombreUsu", required = true) String nombreUsu,
    		//@RequestParam(value = "password", required = true) String password
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
    	// Objeto que convertirá nuestros objetos en cadenas de texto JSON para devolverlas
    	ObjectMapper mapper = new ObjectMapper();
    	// Objeto auxiliar para la codificación MD5
    	// MessageDigest md5 = MessageDigest.getInstance("MD5");
    	
    	// Bloque try-catch en el que realizaremos todas las tareas de consulta a la BBDD
        try {
        	// Buscamos el nombre de usuario y comparamos el password con el del objeto encontrado
        	//usuario = wnUsuarioRepo.findByNombreUsuIgnoreCase(nombreUsu);
        	//String passwordMD5 = (new HexBinaryAdapter()).marshal(md5.digest(password.getBytes()));
        	//if(usuario != null && passwordMD5){
        		
        	//}
        	
        	// Cargamos la ciudad cuyo nombre coinincida con el parámetro consultando, la BBDD a través del repositorio de Ciudades
        	city = wnCityRepo.findByNombreCiuIgnoreCase(ciudad);
        	// Si encuentra la ciudad
        	if(city != null){
	        	System.out.println(city.getNombreCiu());
	        	// Cargamos El estdo del cielo cuyo id coinincida con el parámetro, consultando la BBDD a través del repositorio de estadoscielo
	        	estado = wnEstadosRepo.findOne(sky);
	        	System.out.println(estado.getEstado());
	        	// Vamos cargando los objetos consultados a la base de datos en el objeto -- registro --
	        	registro.setCiudade(city);
	        	registro.setEstadoscielo(estado);
	        	registro.setFechaReg(new Date());
	        	/*if(idUsuario == null){*/
	        	Integer	idUsuario = 1;
	        	//}
	        	usuario = wnUsuarioRepo.findOne(idUsuario);
	        	registro.setUsuario(usuario);
	        	// Guardamos el registro
	        	wnRepo.save(registro);
	        	// Devolvemos el registro generado.
	            response = mapper.writeValueAsString(registro);
	        // Si no encuentra la ciudad no guarda.
        	}else{
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
     * Autor:Miguel Ángel Buñuales
     * @param ciudad  Obligatorio
     * @param sky     Obligatorio
     * @param idUsuario   Obligatorio.
     * @param    Obligatorio.
     * @param idUsuario   Obligatorio.
     * @return
     */
       @RequestMapping(path="/addTemperature", produces = {"text/plain", "application/*"} ) // Anotación para indicar la dirección que ejecutará el método, devuelve texto
       @ResponseBody                                                                // Anotación que indica que devolveremos un Objeto, en este caso, un objeto de tipo String.
       public String addSky(
       		@RequestParam(value = "ciudad", required = true) String ciudad,       		
       		//@RequestParam(value = "usuario", required = true) Integer usuario,
       		//@RequestParam(value = "password", required = true) String password,
       		@RequestParam(value = "temperatura", required = true) Float temperatura,
       		@RequestParam(value = "escala", required = true) String escala) {
       	
       	System.out.println("Dentro del método addSky de WheatherNowController");
       	//Si la escala no termina dentro del dominio "K" o "C"(mayúsculas o minúsculas) devuelve error
       	//if(escala.trim().toUpperCase().endsWith("F") || escala.trim().toUpperCase().endsWith("C")){
       	
        // Inicializamos una respuesta
       	String response = null;
       	// Instanciamos una ciudad ( vacía por ahora )
       	Ciudad city = new Ciudad();       	
       	// Instanciamos un usuario ( vacío por ahora )
       	Usuario usuario = new Usuario();
       	// Instanciamos un registro ( vacío por ahora )
       	Registro registro = new Registro();
       	// Objeto que convertirá nuestros objetos en cadenas de texto JSON para devolverlas
       	ObjectMapper mapper = new ObjectMapper();    
       	
       	// Bloque try-catch en el que realizaremos todas las tareas de consulta a la BBDD
           try {
           	// Cargamos la ciudad cuyo nombre coinincida con el parámetro consultando, la BBDD a través del repositorio de Ciudades
           	city = wnCityRepo.findByNombreCiuIgnoreCase(ciudad);
           	// Si encuentra la ciudad
           	if(city != null){
   	        	System.out.println(city.getNombreCiu());
   	        	// Cargamos El estdo del cielo cuyo id coinincida con el parámetro, consultando la BBDD a través del repositorio de estadoscielo
   	        	
   	        	// Vamos cargando los objetos consultados a la base de datos en el objeto -- registro --
   	        	registro.setCiudade(city);
   	        	
   	        	registro.setFechaReg(new Date());
   	        	/*if(idUsuario == null){
   	        		idUsuario = 1;
   	        	}
   	        	usuario = wnUsuarioRepo.findOne(idUsuario);*/
   	        	registro.setUsuario(usuario);
   	        	// Guardamos el registro
   	        	wnRepo.save(registro);            
   	        	// Devolvemos el registro generado.
   	            response = mapper.writeValueAsString(registro);
   	        // Si no encuentra la ciudad no guarda.
           	}else{
           		response = "Esta ciudad no existe en nuestra base de datos.";
           	}
           	
               
           } catch (Exception e) {
           	LOGGER.error(e.getMessage());
           	response = e.getMessage();
           }
           
           return response;
       }
   
    
}
