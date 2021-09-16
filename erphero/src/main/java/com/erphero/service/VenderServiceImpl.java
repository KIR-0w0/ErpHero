package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erphero.dao.VenderDao;
import com.erphero.vo.Vender;

@Service
public class VenderServiceImpl implements VenderService{

	@Autowired
	VenderDao venderDao;
	
	
	@Override
	public void registerVender(Vender vender) {
		venderDao.insertVender(vender);
	}
	@Override
	public List<Vender> searchVender(String name) {
		return venderDao.searchVender(name);
	}
	@Override
	public List<Vender> getAllVender() {
		return venderDao.getAllVender();
	}
	@Override
	public void removeVender(String code) {
		venderDao.deleteVenderByCode(code);
	}
}
