package com.mynote.app.main;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mynote.app.Paging;

//import com.mynote.app.HomeController;
@Controller
@RequestMapping("/practices/*") // http://localhost:8090/app/practices/main.do
public class mainController {
	private static final Logger logger = LoggerFactory.getLogger(mainController.class);

	@Autowired
	practiceService service;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		try {
			HttpSession session = request.getSession();
			if (session.getAttribute("email") != null) {
				mav.addObject("login", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		mav.setViewName("/main");
		return mav;
	}

	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public ModelAndView logingForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/users/loginForm");
		return mav;
	}

	@RequestMapping(value = "/logOut.do", method = RequestMethod.GET)
	public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.invalidate();

		mav.setViewName("main");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(@RequestParam Map<String, Object> info, HttpServletRequest request,
			HttpServletResponse response) {
		String result = "";

		try {

			Integer check = service.checkLogin(info);
			System.out.print(check);
			if (check < 1 || check == null) {
				result = "fail";
			} else {
				System.out.print(check);
				HttpSession session = request.getSession();
				session.setAttribute("email", info.get("email"));
				result = "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/joinForm.do", method = RequestMethod.GET)
	public ModelAndView joinForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/users/joinForm");
		return mav;
	}

	@RequestMapping(value = "/about.do", method = RequestMethod.GET)
	public ModelAndView about(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		// HttpSession session= request.getSession();
		mav.setViewName("/users/aboutMe");
		return mav;
	}

	// 포트폴리오 페이지 이동
	@RequestMapping(value = "/practices/portfolio.do", method = RequestMethod.GET)
	public ModelAndView port() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/myportfolio");
		return mav;
	}

	// 아작스 페이징처리 내일 일어나서 하자
	@ResponseBody
	@RequestMapping(value = "/paging.do", method = RequestMethod.GET)
	public Paging pagingmethod(@RequestParam Map<String, Object> info, HttpServletRequest request,
			HttpServletResponse response) {

		System.out.print("화면값" + info.toString());

		String start = (String) info.get("nowPage");
		String end = (String) info.get("cntPerPage");
		start = (start == null) ? "1" : start;
		end = (end == null) ? "6" : end;
		int total = service.total();

		Paging paging = new Paging(total, Integer.parseInt(start), Integer.parseInt(end));

		return paging;
	}

	// 아작스 게시판 시작,끝값
	@RequestMapping(value = "/pagingValues.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> board(@RequestParam Map<String, Object> info, HttpServletRequest request,
			HttpServletResponse response) {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		System.out.print("페이징dddd" + info.toString());
		list = service.list(info);

		return list;
	}

	// 포트폴리오 페이지 이동
	@RequestMapping(value = "/practices/write.do", method = RequestMethod.GET)
	public ModelAndView write() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/writeBoard");
		return mav;
	}

	// 게시글 작성
	@RequestMapping(value = "/practices/uploadBoard.do", method = RequestMethod.POST)
	public String upload(@RequestParam Map<String, Object> info, HttpServletRequest request,
			HttpServletResponse response) {
		String result = "";
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		int userNum = service.userNum(email);

		try {
			info.put("userNum", userNum);
			service.createBoard(info);
			result = "/board/myportfolio";
		} catch (Exception e) {
			e.printStackTrace();
			result = "";
		}
		return result;
	}

	// contact 미 페이지이동
	@RequestMapping(value = "/practices/contact.do", method = RequestMethod.GET)
	public ModelAndView contact() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/contactMe/contact");
		return mav;
	}
	
	
	// 댓글등록
	@ResponseBody
	@RequestMapping(value = "practices/addComment.do", method = RequestMethod.POST)
	public String addComment(@RequestParam Map<String, Object> info, HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {
		String result="";
		//boardNum:boardnum,content:content 파라미터 정보
		
		String email =  (String) session.getAttribute("email");
		int userNum = service.userNum(email);   //세션에서 유저번호 가져온다.
		
		info.put("userNum", userNum);
		try {
			
			
			System.out.print(info.toString());
			service.addComment(info);
			result="success";
		} catch (Exception e) {
			e.printStackTrace();
			result="fail";
		}
		return result;
	}

	// 댓글리스트
		@ResponseBody
		@RequestMapping(value = "/practices/afterList.do", method = RequestMethod.GET)
		public List<Map<String,Object>> afterList(@RequestParam Map<String, Object> info, HttpServletRequest request,
				HttpServletResponse response,HttpSession session) {
			List<Map<String,Object>> result= null;
			String boardNum= (String) info.get("boardNum");
			System.out.print("댓글 넘버:"+info.toString());
			try {
				result =service.afterList(boardNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
	
	// 게시판 상세글 이동 + cnt 증가 조회수 + 댓글리스트
	@ResponseBody
	@RequestMapping(value = "/practices/boardDetail.do", method = RequestMethod.GET)
	public Map<String,List<Map<String,Object>>> boardDetail(@RequestParam Map<String, Object> info, HttpServletRequest request,
			HttpServletResponse response) {
		String boardNum = (String) info.get("boardNum"); // 화면에서 게시판번호 받아옴

		// 조회수 증가로직
		Cookie[] cookies = request.getCookies();
		Cookie checknum = null;
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("checknum")) {
					checknum = cookies[i];
				}
			}
		}
		if (checknum == null) {
			System.out.println("checknum 없음");
			Cookie newCookie = new Cookie("checknum", "|" + boardNum + "|");
			response.addCookie(newCookie);

			service.updateCNT(boardNum);
		} else {
			System.out.println("checknum 있음");
			String value = checknum.getValue();
			System.out.println(value);
			if (value.indexOf("|" + boardNum + "|") < 0) { // 입력한 번화와 일치하는 번호가 없으면 추가한다.
				value = value + "|" + boardNum + "|";
				checknum.setValue(value);
				System.out.println("만료시간:" + checknum.getMaxAge());
				response.addCookie(checknum);
				service.updateCNT(boardNum);
			}
		}

		Map<String,List<Map<String,Object>>> result = new HashMap<String,List<Map<String,Object>>>();
		List<Map<String,Object>> detailBoard=null;
		try {
			detailBoard = service.boardDetail(boardNum);  //게시글
			result.put("detail", detailBoard);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
