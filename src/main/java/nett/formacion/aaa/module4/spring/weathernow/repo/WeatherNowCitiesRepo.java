/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nett.formacion.aaa.module4.spring.weathernow.repo;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import nett.formacion.aaa.module4.spring.weathernow.model.Ciudad;
  
public interface WeatherNowCitiesRepo extends CrudRepository<Ciudad, Integer> {
 
    public Ciudad findByNombreCiuIgnoreCase(String name);
    
}

