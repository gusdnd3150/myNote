package com.mynote.app.main;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mynote.app.Paging;

//import com.mynote.app.HomeController;
@Controller
@RequestMapping("/practices/*")    // http://localhost:8090/app/practices/main.do
public class mainController {
	private static final Logger logger = LoggerFactory.getLogger(mainController.class);
	
	
	
	private Paging paging;
	
	@Autowired
	practiceService service;
	
	
	@RequestMapping(value = "/main.do",method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		try {
			HttpSession session= request.getSession();
			if(session.getAttribute("email") != null) {
				mav.addObject("login", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("/main");
		return mav;
	}
	
	@RequestMapping(value = "/loginForm.do",method = RequestMethod.GET)
	public ModelAndView logingForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/users/loginForm");
		return mav;
	}
	
	@RequestMapping(value = "/logOut.do",method = RequestMethod.GET)
	public ModelAndView logOut(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		HttpSession session= request.getSession();
		session.invalidate();
		
		mav.setViewName("main");
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/login.do",method = RequestMethod.GET)
	public String login(@RequestParam Map<String,Object> info, HttpServletRequest request,HttpServletResponse response) {
		String result ="";
		
		try {
			
			Integer check =service.checkLogin(info);
			System.out.print(check);
			if(check < 1 || check==null) {
				result="fail";
			}else {
				System.out.print(check);
				HttpSession session=request.getSession();
				session.setAttribute("email", info.get("email"));
				result="success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "/joinForm.do",method = RequestMethod.GET)
	public ModelAndView joinForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/users/joinForm");
		return mav;
	}
	
	@RequestMapping(value = "/about.do",method = RequestMethod.GET)
	public ModelAndView about(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		//HttpSession session= request.getSession();
		mav.setViewName("/users/aboutMe");
		return mav;
	}
	
	
	// 포트폴리오 페이지 이동
	@RequestMapping(value = "/practices/portfolio.do",method = RequestMethod.GET)
	public ModelAndView port() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/myportfolio");
		return mav;
	}
	
	// 아작스 페이징처리 내일 일어나서 하자
	@RequestMapping(value = "/paging.do",method = RequestMethod.GET)
	public Paging pagingmethod(@RequestParam Map<String,Object> info) {
		
		String start =(String) info.get("start");
		String end = (String) info.get("end");
		
		start = (start==null)? "1":start;
		end = (end==null)? "6":end;
		int total = service.total();
		
		System.out.print(start);
		
		paging = new Paging(total,Integer.parseInt(start),Integer.parseInt(end));
		return paging;
	}

}
