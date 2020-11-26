package com.mynote.app.main;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import com.mynote.app.HomeController;
@Controller
@RequestMapping("/practices/*")    // http://localhost:8090/app/practices/main.do
public class mainController {
	private static final Logger logger = LoggerFactory.getLogger(mainController.class);
	
	@Autowired
	practiceService service;
	
	
	@RequestMapping(value = "/main.do",method = RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		
		test();
		
		mav.setViewName("main");
		return mav;
	}
	
	public void test() {
		List<Map<String,Object>> test = service.test();
		System.out.println(test.toString());
	}

}
