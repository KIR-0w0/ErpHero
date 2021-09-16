package com.erphero.service;


import java.util.List;


import com.erphero.vo.Vender;

public interface VenderService {
	
	void registerVender (Vender vender);
	
	void removeVender (String code);
	
	List<Vender> searchVender (String name);
	List<Vender> getAllVender();
	
	
}
