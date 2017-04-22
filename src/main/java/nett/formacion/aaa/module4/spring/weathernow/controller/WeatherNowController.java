/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nett.formacion.aaa.module4.spring.weathernow.controller;

import java.util.Date;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
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
    
    // CREATE a NEW registro
    @RequestMapping(path="/nuevo/registro", produces = {"text/plain", "application/*"} )
    @ResponseBody
    public String newRegistro(
    		@RequestParam(value = "ciudad", required = true) String ciudad,
    		@RequestParam(value = "temperatura", required = false) String temperatura,
    		@RequestParam(value = "fecha", required = false) String fecha,
    		@RequestParam(value = "sky", required = false) String sky,
    		@RequestParam(value = "usuario", required = true) String usuario) {
        
    	String response = null;
    	
    	Registro registro = new Registro();
    	
        try {
            wnRepo.save(registro);
            response = wnRepo.toString() + " created successful";
        } catch (Exception e) {
        	LOGGER.error(e.getMessage());
        	response = e.getMessage();
        }
        
        return response;
    }
    
 /**
  * Método para introducir un estado del cielo en la BBDD
  * Autor:Miguel Ángel Buñuales
  * @param ciudad  Obligatorio
  * @param sky     Obligatorio
  * @param idUsuario   No obligatorio. Si no se envía se usará el usuario con id=1
  * @return
  */
    @RequestMapping(path="/addSky", produces = {"text/plain", "application/*"} ) // Anotación para indicar la dirección que ejecutará el método, devuelve texto
    @ResponseBody                                                                // Anotación que indica que devolveremos un objeto.
    public String addSky(String ciudad, Integer sky, Integer idUsuario) {
    	
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
    	
    	// Bloque try-catch en el que realizaremos todas las tareas de consulta a la BBDD
        try {
        	// Cargamos la ciudad cuyo nombre coinincida con el parámetro consultando, la BBDD a través del repositorio de Ciudades
        	city = wnCityRepo.findByNombreCiuIgnoreCase(ciudad);
        	// Si encuentra la ciudad
        	if(city != null){
	        	System.out.println(city.getNombreCiu());
	        	// Cargamos El estdo del cielo cuyo id coinincida con el parámetro, consultando la BBDD a través del repositorio de estadoscielo
	        	estado = wnEstadosRepo.findOne(sky);
	        	System.out.println(estado.getEst());
	        	// Vamos cargando los objetos consultados a la base de datos en el objeto -- registro --
	        	registro.setCiudade(city);
	        	registro.setEstadoscielo(estado);
	        	registro.setFechaReg(new Date());
	        	if(idUsuario == null){
	        		idUsuario = 1;
	        	}
	        	usuario = wnUsuarioRepo.findOne(idUsuario);
	        	registro.setUsuario(usuario);
	        	// Guardamos el registro
	        	wnRepo.save(registro);            
	        	// Devolvemos el registro generado.
	            response = registro.toStringSky();
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
    
    // CREATE a NEW ciudad
    @RequestMapping(path="/nuevo/ciudad", produces = {"text/plain", "application/*"} )
    @ResponseBody
    public String createMovie(String ciudad) {
        
    	String response = null;
    	
    	Ciudad city = new Ciudad();
        
        city.setNombreCiu(ciudad);
        city.setPais(new Pais());
        
        try {
            wnCityRepo.save(city);
            response = wnCityRepo.toString() + " created successful";
        } catch (Exception e) {
        	LOGGER.error(e.getMessage());
        	response = e.getMessage();
        }
        
        return response;
    }
    
    // get city by id a NEW ciudad
    @RequestMapping(path="/get/ciudad", produces = {"text/plain", "application/*"} )
    @ResponseBody
    public String getCiudad(int id) {
        
        Ciudad city = new Ciudad();
        String response="response";
                
        try {
            city = (Ciudad) wnCityRepo.findOne( id);
            response = city.toString();
        } catch (Exception e) {        	
        	response = e.getMessage();
        }
        
        return response;
    }
    
}
