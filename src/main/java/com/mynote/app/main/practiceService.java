package com.mynote.app.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class practiceService {

	@Autowired
	practicesDAO dao;
	
	public List<Map<String,Object>> test(){
		List<Map<String,Object>> test =dao.test();
		return test;
	}
	
	public Integer checkLogin(Map<String,Object> info) {
		Integer result =dao.checkLogin(info);
		return result;
	}
}
